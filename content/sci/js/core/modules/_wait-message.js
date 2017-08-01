(function ($) {

	var element;

	$(function () {
		bindEvents();
	});

	function bindEvents() {
		element = $('#wait-message');
		element.css('margin-left', -element.width() / 2);

		$.subscribe('xom.loading', function (e, a) {
			element.toggleClass('active', !!a);
		});
	}

}(window.jQuery));