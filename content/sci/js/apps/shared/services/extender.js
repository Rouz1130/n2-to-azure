angular.module('xom.shared').service('extenderSvc', function () {
	'use strict';

	function extend() {
		if (arguments.length === 0 || typeof arguments[0] != 'object') return {};
		var obj = arguments[0];
		for (var i = 1; i < arguments.length; i++) {
			if (typeof arguments[i] != 'object') continue;
			copyProperties(arguments[i], obj);
		}
		return obj;
	}

	function copyProperties(src, dst) {
		for (var p in src) {
			if (src.hasOwnProperty(p) && src[p] !== null) {
				var propertyName = getPropertyName(dst, p);
				dst[propertyName] = angular.copy(src[p]);
			}
		}
	}

	function getPropertyName(obj, name) {
		var lower = name.toLowerCase();
		for (var p in obj) {
			if (p.toLowerCase() === lower) {
				return p;
			}
		}
		return name;
	}

	return {
		copyProperties: copyProperties,
		extend: extend,
		getPropertyName: getPropertyName
	};
});