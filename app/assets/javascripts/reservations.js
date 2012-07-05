$(document).ready(function() {
	$('#wizard').modal({
		keyboard: false,
		show: true
	}).fade;
	$('#wizard').on('shown', function () {
	  $('#calendar').fullCalendar('render');
	})
})

