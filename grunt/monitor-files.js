module.exports = function (grunt) {
	grunt.registerTask('monitor-files', 'Watch all files', function () {
		grunt.config('watch', {
			coreJS: {
			    files: ['content/sci/js/core/**/*.js'],
				tasks: ['core-js']
			},
			coreCSS: {
			    files: 'content/sci/css/core/**/*.scss',
				tasks: ['core-css']
			},
			ie8CSS: {
			    files: 'content/sci/css/ie8/**/*.scss',
				tasks: ['ie8-css']
			},
			
			pdsCSS: {
			    files: 'content/sci/css/pds/**/*.scss',
				tasks: ['pds-css']
			},
			drillDownJS: {
			    files: ['content/sci/js/apps/drill-down/**/*.js'],
				tasks: ['drill-down-js']
			},
			gdlJS: {
			    files: ['content/sci/js/apps/gdl/**/*.js', 'content/sci/js/apps/shared/**/*.js'],
				tasks: ['gdl-js']
			},
			listJS: {
			    files: ['content/sci/js/apps/list/**/*.js', 'content/sci/js/apps/shared/**/*.js'],
				tasks: ['list-js']
			},
			locatorJS: {
			    files: ['content/sci/js/apps/locator/**/*.js', 'content/sci/js/apps/shared/**/*.js'],
				tasks: ['locator-js']
			},
			productSelectorJS: {
			    files: ['content/sci/js/apps/product-selector/**/*.js'],
				tasks: ['product-selector-js']
			},
			productSelectorCSS: {
			    files: 'content/sci/css/apps/product-selector.scss',
				tasks: ['product-selector-css']
			},
			regionSelectorJS: {
			    files: ['content/sci/js/apps/region-selector/**/*.js', 'content/sci/js/apps/shared/**/*.js'],
				tasks: ['region-selector-js']
			},
			iconSprite: {
			    files: 'content/sci/img/icons/*.*',
				tasks: ['make-sprites']
			},
			weatherCSS: {
			    files: 'content/sci/css/apps/weather.scss',
				tasks: ['weather-css']
			},
			weatherJS: {
			    files: 'content/sci/js/apps/weather/*.js',
				tasks: ['weather-js']
			},
			plugins: {
			    files: ['content/sci/js/plugins/*.js', '!**/*.min.js'],
				tasks: ['plugins']
			},
			angularShared: {
			    files: ['content/sci/js/apps/shared/**/*.js', '!content/sci/js/apps/shared/**/*.min.js'],
				tasks: ['shared-js']
			}
		});

		grunt.loadNpmTasks('grunt-contrib-watch');
		grunt.task.run('watch');
	});
};