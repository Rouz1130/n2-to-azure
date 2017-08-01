(function ($) {

	var COUNTRY_SETTING_KEY = 'country';

	var typeaheadDefaults = {
		highlight: true,
		minLength: 3
	};

	var userHasChangedCountry = false;

	$(function () {
		renderAllRecentSearches();
		loadSearchSettings();
		bindCoveoTypeahead();
		bindSearchBox();
		bindSearchSettingModals();
	});

	function renderAllRecentSearches() {
		$('.search-box').each(function () {
			renderRecentSearches($(this));
		});
	}

	function bindCoveoTypeahead() {
		$('.typeahead').each(function () {
			var $this = $(this);
			var options = $.extend({}, typeaheadDefaults, $this.data('options'));
			var bloodhound = createCoveoBloodhound($this.data('url'), $this.data('wildcard') || '%QUERY');
			bloodhound.initialize();
			$this.typeahead(options, {
				displayKey: 'title',
				source: bloodhound.ttAdapter()
			});
		});
	}

	function bindSearchBox() {
		var INPUT_SELECTOR = '.search-box input[type="text"]';
		$('body')
			.on('focus', INPUT_SELECTOR, function () {
				onSearchInputFocus($(this));
			})
			.on('keydown', INPUT_SELECTOR, function (e) {
				if (e.keyCode != 13) return;
				e.preventDefault();
				onSearchTriggered($(this));
			})
			.on('click', '.search-box button.search', function () {
				onSearchTriggered($(this));
			});
		$.subscribe('xom.geolocation', onGeolocation);
	}

	function bindSearchSettingModals() {
		$('body')
			.on('show.bs.modal', '.modal[data-search-key]', function (e) {
				var modal = $(e.target);
				onSearchSettingModalOpened(modal);
			})
			.on('click', '.modal[data-search-key]', function (e) {
				var target = $(e.target);
				var modal = target.closest('.modal');
				if (target.is('label')) {
					onSearchSettingClicked(modal);
				} else if (target.is('.btn-primary')) {
					onSearchSettingChanged(modal);
				}
			});
	}

	function createCoveoBloodhound(url, wildcard) {
		return new Bloodhound({
			datumTokenizer: function (datum) {
				return Bloodhound.tokenizers.whitespace(datum.title);
			},
			queryTokenizer: Bloodhound.tokenizers.whitespace,
			remote: {
				url: url,
				wildcard: wildcard,
				filter: function (response) {
					return response.results.map(function (r) {
						return {
							title: r.title,
							url: r.clickUri
						};
					});
				}
			}
		});
	}

	function loadSearchSettings() {
		$('.search-box-with-settings').each(function () {
			var $this = $(this);
			var data = $this.data() || {};
			if (!data.settingsCookie) return;
			var settings = getSearchSettingsFromCookie(data.settingsCookie);
			for (var k in settings) {
				setSearchSetting(k, settings[k].value, settings[k].text);
				if (k === COUNTRY_SETTING_KEY) $this.data('countryLoaded', true);
			}
		});
	}

	function onSearchInputFocus(input) {
		var data = input.data('analytics');
		if (!data) return;
		$.publish('xom.analytics', data);
	}

	function onSearchTriggered(trigger) {
		var searchBox = getSearchBoxElement(trigger);
		var phrase = searchBox.find('input[type="text"]').not('.tt-hint').val();
		if (!phrase) return;

		var data = searchBox.data() || {};

		var query = {};
		query[data.searchKey || 'q'] = phrase;
		var settings = getSearchSettings(searchBox);
		for (var k in settings) {
			query[k] = settings[k].value;
		}

		var analytics = trigger.data('analytics');
		if (analytics) {
			var defaultAnalytics = {
				cg: 'Search',
				csg: 'Search',
				ct: 'Button',
				oss: phrase
			};
			$.publish('xom.analytics', $.extend({}, defaultAnalytics, analytics));
		}

		if (data.eventName) {
			$.publish(data.eventName, query);
		}

		if (data.cookieName) {
			var cookieUrl = $.fn.urlUtil.mergeQuery(data.url || window.location.href, query);
			$.fn.siteSearch.add(data.cookieName, phrase, cookieUrl);
		}

		if (data.url) {
			// A slight pause gives analytics time to fire
			setTimeout(function () {
				window.location = $.fn.urlUtil.mergeQuery(data.url, query);
			}, 200);
		} else if (data.cookieName) {
			renderRecentSearches(searchBox);
		}
	}

	function onSearchSettingModalOpened(modal) {
		var searchKey = modal.data('searchKey');
		var trigger = $('.search-box-setting[data-key="' + searchKey + '"]');
		var values = trigger.data('value').split(',');
		modal.find('input').each(function () {
			var input = $(this);
			var selected = values.indexOf(input.val()) !== -1;
			input.prop('checked', selected);
		});
	}

	function onSearchSettingClicked(modal) {
		setTimeout(function () {
			var button = modal.find('.btn-primary');
			var noSelections = (modal.find('input:checked').length === 0);
			button.prop('disabled', noSelections);
		}, 50);
	}

	function onSearchSettingChanged(modal) {
		var selections = modal.find('input:checked');
		if (selections.length === 0) return;
		var selectionText = joinElements(selections, function (e) { return $(e).next('label').text(); }, ', ');
		var selectionValue = joinElements(selections, function (e) { return $(e).val(); }, ',');
		var trigger = getSearchSettingsTrigger(modal);
		var setting = trigger.siblings('.search-box-setting');
		var key = setting.data('key');
		setSearchSetting(key, selectionValue, selectionText);

		var searchBox = trigger.closest('.search-box');
		var data = searchBox.data() || {};
		if (data.settingsCookie) {
			var settings = getSearchSettings(searchBox);
			saveSearchSettingsToCookie(data.settingsCookie, settings);
		}

		if (key === COUNTRY_SETTING_KEY) userHasChangedCountry = true;
	}

	function setSearchSetting(key, value, text) {
		var setting = $('.search-box-setting[data-key="' + key + '"]');
		setting.data('value', value);
		setting.text(text);
	}

	function getSearchSettingsFromCookie(cookieName) {
		$.cookie.json = true;
		return $.cookie(cookieName) || {};
	}

	function saveSearchSettingsToCookie(cookieName, settings) {
		$.cookie.json = true;
		$.cookie(cookieName, settings, { path: '/' });
	}

	function getSearchSettingsTrigger(modal) {
		return $('.search-box-settings [data-target="#' + modal.attr('id') + '"]');
	}

	function onGeolocation(e, args) {
		if (userHasChangedCountry || !args.countryRegion) return;

		// hack: Using the :contains() selector was causing an internal jQuery exception, so this is a workaround
		$('.modal[data-search-key="' + COUNTRY_SETTING_KEY + '"] .form-group label').each(function () {
			var label = $(this);
			var text = label.text();
			if (text !== args.countryRegion) return true;

			var modal = label.closest('.modal');
			var trigger = getSearchSettingsTrigger(modal);
			var searchBox = trigger.closest('.search-box');
			if (searchBox.data('countryLoaded')) return false;

			var value = label.siblings('input').val();
			setSearchSetting(COUNTRY_SETTING_KEY, value, text);
			return false;
		});
	}

	function getSearchBoxElement(el) {
		return el.is('.search-box') ? el : el.closest('.search-box');
	}

	function getSearchSettings(searchBox) {
		var elements = searchBox.find('.search-box-setting');
		if (elements.length === 0) return {};
		var settings = {};
		elements.each(function () {
			var setting = $(this);
			settings[setting.data('key')] = { value: setting.data('value'), text: setting.text() };
		});
		return settings;
	}

	function renderRecentSearches(searchBox) {
		var container = searchBox.find('.recent-searches');
		if (container.length === 0) {
			return;
		}

		var cookieName = searchBox.data('cookieName');
		if (!cookieName) {
			container.hide();
			return;
		}

		var searches = $.fn.siteSearch.get(cookieName);
		if (searches.length === 0) {
			container.hide();
			return;

		}

		var links = [];
		for (var i = 0; i < searches.length; i++) {
			links.push('<a target="_self" href="' + searches[i].Value + '">' + searches[i].Key + '</a>');
		}
		container.find('.recent-searches-links').html(links.join(', '));
		container.show();
	}

	function joinElements(elements, mapFn, separator) {
		var strings = [];
		elements.each(function (i, e) { strings.push(mapFn(e)); });
		return strings.join(separator);
	}

}(window.jQuery));