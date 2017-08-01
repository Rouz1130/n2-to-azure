(function ($) {

	$.fn.extend({
		urlUtil: {
			queryToObject: queryToObject,
			objectToQuery: objectToQuery,
			mergeQuery: mergeQuery,
			parse: parse
		}
	});

	function queryToObject(query) {
		var dict = {};
		query.replace(/([^?=&]+)(=([^&]*))?/g, function ($0, $1, $2, $3) { dict[$1] = $3; });
		return dict;
	}

	function objectToQuery(obj) {
		var str = [];
		for (var p in obj) {
			if (obj.hasOwnProperty(p) && obj[p] !== null && obj[p] !== '') {
				str.push(p + '=' + obj[p]);
			}
		}
		return str.join('&');
	}

	function mergeQuery(url, objToMerge) {
		var parsed = parse(url || '');
		var urlData = queryToObject(parsed.search);
		var newData = $.extend(urlData, objToMerge);
		return parsed.protocol + '//' + parsed.hostname + parsed.pathname + '?' + objectToQuery(newData) + parsed.hash;
	}

	function parse(url) {
		var link = document.createElement('a');
		link.href = url;
		return {
			protocol: link.protocol,
			host: link.host,
			hostname: link.hostname,
			port: link.port,
			pathname: ensureLeadingSlash(link.pathname),
			search: link.search,
			searchObject: queryToObject(link.search),
			hash: link.hash
		};
	}

	function ensureLeadingSlash(path) {
		return (path.length && path[0] != '/' ? '/' : '') + path;
	}

}(window.jQuery));