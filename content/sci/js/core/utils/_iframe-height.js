(function ($) {

	var INTERVAL_SPEED = 50;

	$.fn.iframeHeight = function () {
		this.each(function () {

			var $self = $(this);
			var $body;
			var $contentContainer;
			var lastHeight = -1;
			var interval;

			$self.load(function () {
				$body = $self.contents().find('body');
				$body.css('overflow-y', 'hidden');
				$contentContainer = $body.find('form').first(); /* using body{height:100%} in an iframe causes height to be reported as zero, so we'll target the top-level form element */
				checkHeight();
				interval = setInterval(checkHeight, INTERVAL_SPEED);
				$self.unload(release);
			});

			function checkHeight() {
				var height = $contentContainer.outerHeight(true) + parseInt($body.css('margin-top')) + parseInt($body.css('margin-bottom')) + parseInt($body.css('padding-top')) + parseInt($body.css('padding-bottom'));
				if (height === null || height == lastHeight) return;
				$self.css('height', height);
				lastHeight = height;
			}

			function release() {
				clearInterval(interval);
				lastHeight = -1;
			}
		});

		return this;
	};

	$(function () {
		$('.iframe-height').iframeHeight();
	});

}(window.jQuery));