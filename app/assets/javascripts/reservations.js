$(document).ready(function() {
	// $('#wizard').modal({
	// 	keyboard: false,
	// 	show: true
	// }).fade;
	// $('#wizard').on('shown', function () {
	//   $('#calendar').fullCalendar('render');
	// })
	// $('a[data-method="delete"]').on('ajax:success', function(e, c, s, o) {
	//   $(this).parent().parent().fadeOut();
	// });
})


// Cascading select in step #2
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
