(function ($) {

	var sizes = ['xs', 'sm', 'md', 'lg', 'xl'];

	$.subscribe('xom.breakpoints', onBreakpointsChanged);

	function onBreakpointsChanged() {
		var images = $('.breakpoints img[data-src]');
		images.each(function () { setImageSrc($(this)); });
	}

	function setImageSrc(img) {
		var parentSize = getBreakpointParent(img).data('breakpoint');
		var bestSrc = getBestImageSource(parentSize, img.data('src'));
		if (bestSrc === img.attr('src')) return;
		img.attr('src', bestSrc);
	}

	function getBreakpointParent(img) {
		var breakpointParent = img.data('breakpointParent');
		if (breakpointParent) return breakpointParent;
		breakpointParent = img.closest('.breakpoints');
		img.data('breakpointParent', breakpointParent);
		return breakpointParent;
	}

	function getBestImageSource(size, sources) {
		var idx = sizes.indexOf(size);
		for (var i = idx; i < sizes.length; i++) {
			if (sources[sizes[i]]) return sources[sizes[i]];
		}
		return null;
	}

}(window.jQuery));