window.onload = function() {
	
    let rcalendarEl = document.getElementById('reservecalendar');
    let rcalendar = new FullCalendar.Calendar(rcalendarEl, {
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
	
	let rarr = getCalendarData(getYearMonth(new Date()));

	rcalendar.addEventSource(rarr);
	rcalendar.render();
	
	let rcurDate = rcalendar.getDate();
	let rprevBtn = rcalendarEl.querySelector('.fc-prev-button');
	let rnextBtn = rcalendarEl.querySelector('.fc-next-button');
	let rtodayBtn = rcalendarEl.querySelector('.fc-today-button');
	
	rprevBtn.onclick = function() {
		rcurDate = rcalendar.getDate();
		let arr = getCalendarData(getYearMonth(rcurDate));
		let removeEvents = rcalendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		rcalendar.addEventSource(arr);
		rcalendar.refetchEvents();
	}
	
	rnextBtn.onclick = function() {
		rcurDate = rcalendar.getDate();
		let arr = getCalendarData(getYearMonth(rcurDate));
		let removeEvents = rcalendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		rcalendar.addEventSource(arr);
		rcalendar.refetchEvents();
	}
	
	rtodayBtn.onclick = function() {
		rcurDate = rcalendar.getDate();
		let arr = getCalendarData(getYearMonth(rcurDate));
		let removeEvents = rcalendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		rcalendar.addEventSource(arr);
		rcalendar.refetchEvents();
	}
	
	let pcalendarEl = document.getElementById('pickupcalendar');
    let pcalendar = new FullCalendar.Calendar(pcalendarEl, {
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
	
	let parr = getPickupCalendarData(getYearMonth(new Date()));

	pcalendar.addEventSource(parr);
	pcalendar.render();
	
	let pcurDate = pcalendar.getDate();
	let pprevBtn = pcalendarEl.querySelector('.fc-prev-button');
	let pnextBtn = pcalendarEl.querySelector('.fc-next-button');
	let ptodayBtn = pcalendarEl.querySelector('.fc-today-button');
	
	pprevBtn.onclick = function() {
		pcurDate = pcalendar.getDate();
		let arr = getPickupCalendarData(getYearMonth(pcurDate));
		let removeEvents = pcalendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		pcalendar.addEventSource(arr);
		pcalendar.refetchEvents();
	}
	
	pnextBtn.onclick = function() {
		pcurDate = pcalendar.getDate();
		let arr = getPickupCalendarData(getYearMonth(pcurDate));
		let removeEvents = pcalendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		pcalendar.addEventSource(arr);
		pcalendar.refetchEvents();
	}
	
	ptodayBtn.onclick = function() {
		pcurDate = pcalendar.getDate();
		let arr = getPickupCalendarData(getYearMonth(pcurDate));
		let removeEvents = pcalendar.getEventSources();
		removeEvents.forEach(event => {
		     event.remove();
		});
		pcalendar.addEventSource(arr);
		pcalendar.refetchEvents();
	}
	

};

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

function getYearMonth(date) {
    let month  = date.getMonth() + 1;


    month  = month >= 10 ? month : '0' + month;


    return date.getFullYear() + '-' + month;
};

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
