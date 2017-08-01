angular.module('xom.shared').directive('scopeProperty', function () {
	'use strict';

	return {
		restrict: 'A',
		link: function (scope, element, attrs) {
			var content = element.html();
			scope[attrs.scopeProperty] = content;
		}
	};
});