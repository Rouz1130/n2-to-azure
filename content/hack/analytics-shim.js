// Temporary shim to support analytics gaps

(function ($) {

	var clickMap = [{
		page: '/en/plenti',
		elements: [{
			selector: '.btn-primary:contains("Join now")',
			data: ['WT.cg_n', 'Plenti Program', 'WT.cg_s', 'Join now', 'WT.ct', 'Link', 'WT.et', 'Click']
		}]
	}, {
		page: '/en/return-and-earn',
		elements: [{
			selector: 'a:contains("Search for participating locations")',
			data: ['WT.cg_n', 'return and earn', 'WT.cg_s', 'Search for participating locations >', 'WT.ct', 'Link', 'WT.et', 'Click']
		}, {
			selector: 'a:contains("Register your return and earn card")',
			data: ['WT.cg_n', 'return and earn', 'WT.cg_s', 'Register your return and earn card >', 'WT.ct', 'Link', 'WT.et', 'Click']
		}, {
			selector: 'a:contains("Log in to your account")',
			data: ['WT.cg_n', 'return and earn', 'WT.cg_s', 'Log in to your account >', 'WT.ct', 'Link', 'WT.et', 'Click']
		}]
	}];

	$(init);

	function init() {
		$('body')
			.on('click', '.surfaced-item-copy p a', surfacedItemTracking)
			.on('click', clickMapTracking);
	}

	function surfacedItemTracking(e) {
		var target = $(e.currentTarget);
		var headline = $.trim(target.closest('.surfaced-item-copy').find('h3').text());
		var linkText = $.trim(target.text());
		var list = target.closest('.component.list');
		var data = ['WT.ct', 'Link', 'WT.et', 'Click', 'WT.cg_n', headline, 'WT.cg_s', linkText];
		if (list.length) {
			var linkNum = list.find('.surfaced-item-copy p a').index(target);
			data.push('WT.cn', 'L01:List', 'WT.en', 'Link ' + linkNum);
		} else {
			data.push('WT.cn', 'S01:SurfacedItem', 'WT.en', 'Link');
		}
		dcsMultiTrack.apply(this, data);
	}

	function clickMapTracking(e) {
		var target = $(e.target);
		for (var i = 0; i < clickMap.length; i++) {
			var map = clickMap[i];
			if (!isPage(map.page)) continue;
			for (var j = 0; j < map.elements.length; j++) {
				var element = map.elements[j];
				if (!target.is(element.selector)) continue;
				dcsMultiTrack.apply(this, element.data);
			}
		}
	}

	function isPage(url) {
		var formAction = $('form').attr('action').toLowerCase();
		return formAction.indexOf(url.toLowerCase()) === 0;
	}

}(window.jQuery));