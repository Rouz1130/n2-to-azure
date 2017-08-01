var Clouds = function () {

	var cloudModes = ['None', 'Few', 'Normal', 'Lot', 'Special'],
        apiConditions = [[800], [801], [802, 803], [701, 711, 721, 741, 761, 762, 804], [1]],
        layers = [],
        cloudBases = [],
        objects = [],
        textures = [],
        isStaticCloud = true,
        $world,
        $viewport,
        d = 0,
        p = 400,
        worldXAngle = 0,
        worldYAngle = 0,
        imgSrc,
        animationIsRunning = false,
        computedWeights = [],
        $;

	function setTextureUsage(id, mode) {
		var weights = { 'None': 0, 'Few': 0.7, 'Normal': 0.7, 'Lot': 1, 'Special': 1 };
		var clouds = { 'None': 0, 'Few': 4, 'Normal': 4, 'Lot': 4, 'Special': 2 };
		var size = { 'None': [0, 0], 'Few': [180, 30], 'Normal': [180, 30], 'Lot': [250, 20], 'Special': [60, 5] };
		for (var j = 0; j < cloudModes.length; j++) {
			if (cloudModes[j] == mode) {
				textures[id].mode = mode;
				textures[id].weight = weights[mode];
				textures[id].clouds = clouds[mode];
				textures[id].sizes = size[mode];
				imgSrc = textures[id].file;
			}
		}
		if (mode === "Lot" || mode === "Special") {
			$viewport.addClass("lot");
			$(".background-fade", $viewport).fadeIn(1000);
		}
		else {
			if ($viewport.hasClass("lot")) {
				$viewport.removeClass("lot");
				$(".background-fade", $viewport).fadeOut(1000);

			}
		}
	}


	function getXPos(int, isStaticCloud) {
		if (int === 1) {
			return Math.floor(-300 + (Math.random() * 200));
		}
		else if (int === 2) {
			return Math.floor(Math.random() * 140);
		}
		else {
			return Math.floor(200 + (Math.random() * 50));
		}
	}
	function getYPos(int, isStaticCloud) {
		if (int === 1) {
			return Math.floor(0 - (Math.random() * 30));
		}
		else if (int === 2) {
			return Math.floor(-20 - (Math.random() * 20));
		}
		else {
			return Math.floor(0 - (Math.random() * 40));
		}
	}

	function createCloud(max, size, isStaticCloud, mode, int) {
		var amount = (isStaticCloud) ? 1 : (2 + Math.random() * 2);

		var $div = $("<div>", {
			"class": "cloud-base"
		});

		var x = getXPos(int, isStaticCloud);
		var y = getYPos(int, isStaticCloud);
		var z = size[0] - (Math.random() * size[1]); // size!!

		if (isStaticCloud) {
			x = -260;
			y = 40;
			z = 100;
		}

		if (!isStaticCloud && mode === "Special") {
			x = Math.floor(20 + Math.random() * 50);
			y = Math.floor(-20 - (Math.random() * 20));
			z = 200 + (Math.random() * size[0]);

			// IE requires a larger range!?
			if ($(".no-flexboxlegacy").length > 0) {
				x = 20 + Math.random() * 150;
			}
		}

		var t = 'translateX( ' + x + 'px ) translateY( ' + y + 'px ) translateZ( ' + z + 'px )';
		$div.css("webkitTransform", t);
		$div.css("MozTransform", t);
		$div.css("oTransform", t);
		$div.css("transform", t);
		$world.append($div);

		var speed = 0.52 * Math.random();
		$div.data = { x: x, y: y, z: z, speed: speed };
		cloudBases.push($div);

		for (var j = 0; j < amount; j++) {

			var $cloud = $("<img>", {
				"class": "cloud-layer"
			});
			var r = Math.random();

			var src = imgSrc;
			for (var k = 0; k < computedWeights.length; k++) {
				if (r >= computedWeights[k].min && r <= computedWeights[k].max) {
					(function (img) {
						img.addEventListener('load', function () { img.style.opacity = 0.8; });
					})($cloud.get(0));
				}
			}
			$cloud.css("opacity", 0);
			$cloud.attr("src", src);
			x = 300 - (Math.random() * 650);
			y = 10 - (Math.random() * 200);
			z = 100 - (Math.random() * 10);
			var a = Math.random() * 360;
			var s = (isStaticCloud) ? 1.8 : 0.5;

			// IE requires larger sizes!?
			if ($(".no-flexboxlegacy").length > 0) {
				s = (isStaticCloud) ? 3.8 : 2.5;
			}

			x *= 0.2;
			y *= 0.2;
			var speedStart = (mode === "Lot" || mode === "Special") ? 0.009 : 0.015;
			var speedA = speedStart + (Math.random() * 0.03);
			$cloud.data = { x: x, y: y, z: z, a: a, s: s, speedA: speedA, animate: (isStaticCloud) ? false : true };
			t = 'translateX( ' + x + 'px ) translateY( ' + y + 'px ) translateZ( ' + z + 'px ) rotateZ( ' + a + 'deg ) scale( ' + s + ' )';
			$cloud.css("webkitTransform", t);
			$cloud.css("MozTransform", t);
			$cloud.css("oTransform", t);
			$cloud.css("transform", t);
			$div.append($cloud);
			layers.push($cloud);
		}
		return $div;
	}

	function generate() {
		$world.empty();
		objects = [];
		computedWeights = [];
		var mode = "none";
		var total = 0;
		var clouds = 0;
		var size = [0, 0];

		for (var i = 0; i < textures.length; i++) {
			if (textures[i].weight > 0) {
				total += textures[i].weight;
				mode = textures[i].mode;
			}
			if (textures[i].clouds > 0) {
				clouds += textures[i].clouds;
			}
			if (textures[i].sizes) {
				if (textures[i].sizes[0] > 0) {
					size[0] += textures[i].sizes[0];
					size[1] += textures[i].sizes[1];
				}
			}
		}
		var accum = 0;
		for (var j = 0; j < textures.length; j++) {
			if (textures[j].weight > 0) {
				var w = textures[j].weight / total;
				computedWeights.push({ src: textures[j].file, min: accum, max: accum + w });
				accum += w;
			}
		}


		for (j = 0; j < clouds; j++) {
			var isLast = (j === 0) ? true : false;
			objects.push(createCloud(clouds, size, isLast, mode, j));
		}
	}

	function updateView() {
		var t = 'translateZ( ' + d + 'px ) rotateX( ' + worldXAngle + 'deg) rotateY( ' + worldYAngle + 'deg)';
		$world.css("webkitTransform", t);
		$world.css("MozTransform", t);
		$world.css("oTransform", t);
		$world.css("transform", t);
	}
	function onContainerMouseWheel(event) {
		event = event ? event : window.event;
		d = d - (event.detail ? event.detail * -5 : event.wheelDelta / 8);
		updateView();
	}
	function orientationhandler(e) {
		if (!e.gamma && !e.beta) {
			e.gamma = -(e.x * (180 / Math.PI));
			e.beta = -(e.y * (180 / Math.PI));
		}
		var x = e.gamma;
		var y = e.beta;
		worldXAngle = y;
		worldYAngle = x;
		updateView();
	}
	function update() {
		if (animationIsRunning) {
			for (var j = 0; j < layers.length; j++) {
				var layer = layers[j];
				if (layer.data.animate) {
					layer.data.a += layer.data.speedA;
				}
				else {
					layer.data.a += 0.00001;
				}
				var t = 'translateX( ' + layer.data.x + 'px ) translateY( ' + layer.data.y + 'px ) translateZ( ' + layer.data.z + 'px ) rotateY( ' + (-worldYAngle) + 'deg ) rotateX( ' + (-worldXAngle) + 'deg ) rotateZ( ' + layer.data.a + 'deg ) scale( ' + layer.data.s + ')';
				layer.css("webkitTransform", t);
				layer.css("MozTransform", t);
				layer.css("oTransform", t);
				layer.css("transform", t);
			}
			requestAnimationFrame(update);
		}
	}

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

	var init = function ($jQuery, code, baseImagePath) {
		$ = $jQuery;
		$world = $(".weather .world");
		$viewport = $(".weather .viewport");

		$viewport.css('webkitPerspective', p);
		$viewport.css('MozPerspective', p + 'px');
		$viewport.css("oPerspective", p);
		$viewport.css("perspective", p);
		textures = [];
		textures[0] = { name: 'white cloud', file: baseImagePath + 'cloud.png', opacity: 1, weight: 0, sizes: [0, 0] };
		textures[1] = { name: 'grey cloud', file: baseImagePath + 'cloud-grey.png', opacity: 1, weight: 0, sizes: [0, 0] };
		textures[2] = { name: 'night cloud', file: baseImagePath + 'cloud-night.png', opacity: 1, weight: 0, sizes: [0, 0] };

		// init with
		var position = lookupSettings(code);
		if (cloudModes[position] === "None") {
			stopAnimation();
		}
		else {
			setTextureUsage(0, cloudModes[position]);
			generate();
			animationIsRunning = true;
			update();
		}

	};


	var stopAnimation = function () {
		animationIsRunning = false;
		if ($viewport.hasClass("lot")) {
			$viewport.removeClass("lot");
			$(".background-fade", $viewport).hide();
		}
		if ($world.children().length > 0) {
			$world.empty();
		}
	};

	var changeTo = function (code, noAnimation, optionalId) {
		//removed clouds from night time for this ticket - https://jira.tribalddb.co.uk/browse/ESSOEMEA-173
		if ($('.weather').hasClass('weather-eve')) {
			stopAnimation();
			return;
		}

		var position = lookupSettings(code);
		if (cloudModes[position] === "None") {
			stopAnimation();
		}
		else {
			var id = optionalId || 0;
			setTextureUsage(id, cloudModes[position]);
			generate();
			if (noAnimation) {
				animationIsRunning = false;
			}
			else {
				animationIsRunning = true;
				update();
			}
		}
		if (cloudModes[position] === "None" || cloudModes[position] === "Few") {
			$(".weather .station-img.no-shadow").removeClass("show");
		} else {
			$(".weather .station-img.no-shadow").addClass("show");
		}

	};

	return {
		init: init,
		name: "Clouds",
		stopAnimation: stopAnimation,
		changeTo: changeTo
	};
}();