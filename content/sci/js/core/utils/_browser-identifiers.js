(function ($) {

	var $html = $('html');

	addClass('MSIE', 'ie');
	addClass('MSIE 8', 'ie8');
	addClass('MSIE 9', 'ie9');
	addClass('MSIE 10', 'ie10');
	addClass('Mac OS X', 'mac');

	if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
		$html.addClass('ios');
	}

	if (/Android/.test(navigator.userAgent) && !window.MSStream) {
		$html.addClass('android');
	}

	$.publish('xom.browsers-detected');

	function addClass(browserId, className) {
		if (navigator.appVersion.indexOf(browserId) === -1) return;
		$html.addClass(className);
	}

}(window.jQuery));