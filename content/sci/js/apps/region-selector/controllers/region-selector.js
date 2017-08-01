angular.module('region-selector').controller('RegionSelectorCtrl', ['$scope', '$timeout', 'eventBusSvc', 'INITIAL_COUNTRY', 'REGIONS', 'TOPO_URL',
	function ($scope, $timeout, eventBusSvc, INITIAL_COUNTRY, REGIONS, TOPO_URL) {

		'use strict';

		$scope.currentRegionIndex = -1;
		$scope.regions = REGIONS;
		$scope.worldMapConfig = {
			activeItem: null,
			maxWidth: 1000,
			popupTemplate: '<h3>{{name}}</h3>' +
				'<div ng-repeat="line in lines">' +
				'<span>{{line.name}}</span>' +
				'<p class="paragraph small">' +
				'<span ng-repeat="s in line.sites">' +
				'<span ng-show="$index > 0"> | </span><a ng-href="{{s.url}}" target="{{s.newWindow ? \'_blank\' : \'_self\'}}">{{s.name}}</a>' +
				'</span>' +
				'</p>' +
				'</div>',
			topoUrl: TOPO_URL
		};

		$scope.selectCountry = selectCountry;

		if (INITIAL_COUNTRY) {
			$timeout(function () {
				selectCountry(INITIAL_COUNTRY);
			}, 500);
		}

		function selectCountry(code) {
			setCurrentRegion(code);
		}

		function setCurrentRegion(countryCode) {
			if (!countryCode) return;
			var index = getRegionIndex(countryCode);
			if (index === -1) return;
			$scope.currentRegionIndex = index;
		}

		function getRegionIndex(countryCode) {
			for (var i = 0; i < $scope.regions.length; i++) {
				if (regionSupportsCountry($scope.regions[i], countryCode)) {
					return i;
				}
			}
			return -1;
		}

		function regionSupportsCountry(region, countryCode) {
			return region.countries.filter(function (e) { return e.code === countryCode; }).length > 0;
		}
	}
]);