module.exports = function (grunt) {
	grunt.registerTask('drill-down-js', 'Compile drill-down application', function () {
		require('./helper')(grunt).runAppTasks('drill-down', { services: ['event-bus'] });
	});
};