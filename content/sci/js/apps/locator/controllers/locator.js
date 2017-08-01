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
]);