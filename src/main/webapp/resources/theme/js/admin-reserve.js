window.onload = function() {
	window.pg1 = 1;
	window.pg2 = 1;
	window.pg3 = 1;
	window.search = '윤';
	console.log('js 실행됨');
	$.ajax({
		url: './reserve/getUnpermittedVisitList',
		type: 'get',
		data: {'pg': window.pg1, 'search': window.search},
		success: function(res) {
			console.log(res);
		},
		 error: function(error) {
			alert(error);
		}
	})
	
	
};

