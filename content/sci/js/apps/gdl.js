/*! 2016-09-06 15:20:30 */
angular.module('gdl', ['ngSanitize', 'xom.shared'])
	.config(['$locationProvider', function ($locationProvider) {
		$locationProvider.html5Mode(true);
	}]
);;

angular.module('gdl').controller('GdlCtrl', ['$scope', '$timeout', '$location', 'locationSvc', 'eventBusSvc', 'arraySvc', 'facetSvc', 'extenderSvc', 'MAP', 'GDL',
	function ($scope, $timeout, $location, locationSvc, eventBusSvc, arraySvc, facetSvc, extenderSvc, MAP, GDL) {

		$scope.autoBoundary = true;
		$scope.centerPin = null;
		$scope.countryIsSelected = false;
		$scope.facets = GDL.facets;
		$scope.filters = { latitude: null, longitude: null, countryRegion: null, selectedFacets: '' };
		$scope.mapPins = [];
		$scope.mapSettings = angular.copy(MAP);
		$scope.onFilterValueClick = onFilterValueClick;
		$scope.onGeocode = onGeocode;
		$scope.onMapInteraction = onMapInteraction;
		$scope.onPinOpened = onPinOpened;
		$scope.onPinPopupHtmlReady = onPinPopupHtmlReady;
		$scope.searchFailed = false;
		$scope.searchResults = [];
		$scope.templateTrigger = 1;
		$scope.toggleFacetValue = toggleFacetValue;
		$scope.userLocation = null;

		init();

		function init() {
			bindEventBus();
			loadStateFromUrl();
		}

		function bindEventBus() {
			if (!GDL.searchEventName) return;
			eventBusSvc.subscribe(GDL.searchEventName, onMessageReceived);
			eventBusSvc.subscribe('xom.geolocation', onGeolocation);
		}

		function loadStateFromUrl() {
			var state = $location.search();
			if (!state.q) return false;
			$scope.mapSettings.center = $scope.filters.q = state.q;
			return true;
		}

		function reset() {
			$scope.autoBoundary = true;
			$scope.centerPin = null;
			$scope.countryIsSelected = false;
			$scope.facets = [];
			$scope.filters.countryRegion = null;
			$scope.filters.latitude = null;
			$scope.filters.longitude = null;
			$scope.searchFailed = false;
			$scope.searchResults = [];
		}

		function onMessageReceived(e, args) {
			$scope.mapSettings.center = args.q;
			$scope.$apply();
		}

		function onGeolocation(e, args) {
			if ($scope.filters.q) return;
			var center = { latitude: args.lat, longitude: args.lng };
			$scope.filters.q = args.name;
			$scope.mapSettings.center = center;
			setCenterPin(center);
			search();
			$scope.$apply();
		}

		function onGeocode(result) {
			// This is an easy way to bypass search on initial load, but assumes the user would never enter the same search value as the default
			if (result.name === MAP.center) return;

			var performSearch = true;

			reset();

			if (result.count === 0) {
				$scope.searchFailed = true;
				performSearch = false;
			}

			if (result.type.toLowerCase().indexOf('country') > -1) {
				$scope.autoBoundary = false;
				$scope.countryIsSelected = true;
				performSearch = false;
			}

			$scope.filters.q = result.name;
			setCenterPin(result);

			if (!performSearch) {
				triggerTemplateUpdate();
				$scope.$apply();
				return;
			}

			angular.extend($scope.filters, result);
			search();
		}

		function toggleFacetValue(value) {
			value.selected = !value.selected;
			$scope.filters.selectedFacets = facetSvc.serializeFacets($scope.facets);
			search();
		}

		function search() {
			setWaiting(true);
			// hack: the ['catch'] and ['finally'] notation is required for IE8
			locationSvc.search($scope.filters).then(onResultsReceived)['catch'](showError)['finally'](setWaiting);
		}

		function onResultsReceived(data) {
			$scope.facets = data.facets;
			facetSvc.applyFacetSelections($scope.facets, $scope.filters.selectedFacets);
			$scope.searchFailed = (data.results.length === 0);
			$scope.searchResults = data.results;
			triggerTemplateUpdate();
		}

		function triggerTemplateUpdate() {
			$scope.templateTrigger++;
		}

		function onPinPopupHtmlReady(templates) {
			var pins = arraySvc.map($scope.searchResults, function (r, i) {
				return {
					id: r[GDL.distributorIdField || 'Id'],
					data: r,
					popup: templates[i],
					position: { latitude: r.Latitude, longitude: r.Longitude }
				};
			});

			if ($scope.centerPin) {
				pins.push($scope.centerPin);
			}

			$scope.mapPins = pins;
		}

		function onFilterValueClick(filter, value) {
			toggleFacetValue(value);
			if (!value.selected) return;
			eventBusSvc.publish('xom.analytics', { cg: 'Filter', csg: filter.Name, ct: 'Checkbox' });
		}

		function onMapInteraction(type) {
			eventBusSvc.publish('xom.analytics', { cg: 'Map', csg: type, ct: type, et: type });
		}

		function onPinOpened(pin) {
			eventBusSvc.publish('xom.analytics', { cg: 'Map', csg: pin.data.DisplayName, ct: 'Click', en: 'Click', et: 'Click' });
		}

		function setCenterPin(center) {
			$scope.centerPin = (center && center.latitude ? {
				id: 'center-pin-' + center.latitude + '-' + center.longitude,
				style: GDL.centerPin,
				position: center
			} : null);
		}

		function showError() {
			$scope.searchFailed = true;
			triggerTemplateUpdate();
		}

		function setWaiting(on) {
			eventBusSvc.publish('xom.loading', !!on);
		}
	}
]);;

angular.module('gdl').service('locationSvc', ['$http', '$q', '$interpolate', '$log', 'GDL',
	function ($http, $q, $interpolate, $log, GDL) {

		'use strict';

		function search(filter) {
			if (!GDL.searchApi) {
				$log.warn('No boundary search endpoint configured.');
				return;
			}

			var deferred = $q.defer();
			var expression = $interpolate(GDL.searchApi);
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
			search: search
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