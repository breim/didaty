function setContents(){
	jQuery(".contents").on('cocoon:after-insert', function(e, insertedItem) {
		console.log('hi');
	});
}

function addItens(){
	$(".grid, .subgrid").sortable({
		tolerance: 'pointer',
		revert: 'invalid',
		placeholder: 'span2 well placeholder tile',
		forceHelperSize: true
	}).bind('sortupdate', function() {
		$('.grid > .nested-fields').each(function(idx) {
			var inputField = $(this).find('.course_concepts_fiat input');
			inputField.val(idx)[0].value;
		});
		$('.subgrid .nested-fields').each(function(idx) {
			var inputField = $(this).find('.course_concepts_contents_fiat input');
			inputField.val(idx)[0].value;
		});
	});
};

$( document ).ready(function() {
	addItens();
	$('#concepts').on('cocoon:after-insert', function(e, insertedItem) {
		addItens();
		$( "[id^='concept-panel']" ).mouseover(function() {
			$(this).css( 'cursor', 'move' );
		});
	});
	$( "[id^='concept-panel']" ).mouseover(function() {
		$(this).css( 'cursor', 'move' );
	});
});

$(document).ready(function () {
	$(".dropzone").dropzone({ url: "http://localhost:3000/" });
});