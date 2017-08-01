(function ($, undefined) {

	var cookieName = 'EXXON_GEOLOCATION'; // should read from meta tag

	$(init);

	function init() {
		var location = getLocationCookie();
		if (location === undefined) {
			return;
		} else if (location === null) {
			getUserLocation();
		} else {
			notify(location);
		}
	}

	function getLocationCookie() {
		try {
			$.cookie.json = true;
			return $.cookie(cookieName);
		} catch (e) {
			return undefined;
		}
	}

	function setLocationCookie(data) {
		$.cookie.json = true;
		$.cookie(cookieName, data, { path: '/' });
	}

	function getUserLocation() {
		if (!window.navigator.geolocation) {
			console.warn('Geolocation not supported.');
			return;
		}
		window.navigator.geolocation.getCurrentPosition(onLocationFound, onLocationFailed, { timeout: 10000 });
	}

	function onLocationFound(position) {
		var key = $('meta[name=bingMapKey]').attr('content');
		if (!key) {
			console.warn('Cannot reverse geocode because Bing Map key is missing.');
			return;
		}

		var coords = position.coords;
		var settings = {
			data: {
				jsonp: 'GeocodeCallback',
				key: key
			},
			dataType: 'jsonp',
			jsonpCallback: 'GeocodeCallback',
			method: 'GET',
			url: 'https://dev.virtualearth.net/REST/v1/Locations/' + coords.latitude + ',' + coords.longitude
		};

		$.ajax(settings).done(function (data) {
			var location = {
				lat: coords.latitude,
				lng: coords.longitude
			};

			if (data.resourceSets.length > 0 && data.resourceSets[0].resources.length > 0) {
				var first = data.resourceSets[0].resources[0];
				location.name = first.name;
				location.countryRegion = first.address.countryRegion;
			}

			setLocationCookie(location);
			notify(location);
		});
	}

	function onLocationFailed(err) {
		console.warn('Geolocation failed', err);
	}

	function notify(location) {
		$(function () {
			$.publish('xom.geolocation', location);
		});
	}

}(window.jQuery));