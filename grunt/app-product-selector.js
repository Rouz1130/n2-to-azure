module.exports = function (grunt) {

	grunt.registerTask('product-selector-js', 'Compile product selector JS', function () {

		var helper = require('./helper')(grunt);

		grunt.config('pkg', grunt.file.readJSON('package.json'));

		grunt.config('jshint', {
			options: { force: true },
			files: [helper.appPath('product-selector/**/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.createAppManifest('product-selector', {
					services: ['event-bus']
				}),
				dest: helper.appPath('product-selector.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: helper.appPath('product-selector.js'),
				dest: helper.appPath('product-selector.min.js')
			}
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.loadNpmTasks('grunt-contrib-concat');
		grunt.loadNpmTasks('grunt-contrib-uglify');

		grunt.task.run('jshint');
		grunt.task.run('concat');
		grunt.task.run('uglify');
	});

	grunt.registerTask('product-selector-css', 'Compile product selector CSS', function () {

		grunt.config('sass', {
			dist: {
				options: {
					'sourcemap=none': ''
				},
				files: {
					'content/sci/css/product-selector.css': 'content/sci/css/apps/product-selector.scss'
				}
			}
		});

		grunt.config('cssmin', {
			dist: {
				files: {
					'content/sci/css/product-selector.min.css': 'content/sci/css/product-selector.css'
				}
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});
};