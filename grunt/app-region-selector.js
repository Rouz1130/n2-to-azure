module.exports = function (grunt) {

	grunt.registerTask('region-selector-js', 'Compile region selector application', function () {

		var helper = require('./helper')(grunt);

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('jshint', {
			options: { force: true },
			files: [helper.appPath('region-selector/**/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.createAppManifest('region-selector', {
					directives: ['accordion-trigger', 'world-map'],
					services: ['event-bus']
				}),
				dest: helper.appPath('region-selector.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.appPath('region-selector.js'),
				dest: helper.appPath('region-selector.min.js')
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