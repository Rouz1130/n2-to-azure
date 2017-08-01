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
]);