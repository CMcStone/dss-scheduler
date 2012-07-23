$(document).ready(function() {

	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();

	$('#calendar').fullCalendar({
		editable: true,        
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultView: 'agendaWeek',
		height: 300,
		slotMinutes: 30,    
		selectable: true,
		selectHelper: true,
		editable: true,
		minTime: 7,
		maxTime: 19,

		select: function(start, end, allDay) { 
			var title = prompt('Exchange Event ID:');
			if (title) {
				$('#calendar').fullCalendar('renderEvent', {
						title: title,
						start: start,
						end: end,
						allDay: allDay
					},
					true // make the event "stick"
				);
				createEvent({
					title: title,
					start: start,
					end: end,
					allDay: allDay
				});
			}
			$('#calendar').fullCalendar('unselect');
		},


		loading: function(bool){
			if (bool) 
				$('#loading').show();
			else 
				$('#loading').hide();
		},

		// a future calendar might have many sources.        
		eventSources: [{
			url: '/reservations',
			color: '#2F4D6A',
			textColor: 'white',
			error: function() {
				alert('there was an error while fetching events!');
			}
		}],

		timeFormat: 'h:mm t{ - h:mm t} ',
		dragOpacity: "0.5",

		//http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
		eventDrop: function(event, dayDelta, minuteDelta, allDay, revertFunc){
			updateEvent(event);
		},

		// http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
		eventResize: function(event, dayDelta, minuteDelta, revertFunc){
			updateEvent(event);
		},

		// http://arshaw.com/fullcalendar/docs/mouse/eventClick/
		eventClick: function(event, jsEvent, view){
			// would like a lightbox here.
		},
	});
});

function updateEvent(the_event) {
	$.update(
		"/reservations/" + the_event.id, {
			reservation: {
				exchange_event_id: the_event.title,
				cache_start_time: "" + the_event.start,
				cache_end_time: "" + the_event.end,
				person_id: the_event.description,
				resource_id: the_event.allDay
			}
		}
	);
};

function createEvent(the_event) {
	$.post(
		"/reservations", {
			reservation: {
				exchange_event_id: the_event.title,
				cache_start_time: "" + the_event.start,
				cache_end_time: "" + the_event.end,
				person_id: the_event.description,
				resource_id: the_event.allDay
			}
		}
	)
	.success(function() { alert("second success"); })
	.error(function() { alert("error"); })
	.complete(function() { alert("complete"); });
};