module.exports = function (grunt) {

	grunt.registerTask('plugins', 'Minify plugins', function () {

		grunt.config('jshint', {
			options: {
				force: true
			},
			files: [path('*.js'), not('*.min.js')]
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			all: {
				files: [{
					expand: true,
					cwd: path(''),
					src: ['*.js', '!*.min.js'],
					dest: path(''),
					ext: '.min.js'
				}]
			}
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.loadNpmTasks('grunt-contrib-uglify');

		grunt.task.run('jshint');
		grunt.task.run('uglify');

		function not(s) {
			return '!' + path(s);
		}

		function path(s) {
			return 'content/sci/js/plugins/' + s;
		}
	});
};