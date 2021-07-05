window.onload = function() {
	
	window.pg1 = 1;
	window.pg2 = 1;
	window.pg3 = 1;
	window.search = '';
	
	console.log('js 실행됨');
	
	$.ajax({
		url: './reserve/getUnpermittedVisitList',
		type: 'get',
		data: {'pg': window.pg1, 'search': window.search},
		success: function(res) {
			console.log(res);
			
			let readList = res;
			let plusMsg = '';
			console.log(readList.length);
			for (let i = 0; i < readList.length; i++) {
				console.log(readList[i]);
				plusMsg += '<tr>'
				        +  `<td>${readList[i].no}</td>`
						+  `<td>${readList[i].name}</td>`
						+  `<td>${readList[i].phone}</td>`
						+  `<td>${readList[i].restime}</td>`
						+  `<td><button>승인</button></td>`
						+  '</tr>'
				
			}
			
			let tabBody = document.getElementById('upv-list');
			tabBody.innerHTML = plusMsg;

		},
		 error: function(error) {
			alert(error);
		}
	});
	
};

