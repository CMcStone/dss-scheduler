


// Source: http://jsatt.blogspot.com/2010/01/cascading-select-boxes-using-jquery.html
function cascadeSelect(parent, child){
		var childOptions = child.find('option:not(.static)');
			child.data('options',childOptions);

		parent.change(function(){
			childOptions.remove();
			child
				.append(child.data('options').filter('.dep_' + this.value))
				.change();
		})

		childOptions.not('.static, .dep_' + parent.val()).remove();

}

$(function(){
	//cascadeForm = $('.new_reservation');
	//departmentSelect = cascadeForm.find('#resource_ou_uid');
	//resourceSelect = cascadeForm.find('#resource_id');

	//cascadeSelect(departmentSelect, resourceSelect);
});

function getResourceQuestions(resource) {
	$.ajax({
		url: '/resources/' + resource + '/questions.json',
		success: function(questions) {
			
			//$('div#debug-area').html(result);
			var tmpl = $('#tmpl-question').html();
			//console.log(tmpl);
			$('div#wizard-form').html('');
			_.each(questions, function(question) {
				var compiled = _.template(tmpl, {question: question});
				$('div#wizard-form').append(compiled);
			});
		}
	})
}



(function (reservations, $, undefined) {
	reservations.current_step = null;
	reservations.reservations = null;

	reservations.initialize = function() {
		reservations.current_step = 1;
		console.log('I just initialized!');
		
		$('#wizard').modal({
			keyboard: false,
			show: true
		});
		$('#wizard').on('shown', function () {
			$('#calendar').fullCalendar('render');
		});
		$('a[data-method="delete"]').on('ajax:success', function(e, c, s, o) {
			$(this).parent().parent().fadeOut();
			console.log(e);
		});
		$('input#btn_continue').click( function(e){
			e.preventDefault();
			reservations.current_step++;
			reservations.perform_step();
		});
		$('input#btn_back').click( function(e){
			e.preventDefault();
			reservations.current_step--;
			reservations.perform_step();
		});
		$('fieldset.dept-resource').ready( function(e){
			cascadeForm = $('.new_reservation');
			departmentSelect = cascadeForm.find('#resource_ou_uid');
			resourceSelect = cascadeForm.find('#resource_id');

			cascadeSelect(departmentSelect, resourceSelect);
		});
		
		reservations.perform_step();
		
	};
	
	reservations.perform_step = function() {
		var tmpl = $("#templ-step" + reservations.current_step).html();
		$('.modal').empty();
		console.log(reservations);
		var compiled = _.template(tmpl, {reservations: reservations.reservations, resource_categories: reservations.resource_categories});
		$('.modal').html(compiled);
	}

} (window.reservations = window.reservations || {}, jQuery));
