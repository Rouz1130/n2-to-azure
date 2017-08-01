/*! 2016-09-06 15:21:38 */
angular.module('locator', ['ngSanitize', 'xom.shared'])
	.config(['$locationProvider', function ($locationProvider) {
		$locationProvider.html5Mode(true);
	}]
);;

angular.module('locator').controller('LocatorCtrl', ['$scope', '$location', '$log', 'locationSvc', 'amenitiesSvc', 'eventBusSvc', 'geolocationSvc', 'arraySvc', 'facetSvc', 'extenderSvc', 'MAP', 'LOCATOR',
	function ($scope, $location, $log, locationSvc, amenitiesSvc, eventBusSvc, geolocationSvc, arraySvc, facetSvc, extenderSvc, MAP, LOCATOR) {

		var mapSettings = angular.copy(MAP);
		var hasUrlState = false;
		mapSettings.center = null;

		$scope.amenities = [];
		$scope.facets = [];
		$scope.filters = { latitude1: null, longitude1: null, latitude2: null, longitude2: null, q: '', selectedFacets: '' };
		$scope.filteredResults = [];
		$scope.locatorConfig = LOCATOR;
		$scope.mapSettings = mapSettings;
		$scope.mapPins = [];
		$scope.onBeforeFilterClick = onBeforeFilterClick;
		$scope.onMapInteraction = onMapInteraction;
		$scope.onPinOpened = onPinOpened;
		$scope.onPinPopupHtmlReady = onPinPopupHtmlReady;
		$scope.searchResults = [];
		$scope.userLocation = null;

		$scope.onBoundaryChanged = onBoundaryChanged;
		$scope.toggleFacetValue = toggleFacetValue;

		$scope.$watch('amenities', applyFilter, true);

		init();

		function init() {
			bindEventBus();

			amenitiesSvc.get().then(onAmenitiesReceived);

			hasUrlState = applyUrlState();
			if (hasUrlState) {
				$scope.mapSettings.center = getCenterFromFilters($scope.filters) || $scope.filters.q;
			}
			if (!LOCATOR.disableGeolocation) {
				captureUserLocation();
			}
		}

		function applyUrlState() {
			var urlState = $location.search();
			var filterState = extenderSvc.extend({}, $scope.filters, urlState);
			var hasValidState = false;
			for (var key in $scope.filters) {
				if (filterState[key]) hasValidState = true;
			}
			angular.extend($scope.filters, filterState);
			return hasValidState;
		}

		function captureUserLocation() {
			geolocationSvc.getCurrentPosition().then(onUserLocationFound, useFallbackLocation);
		}

		function onAmenitiesReceived(data) {
			$scope.amenities = data;
		}

		function onUserLocationFound(geoPosition) {
			$scope.userLocation = geoPosition.coords;
			if ($scope.searchResults.length || hasUrlState) return;
			$scope.mapSettings.center = geoPosition.coords;
		}

		function useFallbackLocation() {
			if ($scope.searchResults.length) return;
			$scope.mapSettings.center = MAP.center;
		}

		function onBoundaryChanged(boundary) {
			if (LOCATOR.disableBoundarySearch) return;
			angular.extend($scope.filters, boundary);
			search();
		}

		function onMessageReceived(e, args) {
			angular.extend($scope.filters, args);
			$scope.mapSettings.center = args.q;
			$scope.$apply();
		}

		function toggleFacetValue(value) {
			value.selected = !value.selected;
			$scope.filters.selectedFacets = facetSvc.serializeFacets($scope.facets);
			search();
		}

		function onBeforeFilterClick(filter) {
			if (filter.selected) return;
			eventBusSvc.publish('xom.analytics', { cg: 'Station filter', csg: filter.Name, ct: 'Checkbox' });
		}

		function onMapInteraction(type) {
			eventBusSvc.publish('xom.analytics', { cg: 'Map', csg: type, ct: type, et: type });
		}

		function onPinOpened(pin) {
			eventBusSvc.publish('xom.analytics', { cg: 'Map', csg: pin.data.DisplayName, ct: 'Click', en: 'Click', et: 'Click' });
		}

		function search() {
			setWaiting(true);
			var filters = angular.copy($scope.filters);
			filters.center = getCenterFromFilters($scope.filters);
			// hack: the ['catch'] and ['finally'] notation is required for IE8
			locationSvc.searchByBoundary(filters).then(onResultsReceived)['catch'](showError)['finally'](setWaiting);
		}

		function onResultsReceived(data) {
			$scope.facets = data.facets;
			facetSvc.applyFacetSelections($scope.facets, $scope.filters.selectedFacets);
			$scope.searchResults = angular.isArray(data) ? data : data[LOCATOR.apiResultsKey];
			if (data[LOCATOR.apiPhraseKey]) {
				$scope.filters.q = data[LOCATOR.apiPhraseKey];
			}
			applyFilter();
			updateUrl();
		}

		function onPinPopupHtmlReady(templates) {
			$scope.mapPins = arraySvc.map($scope.filteredResults, function (r, i) {
				return {
					id: r.LocationID,
					data: r,
					popup: templates[i],
					position: { latitude: r.Latitude, longitude: r.Longitude },
					image: getPinImage(r)
				};
			});
		}

		function getPinImage(location) {
			if (LOCATOR.pinStyleMap) {
				for (var k in LOCATOR.pinStyleMap.values) {
					if (location[LOCATOR.pinStyleMap.field] === k) {
						return LOCATOR.pinStyleMap.values[k];
					}
				}
			}

			if (MAP.pin) {
				return MAP.pin.image;
			}

			$log.warn('Unable to map pin image.');
		}

		function showError(data) {
			$scope.error = data;
		}

		function updateUrl() {
			var copy = angular.extend({}, $scope.filters);
			removeEmptyProperties(copy);
			$location.search(copy).replace();
		}

		function removeEmptyProperties(obj) {
			for (var k in obj) {
				if (!obj[k]) delete obj[k];
			}
		}

		function setWaiting(on) {
			eventBusSvc.publish('xom.loading', !!on);
		}

		function bindEventBus() {
			if (!LOCATOR.phraseEventName) return;
			eventBusSvc.subscribe(LOCATOR.phraseEventName, onMessageReceived);
		}

		function applyFilter() {
			var selectedAmenityNames = getSelectedAmenityNames();
			if (selectedAmenityNames.length === 0) {
				$scope.filteredResults = $scope.searchResults;
			} else {
				$scope.filteredResults = $scope.searchResults.filter(function (x) { return matchesAtLeastOneAmenity(x, selectedAmenityNames); });
			}
		}

		function getSelectedAmenityNames() {
			return $scope.amenities.filter ? $scope.amenities.filter(isSelected).map(getName) : [];
		}

		function isSelected(x) {
			return !!x.selected;
		}

		function getName(x) {
			return x.Name;
		}

		function matchesAtLeastOneAmenity(result, selectedAmenityNames) {
			for (var i = 0; i < selectedAmenityNames.length; i++) {
				if (hasAmenity(result, selectedAmenityNames[i])) return true;
			}
		}

		function hasAmenity(result, amenityName) {
			return result.StoreAmenities.filter(function (x) { return x.Name === amenityName; }).length > 0;
		}

		function getCenterFromFilters(filters) {
			try {
				var lat1 = parseFloat(filters.latitude1);
				var lat2 = parseFloat(filters.latitude2);
				var lng1 = parseFloat(filters.longitude1);
				var lng2 = parseFloat(filters.longitude2);
				var center = {
					latitude: lat2 - ((lat2 - lat1) / 2),
					longitude: lng2 - ((lng2 - lng1) / 2)
				};
				return (isNaN(center.latitude) || isNaN(center.longitude)) ? null : center;
			} catch (e) {
				return null;
			}
		}
	}
]);;

angular.module('locator').service('amenitiesSvc', ['$http', '$q', 'LOCATOR',
	function ($http, $q, LOCATOR) {

		'use strict';

		function getAmenities() {
			var deferred = $q.defer();

			if (LOCATOR.amenities) {

				deferred.resolve(LOCATOR.amenities);

			} else if (LOCATOR.amenitiesUrl) {

				$http({ method: 'GET', url: LOCATOR.amenitiesUrl })
					.then(function (res) {
						deferred.resolve(res.data);
					})
					// hack: the ['catch'] and ['finally'] notation is required for IE8
					['catch'](function () {
						deferred.reject('Failed to load amenities.');
					});

			} else {

				deferred.resolve([]);

			}

			return deferred.promise;
		}

		return {
			get: getAmenities
		};
	}
]);;

angular.module('locator').service('locationSvc', ['$http', '$q', '$interpolate', '$log', 'LOCATOR',
	function ($http, $q, $interpolate, $log, LOCATOR) {

		'use strict';

		function searchByBoundary(filter) {
			if (!LOCATOR.boundaryApi) {
				$log.warn('No boundary search endpoint configured.');
				return;
			}
			return search(LOCATOR.boundaryApi, filter);
		}

		function searchByPhrase(filter) {
			if (!LOCATOR.phraseApi) {
				$log.warn('No phrase search endpoint configured.');
				return;
			}
			return search(LOCATOR.phraseApi, filter);
		}

		function search(apiUrl, filter) {
			var deferred = $q.defer();
			var expression = $interpolate(apiUrl);
			var url = expression(filter);

			$http({ method: 'GET', url: url })
				.then(function (res) {
					deferred.resolve(res.data);
				})
				// hack: the ['catch'] and ['finally'] notation is required for IE8
				['catch'](function () {
					deferred.reject('Failed to load locations.');
				});

			return deferred.promise;
		}

		return {
			searchByBoundary: searchByBoundary,
			searchByPhrase: searchByPhrase
		};
	}
]);;

(function ($) {
	$('script[data-app]').each(function () {
		var $this = $(this),
			appName= $this.data('app'),
			constants = $.parseJSON($this.html()); // use html() instead of text() so it works on IE8
		for (var key in constants) {
			angular.module(appName).constant(key, constants[key]);
		}
	});
}(window.jQuery));;

angular.module('xom.shared', []);;

(function ($) {

	'use strict';

	angular.module('xom.shared').directive('map', ['$timeout', function ($timeout) {

		function initMap(scope, element) {

			element.mapify(scope.settings);

			var bindHandler = function (eventName, argName) {
				if (!angular.isFunction(scope[eventName])) return;
				element.mapify(eventName, function (arg) {
					var data = {};
					data[argName] = arg;
					scope[eventName](data);
				});
			};

			bindHandler('onBoundaryChanged', 'boundary');
			bindHandler('onCenterSet', 'center');
			bindHandler('onGeocode', 'result');
			bindHandler('onInteraction', 'type');
			bindHandler('onPinOpened', 'pin');

			scope.$watch('settings.center', function (v) {
				if (!v) return;
				element.mapify('center', v);
			});

			scope.$watch('pins', function (v) {
				var pins = v || [];

				element.mapify('setPins', pins);
				if (!pins.length) return;

				if (scope.autoBoundary) {
					$timeout(function () {
						(scope.onBoundaryAdjust || angular.noop)({ adjusting: true });
						element.mapify('setBoundaryToPins');
					}, 100);
				}
			});
		}

		return {
			restrict: 'E',
			replace: true,
			scope: {
				autoBoundary: '=',
				onBoundaryChanged: '&',
				onCenterSet: '&',
				onGeocode: '&',
				onInteraction: '&',
				onPinOpened: '&',
				pins: '=',
				settings: '='
			},
			template: '<div class="map"></div>',
			link: function (scope, element) {
				var unregister = scope.$watch('settings.center', function (v) {
					if (!v) return;
					unregister();
					initMap(scope, element);
				});
			}
		};
	}]);

}(window.jQuery));;

angular.module('xom.shared').directive('stringTemplate', ['$timeout', function ($timeout) {
	'use strict';

	return {
		link: function (scope, element) {
			scope.$watch('trigger', function (v) {

				$timeout(function () {
					var ary = [];

					if (angular.isDefined(v)) {
						element.children().each(function (i, c) {
							ary.push(angular.element(c).html());
						});
					}

					scope.callback({ templates: ary });
				}, 50);
			});
		},
		restrict: 'E',
		scope: {
			trigger: '=',
			callback: '&'
		}
	};
}]);;

(function ($) {
	angular.module('xom.shared').factory('arraySvc', function () {

		'use strict';

		// IE8-friendly verion of Array.prototype.map
		function map(array, fn) {
			return $.map(array, fn);
		}

		return {
			map: map
		};
	});
}(window.jQuery));;

(function ($) {

	'use strict';

	angular.module('xom.shared').factory('eventBusSvc', function () {
		return {
			publish: $.publish,
			subscribe: $.subscribe
		};
	});

}(window.jQuery));;

angular.module('xom.shared').service('extenderSvc', function () {
	'use strict';

	function extend() {
		if (arguments.length === 0 || typeof arguments[0] != 'object') return {};
		var obj = arguments[0];
		for (var i = 1; i < arguments.length; i++) {
			if (typeof arguments[i] != 'object') continue;
			copyProperties(arguments[i], obj);
		}
		return obj;
	}

	function copyProperties(src, dst) {
		for (var p in src) {
			if (src.hasOwnProperty(p) && src[p] !== null) {
				var propertyName = getPropertyName(dst, p);
				dst[propertyName] = angular.copy(src[p]);
			}
		}
	}

	function getPropertyName(obj, name) {
		var lower = name.toLowerCase();
		for (var p in obj) {
			if (p.toLowerCase() === lower) {
				return p;
			}
		}
		return name;
	}

	return {
		copyProperties: copyProperties,
		extend: extend,
		getPropertyName: getPropertyName
	};
});;

	angular.module('xom.shared').factory('facetSvc', ['serializationSvc', function (serializationSvc) {

		'use strict';

		function isFacetValueSelected(facets, facetKey, valueKey) {
			var facet = getByKey(facets, facetKey);
			if (facet === null) return;

			var value = getByKey(facet.values, valueKey);
			return (value && value.selected === true);
		}

		function toggleFacetValue(facets, facetKey, valueKey) {
			var facet = getByKey(facets, facetKey);
			if (facet === null) return;

			var value = getByKey(facet.values, valueKey);
			if (value === null) return;

			value.selected = !value.selected;
		}

		function mergeFacets(dest, src) {
			for (var i = 0; i < dest.length; i++) {
				var facet = getByKey(src, dest[i].key);
				if (facet === null) continue;
				for (var v = 0; v < dest[i].values.length; v++) {
					var value = getByKey(facet.values, dest[i].values[v].key);
					if (value === null) continue;
					dest[i].values[v].selected = value.selected;
				}
			}
			return dest;
		}

		// Serializes the facet selection in a format the API expects
		// e.g. "Facet1:ValueA,ValueB|Facet2:ValueC,ValueD"
		function serializeFacets(facets) {
			var s = [];
			for (var i = 0; i < facets.length; i++) {
				var facet = facets[i];
				var selectedValues = (facet.values || []).filter(isValueSelected);
				if (selectedValues.length === 0) continue;
				s.push(facet.key + ':' + selectedValues.map(getValueKey).join(','));
			}
			return s.join('|');
		}

		// serializedFacetValues = "Facet1:ValueA,ValueB|Facet2:ValueC,ValueD"
		// facetState = {
		//    "Facet1": ["ValueA", "ValueB"],
		//    "Facet2": ["ValueC", "ValueD"]
		// }
		function applyFacetSelections(facets, serializedFacetValues) {
			if (!serializedFacetValues) return;
			var facetState = deserializeSelectedFacets(serializedFacetValues);
			for (var i = 0; i < facets.length; i++) {
				var facet = facets[i];
				var facetSelections = getFacetSelections(facetState, facet.key);
				if (facetSelections === null || facetSelections.length === 0) continue;
				for (var v = 0; v < facet.values.length; v++) {
					var value = facet.values[v];
					value.selected = arrayContainsString(facetSelections, value.key);
				}
			}
		}

		function isValueSelected(value) {
			return value.selected === true;
		}

		function getByKey(array, key) {
			var keyLower = key.toLowerCase();
			var matches = array.filter(function (e) {
				return e.key.toLowerCase() === keyLower;
			});
			return matches.length > 0 ? matches[0] : null;
		}

		function getFacetSelections(facetState, key) {
			var keyLower = key.toLowerCase();
			for (var p in facetState) {
				if (p.toLowerCase() === keyLower) return facetState[p];
			}
			return null;
		}

		function getValueKey(value) {
			return value.key;
		}

		function deserializeSelectedFacets(s) {
			var selections = serializationSvc.deserialize(s, '|', ':');
			for (var p in selections) {
				if (selections[p] === null) continue;
				selections[p] = selections[p].split(',');
			}
			return selections;
		}

		function arrayContainsString(array, str) {
			var strLower = str.toLowerCase();
			return array.filter(function (e) { return e.toLowerCase() === strLower; }).length > 0;
		}

		return {
			applyFacetSelections: applyFacetSelections,
			isFacetValueSelected: isFacetValueSelected,
			mergeFacets: mergeFacets,
			serializeFacets: serializeFacets,
			toggleFacetValue: toggleFacetValue
		};
	}
]);
;

angular.module('xom.shared').factory('geolocationSvc', ['$q', '$window', function ($q, $window) {

	'use strict';

	function getCurrentPosition() {
		var deferred = $q.defer();

		if (!$window.navigator.geolocation) {
			deferred.reject('Geolocation not supported.');
		} else {
			$window.navigator.geolocation.getCurrentPosition(deferred.resolve, deferred.reject);
		}

		return deferred.promise;
	}

	return {
		getCurrentPosition: getCurrentPosition
	};
}]);;

angular.module('xom.shared').service('serializationSvc', function () {
	'use strict';

	function serialize(obj, pairSeparator, crumbSeparator) {
		var str = [];
		for (var p in obj) {
			if (obj.hasOwnProperty(p) && obj[p] !== null && obj[p] !== '') {
				str.push(p + crumbSeparator + obj[p]);
			}
		}
		return str.join(pairSeparator);
	}

	function deserialize(str, pairSeparator, crumbSeparator) {
		var dict = {},
			regex = new RegExp('([^?' + crumbSeparator + pairSeparator + ']+)(' + crumbSeparator + '([^' + pairSeparator + ']*))?', 'g');
		str.replace(regex, function ($0, $1, $2, $3) { dict[$1] = $3; });
		return dict;
	}

	return {
		serialize: serialize,
		deserialize: deserialize,
		toQueryString: function (obj) {
			return serialize(obj, '&', '=');
		},
		fromQueryString: function (querystring) {
			return deserialize(querystring, '&', '=');
		}
	};
});