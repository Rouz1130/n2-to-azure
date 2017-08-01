module.exports = function (grunt) {

	function appPath(s) {
		return 'content/sci/js/apps/' + s;
	}

	function createAppManifest(appFolder, shared) {
		var appFiles = [appFolder + '/app.js', appFolder + '/**/*.js'];
		var ary = [];

		for (var i = 0; i < appFiles.length; i++) {
			ary.push(appPath(appFiles[i]));
		}
		ary.push(appPath('shared/constants.js'));

		if (shared === undefined) return ary;

		ary.push(appPath('shared/app.js'));
		for (var folder in shared) {
			for (var i = 0; i < shared[folder].length; i++) {
				ary.push(appPath('shared/' + folder + '/' + shared[folder][i] + '.js'));
			}
		}

		return ary;
	}

	function runAppTasks(appName, shared) {
		grunt.config('jshint', {
			options: { force: true },
			files: [appPath(appName + '/**/*.js')]
		});

		grunt.config('concat', {
			options: {
				separator: ';\n\n',
				banner: '/*! ' + appName + ' <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: createAppManifest(appName, shared),
				dest: appPath(appName + '.js')
			}
		});

		grunt.config('uglify', {
			options: {
				banner: '/*! ' + appName + ' <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */\n'
			},
			files: {
				src: appPath(appName + '.js'),
				dest: appPath(appName + '.min.js')
			}
		});

		grunt.loadNpmTasks('grunt-contrib-jshint');
		grunt.loadNpmTasks('grunt-contrib-concat');
		grunt.loadNpmTasks('grunt-contrib-uglify');

		grunt.task.run('jshint');
		grunt.task.run('concat');
		grunt.task.run('uglify');
	}

	return {
		appPath: appPath,
		createAppManifest: createAppManifest,
		runAppTasks: runAppTasks
	}
};