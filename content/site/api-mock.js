window.Api = (function ($) {

	'use strict';

	return {
		findLocations: function (phrase) {
			return $.get('http://private-4e0cf-poc9.apiary-mock.com/location/search_phrase');
		}
	};

}(window.jQuery));