angular.module('xom.shared').service('serializationSvc', function () {
	'use strict';

	function serialize(obj, pairSeparator, crumbSeparator) {
		var str = [];
		for (var p in obj) {
			if (obj.hasOwnProperty(p) && obj[p] !== null && obj[p] !== '') {
				str.push(p + crumbSeparator + obj[p]);
			}
		}
		return str.join(pairSeparator);
	}

	function deserialize(str, pairSeparator, crumbSeparator) {
		var dict = {},
			regex = new RegExp('([^?' + crumbSeparator + pairSeparator + ']+)(' + crumbSeparator + '([^' + pairSeparator + ']*))?', 'g');
		str.replace(regex, function ($0, $1, $2, $3) { dict[$1] = $3; });
		return dict;
	}

	return {
		serialize: serialize,
		deserialize: deserialize,
		toQueryString: function (obj) {
			return serialize(obj, '&', '=');
		},
		fromQueryString: function (querystring) {
			return deserialize(querystring, '&', '=');
		}
	};
});