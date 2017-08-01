(function ($) {
	$(function () {
		$('form[auto-validate="true"]').validate();
		bindEvents();
	});

	function bindEvents() {
		$('body').on('focus blur', 'input, select, textarea', onFieldInteraction);
	}

	function onFieldInteraction(e) {
		var $field = $(this);
		var analytics = $field.data('analytics');
		if (!analytics) return;
		analytics.et = $field.val() ? '1' : '0';
		$.publish('xom.analytics', analytics);
	}

}(window.jQuery));