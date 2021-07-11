window.onload = function() {
	
	window.pg1 = 1;

	getAccumList();

};


function move1(pg) {
	window.pg1 = pg;
	getAccumList();
}


function getAccumList() {
	$.ajax({
		url: './reserve/getAccumList',
		type: 'get',
		dataType: 'json',
		data: {'pg': window.pg1},
		success: function(res) {
			
			let pagingDTO = res;
			let plusMsg = '';
			for (let i = 0; i < pagingDTO.list3.length; i++) {
				plusMsg += `<tr>`
						+  `	<td class='a-no'>${pagingDTO.list3[i].no}</td>`
						+  `	<td class='a-name'>${pagingDTO.list3[i].name}</td>`
						+  `	<td class='a-cnt'>${pagingDTO.list3[i].cnt}</td>`
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
					pagination += `<div class='page-link' style='background-color: #36b9cc; color: white;'>${i}</div>`;
				} else {
					pagination += `<div class='page-link' onclick='move1(${i})'>${i}</div>`;
				}
			}
			
			if (pagingDTO.endPage == pagingDTO.totalPage) {
				pagination += `<div class='page-link'>다음</div>`;
			} else {
				pagination += `<div class='page-link' onclick='move1(${pagingDTO.endPage+1})'>다음</div>`;
			}

			let tabBody = document.getElementById('accumlist');
			let pagingdiv = document.getElementById('pagination1');
			
			tabBody.innerHTML = plusMsg;
			pagingdiv.innerHTML = pagination;

		},
		 error: function(error) {
			alert('getAccumulateList Error');
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
