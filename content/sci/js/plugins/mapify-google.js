(function ($) {

	'use strict';

	var DATA_KEY = 'em.map';

	var Mapify = function (el, options) {
		$(el).addClass('map-google');
		this.gmap = new google.maps.Map(el, {
			center: new google.maps.LatLng(options.center.latitude, options.center.longitude),
			disableDoubleClickZoom: !!options.disableZoom,
			draggable: !options.disableMouse,
			mapTypeControl: false,
			mapTypeId: options.mapType == 'aerial' ? google.maps.MapTypeId.SATELLITE : google.maps.MapTypeId.ROADMAP,
			scaleControl: options.showScale,
			showDashboard: !options.disableZoom,
			zoom: options.zoom,
			zoomControl: !options.disableZoom,
		});
		this.markers = [];
		this.options = $.extend({ culture: 'en-us' }, options);
		this.pinImage = options.pin.image;
		this.infoWindow = new google.maps.InfoWindow();
		this.boundsChangedTimeout = 0;
	};

	Mapify.TYPE = 'Google';
	Mapify.VERSION = '1.0';


	// MAP FUNCTIONS

	Mapify.prototype.setPins = function (pins) {
		var mapify = getMapify(this);
		var result = reconcilePins(mapify.markers, pins);
		var i;

		for (i = 0; i < result.add.length; i++) {
			addPin(mapify, result.add[i]);
		}

		for (i = 0; i < result.remove.length; i++) {
			removePin(mapify, result.remove[i]);
		}
	};

	Mapify.prototype.setBoundaryToPins = function () {
		var mapify = getMapify(this);
		switch (mapify.markers.length) {
			case 0:
				return;
			case 1:
				setCenter(mapify, mapify.markers[0].getPosition());
				mapify.gmap.setZoom(8);
				return;
			default:
				var bounds = getBoundsFromMarkers(mapify.markers);
				mapify.gmap.fitBounds(bounds);
				return;
		}
	};

	Mapify.prototype.onBoundaryChanged = function (fn) {
		var mapify = getMapify(this).gmap;
		mapify.addListener('bounds_changed', function () {
			clearTimeout(mapify.boundsChangedTimeout);
			mapify.boundsChangedTimeout = setTimeout(function () {
				var bounds = mapify.getBounds();
				var ne = bounds.getNorthEast();
				var sw = bounds.getSouthWest();
				var boundary = {
					latitude1: sw.lat(),
					latitude2: ne.lat(),
					longitude1: sw.lng(),
					longitude2: ne.lng()
				};
				fn(boundary);
			}, 300);
		});
	};

	Mapify.prototype.onCenterSet = function (fn) {
		getMapify(this).onCenterSetInternal = fn;
	};

	Mapify.prototype.onGeocode = function (fn) {
		getMapify(this).onGeocodeInternal = fn;
	};

	Mapify.prototype.onInteraction = function (fn) {
		getMapify(this).onInteractionInternal = fn;
	};

	Mapify.prototype.onPinOpened = function (fn) {
		getMapify(this).onPinOpenedInternal = fn;
	};

	Mapify.prototype.center = function (location) {
		var mapify = getMapify(this);
		if (typeof location === 'string') {
			geocode(mapify, location);
		} else if (typeof location === 'object') {
			mapify.gmap.setCenter(new google.maps.LatLng(location.latitude, location.longitude));
		}
	};

	Mapify.prototype.zoom = function (level) {
		var mapify = getMapify(this).gmap;
		mapify.setZoom(level);
	};


	// PLUGIN DEFINITION

	var Plugin = function (option) {

		var args = arguments.length > 1 ? arguments[1] : undefined;
		return this.each(function () {
			var $this = $(this),
				instance = $this.data(DATA_KEY);
			if (!instance) {
				$this.data(DATA_KEY, (instance = new Mapify(this, option)));
			}
			if (typeof option == 'string' && typeof instance[option] == 'function') {
				instance[option].call($this, args);
			} else {
				instance.gmap.addListener('dragend', function () { fireInteraction(instance, 'Drag'); });
				instance.gmap.addListener('zoom_changed', function () { fireInteraction(instance, 'Zoom'); });
				instance.gmap.addListener('mouseover', function () { onMouse(instance, 'mouseover'); });
				instance.gmap.addListener('mouseout', function () { onMouse(instance, 'mouseout'); });
			}
		});
	};

	$.fn.mapify = Plugin;
	$.fn.mapify.Constructor = Mapify;


	// HELPERS

	function getMapify($el) {
		return $el.data(DATA_KEY);
	}

	function getBoundsFromMarkers(markers) {
		var bounds = new google.maps.LatLngBounds();
		for (var i = 0; i < markers.length; i++) {
			bounds.extend(markers[i].getPosition());
		}
		return bounds;
	}

	function createPopupHtml(innerHtml) {
		return '<div class="map-popup"><a type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></a><i class="icon-popup-arrow"></i>' + innerHtml + '</div>';
	}

	function reconcilePins(markers, pins) {
		var result = { add: [], remove: [] };
		var i;

		for (i = 0; i < markers.length; i++) {
			if (getEntityIndex(pins, markers[i]) >= 0) continue;
			result.remove.push(markers[i]);
		}

		for (i = 0; i < pins.length; i++) {
			if (getPinIndex(markers, pins[i]) >= 0) continue;
			result.add.push(pins[i]);
		}

		return result;
	}

	function getEntityIndex(pins, marker) {
		for (var i = 0; i < pins.length; i++) {
			if (pins[i].id == marker.pin.id) return i;
		}
		return -1;
	}

	function getPinIndex(markers, pin) {
		for (var i = 0; i < markers.length; i++) {
			if (markers[i].pin.id == pin.id) return i;
		}
		return -1;
	}

	function addPin(mapify, pin) {
		var coords = pin.position;
		var latlng = { lat: coords.latitude, lng: coords.longitude };
		var marker = new google.maps.Marker({ position: latlng, icon: pin.image || mapify.pinImage });
		mapify.markers.push(marker);
		marker.pin = pin;
		marker.setMap(mapify.gmap);
		(function (marker) {
			var showPopup = function (event) {
				mapify.infoWindow.setOptions({ content: marker.pin.popup });
				mapify.infoWindow.open(mapify.gmap, marker);

				if (typeof mapify.onPinOpenedInternal != 'function') return;
				mapify.onPinOpenedInternal(marker.pin);
			};
			marker.addListener('click', showPopup);
		}(marker));
	}

	function removePin(mapify, marker) {
		var idx = mapify.markers.indexOf(marker);
		mapify.markers.splice(idx, 1);
		marker.setMap(null);
	}

	function geocode(mapify, location) {
		mapify.geocoder = mapify.geocoder || new google.maps.Geocoder();
		mapify.geocoder.geocode({ address: location, language: mapify.options.languageCode }, function (results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var r = results[0];

				mapify.gmap.fitBounds(r.geometry.bounds);

				if (typeof mapify.onGeocodeInternal != 'function') return;
				mapify.onGeocodeInternal({
					address: r.formatted_address,
					count: results.length,
					countryRegion: getCountryName(r.address_components),
					latitude: r.geometry.location.lat(),
					longitude: r.geometry.location.lng(),
					name: r.address_components[0].long_name,
					provider: 'Google',
					type: r.types.join(',')
				});
			} else {
				console.warn('Supplied location could not be geocoded.');
				if (typeof mapify.onGeocodeInternal != 'function') return;
				mapify.onGeocodeInternal({ provider: 'Google', count: 0 });
			}
		});
	}

	function getCountryName(components) {
		var matches = components.filter(isCountryComponent);
		return matches.length > 0 ? matches[0].long_name : null;
	}

	function isCountryComponent(c) {
		return c.types.filter(function (x) { return x === 'country'; }).length > 0;
	}

	function onMouse(mapify, eventName) {
		if (eventName == 'mouseover') {
			clearTimeout(mapify.hoverTimeout);
			mapify.hoverTimeout = setTimeout(function () {
				fireInteraction(mapify, 'Hover');
			}, 3000);
		} else if (eventName == 'mouseout') {
			clearTimeout(mapify.hoverTimeout);
		}
	}

	function fireInteraction(mapify, type) {
		if (typeof mapify.onInteractionInternal != 'function') return;
		mapify.onInteractionInternal(type);
	}

	function setCenter(mapify, point) {
		mapify.gmap.setCenter(point);
		if (typeof mapify.onCenterSetInternal != 'function') return;
		mapify.onCenterSetInternal(point);
	}

}(window.jQuery));