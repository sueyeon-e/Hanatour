$(function() {

		
		
	$(".container_right_body4 > a:nth-child(1)").click(function(e) {
		e.preventDefault();
		window.history.back();
	});
		
		
	$(".container_right_body4 > a:nth-child(2)").click(function(e) { 
		e.preventDefault();
		$("input[name='user_id']").prop("disabled", false);
		$(this).closest("form").submit();
	});		

		
})