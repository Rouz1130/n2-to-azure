var Snow = function () {

	var $,
        $canvas,
        ctx,
        $parent,
        snowflakeImg,
        sleetImg,
        hailImg,
        snowflakes = [],
        hailBits = [],
        color = 80,
        width,
        height,
        animationIsRunning = false;


	var apiConditions = [[600], [615, 620], [601, 621], [611, 612, 616], [602, 622], [906]],
        speeds = [
            { png: "snow", size: -1, modus: -1, speed: 18, drift: 10, max: 100, intervalRadio: [] }, //[light snow]
            { png: "snow", size: -1, modus: -1, speed: 18, drift: 10, max: 100, intervalRadio: [] }, //[light rain and snow]
            { png: "snow", size: -1, modus: -1, speed: 18, drift: 10, max: 100, intervalRadio: [] }, //[snow]
            { png: "snow", size: -1, modus: -1, speed: 18, drift: 10, max: 100, intervalRadio: [] }, //[sleet]
            { png: "snow", size: -1, modus: -1, speed: 18, drift: 10, max: 100, intervalRadio: [] }, //[heavy snow]
            { png: "snow", size: -1, modus: -1, speed: 18, drift: 10, max: 100, intervalRadio: [] }  //[hail]
        ];

	/*
	speeds = [
		{png:"snow",size:-1, modus:-1, speed:18, drift:10, max:100, intervalRadio:[]}, // [light snow]
		{png:"snow",size:-1, modus:4, speed:28, drift:10, max:150, intervalRadio:[]}, //[light rain and snow]
		{png:"snow",size:-1, modus:-1, speed:10, drift:5, max:250, intervalRadio:[]}, //[snow]
		{png:"snow",size:-1, modus:2, speed:20, drift:2.2, max:350, intervalRadio:[]}, //[sleet]
		{png:"snow",size:-1, modus:-1, speed:90, drift:5.8, max:350, intervalRadio:[]}, //[heavy snow]
		{png:"hail",size:0.5, modus:-1, speed:35, drift:1.8, max:120, intervalRadio:[7000,5500]} //[hail]
	];
	*/

	//setting up html5 canvas
	var setup = function (baseImagePath) {
		var $parent = $(".weather .viewport-wrapper");
		width = 1950;
		height = $parent.height();
		$canvas = document.createElement('canvas');
		$canvas.width = width;
		$canvas.height = height;
		$canvas.className = 'snow-canvas';
		$parent.append($($canvas));
		ctx = $canvas.getContext('2d');

		snowflakeImg = new Image();
		snowflakeImg.src = baseImagePath + 'snowflake.png';
		sleetImg = new Image();
		sleetImg.src = baseImagePath + 'sleet.png';
		hailImg = new Image();
		hailImg.src = baseImagePath + 'hail.png';
	};
	//tocreate random umber within the range.
	var rand = function (min, max) {
		return Math.random() * (max - min) + min;
	};
	//to calculte distance between tow coords
	var calDistance = function (x1, y1, x2, y2) {
		return Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));
	};
	//The Snowflake object
	var Snowflake = function (speed, drift, xPos, yPos, h, img, size, interval) {
		var Snowflake = this,
            //size = size,
            //speed = speed,
            //drift = drift,
            //xPos = xPos,
            //yPos = yPos,
            oriYPos = -10,
            //img = img,
            counter = 0,
            endY = h,
            intTimer,
            intAray = interval,
            intStep = 0,
            colour = '#' + Math.floor(Math.random() * 16777215).toString(16),
            stopped = false,
            pause = false,
            wait = false,
            sign = Math.random() < 0.5 ? 1 : -1,
            opacity = 0.1 + Math.random();

		Snowflake.init = function () {
			counter = 0;
			if (size === -1) {
				size = (img === sleetImg) ? 1 : 0.05 + (Math.floor(0 + Math.random() * 70)) / 100;
			}
			else {
				size = size + (Math.random() * 0.15);
				opacity = 0.5 + Math.random();
			}

			if (intAray.length > 0) {
				intTimer = setTimeout(Snowflake.timeToChangeInterval, intAray[intStep]);
			}
		};

		Snowflake.timeToChangeInterval = function () {
			if (intStep === 0) {
				pause = true;
				intStep = 1;
			}
			else {
				pause = false;
				wait = false;
				intStep = 0;
				intTimer = setTimeout(Snowflake.timeToChangeInterval, intAray[intStep]);
			}
		};

		Snowflake.draw = function () {
			if (!stopped) {
				ctx.save();
				ctx.globalAlpha = opacity;
				ctx.drawImage(img, Math.round(xPos), Math.round(yPos), img.width * size, img.height * size);
				ctx.restore();
			}
		};

		Snowflake.update = function (i) {
			if (!stopped) {
				if (!wait) {
					// using some trigonometry to determine our x and y position
					counter += speed / 5000;
					xPos += sign * speed * Math.cos(counter) / 40;
					var drop = Math.floor((Math.sin(counter) / 40 + speed / drift) * 100) / 100;
					yPos += drop;

				}

				// move to the top again
				if (yPos > endY) {
					yPos = oriYPos;
					if (pause) {
						wait = true;
						intTimer = setTimeout(Snowflake.timeToChangeInterval, intAray[intStep]);
					}
				}
			}
		};

		//updating Snowflake drop
		Snowflake.stop = function (i) {
			stopped = true;
			clearTimeout(intTimer);
		};
		Snowflake.init();
	};

	var update = function () {
		if (animationIsRunning) {
			requestAnimationFrame(update);
			ctx.globalCompositeOperation = 'destination-out';
			ctx.fillRect(0, 0, width, height);
			ctx.globalCompositeOperation = 'lighter';
			// update over each snowflakes, draw it, update it
			var i = snowflakes.length;
			while (i--) {
				snowflakes[i].draw();
				snowflakes[i].update(i);
			}

			i = hailBits.length;
			while (i--) {
				hailBits[i].draw();
				hailBits[i].update(i);
			}
		}
	};

	var createSnow = function (code) {
		//find out which settings to use:
		var position = 0;
		for (var i = 0; i < apiConditions.length; i++) {
			var list = apiConditions[i];
			for (var k = 0; k < list.length; k++) {
				if (list[k] == code) {
					position = i;
					break;
				}
			}
		}

		if (position === 3 || position === 5) {
			$parent.addBackgroundClass("grey-sky");
		}
		else if (position === 0) {
			$parent.addBackgroundClass("blue-sky");
		}

		for (var j = 0; j < speeds[position].max; j++) {
			var x = Math.floor(20 + Math.random() * width);
			var y = 10 + Math.floor(Math.random() * height);
			var speed = 2 + Math.random() * speeds[position].speed;
			var drift = speeds[position].drift;
			var img = snowflakeImg;
			switch (speeds[position].png) {
				case "sleet":
					img = sleetImg;
					break;
				case "hail":
					speed = Math.floor(12 + Math.random() * speeds[position].speed);
					y = (Math.floor((Math.random() * 600)) * -1) - 5;
					img = hailImg;
					break;
			}

			if (speeds[position].modus !== -1) {
				var modus = j % speeds[position].modus;
				if (modus === speeds[position].modus - 1) {
					img = sleetImg;
					speed = 8 + Math.random() * 10;
					drift = 1 + Math.random() * 1;
				}
			}

			snowflakes.push(new Snowflake(speed, drift, x, y, height, img, speeds[position].size, speeds[position].intervalRadio));
		}
	};


	var init = function ($jQuery, code, parent, baseImagePath) {
		$ = $jQuery;
		$parent = parent;

		setup(baseImagePath);
		animationIsRunning = true;
		createSnow(code);
		update();
	};

	var stopAnimation = function () {
		animationIsRunning = false;
		cancelAnimationFrame(update);

		for (var i = 0; i < snowflakes.length; i++) {
			snowflakes[i].stop(i);
			snowflakes[i] = null;
		}
		snowflakes = [];

		ctx.globalCompositeOperation = 'destination-in';
		ctx.fillRect(0, 0, width, height);
	};

	var changeTo = function (code) {
		stopAnimation();
		createSnow(code);
		animationIsRunning = true;
		update();
	};

	return {
		init: init,
		name: "Snow",
		animationIsRunning: animationIsRunning,
		stopAnimation: stopAnimation,
		changeTo: changeTo
	};
}();