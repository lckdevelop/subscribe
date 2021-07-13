window.onload = function() {
	
	window.pg1 = 1;
	window.pg2 = 1;
	window.pg3 = 1;
	
	getUnpermittedVisitList();
	getReserveList();
	getTodayReserveList();

    let calendarEl = document.getElementById('calendar');
    let calendar = new FullCalendar.Calendar(calendarEl, {
   		headerToolbar: {
    		left: 'prev,next,today',
    		center: 'title',
    		right: 'dayGridMonth,listWeek'
    	},
    	initialView: 'dayGridMonth',
		initialDate: new Date(),
		locale: 'ko',
		dayMaxEvents: true

    });
	
	let arr = getCalendarData(getYearMonth(new Date()));
	console.log(arr);
	calendar.addEventSource(arr);
	calendar.render();
	
	let curDate = calendar.getDate();
	let prevBtn = document.querySelector('.fc-prev-button');
	let nextBtn = document.querySelector('.fc-next-button');
	let todayBtn = document.querySelector('.fc-today-button');
	
	prevBtn.onclick = function() {
		curDate = calendar.getDate();
		let arr = getCalendarData(getYearMonth(curDate));
		let removeEvents = calendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		calendar.addEventSource(arr);
		calendar.refetchEvents();
	}
	
	nextBtn.onclick = function() {
		curDate = calendar.getDate();
		let arr = getCalendarData(getYearMonth(curDate));
		let removeEvents = calendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		calendar.addEventSource(arr);
		calendar.refetchEvents();
	}
	
	todayBtn.onclick = function() {
		curDate = calendar.getDate();
		let arr = getCalendarData(getYearMonth(curDate));
		let removeEvents = calendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		calendar.addEventSource(arr);
		calendar.refetchEvents();
	}

};

function getStatus(input) {
	let status = '';
	
	switch(input) {
		case 0:
			status = '승인 대기중';
			break;
		case 1:
			status = '예약 완료';
			break;
		case 2:
			status = '방문 완료';
			break;
		case 3:
			status = '예약 취소';
			break;
		default:
			status = '승인 대기중';
			break;
	}
	return status;
}


function move1(pg) {
	window.pg1 = pg;
	getUnpermittedVisitList();
}

function move2(pg) {
	window.pg2 = pg;
	getTodayReserveList();
}

function move3(pg) {
	window.pg3 = pg;
	getReserveList();
}

function getUnpermittedVisitList() {
	$.ajax({
		url: './reserve/getUnpermittedVisitList',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg1, 'search': window.search},
		success: function(res) {
			
			let pagingDTO = res;
			let plusMsg = '';
			for (let i = 0; i < pagingDTO.list1.length; i++) {
				plusMsg += `<tr data-toggle="modal" data-target="#upvdetailModal" onclick="upvdetail(${pagingDTO.list1[i].no})">`
						+  `	<td class='upvname'>${pagingDTO.list1[i].name}</td>`
						+  `	<td class='upvphone'>${pagingDTO.list1[i].phone}</td>`
						+  `	<td class='upvdate'>${dateFormat(new Date(pagingDTO.list1[i].restime))}</td>`
						+  `	<td class='upvmemo hidden-col'>${pagingDTO.list1[i].memo}</td>`
						+  `	<td class='upvstatus hidden-col'>${pagingDTO.list1[i].status}</td>`
						+  `	<td><button class='btn btn-waiting btn-danger'`
						+  `    	        onclick='approve(${pagingDTO.list1[i].no})'`
						+  `            	>대기</button></td>`
						+  '</tr>';
			}

			let pagination = '';
			
			if (pagingDTO.startPage == 1) {
				pagination += `<div class='page-link'>이전</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move1(${pagingDTO.startPage-1})'>이전</div>`;
			}
			
			for (let i = pagingDTO.startPage; i < pagingDTO.endPage + 1; i++) {
				if (pagingDTO.page == i) {
					pagination += `<div class='page-link curpg'>${i}</div>`;
				} else {
					pagination += `<div class='page-link' onclick='move1(${i})'>${i}</div>`;
				}
			}
			
			if (pagingDTO.endPage == pagingDTO.totalPage) {
				pagination += `<div class='page-link'>다음</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move1(${pagingDTO.endPage+1})'>다음</div>`;
			}

			let tabBody = document.getElementById('upv-list');
			let pagingdiv = document.getElementById('pagination1');
			
			tabBody.innerHTML = plusMsg;
			pagingdiv.innerHTML = pagination;

		},
		 error: function(error) {
			alert('getUnpermittedVisitList Error');
		}
	});
}

function getTodayReserveList() {
	$.ajax({
		url: './reserve/getTodayReserveList',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg2, 'search': window.search},
		success: function(res) {
			
			let pagingDTO = res;
			let plusMsg = '';
			for (let i = 0; i < pagingDTO.list1.length; i++) {
				plusMsg += `<tr data-toggle="modal" data-target="#upvdetailModal" onclick="trdetail(${pagingDTO.list1[i].no})">`
						+  `	<td class='trname upvname'>${pagingDTO.list1[i].name}</td>`
						+  `	<td class='trphone'>${pagingDTO.list1[i].phone}</td>`
						+  `	<td class='trdate'>${dateFormat(new Date(pagingDTO.list1[i].restime))}</td>`
						+  `	<td class='trmemo hidden-col'>${pagingDTO.list1[i].memo}</td>`;
						
				if (pagingDTO.list1[i].status == 0) {
					
					plusMsg += `<td><button class='btn btn-waiting btn-danger trstatus'`
						    +  `	onclick='approve(${pagingDTO.list1[i].no})'`
						    +  `   >대기</button></td></tr>`;
				} 
				else if (pagingDTO.list1[i].status == 1){
					plusMsg += `<td><button class='btn btn-reserved btn-success trstatus'`
						    +  `	onclick='visitcheck(${pagingDTO.list1[i].no})'`
						    +  `    >예약</button></td></tr>`;
				} 
				else if (pagingDTO.list1[i].status == 2){
					plusMsg += `<td><button class='btn btn-fin btn-dark trstatus'`
						    +  `    >완료</button></td></tr>`;
				} 
				else if (pagingDTO.list1[i].status == 3){
					plusMsg += `<td><button class='btn btn-fin btn-dark trstatus'`
						    +  `    >취소</button></td></tr>`;
				}
				
			}

			let pagination = '';
			
			if (pagingDTO.startPage == 1) {
				pagination += `<div class='page-link'>이전</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move2(${pagingDTO.startPage-1})'>이전</div>`;
			}
			
			for (let i = pagingDTO.startPage; i < pagingDTO.endPage + 1; i++) {
				if (pagingDTO.page == i) {
					pagination += `<div class='page-link curpg'>${i}</div>`;
				} else {
					pagination += `<div class='page-link' onclick='move2(${i})'>${i}</div>`;
				}
			}
			
			if (pagingDTO.endPage == pagingDTO.totalPage) {
				pagination += `<div class='page-link'>다음</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move2(${pagingDTO.endPage+1})'>다음</div>`;
			}

			let tabBody = document.getElementById('today-list');
			let pagingdiv = document.getElementById('pagination2');
			
			tabBody.innerHTML = plusMsg;
			pagingdiv.innerHTML = pagination;

		},
		 error: function(error) {
			alert('getTodayVisitList Error');
		}
	});
}

function getReserveList() {
	$.ajax({
		url: './reserve/getReserveList',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg3, 'search': window.search},
		success: function(res) {
			
			let pagingDTO = res;
			let plusMsg = '';
			for (let i = 0; i < pagingDTO.list1.length; i++) {
				plusMsg += `<tr data-toggle="modal" data-target="#upvdetailModal" onclick="reservedetail(${pagingDTO.list1[i].no})">`
						+  `	<td class='rname upvname'>${pagingDTO.list1[i].name}</td>`
						+  `	<td class='rphone'>${pagingDTO.list1[i].phone}</td>`
						+  `	<td class='rdate'>${dateFormat(new Date(pagingDTO.list1[i].restime))}</td>`
						+  `	<td class='rmemo hidden-col'>${pagingDTO.list1[i].memo}</td>`;
						
				if (pagingDTO.list1[i].status == 0) {
					
					plusMsg += `<td><button class='btn btn-waiting btn-danger rstatus'`
						    +  `	onclick='approve(${pagingDTO.list1[i].no})'`
						    +  `   >대기</button></td></tr>`;
				} 
				else if (pagingDTO.list1[i].status == 1){
					plusMsg += `<td><button class='btn btn-reserved btn-success rstatus'`
						    +  `	onclick='visitcheck(${pagingDTO.list1[i].no})'`
						    +  `    >예약</button></td></tr>`;
				} 
				else if (pagingDTO.list1[i].status == 2){
					plusMsg += `<td><button class='btn btn-fin btn-dark rstatus'`
						    +  `    >완료</button></td></tr>`;
				} 
				else if (pagingDTO.list1[i].status == 3){
					plusMsg += `<td><button class='btn btn-fin btn-dark rstatus'`
						    +  `    >취소</button></td></tr>`;
				}
			}

			let pagination = '';
			
			if (pagingDTO.startPage == 1) {
				pagination += `<div class='page-link'>이전</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move3(${pagingDTO.startPage-1})'>이전</div>`;
			}
			
			for (let i = pagingDTO.startPage; i < pagingDTO.endPage + 1; i++) {
				if (pagingDTO.page == i) {
					pagination += `<div class='page-link curpg'>${i}</div>`;
				} else {
					pagination += `<div class='page-link' onclick='move3(${i})'>${i}</div>`;
				}
			}
			
			if (pagingDTO.endPage == pagingDTO.totalPage) {
				pagination += `<div class='page-link'>다음</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move3(${pagingDTO.endPage+1})'>다음</div>`;
			}

			let tabBody = document.getElementById('rlist');
			let pagingdiv = document.getElementById('pagination3');
			
			tabBody.innerHTML = plusMsg;
			pagingdiv.innerHTML = pagination;

		},
		 error: function(error) {
			alert('getReserveList Error');
		}
	});
}

function getCalendarData(date) {
	
	let events;
	
	$.ajax({
		url: './reserve/getCalendarData',
		type: 'get',
		dataType: 'json',
		async: false,
		data: {'date': date},
		success: function(res) {
			events = res;
		},
		 error: function(error) {
			alert('getCalendarData Error');
		}
	});
	
	return events;
}

function approve(no) {
	
	$('#approveModal').modal('show');
	let myTarget = event.target;
	let targetName = myTarget.parentNode.parentNode.querySelector('.upvname').innerHTML;
	document.getElementById('approve-modal-body').innerHTML = targetName + '님의 예약을 확정하시겠습니까?';
	document.getElementById('approve-modal-btn').setAttribute('onclick', 'permit(' + no + ')');
	document.getElementById('refuse-modal-btn').setAttribute('onclick', 'refuse(' + no + ')');
	event.stopPropagation();
	
}

function visitcheck(no) {
	
	$('#approveModal').modal('show');
	let myTarget = event.target;
	let targetName = myTarget.parentNode.parentNode.querySelector('.upvname').innerHTML;
	document.getElementById('approve-modal-body').innerHTML = targetName + '님의 방문을 확정하시겠습니까?';
	document.getElementById('approve-modal-btn').setAttribute('onclick', 'visit(' + no + ')');
	document.getElementById('refuse-modal-btn').setAttribute('onclick', 'refuse(' + no + ')');
	event.stopPropagation();
	
}

function upvdetail(no) {
	

	let myTarget = event.target;
	let parent = myTarget.parentNode;
	
	
	content =  `<div class="font-weight-bold">`
            +  `<p><span class="detail-head">성함</span>: ${parent.querySelector('.upvname').innerHTML}</p>`
            +  `<p><span class="detail-head">전화번호</span>: ${parent.querySelector('.upvphone').innerHTML}</p>`
            +  `<p><span class="detail-head">예약 시간</span>: ${parent.querySelector('.upvdate').innerHTML}</p>`
            +  `<p><span class="detail-head">메모</span>: ${parent.querySelector('.upvmemo').innerHTML}</p>`
            +  `<p><span class="detail-head">처리상태</span>: ${getStatus(parent.querySelector('.upvstatus').innerHTML)}</p>`
            +  `</div>`;
	
	document.getElementById('upv-modal-body').innerHTML = content;
}


function reservedetail(no) {

	let myTarget = event.target;
	let parent = myTarget.parentNode;
	
	content =  `<div class="font-weight-bold">`
            +  `<p><span class="detail-head">성함</span>: ${parent.querySelector('.rname').innerHTML}</p>`
            +  `<p><span class="detail-head">전화번호</span>: ${parent.querySelector('.rphone').innerHTML}</p>`
            +  `<p><span class="detail-head">예약 시간</span>: ${parent.querySelector('.rdate').innerHTML}</p>`
            +  `<p><span class="detail-head">메모</span>: ${parent.querySelector('.rmemo').innerHTML}</p>`
            +  `<p><span class="detail-head">처리상태</span>: ${parent.querySelector('.rstatus').innerHTML}</p>`
            +  `</div>`;
	
	document.getElementById('upv-modal-body').innerHTML = content;
}

function trdetail(no) {

	let myTarget = event.target;
	let parent = myTarget.parentNode;
	
	content =  `<div class="font-weight-bold">`
            +  `<p><span class="detail-head">성함</span>: ${parent.querySelector('.trname').innerHTML}</p>`
            +  `<p><span class="detail-head">전화번호</span>: ${parent.querySelector('.trphone').innerHTML}</p>`
            +  `<p><span class="detail-head">예약 시간</span>: ${parent.querySelector('.trdate').innerHTML}</p>`
            +  `<p><span class="detail-head">메모</span>: ${parent.querySelector('.trmemo').innerHTML}</p>`
            +  `<p><span class="detail-head">처리상태</span>: ${parent.querySelector('.trstatus').innerHTML}</p>`
            +  `</div>`;
	
	document.getElementById('upv-modal-body').innerHTML = content;
}


function permit(no) {
	
	$.ajax({
		url: './reserve/permit',
		type: 'get',
		dataType: 'text',
		data: {'no': no},
		success: function() {
			getUnpermittedVisitList();
			getReserveList();
			getTodayReserveList();
		},
		error: function(error) {
		}
	});
	
}

function refuse(no) {
	
	$.ajax({
		url: './reserve/refuse',
		type: 'get',
		dataType: 'text',
		data: {'no': no},
		success: function() {
			getUnpermittedVisitList();
			getReserveList();
			getTodayReserveList();
		},
		error: function(error) {
		}
	});
	
}

function visit(no) {
	
	$.ajax({
		url: './reserve/visit',
		type: 'get',
		dataType: 'text',
		data: {'no': no},
		success: function() {
			getUnpermittedVisitList();
			getReserveList();
			getTodayReserveList();
		},
		error: function(error) {
		}
	});
	
}

// 날짜 포매팅 함수
function dateFormat(date) {
    let month  = date.getMonth() + 1;
    let day    = date.getDate();
    let hour   = date.getHours();
    let minute = date.getMinutes();

    month  = month >= 10 ? month : '0' + month;
    day    = day >= 10 ? day : '0' + day;
    hour   = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute;
};

function getYearMonth(date) {
    let month  = date.getMonth() + 1;


    month  = month >= 10 ? month : '0' + month;


    return date.getFullYear() + '-' + month;
};


