angular.module('locator').service('amenitiesSvc', ['$http', '$q', 'LOCATOR',
	function ($http, $q, LOCATOR) {

		'use strict';

		function getAmenities() {
			var deferred = $q.defer();

			if (LOCATOR.amenities) {

				deferred.resolve(LOCATOR.amenities);

			} else if (LOCATOR.amenitiesUrl) {

				$http({ method: 'GET', url: LOCATOR.amenitiesUrl })
					.then(function (res) {
						deferred.resolve(res.data);
					})
					// hack: the ['catch'] and ['finally'] notation is required for IE8
					['catch'](function () {
						deferred.reject('Failed to load amenities.');
					});

			} else {

				deferred.resolve([]);

			}

			return deferred.promise;
		}

		return {
			get: getAmenities
		};
	}
]);