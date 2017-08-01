angular.module('list').factory('dataSvc', ['$http', '$q', 'httpShimSvc', 'LIST',
	function ($http, $q, httpShimSvc, LIST) {

		'use strict';

		function search(query) {
			var deferred = $q.defer();

			var options = httpShimSvc.parseTemplateUrl(LIST.apiUrl, query);
			options.method = 'GET';

			$http(options).then(
				function (res) {
					deferred.resolve(res.data);
				}, function (xhr) {
					deferred.reject('The API returned status code ' + xhr.status);
				});

			return deferred.promise;
		}

		return {
			search: search
		};
	}
]);