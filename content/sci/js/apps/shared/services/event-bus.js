(function ($) {

	'use strict';

	angular.module('xom.shared').factory('eventBusSvc', function () {
		return {
			publish: $.publish,
			subscribe: $.subscribe
		};
	});

}(window.jQuery));