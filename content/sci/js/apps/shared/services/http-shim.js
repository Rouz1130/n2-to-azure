/*
 * This shim became necessary when it was determined some versions of IE (at least 9 and 10) would not
 * properly encode non-ascii characters, so using the original approach of interpolation to inject URL
 * parameters would break.  This shim parses a URL containing Angular tags and return an object with
 * both the cleaned URL and the new parameter model that can be passed as options to $http.
 */

angular.module('xom.shared').factory('httpShimSvc', function () {

	'use strict';

	function parseTemplateUrl(url, query) {
		var data = {};
		var newUrl = url;
		for (var k in query) {
			var re = new RegExp('(&?)([^?&=]+)(={{' + k + '}})(&?)');
			var match = newUrl.match(re);
			if (!match) continue;

			data[match[2]] = query[k];

			var find = match[0];
			if (match[1] + match[4] === '&&') {
				find = find.substring(1);
			}
			newUrl = newUrl.replace(find, '');
		}

		return {
			params: data,
			url: newUrl
		};
	}

	return {
		parseTemplateUrl: parseTemplateUrl
	};
});