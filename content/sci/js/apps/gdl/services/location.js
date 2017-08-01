angular.module('gdl').service('locationSvc', ['$http', '$q', '$interpolate', '$log', 'GDL',
	function ($http, $q, $interpolate, $log, GDL) {

		'use strict';

		function search(filter) {
			if (!GDL.searchApi) {
				$log.warn('No boundary search endpoint configured.');
				return;
			}

			var deferred = $q.defer();
			var expression = $interpolate(GDL.searchApi);
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
			search: search
		};
	}
]);