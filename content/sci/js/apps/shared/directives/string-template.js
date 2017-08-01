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
}]);