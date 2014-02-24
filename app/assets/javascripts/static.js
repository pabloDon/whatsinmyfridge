// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
	// Init Skrollr
	    var s = skrollr.init({
	        render: function(data) {
	            //Debugging - Log the current scroll position.
				//if (data.curTop % 10 == 0)
	            //	console.log(data.curTop);
	        }
	    });
		$('.slider-recipe').bxSlider({
		    slideWidth: 300,
		    minSlides: 2,
		    maxSlides: 3,
		    moveSlides: 1,
		    slideMargin: 10
		  });
});