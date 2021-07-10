window.onload = function() {
	connect();
}

function sendToAdminReserve() {
	
	//connect();

	console.log('websocket connected');
	
	let reserveDate = $('#dp1').val() + " " + $(this).text();
	let brandNo = document.getElementById('brandNo').value;
	let storeNo = $('#deptselect').val();
	
	let data = {'command':'예약 요청',
	            'brandNo': brandNo,
                'storeNo': storeNo,
                'reserveDate':reserveDate};
	

	send(data);
}

function sendToAdminPickup() {
	
	//connect();
	
	console.log('websocket connected');
	
	let reserveDate = document.getElementById('reserveDate').value;
	let storeNo = document.getElementById('storeNo').value;
	
	for (let i = 0; i < sendlist.length; i++) {
		
		let data = {'command':'픽업 주문',
		            'storeNo': storeNo,
	                'productNo': sendlist[i].productNo + "",
	                'reserveDate':reserveDate};
		console.log(data);
		
	send(data);
		

		
	}
	

}

function connect() {
   window.wsocket = new WebSocket(`ws://${window.location.hostname}/subscribe/notice/0`);
   wsocket.onopen = onOpen;
};

function disconnect() {
   wsocket.close();
};

function onOpen(evt) {
   console.log('socket connected');
};

function onClose(evt) {
   console.log('socket disconnected');
};

function send(data) {
   wsocket.send(JSON.stringify(data));
};