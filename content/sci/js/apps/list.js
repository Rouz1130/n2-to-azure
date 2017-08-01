/*! 2016-09-06 15:20:32 */
angular.module('list', ['ngSanitize', 'xom.shared'])
	.config(['$locationProvider', function ($locationProvider) {
		$locationProvider.html5Mode(true);
	}]
);;

angular.module('list').controller('ListCtrl', ['$scope', '$window', '$location', 'eventBusSvc', 'serializationSvc', 'facetSvc', 'dataSvc', 'extenderSvc', 'LIST',
	function ($scope, $window, $location, eventBusSvc, serializationSvc, facetSvc, dataSvc, extenderSvc, LIST) {

		'use strict';

		var openFacets = {};

		$scope.facets = [];
		$scope.filters = {};
		$scope.lastSearchPhrase = null;
		$scope.listConfig = LIST;
		$scope.results = [];
		$scope.totalCount = -1;

		$scope.applyFilter = applyFilter;
		$scope.isFacetOpen = isFacetOpen;
		$scope.loadMore = loadMore;
		$scope.reloadPage = reloadPage;
		$scope.toggleFacetOpen = toggleFacetOpen;
		$scope.toggleFacetValue = toggleFacetValue;

		if (LIST.eventName) {
			eventBusSvc.subscribe(LIST.eventName, onMessageReceived);
		}

		init();

		function init() {
			var urlState = $location.search();
			var emptyFilters = { q: '', pageSize: 10, pageNumber: 1, selectedFacets: '' };
			var persistentFilters = extenderSvc.extend(emptyFilters, LIST.filters, urlState);
			var options = {};

			// If the first page we're targeting is >1, then we have to create a temporary filter
			// to load (pageNumber * pageSize) results
			var temporaryFilters = {};
			if (persistentFilters.pageNumber > 1) {
				temporaryFilters.pageNumber = 1;
				temporaryFilters.pageSize = persistentFilters.pageSize * persistentFilters.pageNumber;
			}

			if (!LIST.searchOnLoad) {
				options.deferSearch = true;
			}

			if (!urlState.q) {
				options.dontUpdateUrl = true;
			}

			// Ensure paging filters are numeric
			persistentFilters.pageNumber = parseInt(persistentFilters.pageNumber);
			persistentFilters.pageSize = parseInt(persistentFilters.pageSize);
			applyFilter(persistentFilters, temporaryFilters, options);
		}

		function applyFilter(persistentFilters, temporaryFilters, options) {
			var defaultOptions = {
				deferSearch: false,
				replaceResult: true
			};

			var onComplete = function () {
				$scope.lastSearchPhrase = $scope.filters.q;
				setWaiting(false);
			};

			// Update the filters
			angular.extend($scope.filters, persistentFilters);

			// Bail if we're deferring the search
			options = angular.extend({}, defaultOptions, options);
			if (options.deferSearch) return;

			// Update the URL before applying temporary filters
			if (!options.dontUpdateUrl) {
				updateUrl($scope.filters);
			}
			angular.extend($scope.filters, temporaryFilters);

			setWaiting(true);
			$scope.apiError = null;
			dataSvc
				.search($scope.filters)
				.then(function (data) {
					handleApiResponse(data, options);
				})
				['catch'](handleApiError)
				['finally'](onComplete);
		}

		function loadMore() {
			applyFilter({ pageNumber: $scope.filters.pageNumber + 1 }, null, { replaceResult: false });
		}

		function toggleFacetValue(value, options) {
			value.selected = !value.selected;
			$scope.filters.selectedFacets = facetSvc.serializeFacets($scope.facets);
			applyFilter({ pageNumber: 1 }, null, options);
		}

		function handleApiResponse(data, options) {
			$scope.facets = data.facets;
			facetSvc.applyFacetSelections($scope.facets, $scope.filters.selectedFacets);
			$scope.totalCount = data.totalCount;
			if (options.replaceResult) {
				$scope.results.length = 0;
			}

			Array.prototype.push.apply($scope.results, data.results);

			eventBusSvc.publish('xom.analytics', {
				cg: 'Search',
				csg: 'Search',
				oss: $scope.filters.q,
				ossr: data.totalCount
			});
		}

		function handleApiError(message) {
			$scope.apiError = message;
		}

		function updateUrl(filters) {
			$location.search(filters).replace();
		}

		function setWaiting(on) {
			eventBusSvc.publish('xom.loading', !!on);
		}

		function onMessageReceived(e, a) {
			var filter = angular.extend({ pageNumber: 1 }, a);
			var options = { replaceResult: true };
			applyFilter(filter, null, options);
		}

		function reloadPage(url) {
			$window.location.href = url;
		}

		function isFacetOpen(key) {
			return openFacets[key.toLowerCase()];
		}

		function toggleFacetOpen(key) {
			openFacets[key.toLowerCase()] = !openFacets[key.toLowerCase()];
		}
	}
]);;

angular.module('list').factory('dataSvc', ['$http', '$q', 'httpShimSvc', 'LIST',
	function ($http, $q, httpShimSvc, LIST) {

		'use strict';

		function search(query) {
			var deferred = $q.defer();

			var options = httpShimSvc.parseTemplateUrl(LIST.apiUrl, query);
			options.method = 'GET';

			$http(options).then(
				function (res) {
					deferred.resolve(res.data);
				}, function (xhr) {
					deferred.reject('The API returned status code ' + xhr.status);
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

/*
 * This shim became necessary when it was determined some versions of IE (at least 9 and 10) would not
 * properly encode non-ascii characters, so using the original approach of interpolation to inject URL
 * parameters would break.  This shim parses a URL containing Angular tags and return an object with
 * both the cleaned URL and the new parameter model that can be passed as options to $http.
 */

angular.module('xom.shared').factory('httpShimSvc', function () {

	'use strict';

	function parseTemplateUrl(url, query) {
		var data = {};
		var newUrl = url;
		for (var k in query) {
			var re = new RegExp('(&?)([^?&=]+)(={{' + k + '}})(&?)');
			var match = newUrl.match(re);
			if (!match) continue;

			data[match[2]] = query[k];

			var find = match[0];
			if (match[1] + match[4] === '&&') {
				find = find.substring(1);
			}
			newUrl = newUrl.replace(find, '');
		}

		return {
			params: data,
			url: newUrl
		};
	}

	return {
		parseTemplateUrl: parseTemplateUrl
	};
});;

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