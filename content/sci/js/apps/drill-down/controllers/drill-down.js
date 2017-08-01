angular.module('drill-down').controller('DrillDownCtrl', ['$scope', '$http', '$interpolate', 'eventBusSvc', 'DRILL_DOWN',
	function ($scope, $http, $interpolate, eventBusSvc, DRILL_DOWN) {

		'use strict';

		$scope.breadcrumbs = [];
		$scope.error = null;
		$scope.list = null;
		$scope.loading = false;
		$scope.previousList = null;

		$scope.goBack = goBack;
		$scope.loadList = loadList;

		$scope.$watch('loading', function (v) {
			eventBusSvc.publish('xom.loading', v);
		});

		DRILL_DOWN.groupingRules.sort(sortGroupingRules);

		if (DRILL_DOWN.searchOnLoad) {
			loadList(DRILL_DOWN.initialApiUrl);
		}

		if (DRILL_DOWN.phraseEventName) {
			eventBusSvc.subscribe(DRILL_DOWN.phraseEventName, onSearchRequested);
		}

		function loadList(url, skipBreadcrumb) {
			if ($scope.loading) return;
			$scope.loading = true;

			if ($scope.list && !skipBreadcrumb) {
				$scope.breadcrumbs.push(angular.copy($scope.list));
			}

			$http.get(url).then(onListReceived, onListError).finally(onListComplete);
		}

		function onListReceived(response) {
			$scope.error = null;
			$scope.list = response.data.conditionlist;
			$scope.list.url = response.config.url;
			buildGroups($scope.list);
			setPreviousList();
		}

		function onListError(response) {
			$scope.error = response;
		}

		function onListComplete() {
			$scope.loading = false;
		}

		function onSearchRequested(e, args) {
			var expression = $interpolate(DRILL_DOWN.initialApiUrl);
			var url = expression(args);
			$scope.breadcrumbs = [];
			$scope.list = null;
			$scope.previousList = null;
			loadList(url);
		}

		function buildGroups(list) {
			var itemCount = list.results.length;
			var columnCount = getColumnCount(itemCount);
			var itemsPerColumn = calculateItemsPerColumn(itemCount, columnCount);

			list.groups = [];
			for (var i = 0; i < list.results.length; i++) {
				if (i % itemsPerColumn === 0) {
					list.groups.push([]);
				}
				list.groups[list.groups.length - 1].push(list.results[i]);
			}
		}

		function getColumnCount(itemCount) {
			for (var i = 0; i < DRILL_DOWN.groupingRules.length; i++) {
				if (DRILL_DOWN.groupingRules[i].minItems <= itemCount) {
					return DRILL_DOWN.groupingRules[i].cols;
				}
			}
			return 3;
		}

		function calculateItemsPerColumn(itemCount, columnCount) {
			var itemsPerColumn = parseInt(itemCount / columnCount);
			if (itemCount % columnCount !== 0) itemsPerColumn++;
			return itemsPerColumn;
		}

		function sortGroupingRules(a, b) {
			return -(a.minItems - b.minItems);
		}

		function goBack() {
			if ($scope.breadcrumbs.length < 1) return;
			var lastList = $scope.breadcrumbs.pop();
			loadList(lastList.url, true);
		}

		function setPreviousList() {
			$scope.previousList = ($scope.breadcrumbs.length < 1 ? null : $scope.breadcrumbs[$scope.breadcrumbs.length - 1]);
		}
	}
]);