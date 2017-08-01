(function ($) {

	$('body').on('click', '.nav-social-trigger', toggleClass);

	function toggleClass() {
		$(this).closest('.nav-social').toggleClass('nav-social-on');
	}

}(window.jQuery));