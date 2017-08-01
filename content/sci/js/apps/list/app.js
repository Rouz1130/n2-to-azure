angular.module('list', ['ngSanitize', 'xom.shared'])
	.config(['$locationProvider', function ($locationProvider) {
		$locationProvider.html5Mode(true);
	}]
);