(function ($) {

	$('body')
		.on('show.bs.modal', '.modal-iframe', onModalShow)
		.on('hide.bs.modal', onModalHide);

	function onModalShow(e) {
		var modal = $(e.target);
		var src = modal.data('iframeSrc');
		var iframe = modal.find('iframe');
		if (!iframe.length || !src) return;
		iframe.attr('src', src);
	}

	function onModalHide(e) {
		var modal = $(e.target);
		var analytics = modal.data('analytics');
		if (!analytics) return;
		analytics.csg = 'Cancel';
		$.publish('xom.analytics', analytics);
	}
}(window.jQuery));