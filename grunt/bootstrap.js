module.exports = function (grunt) {

	grunt.registerTask('bootstrap-css', 'Compile custom Bootstrap', function () {

		grunt.config('sass', {
			dist: {
				options: {
					'sourcemap=none': ''
				},
				files: {
					'content/vendor/bootstrap/css/bootstrap.css': 'content/vendor/bootstrap/css/source/bootstrap-custom.scss'
				}
			}
		});

		grunt.config('cssmin', {
			dist: {
				files: {
					'content/vendor/bootstrap/css/bootstrap.min.css': 'content/vendor/bootstrap/css/bootstrap.css'
				}
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});
};