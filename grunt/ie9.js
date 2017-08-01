module.exports = function (grunt) {

    grunt.registerTask('ie9-css', 'Compile IE9 CSS', function () {

        grunt.config('sass', {
            dist: {
                options: {
                    'sourcemap=none': ''
                },
                files: {
                    'content/xomfl/css/ie9.css': 'content/xomfl/css/ie9/ie9.scss'
                }
            }
        });

        grunt.config('cssmin', {
            dist: {
                files: {
                    'content/xomfl/css/ie9.min.css': 'content/xomfl/css/ie9.css'
                }
            }
        });

        grunt.loadNpmTasks('grunt-contrib-sass');
        grunt.loadNpmTasks('grunt-contrib-cssmin');

        grunt.task.run('sass');
        grunt.task.run('cssmin');
            });

  
};