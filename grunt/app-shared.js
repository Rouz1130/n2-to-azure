module.exports = function (grunt) {
	grunt.registerTask('shared-js', 'Lint shared files', function () {

		var helper = require('./helper')(grunt);

		grunt.config('jshint', {
			options: { force: true },
			files: [helper.appPath('shared/**/*.js')]
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.task.run('jshint');
	});
};