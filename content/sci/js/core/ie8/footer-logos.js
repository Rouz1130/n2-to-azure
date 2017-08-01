(function ($) {

	$.subscribe('xom.browsers-detected', addPngImages);

	function addPngImages() {
		if ($('html.ie8').length === 0) return;

		$('#footer-logos a[data-img]').each(function () {
			var link = $(this);
			var src = link.data('img');
			var img = $('<img/>');
			img.attr('src', src);
			link.append(img);
		});
	}

}(window.jQuery));