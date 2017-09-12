(function ($) {

	jQuery.easing.fastToSlow = function (x) {
		var t = -2.9 * Math.pow(x, 4) + 7.1 * Math.pow(x, 3) - 6.6 * Math.pow(x, 2) + 3.34 * x;
		var y = 0.9 * 3 * Math.pow(1 - t, 2) * t + 1.0 * 3 * (1 - t) * Math.pow(t, 2) + Math.pow(t, 3);
		return y;
	};

	$('body').on('click', '.ks-nav a', function (e) {
		e.preventDefault();
		var hash = $(this).attr('href');
		scrollTo(hash);
		updateHash(hash);
	});

	$(window).on('hashchange', function () {
		scrollTo(window.location.hash);
	});

	$(function () {
		applyTestUx();
		setBreadcrumbBorder();
	});



	function getScrollTop(hash) {
		if (!hash || hash.indexOf('=') > -1) return;
		var $hash = $(hash);
		if (!$hash.length) return;
		return $hash.offset().top - $('.navbar').outerHeight() - 20;
	}

	function scrollTo(hash) {
		var newScrollTop = getScrollTop(hash),
			delta = Math.abs($('body').scrollTop() - newScrollTop),
			duration = delta < 1000 ? 400 : 1000;
		$('body').animate({ scrollTop: newScrollTop }, duration, 'fastToSlow');
	}

	function updateHash(hash) {
		if (history.pushState) {
			history.pushState(null, null, hash);
		} else {
			location.hash = hash;
		}
	}

	function stringToObject(s) {
		var dict = {};
		s.replace(
			/([^?=&]+)(=([^&]*))?/g,
            function ($0, $1, $2, $3) { dict[$1] = $3; }
        );
		return dict;
	}

	function applyTestUx() {
		var qs = stringToObject(window.location.search);
		switch (qs.nav) {
			case 'global-selector-collapsed':
				$('.nav-global-selector').trigger('click');
				break;
			case 'global-selector-expanded':
				$('<a class="nav-global-selector" href="#exxon"/>').appendTo('body').trigger('click');
				$('.gs-country-title').trigger('click');
				break;
			case 'meganav-open':
				$('.nav-main-item[rel=energy]').trigger('click');
				break;
		
			case 'search-open':
				$('.nav-main-search-trigger').trigger('click');
				break;
		}
	}

}(window.jQuery));