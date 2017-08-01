(function ($) {

	var attrName = 'data-no-svg';

	if (document.implementation.hasFeature('http://www.w3.org/TR/SVG11/feature#Image', '1.1')) return;

	applySvgFallback();

	function applySvgFallback() {
		$('img[' + attrName + ']').each(function () {
			var $img = $(this);
			var fallback = $img.attr(attrName);
			if (!fallback) return;
			$img.attr('src', fallback).removeAttr(attrName);
		});
	}

}(window.jQuery));