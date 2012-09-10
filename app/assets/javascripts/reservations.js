if (sessionStorage.getItem("currentstep") == null) {
	var currentStep = 1;	
} else {
	var currentStep = sessionStorage.getItem("currentstep");
}

console.log(currentStep);

$(document).ready(function() {
	$('#wizard').modal({
		keyboard: false,
		show: true
	}).fade;
	$('#wizard').on('shown', function () {
		$('#calendar').fullCalendar('render');
	});
	$('a[data-method="delete"]').on('ajax:success', function(e, c, s, o) {
		$(this).parent().parent().fadeOut();
	});
	$('input#btn_continue').click( function(e){
		e.preventDefault();
		currentStep += 1;
		sessionStorage.setItem("currentstep", currentStep);
		$.ajax({
			url: '/reservations', //get next step data
			success: function() {
				//update the html of wizard-form div
				//and increment the step number in the session
				console.log(currentStep);
			}
		});
	});
	$('input#btn_back').click( function(e){
		e.preventDefault();
		currentStep -= 1;
		sessionStorage.setItem("currentstep", currentStep);
		$.ajax({
			url: '/reservations', //get next step data
			success: function() {
				//update the html of wizard-form div
				//and increment the step number in the session
				console.log(currentStep);
			}
		});
	});
	$('fieldset.dept-resource').ready( function(e){
		cascadeForm = $('.new_reservation');
		departmentSelect = cascadeForm.find('#resource_ou_uid');
		resourceSelect = cascadeForm.find('#resource_id');

		cascadeSelect(departmentSelect, resourceSelect);
	});
});


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
	cascadeForm = $('.new_reservation');
	departmentSelect = cascadeForm.find('#resource_ou_uid');
	resourceSelect = cascadeForm.find('#resource_id');

	cascadeSelect(departmentSelect, resourceSelect);
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
