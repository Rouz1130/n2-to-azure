module.exports = function (grunt) {

	grunt.registerTask('ie8-css', 'Compile IE8 CSS', function () {

		grunt.config('sass', {
			dist: {
				options: {
					'sourcemap=none': ''
				},
				files: {
				    'content/sci/css/ie8.css': 'content/sci/css/ie8/ie8.scss'
				}
			}
		});

		grunt.config('cssmin', {
			dist: {
				files: {
				    'content/sci/css/ie8.min.css': 'content/sci/css/ie8.css'
				}
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});

	grunt.registerTask('ie8-js', 'Compile IE8 JS', function () {

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: ['content/vendor/ie8/*.js', '!content/vendor/ie8/respond.min.js', '!content/vendor/ie8/polyfills.min.js'],
				dest: 'content/vendor/ie8/polyfills.min.js'
			}
		});

		grunt.loadNpmTasks('grunt-contrib-concat');

		grunt.task.run('concat');
	});
};