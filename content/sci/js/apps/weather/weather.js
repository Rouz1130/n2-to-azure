var Tribal = window.Tribal || {};

Tribal.Weather = function () {

	var animationsRunning = [],
        $,
        backgroundClass = [],
        allWeatherClasses = { "Clouds": Clouds, "Snow": Snow, "Rain": Rain },
        alreadyInited = {},
		baseImagePath = '/';

	var init = function ($jQuery, imagePath) {
		$ = $jQuery;
		baseImagePath = imagePath;

		// set up initial inited classes
		for (var item in allWeatherClasses) {
			var name = allWeatherClasses[item].name;
			alreadyInited[item] = false;
		}

		//// add the temp eventlistners
		//var btns = $("#temp-controls a");
		//for (var j = 0; j < btns.length; j++) {
		//	var btn = $(btns[j]);
		//	btn.on('click', function (e) {
		//		e.preventDefault();
		//		var codes = $(this).data("code");
		//		var type = $(this).parent().data("type");
		//		var useCode;
		//		if ($.isNumeric(codes)) {
		//			useCode = codes;
		//		}
		//		else {
		//			var list = codes.split(",");
		//			useCode = list[Math.floor(Math.random() * list.length)];
		//		}
		//		changeWeatherTo(type, useCode);
		//	});
		//}
	};

	var changeWeatherTo = function (type, code) {
		backgroundClass = [];
		if (type == "Snow" && (code == 620 || code == 615)) {
			type = "Rain";
			code = 300;
		}
		else if (type == "Snow" && (code == 611 || code == 612 || code == 616 || code == 906)) {
			type = "Rain";
			code = 302;
		}

		switch (type) {
			case "Clear":
			case "Clouds":
			case "Atmosphere":
				stopAllAnimations();
				if (isOldBrowser()) {
					doIE9StillImage(code);
				}
				else {
					doCloudAnimation(code);
				}
				break;

			case "Snow":
				stopAllAnimations();
				if (isOldBrowser()) {
					doIE9StillImage(code);
				}
				else {
					doSnowAnimation(code);
				}
				break;

			case "Rain":
			case "Drizzle":
				stopAllAnimations();
				if (isOldBrowser()) {
					doIE9StillImage(code);
				}
				else {
					doRainAnimation(code);
				}
				break;

			case "Extreme":
				if (code === 906) { // hail
					changeWeatherTo("Snow", 906);
				}
				else { // dont support others, give them overcast!
					changeWeatherTo("Clouds", 804);
				}
				break;

			default:
				changeWeatherTo("Clouds", 804);
		}

		var $anim = $(".weather .weather-animation");
		$anim.removeClass().addClass("weather-animation");
		for (var i = 0; i < backgroundClass.length; i++) {
			$anim.addClass(backgroundClass[i]);
		}
		if (code === 800) {
			$anim.addClass("Clear");
		}

	};

	var addBackgroundClass = function (className) {
		backgroundClass.push(className);
	};

	var stopAllAnimations = function (excludeList) {
		for (var i = 0; i < animationsRunning.length; i++) {
			allWeatherClasses[animationsRunning[i]].stopAnimation();
		}
		//remove all but the exclude list
		animationsRunning = [];
	};

	var doRainAnimation = function (code) {
		if (!alreadyInited[Rain.name]) {
			Rain.init($, code, Tribal.Weather);
			alreadyInited[Rain.name] = true;
		}
		else {
			Rain.changeTo(code);
		}
		//light rain
		var cloudColorid = (
            Number(code) === 300 ||
            Number(code) === 301 ||
            Number(code) === 310 ||
            Number(code) === 500 ||
            Number(code) === 520) ? 0 : 1;
		if (!isDay()) {
			cloudColorid = 2;
		}

		Clouds.changeTo(1, true, cloudColorid); //'Special' clouds!
		backgroundClass.push(Clouds.name);
		backgroundClass.push(Rain.name);

		animationsRunning = [Clouds.name, Rain.name];

	};


	var doCloudAnimation = function (code) {
		if (!alreadyInited[Clouds.name]) {
			Clouds.init($, 'None', baseImagePath);
			alreadyInited[Clouds.name] = true;
		}
		else {
			var cloudColorid = isDay() ? 0 : 2;
			Clouds.changeTo(code, false, cloudColorid);
		}
		backgroundClass.push(Clouds.name);
		animationsRunning = [Clouds.name];
	};

	var doSnowAnimation = function (code) {
		if (!alreadyInited[Snow.name]) {
			Snow.init($, code, Tribal.Weather, baseImagePath);
			alreadyInited[Snow.name] = true;
		}
		else {
			Snow.changeTo(code);
		}

		var cloudColorid = isDay() ? 1 : 2;
		if (Number(code) === 600 || Number(code) === 615 || Number(code) === 620) {
			Clouds.changeTo(804, true, cloudColorid); //light snow:: 'Lot' clouds!
		}
		else {
			Clouds.changeTo(1, true, cloudColorid); //'Special' clouds!
		}
		backgroundClass.push(Clouds.name);
		backgroundClass.push(Snow.name);
		animationsRunning = [Clouds.name, Snow.name];

	};

	var isDay = function () {
		return $('.weather').hasClass('weather-day');
	};

	var doIE9StillImage = function (code) {
		var $viewWrapper = $(".weather .viewport-wrapper");
		var $viewport = $(".viewport", $viewWrapper);
		$viewWrapper.removeClass().addClass("ie");
		$viewport.removeClass();

		switch (code + "") {
			case "800":
				$viewport.addClass("clouds-clear");
				$viewWrapper.addClass("do-show-shadow");
				break;
			case "801":
				$viewport.addClass("clouds-few");
				$viewWrapper.addClass("do-show-shadow");
				break;
			case "802":
			case "803":
				$viewport.addClass("clouds-scattered");
				break;
			case "600":
				$viewport.addClass("snow-light");
				break;
			case "601":
			case "621":
				$viewport.addClass("snow-med");
				break;
			case "615":
			case "620":
			case "611":
			case "612":
			case "616":
				$viewport.addClass("snow_sleet");
				break;
			case "602":
			case "622":
				$viewport.addClass("snow-heavy");
				break;
			case "906":
				$viewport.addClass("hail");
				break;
			case "302":
			case "312":
			case "314":
			case "502":
			case "503":
			case "504":
			case "511":
			case "522":
			case "531":
				$viewport.addClass("rain-heavy");
				break;
			case "311":
			case "313":
			case "321":
			case "501":
			case "521":
				$viewport.addClass("rain-med");
				break;
			case "300":
			case "301":
			case "310":
			case "500":
			case "520":
				$viewport.addClass("rain-light");
				break;

			default:
				$viewport.addClass("clouds-overcast");
		}
	};
	
	var isOldBrowser = function () {
		if ($(".no-cssanimations").length > 0) {
			return true;
		}
		return false;
	};

	return {
		init: init,
		addBackgroundClass: addBackgroundClass,
		changeWeatherTo: changeWeatherTo,
		baseImagePath: baseImagePath
	};
}();
