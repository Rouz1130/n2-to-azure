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
]);