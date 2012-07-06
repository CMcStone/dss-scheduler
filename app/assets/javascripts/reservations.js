$(document).ready(function() {
	$('#wizard').modal({
		keyboard: false,
		show: true
	}).fade;
	$('#wizard').on('shown', function () {
	  $('#calendar').fullCalendar('render');
	})
	$('a[data-method="delete"]').on('ajax:success', function(e, c, s, o) {
	  $(this).parent().parent().fadeOut();
	});
})
