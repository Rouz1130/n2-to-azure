(function ($) {

	var defaults = {
		days: 30,
		maxResults: 5,
		path: '/'
	};

	$.fn.extend({
		siteSearch: {
			get: get,
			add: add
		}
	});

	function get(cookieName) {
		try {
			$.cookie.json = true;
			var obj = $.cookie(cookieName || 'EXXON_GLOBAL_COOKIE');
			return $.isArray(obj) ? obj : [];
		} catch (e) {
			return [];
		}
	}

	function add(cookieName, key, url, options) {
		var opts = $.extend({}, defaults, options);
		var searches = get(cookieName);
		var index = getSearchIndex(searches, key);
		if (index > -1) {
			searches.splice(index, 1);
		}
		searches.splice(0, 0, { Key: key, Value: url });
		while (searches.length > opts.maxResults) {
			searches.pop();
		}
		$.cookie.json = true;
		$.cookie(cookieName, searches, { expires: opts.days, path: opts.path });
		return searches;
	}

	function getSearchIndex(searches, key) {
		var lowerKey = key.toLowerCase();
		for (var i = 0; i < searches.length; i++) {
			if (searches[i].Key.toLowerCase() === lowerKey) {
				return i;
			}
		}
		return -1;
	}

}(window.jQuery));