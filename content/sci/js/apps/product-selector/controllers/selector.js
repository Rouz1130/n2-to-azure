angular.module('product-selector').controller('SelectorCtrl', ['$scope', 'dataSvc', function ($scope, dataSvc) {

	'use strict';

	var GROUP_LIMIT = 50,
		COLUMNS = 3;

	$scope.alphabet = '#ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
	$scope.sectionLetters = {};

	$scope.results = {
		groups: []
	};

	$scope.filter = {
		search: '',
		options: []
	};

	$scope.applyFilter = function () {
		$scope.waiting = true;
		dataSvc.search($scope.filter)
			.then(function (data) {
				createResultsModel(data);
				updateSectionLetters();
			})
			.finally(function () {
				$scope.waiting = false;
			});
	};

	$scope.applyFilter();

	function createResultsModel(data) {
		var sections,
			numLinks = data.length,
			numPerGroup = numLinks > GROUP_LIMIT ? parseInt(numLinks / COLUMNS) : numLinks;

		data.sort(compareResults);
		sections = groupByFirstLetter(data);

		$scope.results.groups = numLinks == numPerGroup ? [{ sections: sections }] : createSectionedGroups(sections, numPerGroup);
	}

	function updateSectionLetters() {
		for (var i = 0; i < $scope.alphabet.length; i++) {
			var letter = $scope.alphabet[i];
			$scope.sectionLetters[letter] = $scope.results.groups.filter(function (g) {
				return g.sections.filter(function (s) { return s.letter == letter; }).length > 0;
			}).length > 0;
		}
	}

	function groupByFirstLetter(sortedData) {
		if (!sortedData || !sortedData.length) return [];
		var sections = [],
			section,
			letter,
			lastLetter;
		for (var i = 0; i < sortedData.length; i++) {
			letter = sortedData[i].text[0];
			if (lastLetter != letter) {
				section = { letter: letter.toUpperCase(), links: [] };
				sections.push(section);
				lastLetter = letter;
			}
			section.links.push(sortedData[i]);
		}
		return sections;
	}

	function createSectionedGroups(sections, numPerGroup) {
		var groups = [],
			group,
			linkCount = 0;

		for (var i = 0; i < sections.length; i++) {
			if (groups.length === 0 || linkCount >= numPerGroup) {
				group = { sections: [] };
				groups.push(group);
				linkCount = 0;
			}

			group.sections.push(sections[i]);
			linkCount += sections[i].links.length;
		}

		return groups;
	}

	function compareResults(a, b) {
		if (a.text < b.text)
			return -1;
		if (a.text > b.text)
			return 1;
		return 0;
	}
}]);