module.exports = function (grunt) {

	grunt.registerTask('unit-tests', 'JavaScript unit tests', function () {

		grunt.config('karma', {
			unit: {
				configFile: 'unit-tests/config/karma.conf.js',
				background: true,
				singleRun: false
			}
		});

		grunt.loadNpmTasks('grunt-karma');
		grunt.task.run('karma');
	});

};