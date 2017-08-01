module.exports = function (grunt) {
	grunt.registerTask('make-sprites', 'Create image sprites', function () {
		grunt.config('sprite', {
			icons: {
				src: 'content/sci/img/icons/*.*',
				dest: 'content/sci/img/icons.temp.png',
				destCss: 'content/sci/css/core/modules/_icons-generated.scss',
				imgPath: '../img/icons.png'
			}
		});

		grunt.config('imagemin', {
			icons: {
				options: {
					optimizationLevel: 3
				},
				files: {
				    'content/sci/img/icons.png': 'content/sci/img/icons.temp.png'
				}
			}
		});

		grunt.loadNpmTasks('grunt-spritesmith');
		grunt.loadNpmTasks('grunt-contrib-imagemin');
		grunt.task.run('sprite');
		grunt.task.run('imagemin');
	});
};