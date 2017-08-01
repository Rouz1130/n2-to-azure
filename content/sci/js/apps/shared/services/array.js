(function ($) {
	angular.module('xom.shared').factory('arraySvc', function () {

		'use strict';

		// IE8-friendly verion of Array.prototype.map
		function map(array, fn) {
			return $.map(array, fn);
		}

		return {
			map: map
		};
	});
}(window.jQuery));