(function ($) {

	var map = {
		cg: { wt: 'WT.cg_n' },
		csg: { wt: 'WT.cg_s' },
		cn: { wt: 'WT.cn' },
		ct: { wt: 'WT.ct' },
		en: { wt: 'WT.en' },
		et: { wt: 'WT.et' },
		oss: { wt: 'WT.oss' },
		ossr: { wt: 'WT.oss_r' },
		rn: { wt: 'WT.rn' }
	};

	var WT_SESSION_META_NAME = 'DCSext.vs';
	var WEP_META_NAME = 'wep_analytics';
	var wtSessionValue;
	var scEndpoint;

	bindEvents();

	function bindEvents() {
		$('body').on('click', onClick);
		$.subscribe('xom.analytics', onAnalyticsEvent);
	}

	function onClick(e) {
		var target = $(e.target);
		var tags = getAllTags(target);
		if (!tags || !Object.keys(tags).length || tags.manual) return;
		fireTrackingCall(tags);
	}

	function onAnalyticsEvent(e, tags) {
		fireTrackingCall(tags);
	}

	function fireTrackingCall(tags) {
		var transformed = transformData(tags, 'wt');
		webTrends(transformed);
		var scQuery = getSitecoreQuery(tags);
		if (scQuery) {
			sitecore(scQuery);
		}
	}

	function getAllTags(element) {
		var analyticsData = getAnalyticsData(element);
		var mappedData = getWepData(element);
		return $.extend({}, mappedData, analyticsData);
	}

	function getAnalyticsData(element) {
		return element.data('analytics') || element.closest('[data-analytics]').data('analytics');
	}

	function getWepData(element) {
		if (typeof wepAnalytics === 'undefined' || !wepAnalytics) return null;
		var link = element.is('[href]') ? element : element.closest('[href]');
		var url = removeProtocol(link.attr('href'));
		var wep = wepAnalytics['http:' + url] || wepAnalytics['https:' + url];
		if (!wep) return null;
		var index = $('[href$="' + url + '"]').index(link);
		if (index > wep.length - 1) return null;
		return wep[index];
	}

	function transformData(tags, provider) {
		var transformed = {};
		for (var k in tags) {
			var mapEntry = map[k];
			if (mapEntry === undefined || mapEntry[provider] === undefined) continue;
			transformed[mapEntry[provider]] = tags[k];
		}
		return transformed;
	}

	function getWebTrendsSessionId() {
		wtSessionValue = wtSessionValue || getMetaTagValue(WT_SESSION_META_NAME);
		return wtSessionValue;
	}

	function getSitecoreEndpoint() {
		scEndpoint = scEndpoint || getMetaTagValue(WEP_META_NAME);
		return scEndpoint;
	}

	function getMetaTagValue(name) {
		return $('meta[name="' + name + '"]').attr('content');
	}

	function getSitecoreQuery(tags) {
		var ary = [];
		for (var k in tags) {
			if (k.length < 3 || k.substring(0, 3) !== 'sc_' || tags[k] === null) continue;
			ary.push(k + '=' + tags[k]);
		}
		return ary.join('&');
	}

	function webTrends(tags) {
		if (typeof dcsMultiTrack != 'function') return;
		tags[WT_SESSION_META_NAME] = getWebTrendsSessionId();
		var params = objectToArray(tags);
		dcsMultiTrack.apply(this, params);
	}

	function sitecore(query) {
		$.get(getSitecoreEndpoint() + '?' + query);
	}

	function objectToArray(obj) {
		var ary = [];
		for (var k in obj) {
			ary.push(k);
			ary.push(obj[k]);
		}
		return ary;
	}

	function removeProtocol(url) {
		if (!url) return '';
		return url.replace(/.*?:\/\//g, '//');
	}

}(window.jQuery));