function sendToAdminReserve() {
	
	let wsocket = new WebSocket(`ws://${window.location.hostname}/subscribe/notice/0`);

	console.log('websocket connected');
	
	let name = document.getElementById('name').value;
	let reserveDate = document.getElementById('reserveDate').value;
	let brandNo = document.getElementById('brandNo').value;
	let storeNo = document.getElementById('storeNo').value;
	
	let data = {'command':'예약 요청',
	            'brandNo': brandNo,
                'storeNo': storeNo,
	            'name':name,
                'reserveDate':reserveDate};
	
	wsocket.onopen = function() {
		wsocket.send(JSON.stringify(data));
	};

}