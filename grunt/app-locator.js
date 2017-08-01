module.exports = function (grunt) {

	grunt.registerTask('locator-js', 'Compile locator application', function () {

		var helper = require('./helper')(grunt);

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('jshint', {
			options: { force: true },
			files: [helper.appPath('locator/**/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.createAppManifest('locator', {
					directives: ['map', 'string-template'],
					services: ['array', 'event-bus', 'extender', 'facet', 'geolocation', 'serialization']
				}),
				dest: helper.appPath('locator.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.appPath('locator.js'),
				dest: helper.appPath('locator.min.js')
			}
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.loadNpmTasks('grunt-contrib-concat');
		grunt.loadNpmTasks('grunt-contrib-uglify');

		grunt.task.run('jshint');
		grunt.task.run('concat');
		grunt.task.run('uglify');
	});
};