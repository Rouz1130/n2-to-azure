(function ($) {

	'use strict';

	angular.module('xom.shared').directive('accordionTrigger', ['$timeout', function ($timeout) {

		function setIndex(scope, i) {
			$timeout(function () {
				scope.control = i;
			});
		}

		function simulateUserClick(panel) {
			panel.find('a[data-toggle="collapse"]').first().trigger('click');
		}

		return {
			restrict: 'A',
			scope: {
				control: '=accordionTrigger'
			},
			link: function (scope, element) {

				// When bootstrap modifies a panel, update the index
				element.parent()
					.on('show.bs.collapse', '.panel-group', function (e) {
						var panelIndex = $(e.target).closest('.panel').index();
						setIndex(scope, panelIndex);
					})
					.on('hide.bs.collapse', '.panel-group', function (e) {
						setIndex(scope, -1);
					});


				scope.$watch('control', function (v) {
					if (!angular.isDefined(v) || v < 0) return;
					var panel = element.find('.panel').eq(v);
					if (panel.hasClass('active')) return;
					simulateUserClick(panel);
				});
			}
		};
	}]);
}(window.jQuery));