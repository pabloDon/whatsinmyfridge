$(document).ready(function() {
	$('.tab-recipes').click(function(){
		$('.my-recipes').show();
		$('.list-favorites').css('background-color','transparent');
		$('.my-favorites').hide();
		$('.list-recipes').css('background-color','#eee');
		$('.tab-recipes').css('color','#EC7063');
		$('.tab-favorites').css('color','black');
	});
	$('.tab-favorites').click(function(){
		$('.my-recipes').hide();
		$('.list-recipes').css('background-color','transparent');
		$('.my-favorites').show();
		$('.list-favorites').css('background-color','#eee');
		$('.tab-favorites').css('color','#EC7063');
		$('.tab-recipes').css('color','black');
	});
});