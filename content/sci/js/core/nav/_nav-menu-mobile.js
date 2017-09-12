(function ($) {

    var SPEED = 350; // this should match the CSS transition time
		
    $('.nav-main-list-trigger').on('click', function() {
    
	    var $html = $('html').toggleClass('nav-main-mobile-open').addClass('nav-main-mobile-transition');
	    setTimeout((function () {
	        $html.removeClass('nav-main-mobile-transition');
	    }), SPEED);
	});

    $('#nav-main-mobile').on('show.bs.collapse', function(e) {
        $(e.target).parent('li').addClass('openPanel');
    }).on('hidden.bs.collapse', function (e) {
        $(e.target).parent('li').removeClass('openPanel');
    });
}(window.jQuery));