(function ($) {

	$('body').on('click', '.class-toggle', toggleClass);

	function toggleClass(e) {
		var self = $(this);
		var target = self.data('target') || self;
		var className = self.data('className');
		e.preventDefault();
		$(target).toggleClass(className);
	}

}(window.jQuery));