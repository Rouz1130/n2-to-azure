(function ($) {

	'use strict';

	angular.module('xom.shared').directive('map', ['$timeout', function ($timeout) {

		function initMap(scope, element) {

			element.mapify(scope.settings);

			var bindHandler = function (eventName, argName) {
				if (!angular.isFunction(scope[eventName])) return;
				element.mapify(eventName, function (arg) {
					var data = {};
					data[argName] = arg;
					scope[eventName](data);
				});
			};

			bindHandler('onBoundaryChanged', 'boundary');
			bindHandler('onCenterSet', 'center');
			bindHandler('onGeocode', 'result');
			bindHandler('onInteraction', 'type');
			bindHandler('onPinOpened', 'pin');

			scope.$watch('settings.center', function (v) {
				if (!v) return;
				element.mapify('center', v);
			});

			scope.$watch('pins', function (v) {
				var pins = v || [];

				element.mapify('setPins', pins);
				if (!pins.length) return;

				if (scope.autoBoundary) {
					$timeout(function () {
						(scope.onBoundaryAdjust || angular.noop)({ adjusting: true });
						element.mapify('setBoundaryToPins');
					}, 100);
				}
			});
		}

		return {
			restrict: 'E',
			replace: true,
			scope: {
				autoBoundary: '=',
				onBoundaryChanged: '&',
				onCenterSet: '&',
				onGeocode: '&',
				onInteraction: '&',
				onPinOpened: '&',
				pins: '=',
				settings: '='
			},
			template: '<div class="map"></div>',
			link: function (scope, element) {
				var unregister = scope.$watch('settings.center', function (v) {
					if (!v) return;
					unregister();
					initMap(scope, element);
				});
			}
		};
	}]);

}(window.jQuery));