window.addEventListener('load', function() {

	let wsocket = new WebSocket(`ws://${window.location.hostname}/subscribe/notice/1`);

	wsocket.onmessage = onMessage;
	wsocket.onopen = function() {
		console.log('socket connected');
	}
});

function onMessage(evt) {
	
	let data = JSON.parse(evt.data);
	
	toastr.options = {
	  "closeButton": true,
	  "debug": false,
	  "newestOnTop": false,
	  "progressBar": false,
	  "positionClass": "toast-bottom-right",
	  "preventDuplicates": false,
	  "showDuration": "300",
	  "hideDuration": "1000",
	  "timeOut": "0",
	  "extendedTimeOut": "0",
	  "showEasing": "swing",
	  "hideEasing": "linear",
	  "showMethod": "fadeIn",
	  "hideMethod": "fadeOut"
	}
	Command: toastr["info"](`${data.content1} : ${data.content2}`,`새로운 ${data.command}`);
}
