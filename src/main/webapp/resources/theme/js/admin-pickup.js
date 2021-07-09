window.onload = function() {
	
	window.pg1 = 1;
	window.pg2 = 1;
	window.pg3 = 1;

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
	
	let arr = getPickupCalendarData(getYearMonth(new Date()));

	calendar.addEventSource(arr);
	calendar.render();
	
	let curDate = calendar.getDate();
	let prevBtn = document.querySelector('.fc-prev-button');
	let nextBtn = document.querySelector('.fc-next-button');
	let todayBtn = document.querySelector('.fc-today-button');
	
	prevBtn.onclick = function() {
		curDate = calendar.getDate();
		let arr = getPickupCalendarData(getYearMonth(curDate));
		let removeEvents = calendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		calendar.addEventSource(arr);
		calendar.refetchEvents();
	}
	
	nextBtn.onclick = function() {
		curDate = calendar.getDate();
		let arr = getPickupCalendarData(getYearMonth(curDate));
		let removeEvents = calendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		calendar.addEventSource(arr);
		calendar.refetchEvents();
	}
	
	todayBtn.onclick = function() {
		curDate = calendar.getDate();
		let arr = getPickupCalendarData(getYearMonth(curDate));
		let removeEvents = calendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		calendar.addEventSource(arr);
		calendar.refetchEvents();
	}
	
	getTodayPickupList();
	getPickupList();
	
};

function getStatus(input) {
	let status = '';
	
	switch(input) {
		case '0':
			status = '대기';
			break;
		case '1':
			status = '완료';
			break;
	}
	return status;
}


function move1(pg) {
	window.pg1 = pg;
	getTodayPickupList();
}

function move2(pg) {
	window.pg2 = pg;
	getPickupList();
}

function getTodayPickupList() {
	$.ajax({
		url: './reserve/getTodayPickupList',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg1},
		success: function(res) {
			let pagingDTO = res;
			let plusMsg = '';
			for (let i = 0; i < pagingDTO.list2.length; i++) {
				plusMsg += `<tr data-toggle="modal" data-target="#pickupdetailModal" onclick="pickupdetail(${pagingDTO.list2[i].no})">`
						+  `	<td class='p-no hidden-col'>${pagingDTO.list2[i].no}</td>`
						+  `	<td class='p-orderno'>${pagingDTO.list2[i].orderNo}</td>`
						+  `	<td class='p-membername hidden-col'>${pagingDTO.list2[i].memberName}</td>`
						+  `	<td class='p-phone hidden-col'>${pagingDTO.list2[i].phone}</td>`
						+  `	<td class='p-storeno hidden-col'>${pagingDTO.list2[i].storeNo}</td>`
						+  `	<td class='p-brandno hidden-col'>${pagingDTO.list2[i].brandNo}</td>`
						+  `	<td class='p-productno hidden-col'>${pagingDTO.list2[i].productNo}</td>`
						+  `	<td class='p-productname'>${pagingDTO.list2[i].productName}</td>`
						+  `	<td class='p-price hidden-col'>${pagingDTO.list2[i].price}</td>`
						+  `	<td class='p-clothsize hidden-col'>${pagingDTO.list2[i].clothsize}</td>`
						+  `	<td class='p-shoesize hidden-col'>${pagingDTO.list2[i].shoesize}</td>`
						+  `	<td class='p-qty hidden-col'>${pagingDTO.list2[i].qty}</td>`
						+  `	<td class='p-orderdate hidden-col'>${dateFormat(new Date(pagingDTO.list2[i].orderDate))}</td>`
						+  `	<td class='p-reservedate'>${dateFormat(new Date(pagingDTO.list2[i].reserveDate))}</td>`
						+  `	<td class='p-status hidden-col'>${pagingDTO.list2[i].status}</td>`;
				
				if (pagingDTO.list2[i].status == 0) {
					plusMsg += `<td><button class='btn btn-waiting btn-danger'`
						    +  `	onclick='approve(${pagingDTO.list2[i].no})'`
						    +  `   >대기</button></td></tr>`;
				} 
				else if (pagingDTO.list2[i].status == 1){
					plusMsg += `<td><button class='btn btn-reserved btn-success'`
						    +  `    >완료</button></td></tr>`;
				} 	
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

			let tabBody = document.getElementById('tplist');
			let pagingdiv = document.getElementById('pagination1');
			
			tabBody.innerHTML = plusMsg;
			pagingdiv.innerHTML = pagination;

		},
		 error: function(error) {
			alert('getTodayPickupList Error');
		}
	});
}

function getPickupList() {
	$.ajax({
		url: './reserve/getPickupList',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg2},
		success: function(res) {
			let pagingDTO = res;
			let plusMsg = '';
			for (let i = 0; i < pagingDTO.list2.length; i++) {
				plusMsg += `<tr data-toggle="modal" data-target="#pickupdetailModal" onclick="pickupdetail(${pagingDTO.list2[i].no})">`
						+  `	<td class='p-no hidden-col'>${pagingDTO.list2[i].no}</td>`
						+  `	<td class='p-orderno'>${pagingDTO.list2[i].orderNo}</td>`
						+  `	<td class='p-membername'>${pagingDTO.list2[i].memberName}</td>`
						+  `	<td class='p-phone hidden-col'>${pagingDTO.list2[i].phone}</td>`
						+  `	<td class='p-storeno hidden-col'>${pagingDTO.list2[i].storeNo}</td>`
						+  `	<td class='p-brandno hidden-col'>${pagingDTO.list2[i].brandNo}</td>`
						+  `	<td class='p-productno hidden-col'>${pagingDTO.list2[i].productNo}</td>`
						+  `	<td class='p-productname'>${pagingDTO.list2[i].productName}</td>`
						+  `	<td class='p-price hidden-col'>${pagingDTO.list2[i].price}</td>`
						+  `	<td class='p-clothsize'>${pagingDTO.list2[i].clothsize}</td>`
						+  `	<td class='p-shoesize'>${pagingDTO.list2[i].shoesize}</td>`
						+  `	<td class='p-qty hidden-col'>${pagingDTO.list2[i].qty}</td>`
						+  `	<td class='p-orderdate hidden-col'>${dateFormat(new Date(pagingDTO.list2[i].orderDate))}</td>`
						+  `	<td class='p-reservedate'>${dateFormat(new Date(pagingDTO.list2[i].reserveDate))}</td>`
						+  `	<td class='p-status hidden-col'>${pagingDTO.list2[i].status}</td>`;
						
						
				if (pagingDTO.list2[i].status == 0) {
					
					plusMsg += `<td><button class='btn btn-waiting btn-danger'`
						    +  `	onclick='approve(${pagingDTO.list2[i].no})'`
						    +  `   >대기</button></td></tr>`;
				} 
				else if (pagingDTO.list2[i].status == 1){
					plusMsg += `<td><button class='btn btn-reserved btn-success'`
						    +  `    >완료</button></td></tr>`;
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

			let tabBody = document.getElementById('aplist');
			let pagingdiv = document.getElementById('pagination2');
			
			tabBody.innerHTML = plusMsg;
			pagingdiv.innerHTML = pagination;

		},
		 error: function(error) {
			alert('getPickupList Error');
		}
	});
}

function permit(no) {
	
	$.ajax({
		url: './reserve/pickuppermit',
		type: 'get',
		dataType: 'text',
		data: {'no': no},
		success: function() {
			getTodayPickupList();
			getPickupList();
		},
		error: function(error) {
			alert('pickupPermit Error');
		}
	});
	
}


function getPickupCalendarData(date) {
	
	let events;
	
	$.ajax({
		url: './reserve/getPickupCalendarData',
		type: 'get',
		dataType: 'json',
		async: false,
		data: {'date': date},
		success: function(res) {
			events = res;
		},
		 error: function(error) {
			alert('getPickupCalendarData Error');
		}
	});
	
	return events;
}

function approve(no) {
	
	$('#approveModal').modal('show');
	let myTarget = event.target;
	let targetName = myTarget.parentNode.parentNode.querySelector('.p-membername').innerHTML;
	document.getElementById('approve-modal-body').innerHTML = targetName + '님의 픽업을 확정하시겠습니까?';
	document.getElementById('approve-modal-btn').setAttribute('onclick', 'permit(' + no + ')');
	event.stopPropagation();
	
}

function pickupdetail(no) {
	

	let myTarget = event.target;
	let parent = myTarget.parentNode;
	
	
	content =  `<div class="font-weight-bold">`
            +  `<p><span class="detail-head">주문번호</span>: ${parent.querySelector('.p-orderno').innerHTML}</p>`
            +  `<p><span class="detail-head">성함</span>: ${parent.querySelector('.p-membername').innerHTML}</p>`
            +  `<p><span class="detail-head">전화번호</span>: ${parent.querySelector('.p-phone').innerHTML}</p>`
            +  `<p><span class="detail-head">제품명(번호)</span>: (#${parent.querySelector('.p-productno').innerHTML}) ${parent.querySelector('.p-productname').innerHTML}</p>`
            +  `<p><span class="detail-head">가격</span>: ${parent.querySelector('.p-price').innerHTML}</p>`
			+  `<p><span class="detail-head">의류 사이즈</span>: ${parent.querySelector('.p-clothsize').innerHTML}</p>`
			+  `<p><span class="detail-head">신발 사이즈</span>: ${parent.querySelector('.p-shoesize').innerHTML}</p>`
			+  `<p><span class="detail-head">수량</span>: ${parent.querySelector('.p-qty').innerHTML}</p>`
			+  `<p><span class="detail-head">주문일자</span>: ${parent.querySelector('.p-orderdate').innerHTML}</p>`
			+  `<p><span class="detail-head">수령예약일</span>: ${parent.querySelector('.p-reservedate').innerHTML}</p>`
			+  `<p><span class="detail-head">상태</span>: ${getStatus(parent.querySelector('.p-status').innerHTML)}</p>`
            +  `</div>`;
	
	document.getElementById('pickup-modal-body').innerHTML = content;
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


