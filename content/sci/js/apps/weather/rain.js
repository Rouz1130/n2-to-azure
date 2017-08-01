var Rain = function () {

	var $,
		animationIsRunning = false,
		$container,
		$parent,
		nbDrop = 10;

	var apiConditions = [[300, 301, 310, 500, 520], [311, 313, 321, 501, 521], [302, 312, 314, 502, 503, 504, 511, 522, 531]],
		speeds = [
			{ class: " light", max: 60, height: 0 },  //light rain
			{ class: " light", max: 60, height: 0 }, // shower rain and drizzle
			{ class: " heavy", max: 150, height: 0 }]; //heavy intensity rain and drizzle


	// function to generate a random number range.
	var randRange = function (minNum, maxNum) {
		return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
	};

	var lookupSettings = function (code) {
		for (var i = 0; i < apiConditions.length; i++) {
			var list = apiConditions[i];
			for (var k = 0; k < list.length; k++) {
				if (list[k] == code) {
					return i;
				}
			}
		}
		return 0;
	};

	var createRainDrops = function (position) {
		if (position === 2) {
			$parent.addBackgroundClass("dark-sky");
		}

		for (i = 1; i < speeds[position].max; i++) {
			var dropLeft = randRange(0, 1950);
			var dropTop = randRange(-500, 120);
			var isangled = ((i % 2) === 0) ? " angled" : "";
			var $drop = $("<div>", {
				"class": "drop" + speeds[position].class + isangled,
				"id": "drop" + i
			});
			var $span = $("<span>");
			var h = (speeds[position].height === 0) ? Math.floor(5 + Math.random() * 5) : Math.floor(30 + Math.random() * speeds[position].height);
			//$drop.height( h );

			$drop.append($span);
			$container.append($drop);
			$drop.css('left', dropLeft);
			$drop.css('top', dropTop);
		}
	};

	var init = function ($jQuery, code, parent) {

		$ = $jQuery;
		$parent = parent;

		$container = $("<div>", {
			"class": "rain-base"
		});
		$("#viewport-wrapper").append($container);

		var position = lookupSettings(code);
		createRainDrops(position);

		animationIsRunning = true;
	};

	var stopAnimation = function () {
		animationIsRunning = false;
	};

	var changeTo = function (code) {
		$container.empty();
		var position = lookupSettings(code);
		createRainDrops(position);
	};

	return {
		init: init,
		name: "Rain",
		stopAnimation: stopAnimation,
		changeTo: changeTo
	};
}();