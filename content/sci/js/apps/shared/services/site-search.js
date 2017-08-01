(function ($) {
	angular.module('xom.shared').factory('siteSearchSvc', ['SITE_SEARCH',
		function (SITE_SEARCH) {

			'use strict';

			function get() {
				return $.fn.siteSearch.get(SITE_SEARCH.cookieName);
			}

			function add(key, url) {
				return $.fn.siteSearch.add(SITE_SEARCH.cookieName, key, url, SITE_SEARCH);
			}

			return {
				get: get,
				add: add
			};
		}
	]);
}(window.jQuery));