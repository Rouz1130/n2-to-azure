(function ($) {
	$('script[data-app]').each(function () {
		var $this = $(this),
			appName= $this.data('app'),
			constants = $.parseJSON($this.html()); // use html() instead of text() so it works on IE8
		for (var key in constants) {
			angular.module(appName).constant(key, constants[key]);
		}
	});
}(window.jQuery));