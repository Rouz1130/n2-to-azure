angular.module('product-selector').controller('WizardCtrl', ['$scope', 'dataSvc', 'eventBusSvc', 'INITIAL_URL',
	function ($scope, dataSvc, eventBusSvc, INITIAL_URL) {

		'use strict';

		var isLoaded = false;

		$scope.lists = [];
		$scope.listOffset = 0;
		$scope.hasRecommendation = false;

		$scope.selectOption = function (list, option) {
			setListSelection(list, option);
			clearFollowingLists(list);
			$scope.hasRecommendation = option.showrecommendation;
			if (option.showrecommendation) {
				$scope.recommendationUrl = option.url;
			} else {
				loadResults(list, option);
			}
		};

		$scope.setOffset = function (amount) {
			$scope.listOffset += amount;
			if (amount < 1) {
				$scope.hasRecommendation = false;
			}
		};

		loadFirstList();

		function loadFirstList() {
			setWaiting(true);
			dataSvc.recommend(INITIAL_URL).then(addList).finally(setWaiting);
		}

		function setListSelection(list, option) {
			angular.forEach(list.options, function (o) { o.isSelected = false; });
			option.isSelected = true;
			list.title = option.name;
		}

		function loadResults(list, option) {
			$scope.hasRecommendation = false;
			setWaiting(true);
			dataSvc.recommend(option.url).then(onListReceived).finally(setWaiting);
		}

		function onListReceived(data) {
			addList(data);
			$scope.listOffset = 0;
		}

		function clearFollowingLists(list) {
			var listIndex = $scope.lists.indexOf(list);
			removeLists(listIndex + 1);
		}

		function removeLists(startIndex) {
			var numLists = $scope.lists.length;
			if (startIndex >= numLists) return;
			$scope.lists.splice(startIndex, numLists - startIndex);
		}

		function addList(data) {
			$scope.lists.push(data);
		}

		function setWaiting(on) {
			eventBusSvc.publish('xom.loading', !!on);
		}
	}
]);