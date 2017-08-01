module.exports = function (grunt) {

	grunt.registerTask('weather-js', 'Compile weather app', function () {

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('jshint', {
			options: {
				force: true
			},
			files: [path('weather/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: path('weather/*.js'),
				dest: path('weather.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: path('weather.js'),
				dest: path('weather.min.js')
			}
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.loadNpmTasks('grunt-contrib-concat');
		grunt.loadNpmTasks('grunt-contrib-uglify');

		grunt.task.run('jshint');
		grunt.task.run('concat');
		grunt.task.run('uglify');

		function path(s) {
			return 'content/sci/js/apps/' + s;
		}
	});

	grunt.registerTask('weather-css', 'Compile weather CSS', function () {

		grunt.config('sass', {
			dist: {
				options: {
					'sourcemap=none': ''
				},
				files: {
					'content/sci/css/weather.css': 'content/sci/css/apps/weather.scss'
				}
			}
		});

		grunt.config('cssmin', {
			dist: {
				files: {
					'content/sci/css/weather.min.css': 'content/sci/css/weather.css'
				}
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});
};