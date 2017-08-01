var requestAnimationFrameId;

(function ($) {
	var lastTime = 0;
	var vendors = ['ms', 'moz', 'webkit', 'o'];
	var config;
	var component;

	for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
		window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
		window.cancelRequestAnimationFrame = window[vendors[x] + 'CancelRequestAnimationFrame'];
	}

	window.requestAnimationFrame = function (callback, element) {
		var currTime = new Date().getTime();
		var timeToCall = Math.max(0, 16 - (currTime - lastTime));
		requestAnimationFrameId = window.setTimeout(function () {
			callback(currTime + timeToCall);
		}, timeToCall);
		lastTime = currTime + timeToCall;
		return requestAnimationFrameId;
	};

	window.cancelAnimationFrame = function (requestAnimationFrameId) {
		clearTimeout(requestAnimationFrameId);
	};

	$(function () {
		component = $('.weather[data-weather]');
		if (component.length === 0) return;

		config = component.data('weather');
		Tribal.Weather.init($, config.imageBaseUrl);

		// Changing the weather twice seems to be necessary to get the script initialized properly
		Tribal.Weather.changeWeatherTo();
		Tribal.Weather.changeWeatherTo(config.style, config.value);

		if (!config.apiUrl) return;

		$.subscribe('xom.location-changed', onLocationChanged);
	});

	function onLocationChanged(e, args) {
		if (!args || (!args.postalCode && !args.coordinates)) return;
		$.get(config.apiUrl, args).done(function (data) {
			setDayOrNight(data.time);
			Tribal.Weather.changeWeatherTo(data.style, data.value);
		});
	}

	function setDayOrNight(time) {
		component.removeClass('weather-day weather-eve').addClass(time === 'night' ? 'weather-eve' : 'weather-day');
	}

}(window.jQuery));