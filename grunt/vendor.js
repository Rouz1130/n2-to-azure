module.exports = function (grunt) {

	grunt.registerTask('vendor-js', 'Combine vendor scripts', function () {

		grunt.config('uglify', {
			files: {
				src: js('typeahead/typeahead.bundle.js'),
				dest: js('typeahead/typeahead.bundle.min.js')
			}
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! vendor libs <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: [js('jquery/jquery.min.js'), js('bootstrap/js/bootstrap.min.js'), js('slick/slick.min.js'), js('jquery/jquery.validate.min.js'), js('jquery/jquery.cookie.js'), js('typeahead/typeahead.bundle.min.js')],
				dest: js('vendor.min.js')
			}
		});

		grunt.loadNpmTasks('grunt-contrib-uglify');
		grunt.loadNpmTasks('grunt-contrib-concat');

		grunt.task.run('uglify');
		grunt.task.run('concat');

		function js(s) {
			return 'content/vendor/' + s;
		}
	});
};