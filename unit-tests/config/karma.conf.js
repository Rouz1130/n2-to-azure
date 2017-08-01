module.exports = function (config) {
	config.set({
		autoWatch: true,
		basePath: '../../',
		browsers: ['Chrome'],
		exclude: [],
		files: [
			'content/vendor/jquery/jquery.min.js',
			'content/vendor/angular/angular.min.js',
			'unit-tests/test/lib/angular/angular-mocks.js',
			//'content/sci/js/apps/shared/app.js',
			'content/sci/js/apps/shared/**/*.js',
			'unit-tests/test/unit/*.js'
		],
		frameworks: ['jasmine'],
		junitReporter: {
			outputFile: 'test_out/unit.xml',
			suite: 'unit'
		},
		plugins: [
			'karma-script-launcher',
			'karma-junit-reporter',
			'karma-chrome-launcher',
			'karma-jasmine'
		]
	});
};