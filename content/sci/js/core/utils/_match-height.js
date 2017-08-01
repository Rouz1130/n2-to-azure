(function ($) {

	// Removes any height set on each child so its auto height can be calculated.
	// The height of the tallest child is then applied to all children. 
	function matchHeight(children) {
		var height = 0;
		children.css('height', 'auto');
		children.each(function () {
			height = Math.max(height, getHeight($(this)));
		});
		children.css('height', height + 'px');
	}

	// Avoid problems with box-sizing by using .css() instead of .height() or .outerHeight()
	function getHeight(element) {
		return parseInt(element.css('height'));
	}

	// Define the plugin
	$.fn.matchHeight = function () {
		this.each(function () {
			var $self = $(this),
				selectors = $self.attr('data-match-height-selectors').split(','),
				onResize = function () {
					for (var i = 0; i < selectors.length; i++) {
						matchHeight($self.find(selectors[i]));
					}
				};

			$(window).off('resize', onResize);
			$(window).on('resize', onResize);

			onResize();
		});

		return this;
	};

	// Apply the plugin at dom-ready
	$(function () {
		$('.match-height').matchHeight();
	});

}(window.jQuery));