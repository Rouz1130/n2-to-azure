(function ($) {

	$('.nav-main-search-trigger').on('click', function() {
	    $(this).toggleClass('nav-main-item-active');
	    $('html').toggleClass('nav-search-open');
	    $('.nav-main-search input').focus();
	});

}(window.jQuery));