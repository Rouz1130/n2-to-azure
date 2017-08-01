module.exports = function (grunt) {

	grunt.registerTask('list-js', 'Compile list application', function () {

		var helper = require('./helper')(grunt);

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('jshint', {
			options: { force: true },
			files: [helper.appPath('list/**/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.createAppManifest('list', {
					services: ['event-bus', 'extender', 'facet', 'http-shim', 'serialization']
				}),
				dest: helper.appPath('list.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.appPath('list.js'),
				dest: helper.appPath('list.min.js')
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