
function titleOut() {
	
	let title = document.getElementById('title').value;
	if (title == '') {
		title = '----- 할인 쿠폰';
	}
	document.querySelector('.coupon-img-title').innerHTML = title;
	
}

function amountOut() {
	
	let amount = document.getElementById('amount').value;
	if (amount == '') {
		amount = '00';
	}
	document.querySelector('.coupon-img-amount').innerHTML = amount;
	
}

function typeOut(type) {

	switch(type) {
		case '0':
			type = '%';
			break;
	    case '1':
			type = '원';
			break;
	}
	document.querySelector('.coupon-img-type').innerHTML = type;
	
}

function dateOut() {
	
	let duetime = document.getElementById('duetime').value;
	if (duetime == '') {
		duetime = '0000-00-00';
	}
	document.querySelector('.coupon-img-duetime').innerHTML = '~' + duetime;
	
}