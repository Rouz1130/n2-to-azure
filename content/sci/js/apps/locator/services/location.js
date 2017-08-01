angular.module('locator').service('locationSvc', ['$http', '$q', '$interpolate', '$log', 'LOCATOR',
	function ($http, $q, $interpolate, $log, LOCATOR) {

		'use strict';

		function searchByBoundary(filter) {
			if (!LOCATOR.boundaryApi) {
				$log.warn('No boundary search endpoint configured.');
				return;
			}
			return search(LOCATOR.boundaryApi, filter);
		}

		function searchByPhrase(filter) {
			if (!LOCATOR.phraseApi) {
				$log.warn('No phrase search endpoint configured.');
				return;
			}
			return search(LOCATOR.phraseApi, filter);
		}

		function search(apiUrl, filter) {
			var deferred = $q.defer();
			var expression = $interpolate(apiUrl);
			var url = expression(filter);

			$http({ method: 'GET', url: url })
				.then(function (res) {
					deferred.resolve(res.data);
				})
				// hack: the ['catch'] and ['finally'] notation is required for IE8
				['catch'](function () {
					deferred.reject('Failed to load locations.');
				});

			return deferred.promise;
		}

		return {
			searchByBoundary: searchByBoundary,
			searchByPhrase: searchByPhrase
		};
	}
]);