module.exports = function (grunt) {

	grunt.registerTask('amp-obits-css', 'Compile amp specific CSS', function () {

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('sass', {
			dist: {
				options: {
					'sourcemap=none': ''
				},
				files: {
				    'content/sci/css/amp-obits.css':  'content/sci/css/core/amp-obits.scss'
				}
			}
		});

		grunt.config('cssmin', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
			},
			dist: {
				files: {
				    'content/sci/css/amp-obits.min.css': 'content/sci/css/amp-obits.css' 
				}
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});
};