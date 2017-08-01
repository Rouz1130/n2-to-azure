(function ($) {

	'use strict';

	var DATA_KEY = 'em.map';

	var Mapify = function (el, options) {
		$(el).addClass('map-baidu');
		this.bmap = new BMap.Map(el);
		this.bmap.addControl(new BMap.NavigationControl());
		this.bmap.addControl(new BMap.MapTypeControl());
		this.bmap.centerAndZoom({ lat: options.center.latitude, lng: options.center.longitude }, options.zoom);
		this.markers = [];
		this.options = options;
	};

	Mapify.TYPE = 'Baidu';
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
		var bounds = getBoundsFromMarkers(mapify.markers);
		if (mapify.markers.length === 0) return;
		mapify.bmap.setViewport(bounds);
	};

	Mapify.prototype.onBoundaryChanged = function (fn) {
		var mapify = getMapify(this).bmap;

		mapify.addEventListener('moveend', function () {
			boundaryChangeEvent();
		});
		mapify.addEventListener('zoomend', function () {
			boundaryChangeEvent();
		});

		function boundaryChangeEvent() {
			var bounds = mapify.getBounds();
			var sw = bounds.getSouthWest();
			var ne = bounds.getNorthEast();
			if (sw === null || ne === null) return;
			var boundary = {
				latitude1: ne.lat,
				latitude2: sw.lat,
				longitude1: sw.lng,
				longitude2: ne.lng
			};
			fn(boundary);
		}
	};

	Mapify.prototype.onPinOpened = function (fn) {
		getMapify(this).onPinOpenedInternal = fn;
	};

	Mapify.prototype.center = function (location) {
		var mapify = getMapify(this);
		if (typeof location === 'string') {
			geocode(mapify, location);
		} else if (typeof location === 'object') {
			mapify.bmap.setCenter(new BMap.Point(location.longitude, location.latitude));
		}
	};

	Mapify.prototype.zoom = function (level) {
		var mapify = getMapify(this).bmap;
		mapify.setZoom({ zoom: level });
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
		var bounds = [];
		for (var i = 0; i < markers.length; i++) {
			var mark = markers[i].getPosition();
			bounds.push(mark);
		}
		return bounds;
	}

	function createPopupHtml(innerHtml) {
		return '<div class="map-popup map-popup-baidu"><a type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></a><i class="icon-popup-arrow"></i>' + innerHtml + '</div>';
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
		var icon = new BMap.Icon(mapify.options.pin.image, new BMap.Size(mapify.options.pin.width, mapify.options.pin.height));
		var marker = new BMap.Marker(new BMap.Point(latlng.lng, latlng.lat), { icon: icon });
		mapify.bmap.addOverlay(marker);
		mapify.markers.push(marker);
		marker.pin = pin;

		(function (marker) {
			var infoWindow = new BMap.InfoWindow(marker.pin.popup, { enableCloseOnClick: false });
			var showPopup = function (event) {
				var point = new BMap.Point(event.target.point.lng, event.target.point.lat);
				mapify.bmap.openInfoWindow(infoWindow, point);

				if (typeof mapify.onPinOpenedInternal != 'function') return;
				mapify.onPinOpenedInternal(marker.pin);
			};
			marker.addEventListener('click', showPopup);
		}(marker));
	}

	function removePin(mapify, marker) {
		var idx = mapify.markers.indexOf(marker);
		mapify.markers.splice(idx, 1);
		mapify.bmap.clearOverlays();
		mapify.markers = [];
	}

	function geocode(mapify, location) {
		mapify.geocoder = mapify.geocoder || new BMap.Geocoder();
		mapify.geocoder.getPoint(location, function (point) {
			if (point) {
				mapify.bmap.centerAndZoom(point, mapify.options.zoom || 16);
			} else {
				console.warn('Supplied location could not be geocoded.');
			}
		});
	}

}(window.jQuery));