module.exports = function (grunt) {

	grunt.registerTask('gdl-js', 'Compile GDL application', function () {

		var helper = require('./helper')(grunt);

		grunt.config('jshint', {
			options: { force: true },
			files: [helper.appPath('gdl/**/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.createAppManifest('gdl', {
					directives: ['map', 'string-template'],
					services: ['array', 'event-bus', 'extender', 'facet', 'geolocation', 'serialization']
				}),
				dest: helper.appPath('gdl.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.appPath('gdl.js'),
				dest: helper.appPath('gdl.min.js')
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