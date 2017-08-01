angular.module('product-selector').factory('dataSvc', ['$http', '$q', 'API_ROOT', function ($http, $q, API_ROOT) {

	'use strict';

	var WORDS = 'meowing non stop make meme cute face or give attitude and jump around on couch meow constantly until given food for cat snacks loves cheeseburgers who the baby'.split(' ');

	function search(filter) {
		var deferred = $q.defer();

		setTimeout(function () {
			var data = createRandomResults();
			deferred.resolve(data);
		}, 500);

		return deferred.promise;
	}

	function recommend(url) {
		var deferred = $q.defer();

		$http({ method: 'GET', url: API_ROOT + url })
			.then(function (res) {
				var result = convertRecommendationResponse(res.data.conditionlist);
				deferred.resolve(result);
			})
			.catch(function () {
				deferred.reject('Failed to load recommendations.');
			});

		return deferred.promise;
	}

	function createRandomResults() {
		var ary = [],
			numResults = Math.floor(Math.random() * 500) + 1;
		for (var i = 0; i < numResults; i++) {
			ary.push({
				url: '#',
				text: createRandomTitle()
			});
		}
		return ary;
	}

	function createRandomTitle() {
		var ary = [],
			numWords = Math.floor(Math.random() * 6) + 1,
			wordCount = WORDS.length,
			idx = 0;
		for (var i = 0; i < numWords; i++) {
			idx = Math.floor(Math.random() * wordCount);
			ary.push(WORDS[idx]);
		}
		return ary.join(' ');
	}

	function convertRecommendationResponse(data) {
		return {
			title: data.title,
			options: data.values
		};
	}

	return {
		search: search,
		recommend: recommend
	};
}]);