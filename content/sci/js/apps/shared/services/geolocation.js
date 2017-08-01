angular.module('xom.shared').factory('geolocationSvc', ['$q', '$window', function ($q, $window) {

	'use strict';

	function getCurrentPosition() {
		var deferred = $q.defer();

		if (!$window.navigator.geolocation) {
			deferred.reject('Geolocation not supported.');
		} else {
			$window.navigator.geolocation.getCurrentPosition(deferred.resolve, deferred.reject);
		}

		return deferred.promise;
	}

	return {
		getCurrentPosition: getCurrentPosition
	};
}]);