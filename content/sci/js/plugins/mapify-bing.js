(function ($) {

	// Note: Using separate layers (i.e. entity collections) for pins vs the infobox resulted in click events not
	// firing on the pins.

	'use strict';

	var DATA_KEY = 'em.map';

	var Mapify = function (el, options) {
		$(el).addClass('map-bing');
		this.options = $.extend({}, options);
		this.infobox = null;
		this.bingMap = new Microsoft.Maps.Map(el, {
			center: typeof options.center === 'object' ? new Microsoft.Maps.Location(options.center.latitude, options.center.longitude) : null,
			credentials: options.key,
			disableMouseInput: options.disableMouse,
			disablePanning: options.disablePan,
			disableZooming: options.disableZoom,
			mapTypeId: Microsoft.Maps.MapTypeId[options.mapType],
			showDashboard: !options.disableZoom,
			showScalebar: options.showScale,
			zoom: options.zoom
		});
	};

	Mapify.TYPE = 'Bing';
	Mapify.VERSION = '1.0';


	// MAP FUNCTIONS

	Mapify.prototype.setPins = function (pins) {
		var mapify = getMapify(this);
		var result = reconcilePins(mapify, pins);
		var infoboxPin = mapify.infobox !== null ? mapify.infobox.getPushpin() : null;
		var removeInfobox = infoboxPin !== null && getEntityIndex(pins, infoboxPin) === -1;
		var i;

		for (i = 0; i < result.add.length; i++) {
			addPin(mapify, result.add[i]);
		}

		for (i = 0; i < result.remove.length; i++) {
			removePin(mapify, result.remove[i]);
		}

		if (removeInfobox) {
			mapify.bingMap.entities.remove(mapify.infobox);
			mapify.infobox = null;
		}
	};

	Mapify.prototype.setBoundaryToPins = function () {
		var bingMap = getMapify(this).bingMap;
		var locations = getEntityLocations(bingMap);
		var bounds = Microsoft.Maps.LocationRect.fromLocations(locations);
		bingMap.setView({ bounds: bounds });
	};

	Mapify.prototype.onBoundaryChanged = function (fn) {
		var bingMap = getMapify(this).bingMap;
		Microsoft.Maps.Events.addThrottledHandler(bingMap, 'viewchangeend', function () {
			// Note: There's an event argument with a 'userInitiated' property, but my tests
			//       showed that the property was always true, even if I didn't initiate the
			//       boundary change.  So I don't rely on that property.
			var bounds = bingMap.getBounds();
			var boundary = {
				latitude1: bounds.center.latitude - (bounds.height / 2),
				latitude2: bounds.center.latitude + (bounds.height / 2),
				longitude1: bounds.center.longitude - (bounds.width / 2),
				longitude2: bounds.center.longitude + (bounds.width / 2)
			};
			fn(boundary);
		}, 300);
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

	Mapify.prototype.getBounds = function () {
		return getMapify(this).bingMap.getBounds();
	};

	Mapify.prototype.center = function (location) {
		var mapify = getMapify(this);
		if (typeof location === 'string') {
			geocode(mapify, location);
		} else if (typeof location === 'object') {
			setCenter(mapify, location.latitude, location.longitude);
		}
	};

	Mapify.prototype.zoom = function (level) {
		return getMapify(this).bingMap.setView({ zoom: level });
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
				instance.lastZoom = instance.bingMap.getZoom();
				Microsoft.Maps.Events.addHandler(instance.bingMap, 'click', function (e) { onClick(instance, e); });
				Microsoft.Maps.Events.addThrottledHandler(instance.bingMap, 'viewchangeend', function (e) { onViewChangeEnd(instance, e); });
				Microsoft.Maps.Events.addHandler(instance.bingMap, 'mouseover', function (e) { onMouse(instance, e); });
				Microsoft.Maps.Events.addHandler(instance.bingMap, 'mouseout', function (e) { onMouse(instance, e); });
			}
		});
	};

	$.fn.mapify = Plugin;
	$.fn.mapify.Constructor = Mapify;


	// HELPERS

	function getMapify($el) {
		return $el.data(DATA_KEY);
	}

	function getEntityLocations(bingMap) {
		var len = bingMap.entities.getLength();
		var locations = [];
		for (var i = 0; i < len; i++) {
			var entity = bingMap.entities.get(i);
			if (!entity.getLocation) continue;
			locations.push(entity.getLocation());
		}
		return locations;
	}

	function ensureInfoboxIsNotClipped(bingMap, pin, offset) {
		var BUFFER = 20;

		var mapPopup = $('.map-popup');
		var mapPopupTop = -offset.height;
		var mapPopupWidth = mapPopup.outerWidth();
		var mapPopupHeight = mapPopup.outerHeight();
		var mapWidth = bingMap.getWidth();

		var pinLocation = bingMap.tryLocationToPixel(pin.getLocation(), Microsoft.Maps.PixelReference.control);

		var infoboxTop = pinLocation.y - mapPopupHeight + mapPopupTop;
		var infoboxLeft = pinLocation.x - (mapPopupWidth / 2);
		var infoboxRight = infoboxLeft + mapPopupWidth;

		var leftOverlap = Math.max(BUFFER - infoboxLeft, 0);
		var rightOverlap = Math.min(mapWidth - infoboxRight - BUFFER, 0);
		var shiftX = leftOverlap || rightOverlap;
		var shiftY = Math.max(BUFFER - infoboxTop, 0);

		bingMap.setView({ centerOffset: new Microsoft.Maps.Point(shiftX, shiftY), center: bingMap.getCenter() });
	}

	function createPopupHtml(innerHtml) {
		return '<div class="map-popup map-popup-bing"><a type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></a><i class="icon-popup-arrow"></i>' + innerHtml + '</div>';
	}

	function reconcilePins(mapify, pins) {
		var result = { add: [], remove: [] };
		var numEntities = mapify.bingMap.entities.getLength();
		var i;

		for (i = 0; i < numEntities; i++) {
			var entity = mapify.bingMap.entities.get(i);
			if (!entity.pin || getEntityIndex(pins, entity) >= 0) continue;
			result.remove.push(entity);
		}

		for (i = 0; i < pins.length; i++) {
			if (getPinIndex(mapify.bingMap.entities, numEntities, pins[i]) >= 0) continue;
			result.add.push(pins[i]);
		}

		return result;
	}

	function getEntityIndex(pins, entity) {
		for (var i = 0; i < pins.length; i++) {
			if (pins[i].id == entity.pin.id) return i;
		}
		return -1;
	}

	function getPinIndex(entities, numEntities, pin) {
		for (var i = 0; i < numEntities; i++) {
			var entity = entities.get(i);
			if (entity.pin && entity.pin.id == pin.id) return i;
		}
		return -1;
	}

	function addPin(mapify, pin) {
		var entity = new Microsoft.Maps.Pushpin(pin.position, {
			draggable: false,
			htmlContent: '<img class="map-pin" src="' + (pin.image || mapify.options.pin.image) + '" />'
		});
		entity.pin = pin;

		mapify.bingMap.entities.push(entity);

		if (!entity.pin.popup) return;

		var openInfobox = function (e) {
			var entity = e.target;
			var html = createPopupHtml(entity.pin.popup);
			var offset = calculatePopupOffset(mapify, html);
			var infoboxOptions = {
				htmlContent: createPopupHtml(entity.pin.popup),
				location: entity.getLocation(),
				offset: new Microsoft.Maps.Point(offset.width, offset.height),
				pushpin: entity,
				visible: true
			};

			if (mapify.infobox !== null) {
				mapify.bingMap.entities.remove(mapify.infobox);
			}

			mapify.infobox = new Microsoft.Maps.Infobox(infoboxOptions.location, infoboxOptions);
			mapify.bingMap.entities.push(mapify.infobox);

			ensureInfoboxIsNotClipped(mapify.bingMap, entity, offset);

			Microsoft.Maps.Events.addHandler(mapify.infobox, 'click', closeInfobox);

			if (typeof mapify.onPinOpenedInternal != 'function') return;
			mapify.onPinOpenedInternal(pin);
		};

		Microsoft.Maps.Events.addHandler(entity, 'click', openInfobox);
	}

	function removePin(mapify, entity) {
		mapify.bingMap.entities.remove(entity);
	}

	function closeInfobox(e) {
		var infobox = e.target;
		var target = $(e.originalEvent.target);
		if (target.is('.close') || target.closest('.close').length) {
			infobox.setOptions({ visible: false });
		}
	}

	function geocode(mapify, location) {
		var settings = {
			data: {
				c: mapify.options.languageCode,
				jsonp: 'GeocodeCallback',
				key: mapify.options.key,
				q: location
			},
			dataType: 'jsonp',
			jsonpCallback: 'GeocodeCallback',
			method: 'GET',
			url: 'https://dev.virtualearth.net/REST/v1/Locations'
		};

		$.ajax(settings).done(function (data) {
			if (data.resourceSets.length === 0 || data.resourceSets[0].resources.length === 0) {
				if (typeof mapify.onGeocodeInternal != 'function') return;
				mapify.onGeocodeInternal({ provider: 'Bing', count: 0 });
				return;
			}

			var first = data.resourceSets[0].resources[0];
			var center = first.point.coordinates;
			var bbox = first.bbox;
			var bounds = Microsoft.Maps.LocationRect.fromLocations(new Microsoft.Maps.Location(bbox[0], bbox[1]), new Microsoft.Maps.Location(bbox[2], bbox[3]));
			mapify.bingMap.setView({ bounds: bounds });

			if (typeof mapify.onGeocodeInternal != 'function') return;
			mapify.onGeocodeInternal({
				address: first.address,
				count: data.resourceSets[0].resources.length,
				countryRegion: first.address.countryRegion,
				latitude: center[0],
				longitude: center[1],
				name: first.name,
				provider: 'Bing',
				type: first.entityType
			});
		});
	}

	function setCenter(mapify, latitude, longitude) {
		mapify.bingMap.setView({ center: new Microsoft.Maps.Location(latitude, longitude), zoom: mapify.options.zoom });
		if (typeof mapify.onCenterSetInternal != 'function') return;
		mapify.onCenterSetInternal({ latitude: latitude, longitude: longitude });
	}

	function onClick(mapify, e) {
		if (!e.mouseMoved || !e.isPrimary) return;
		fireInteraction(mapify, 'Drag');
	}

	function onViewChangeEnd(mapify, e) {
		var thisZoom = mapify.bingMap.getZoom();
		if (mapify.lastZoom != thisZoom) {
			mapify.lastZoom = thisZoom;
			fireInteraction(mapify, 'Zoom');
		}
	}

	function onMouse(mapify, e) {
		if (e.eventName == 'mouseover') {
			clearTimeout(mapify.hoverTimeout);
			mapify.hoverTimeout = setTimeout(function () {
				fireInteraction(mapify, 'Hover');
			}, 3000);
		} else if (e.eventName == 'mouseout') {
			clearTimeout(mapify.hoverTimeout);
		}
	}

	function fireInteraction(mapify, type) {
		if (typeof mapify.onInteractionInternal != 'function') return;
		mapify.onInteractionInternal(type);
	}

	// hack: Bing doesn't have a supported way to center a custom infobox, so we need to add an invisible
	// element to the DOM and measure it to calculate the required offset.
	function calculatePopupOffset(mapify, html) {
		var temp = $(html);
		temp.css({ position: 'absolute', visibility: 'hidden' });
		temp.appendTo('body');
		var pinHeight = $('.map-pin').outerHeight(true);
		var arrowHeight = temp.find('.icon-popup-arrow').outerHeight(true);
		var margin = 3;
		var offset = {
			height: pinHeight + arrowHeight - margin,
			width: -(temp.outerWidth(true) / 2) - margin
		};
		temp.remove();
		return offset;
	}

}(window.jQuery));