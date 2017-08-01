module.exports = function (grunt) {

	grunt.registerTask('lob-css', 'Compile LOB CSS', function () {

		grunt.config('sass', {
			options: {
				'sourcemap=none': ''
			},
			dist: {
				files: [{
					expand: true,
					cwd: 'content/sci/css/lob',
					src: ['*.scss'],
					dest: 'content/sci/css/lob',
					ext: '.css'
				}]
			}
		});

		grunt.config('cssmin', {
			options: {
				banner: '/*! <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
			},
			dist: {
				files: [{
					expand: true,
					cwd: 'content/sci/css/lob',
					src: ['*.css', '!*.min.css'],
					dest: 'content/sci/css',
					ext: '.min.css'
				}]
			}
		});

		grunt.loadNpmTasks('grunt-contrib-sass');
		grunt.loadNpmTasks('grunt-contrib-cssmin');

		grunt.task.run('sass');
		grunt.task.run('cssmin');
	});
};