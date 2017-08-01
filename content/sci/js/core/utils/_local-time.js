(function ($, m) {

	if (!$) {
		return console.log('localTime plugin requires jQuery');
	} else if (!m) {
		return console.log('localTime plugin requires Moment.js');
	}

	$.fn.localTime = function (options) {
		this.each(function () {
			var self = $(this);
			var config = $.extend({}, $.fn.localTime.defaults, self.data(), options);
			var utcTime = self.data('utc');
			self.text(m(utcTime).format(config.format));
		});
		return this;
	};

	$.fn.localTime.defaults = {
		format: 'dddd MMMM D, YYYY'
	};

	$(function () {
		$('.local-time').localTime();
	});

}(window.jQuery, window.moment));