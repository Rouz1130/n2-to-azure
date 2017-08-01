module.exports = function (grunt) {

	grunt.registerTask('core-css', 'Compile core CSS', function () {

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('sass', {
			dist: {
				options: {
					'sourcemap=none': ''
				},
				files: {
				    'content/sci/css/core.css': 'content/sci/css/core/core.scss'
				}
			}
		});

		grunt.config('cssmin', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
			},
			dist: {
				files: {
				    'content/sci/css/core.min.css': 'content/sci/css/core.css'
				}
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});

	grunt.registerTask('core-js', 'Compile core JS', function () {

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('jshint', {
			options: {
				force: true
			},
			dist: js('core/**/*.js')
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			dist: {
				src: [js('core/utils/_pubsub.js'), js('core/utils/_responsive-images.js'), js('core/**/*.js')],
				dest: js('core.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			dist: {
				src: js('core.js'),
				dest: js('core.min.js')
			}
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.loadNpmTasks('grunt-contrib-concat');
		grunt.loadNpmTasks('grunt-contrib-uglify');

		grunt.task.run('jshint');
		grunt.task.run('concat');
		grunt.task.run('uglify');

		function js(s) {
			return 'content/sci/js/' + s;
		}
	});
};