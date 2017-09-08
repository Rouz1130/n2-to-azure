/*! 2017-09-08 12:06:08 */
(function ($) {

	var o = $({});

	$.subscribe = function () {
		o.on.apply(o, arguments);
	};

	$.unsubscribe = function () {
		o.off.apply(o, arguments);
	};

	$.publish = function () {
		o.trigger.apply(o, arguments);
	};

}(window.jQuery));;

(function ($) {

	var sizes = ['xs', 'sm', 'md', 'lg', 'xl'];

	$.subscribe('xom.breakpoints', onBreakpointsChanged);

	function onBreakpointsChanged() {
		var images = $('.breakpoints img[data-src]');
		images.each(function () { setImageSrc($(this)); });
	}

	function setImageSrc(img) {
		var parentSize = getBreakpointParent(img).data('breakpoint');
		var bestSrc = getBestImageSource(parentSize, img.data('src'));
		if (bestSrc === img.attr('src')) return;
		img.attr('src', bestSrc);
	}

	function getBreakpointParent(img) {
		var breakpointParent = img.data('breakpointParent');
		if (breakpointParent) return breakpointParent;
		breakpointParent = img.closest('.breakpoints');
		img.data('breakpointParent', breakpointParent);
		return breakpointParent;
	}

	function getBestImageSource(size, sources) {
		var idx = sizes.indexOf(size);
		for (var i = idx; i < sizes.length; i++) {
			if (sources[sizes[i]]) return sources[sizes[i]];
		}
		return null;
	}

}(window.jQuery));;

(function ($) {

	$.subscribe('xom.browsers-detected', addPngImages);

	function addPngImages() {
		if ($('html.ie8').length === 0) return;

		$('#footer-logos a[data-img]').each(function () {
			var link = $(this);
			var src = link.data('img');
			var img = $('<img/>');
			img.attr('src', src);
			link.append(img);
		});
	}

}(window.jQuery));;

(function ($) {

	initActivePanels();
	bindPanelEvents();

	function bindPanelEvents() {
		$('body')
			.on('show.bs.collapse', '.panel-group', function (e) {
				handlePanelClick(e.target, true);
			})
			.on('hide.bs.collapse', '.panel-group', function (e) {
				handlePanelClick(e.target, false);
			});
	}

	function handlePanelClick(target, active) {
		var panel = getPanel($(target));
		setPanelState(panel, active);
		if (active) {
			$.publish(getEventName(panel), getEventData(panel));
		}
	}

	function getPanel(child) {
		return child.closest('.panel');
	}

	function initActivePanels() {
		$('.panel-group .in').each(function () {
			setPanelState(getPanel($(this)), true);
		});
	}

	function setPanelState(panel, active) {
		panel[active ? 'addClass' : 'removeClass']('active');
	}

	function getEventName(panel) {
		return panel.data('eventName') || panel.closest('.panel-group').data('eventName') || 'accordion';
	}

	function getEventData(panel) {
		return panel.data('eventData') || panel.find('.panel-heading a:first').text();
	}

}(window.jQuery));;

// This solution "hijacks" input element containers and uses AJAX to submit the data instead of doing
// a full postback.  In the Sitecore development environment, this was causing a viewstate validation
// error that could not be reproduced outside of Sitecore.  So the following workaround was implemented:
// 
// 1) Set ASP.NET control ClientIDMode="static"
// 2) This script updates the "name" attribute of each input element to match its "id" attribute (add data-sync-name="false" to bypass this behavior)
// 3) The form handler checks for postback using Request.RequestType == "POST" and reads values as Request.Form[theControl.ClientID]

(function ($) {

	if (!$.fn.validate) {
		console.warn('jQuery Validation plugin not available');
		return;
	}

	bindEvents();

	function bindEvents() {
		$('body')
			.on('show.bs.modal', '.ajax-form', function (e) {
				captureInitialValues(e.target);
				resetForm(e.target);
			})
			.on('shown.bs.modal', '.ajax-form', function (e) {
				setFocusToFirstField(e.target);
			})
			.on('click', '.ajax-form button[type="submit"]', function (e) {
				e.preventDefault();
				var $form = $(e.target).closest('.ajax-form');
				onSubmitRequested($form);
			})
			.on('change', '.ajax-form .radio-buttons.required input[type="radio"]', function (e) {
				var $form = $(e.target).closest('.radio-buttons.required');
				validateRadioGroup($form);
			});
	}

	function captureInitialValues(target) {
		var $target = $(target);
		getFields(target).each(function () {
			var $this = $(this);
			if ($this.data('initialValue') !== undefined) return;
			$this.data('initialValue', $this.is('[type="radio"],[type="checkbox"]') ? $this.is(':checked') : $this.val());
		});
	}

	function restoreInitialValues(target) {
		var $target = $(target);
		getFields(target).each(function () {
			var $this = $(this);
			var initialValue = $this.data('initialValue');
			if (initialValue === null) return;
			if ($this.is('[type="radio"],[type="checkbox"]')) {
				$this.attr('checked', initialValue);
			} else {
				$this.val(initialValue);
			}
		});
	}

	function resetForm(target) {
		var $target = $(target);
		var fields = getFields(target);
		fields.each(setNameToId).removeClass('error').next('label.error').remove();
		$target.find('.form-submit,.form-cancel').removeClass('hidden');
		$target.find('.form-done').addClass('hidden');
		restoreInitialValues(target);
		show($(target), 'body');
	}

	function setNameToId() {
		var $el = $(this);
		var id = $el.attr('id');
		if (!id || $el.data('syncName') === false) return;
		$el.attr('name', id);
	}

	function setFocusToFirstField(target) {
		getFields(target).first().focus();
	}

	function onSubmitRequested($form) {
		var valid = getFields($form).valid();
		valid = validateRadios($form) && valid;
		if (valid) submitForm($form);
	}

	function submitForm($form) {
		var action = $form.attr('data-form-action');
		var serialized = $('form')
			.find('input,textarea,select,hidden')
			.not('#__VIEWSTATE,#__EVENTVALIDATION')
			.serialize();
		$.post(action, serialized)
			.done(function () { show($form, 'success'); })
			.fail(function () { show($form, 'failure'); })
			.always(function () {
				$form.find('.form-submit,.form-cancel').addClass('hidden');
				$form.find('.form-done').removeClass('hidden');
			});
	}

	function getFields(target) {
		return $(target).find('input,textarea,select');
	}

	function validateRadios($target) {
		var valid = true;
		$target.find('.radio-buttons.required').each(function () {
			if (!validateRadioGroup($(this))) value = false;
		});
		return valid;
	}

	function validateRadioGroup($group) {
		var radios = $group.find('input[type="radio"]');
		var message = $group.attr('data-required-message') || 'This field is required';
		var name = radios.first().attr('name');

		var hasValue = radios.is(':checked');
		if (hasValue) {
			radios.removeClass('error');
			clearRadioError($group);
			return true;
		}

		radios.addClass('error');
		showRadioError($group, name, message);
		return false;
	}

	function showRadioError($group, name, message) {
		var parent = $group.closest('.radio-buttons');
		var err = parent.find('label.error');
		if (err.length > 0) {
			err.show();
		} else {
			parent.append('<label class="error" for="' + name + '">' + message + '</label>');
		}
	}

	function clearRadioError($group) {
		$group.closest('.radio-buttons').find('label.error').remove();
	}

	function show($container, partial) {
		var partials = ['body', 'success', 'failure'];
		for (var i = 0; i < partials.length; i++) {
			var on = (partial == partials[i]);
			$container.find('.form-' + partials[i])[on ? 'removeClass' : 'addClass']('hidden');
		}
	}

}(window.jQuery));;

(function ($) {

	var COOKIE_DAYS = 30;
	var COOKIE_PATH = '/';

	bindLanguageSelector();

	function bindLanguageSelector() {
		$('body')
			.on('show.bs.modal', '.modal-change-language', function (e) {
				var modal = $(e.target);
				onLanguageSelectorOpened(modal);
			})
			.on('click', '.modal-change-language .btn-primary', function () {
				var modal = $(this).closest('.modal-change-language');
				onLanguageSelected(modal);
			});
	}

	function onLanguageSelectorOpened(modal) {
		var cookieName = modal.data('cookieName');
		if (!cookieName) return;

		$.cookie.json = false;
		var language = $.cookie(cookieName);
		modal.find('input').each(function () {
			var input = $(this);
			var selected = input.val() == language;
			input.prop('checked', selected);
		});
	}

	function onLanguageSelected(modal) {
		var cookieName = modal.data('cookieName');
		var queryParam = modal.data('queryParam');
		var language = modal.find('input:checked').val();
		if (!language) return;

		if (cookieName) {
			$.cookie.json = false;
			$.cookie(cookieName, language, { expires: COOKIE_DAYS, path: COOKIE_PATH });
		}

		if (queryParam) {
			var query = {};
			query[queryParam] = language;
			var url = $.fn.urlUtil.mergeQuery(window.location.href, query);
			window.location = url;
		} else {
			window.location.reload(true);
		}
	}

}(window.jQuery));;

(function ($) {

	$(function () {
		initCarousels();
		disableAutoTagging();
		bindEvents();
	});

	function initCarousels() {
		if (!$.fn.slick) return;

		$('.carousel').each(function () {
			var self = $(this);
			var useThumbs = self.hasClass('carousel-thumb');
			var defaults = {
				dots: false,
				customPaging: function (slider, i) {
					var pager = '<a href="javascript:;" class="pager">';
					if (useThumbs) {
						var json = $(slider.$slides[i]).find('script').text();
						var data = $.parseJSON(json);
						pager += '<img src="' + data.image + '"><p>' + data.caption + '</p>';
					} else {
						pager += '';
					}
					return pager + '</a>';
				}
			};
			var custom = self.data('options');
			var options = $.extend(defaults, custom);

			self.slick(options);
		});
	}

	function disableAutoTagging() {
		$('.carousel .pager, .carousel .slick-prev, .carousel .slick-next').data('analytics', { manual: true });
	}

	function bindEvents() {
		$('body')
			.on('click', '.slick-prev,.slick-next', function () {
				onArrowClick($(this));
			})
			.on('click', '.slick-dots .pager', function () {
				onPagerClick($(this));
			});
	}

	function onArrowClick(arrow) {
		var carousel = arrow.closest('.carousel');
		var isPrevious = arrow.hasClass('slick-prev');
		var data = $.extend({}, carousel.data('analytics'), {
			et: 'Navigate',
			en: isPrevious ? 'Left' : 'Right',
			ct: isPrevious ? '<' : '>'
		});
		$.publish('xom.analytics', data);
	}

	function onPagerClick(pager) {
		var carousel = pager.closest('.carousel');
		var position = pager.parent().index() + 1;
		var data = $.extend({}, carousel.data('analytics'), {
			et: 'Click',
			en: 'Thumbnail' + position,
			ct: 'Thumbnail'
		});
		$.publish('xom.analytics', data);
	}

}(window.jQuery));;

(function ($) {
	$(function () {
		$('form[auto-validate="true"]').validate();
		bindEvents();
	});

	function bindEvents() {
		$('body').on('focus blur', 'input, select, textarea', onFieldInteraction);
	}

	function onFieldInteraction(e) {
		var $field = $(this);
		var analytics = $field.data('analytics');
		if (!analytics) return;
		analytics.et = $field.val() ? '1' : '0';
		$.publish('xom.analytics', analytics);
	}

}(window.jQuery));;

(function ($) {

	var $lists = $('.component.list');
	var debouncedResize = debounce(adjustListItemHeights, 100);

	$(window)
		.load(adjustListItemHeights)
		.resize(debouncedResize);

	$(adjustListItemHeights);

	function adjustListItemHeights() {
		$lists.each(function () {
			var list = $(this);
			var columns = getColumnCount(list);
			setItemHeights(list, columns);
		});
	}

	function getColumnCount(list) {
		return Math.round(1 / (list.children('li:first').outerWidth() / list.outerWidth()), 0);
	}

	function setItemHeights(list, columns) {
		var items = list.children('li');
		clearHeight(items);
		if (columns === 1) return;
		var heights = getRowHeight(items, columns);
		setRowHeight(items, columns, heights);
	}

	function clearHeight(items) {
		items.css('height', 'auto');
	}

	function getRowHeight(items, columns) {
		var heights = [];
		items.each(function (i) {
			if (i % columns === 0) heights.push(0);
			heights[heights.length - 1] = Math.max(heights[heights.length - 1], getItemHeight($(this)));
		});
		return heights;
	}

	function setRowHeight(items, columns, heights) {
		for (var h = 0; h < heights.length; h++) {
			for (var c = 0; c < columns; c++) {
				items.eq((h * columns) + c).css('height', heights[h]);
			}
		}
	}

	function getItemHeight(li) {
		li.css('height', 'auto');
		return parseInt(li.css('height'));
	}

	function debounce(func, threshold, execAsap) {
		var timeout;

		return function () {
			var obj = this, args = arguments;
			function delayed() {
				if (!execAsap) func.apply(obj, args);
				timeout = null;
			}

			if (timeout) {
				clearTimeout(timeout);
			} else if (execAsap) {
				func.apply(obj, args);
			}

			timeout = setTimeout(delayed, threshold || 100);
		};
	}

}(window.jQuery));;

(function ($) {

	$('body')
		.on('show.bs.modal', '.modal-iframe', onModalShow)
		.on('hide.bs.modal', onModalHide);

	function onModalShow(e) {
		var modal = $(e.target);
		var src = modal.data('iframeSrc');
		var iframe = modal.find('iframe');
		if (!iframe.length || !src) return;
		iframe.attr('src', src);
	}

	function onModalHide(e) {
		var modal = $(e.target);
		var analytics = modal.data('analytics');
		if (!analytics) return;
		analytics.csg = 'Cancel';
		$.publish('xom.analytics', analytics);
	}

}(window.jQuery));;

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

}(window.jQuery));;

(function ($) {

	var element;

	$(function () {
		bindEvents();
	});

	function bindEvents() {
		element = $('#wait-message');
		element.css('margin-left', -element.width() / 2);

		$.subscribe('xom.loading', function (e, a) {
			element.toggleClass('active', !!a);
		});
	}

}(window.jQuery));;

(function ($) {

	var FILTERED = 'gs-filtered';

	bindEvents();

	function bindEvents() {
		$('body')
			.on('click', '[data-global-selector]', onOpenTriggerClick)
			.on('click', '#gs-mobile-filter-trigger', onMobileFilterClick)
			.on('click', '#gs-mobile-filter-options > li > a, #gs-sidebar-items a', onRegionClick)
			.on('input', '#gs-search-input', onSearchChanged)
			.on('click', '.gs-country-title', onCountryClick)
			.on('click', '#gs-close-wrapper', onCloseClick);
	}

	function onOpenTriggerClick(e) {
		e.preventDefault();
		var region = $(this).data('globalSelector');
		if (region) {
			setActiveRegion(region);
		}
		setGlobalSelectorVisibility(true);
	}

	function onMobileFilterClick() {
		$('#gs-mobile-filter').toggleClass('gs-mobile-filter-open');
	}

	function onRegionClick(e) {
		e.preventDefault();
		setActiveRegion($(this).attr('rel'));
	}

	function onSearchChanged(e) {
		var phrase = $(e.target).val();
		applyCountryFilter(phrase);
	}

	function onCountryClick(e) {
		$(this).parent().toggleClass('gs-country-open');
	}

	function onCloseClick() {
		setGlobalSelectorVisibility(false);
	}

	function setActiveRegion(key) {
		var region = $('#gs-sidebar-items a[rel=' + key + ']'),
			name = region.text(),
			wrapper = $('#' + key);
		if (!region.length) return;
		setActiveRegionWrapper(wrapper);
		setMobileFilterText(name);
		closeMobileFilter();
		setSidebarSelection(key);
		setSearchPlaceholder(name);
	}

	function applyCountryFilter(s) {
		if (!s) {
			clearCountryFilter();
			return;
		}

		s = s.toLowerCase();
		$('.gs-region').each(function () {
			filterRegion($(this), s);
		});
	}

	function filterRegion(region, s) {
		var numFound = 0;
		region.find('.gs-country').each(function () {
			var country = $(this),
				name = country.find('.gs-country-title').text(),
				filtered = name.toLowerCase().indexOf(s) === -1;
			filter(country, filtered);
			if (!filtered) {
				numFound++;
			}
		});

		filter(region, numFound === 0);
	}

	function clearCountryFilter() {
		filter($('.gs-region'), false);
		filter($('.gs-country'), false);
	}

	function setActiveRegionWrapper(region) {
		region.addClass('gs-region-wrapper-active').siblings().removeClass('gs-region-wrapper-active');
		$('#gs-content-wrapper').scrollTop(0);
	}

	function setSidebarSelection(regionName) {
		$('#gs-sidebar-items a[rel=' + regionName + ']').parent().addClass('gs-sidebar-item-active').siblings().removeClass('gs-sidebar-item-active');
	}

	function setSearchPlaceholder(regionName) {
		var search = $('#gs-search-input');
		search.attr('placeholder', search.data('placeholderInit') + ' ' + regionName);
	}

	function closeMobileFilter() {
		$('#gs-mobile-filter').removeClass('gs-mobile-filter-open');
	}

	function setMobileFilterText(text) {
		$('#gs-mobile-filter-trigger').text(text);
	}

	function setGlobalSelectorVisibility(on) {
		var method = on ? 'addClass' : 'removeClass';
		$('html')[method]('nav-global-selector-open');
		$('#global-selector')[method]('gs-open');
		if (on) {
			$('body').scrollTop(0);
		}
	}

	function filter(elements, filtered) {
		elements[filtered ? 'addClass' : 'removeClass'](FILTERED);
	}

}(window.jQuery));;

(function ($) {

	bindEvents();

	function bindEvents() {
		$('body').on('click', onClickAnywhere);
	}

	function onClickAnywhere(e) {
		var $this = $(e.target);
		if ($this.is('.nav-language-current')) return;
		$('.nav-language').removeClass('nav-language-open');
	}

}(window.jQuery));;

(function ($) {

	var BUFFER = 2; // spacing between logo and main nav to ensure there's no wrapping in edge cases
	var $navMainBar;
	var $navMainList;

	captureElements();
	bindEvents();
	adjustMainMenu();

	function captureElements() {
		$navMainBar = $('.nav-main-bar');
		$navMainList = $('.nav-main-list');
	}

	function bindEvents() {
		$(document).on('ready', adjustMainMenu);
		$(window).off('resize', adjustMainMenu);
		$(window).on('load resize', adjustMainMenu);
	}

	function adjustMainMenu() {
		if (!$navMainBar.is(':visible')) return;
		applyWidth(true);
		var availableWidth = getAvailableWidth() - BUFFER;
		var requiredWidth = $navMainList.outerWidth(true);
		var hasEnoughSpace = availableWidth >= requiredWidth;
		applyWidth(hasEnoughSpace, availableWidth);
	}

	function getAvailableWidth() {
		var consumedWidth = 0;
		$navMainBar.children(':visible').not($navMainList).each(function () {
			consumedWidth += $(this).outerWidth(true);
		});
		return $navMainBar.width() - consumedWidth;
	}

	function applyWidth(hasEnoughSpace, width) {
		$navMainList.toggleClass('nav-main-list-condensed', !hasEnoughSpace);
		$navMainList.css('max-width', hasEnoughSpace ? '' : width);
	}

}(window.jQuery));;

(function ($) {

	var NAV_ITEM_ACTIVE = 'nav-main-item-active';
	var NAV_MEGANAV = 'nav-meganav';
	var NAV_MEGANAV_OPEN = 'nav-meganav-open';
	var NAV_MEGANAV_ACTIVE = 'nav-meganav-active';
	var NAV_SEARCH_OPEN = 'nav-search-open';
	var NAV_ITEM_SEARCH_TRIGGER = 'nav-main-search-trigger';

	bindEvents();

	function bindEvents() {
		$('body')
			.on('click', '.nav-main-item', onMainItemClick)
			.on('click', '.nav-meganav-close', closeAll)
			.on('click', onClickAnywhere);
	}

	function onMainItemClick(e) {
		var item = $(this);
		var link = item.is('a') ? item : item.children('a');
		if (link.attr('href') != '#') return;

		var isActive = item.hasClass(NAV_ITEM_ACTIVE);
		var isSearch = item.hasClass(NAV_ITEM_SEARCH_TRIGGER);
		e.preventDefault();

		closeAll();
		if (isActive) return;

		if (isSearch) {
			openSearch(item);
		} else {
			openMegaNav(item);
		}
	}

	function onClickAnywhere(e) {
		var $this = $(e.target);
		if (!isPartOfMegaNav($this)) {
			closeAll();
		}
	}

	function isPartOfMegaNav(element) {
		var megaNav = thisOrClosest(element, 'nav-meganav');
		var navItem = thisOrClosest(element, 'nav-main-item');
		var search = thisOrClosest(element, 'nav-main-search');
		return (search.length || megaNav.length || navItem.length);
	}

	function openSearch(item) {
		item.addClass(NAV_ITEM_ACTIVE);
		$('html').addClass(NAV_MEGANAV_OPEN).addClass(NAV_SEARCH_OPEN);
		$('.nav-main-search input').focus();
	}

	function openMegaNav(item) {
		var megaNav = $('#' + item.attr('rel'));
		item.addClass(NAV_ITEM_ACTIVE);
		megaNav.addClass(NAV_MEGANAV_ACTIVE);
		$('html').addClass(NAV_MEGANAV_OPEN);
	}

	function closeAll() {
		deactivate(NAV_ITEM_ACTIVE);
		deactivate(NAV_MEGANAV_ACTIVE);
		deactivate(NAV_MEGANAV_OPEN);
		deactivate(NAV_SEARCH_OPEN);
	}

	function deactivate(className) {
		$('.' + className).removeClass(className);
	}

	function thisOrClosest(element, className) {
		return element.hasClass(className) ? element : element.closest('.' + className);
	}

}(window.jQuery));;

(function ($) {

	var SPEED = 350, // this should match the CSS transition time
		PANEL = 'nav-main-mobile-panel',
		PANEL_ACTIVE = 'nav-main-mobile-panel-active',
		PANEL_PARENT = 'nav-main-mobile-panel-parent',
		PANEL_HIGHEST = 'nav-main-mobile-panel-highest';

	bindEvents();

	function bindEvents() {
		$('body')
			.on('click', '.nav-main-list-trigger', toggleMobileMenu)
			.on('click', '.' + PANEL + ' > li > a', onMenuItemClick);
	}

	function toggleMobileMenu() {
		var $html = $('html');
		$html.toggleClass('nav-main-mobile-open');
		$html.removeClass('nav-meganav-open');
		setTransitionClass($html, 'nav-main-mobile-transition');
	}

	function onMenuItemClick(e) {
		var $link = $(this),
			target = $link.attr('href'),
			isMenuNav = (target[0] === '#');

		if (!isMenuNav) return;

		e.preventDefault();

		if (target === '#') {
			toggleMobileMenu();
			return;
		}

		var $thisPanel = $link.closest('.' + PANEL),
			$targetPanel = $(target),
			isBackNav = ($link.parent().index() === 0);

		setActivePanel($targetPanel);
		setTransitionClass(isBackNav ? $thisPanel : $targetPanel, PANEL_HIGHEST);
	}

	function setTransitionClass(element, className) {
		element.addClass(className);
		transitionDelay(function () {
			element.removeClass(className);
		});
	}

	function transitionDelay(fn) {
		setTimeout(fn, SPEED);
	}

	function setActivePanel(panel) {
		$('.' + PANEL_ACTIVE).removeClass(PANEL_ACTIVE);
		$('.' + PANEL_PARENT).removeClass(PANEL_PARENT);
		panel.addClass(PANEL_ACTIVE);
		findParentPanel(panel).addClass(PANEL_PARENT);
	}

	function findParentPanel(childPanel) {
		var firstLink = childPanel.find('li:first-child > a'),
			parentSelector = firstLink.attr('href');
		return $(parentSelector);
	}

}(window.jQuery));;

(function ($) {

	$('body').on('click', '.nav-social-trigger', toggleClass);

	function toggleClass() {
		$(this).closest('.nav-social').toggleClass('nav-social-on');
	}

}(window.jQuery));;

if (!Array.prototype.indexOf) {
	Array.prototype.indexOf = function (obj, start) {
		for (var i = (start || 0), j = this.length; i < j; i++) {
			if (this[i] === obj) { return i; }
		}
		return -1;
	};
}

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex#Polyfill
if (!Array.prototype.findIndex) {
	Array.prototype.findIndex = function (predicate) {
		if (this === null) {
			throw new TypeError('Array.prototype.findIndex called on null or undefined');
		}
		if (typeof predicate !== 'function') {
			throw new TypeError('predicate must be a function');
		}
		var list = Object(this);
		var length = list.length >>> 0;
		var thisArg = arguments[1];
		var value;

		for (var i = 0; i < length; i++) {
			value = list[i];
			if (predicate.call(thisArg, value, i, list)) {
				return i;
			}
		}
		return -1;
	};
};

// From https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys
if (!Object.keys) {
	Object.keys = (function () {
		'use strict';
		var hasOwnProperty = Object.prototype.hasOwnProperty,
			hasDontEnumBug = !({ toString: null }).propertyIsEnumerable('toString'),
			dontEnums = [
				'toString',
				'toLocaleString',
				'valueOf',
				'hasOwnProperty',
				'isPrototypeOf',
				'propertyIsEnumerable',
				'constructor'
			],
			dontEnumsLength = dontEnums.length;

		return function (obj) {
			if (typeof obj !== 'object' && (typeof obj !== 'function' || obj === null)) {
				throw new TypeError('Object.keys called on non-object');
			}

			var result = [], prop, i;

			for (prop in obj) {
				if (hasOwnProperty.call(obj, prop)) {
					result.push(prop);
				}
			}

			if (hasDontEnumBug) {
				for (i = 0; i < dontEnumsLength; i++) {
					if (hasOwnProperty.call(obj, dontEnums[i])) {
						result.push(dontEnums[i]);
					}
				}
			}
			return result;
		};
	}());
};

(function ($) {

	var attrName = 'data-no-svg';

	if (document.implementation.hasFeature('http://www.w3.org/TR/SVG11/feature#Image', '1.1')) return;

	applySvgFallback();

	function applySvgFallback() {
		$('img[' + attrName + ']').each(function () {
			var $img = $(this);
			var fallback = $img.attr(attrName);
			if (!fallback) return;
			$img.attr('src', fallback).removeAttr(attrName);
		});
	}

}(window.jQuery));;

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

}(window.jQuery));;

(function ($) {

	var prefix = 'bp-';

	// These are container minimum widths.  Do not confuse them with viewport breakpoints.
	var sizes = [
		{ name: 'xs', width: 0 },
		{ name: 'sm', width: 380 },
		{ name: 'md', width: 480 },
		{ name: 'lg', width: 720 },
		{ name: 'xl', width: 1024 }];

	function applySizeClass(element) {
		var size = calculateSize(element);
		element.removeClass(size.remove.join(' ')).addClass(size.add.join(' '));
		element.data('breakpoint', size.current);
		return size;
	}

	function calculateSize(element) {
		var width = parseInt(element.css('width'));
		var obj = { add: [], remove: [] };
		var maxSize = sizes[0].name;
		var i, size;

		// Calculate classes to add/remove and keep track of maximum breakpoint that's applicable
		for (i = 0; i < sizes.length; i++) {
			size = sizes[i];
			var within = (width >= size.width);
			obj[within ? 'add' : 'remove'].push(prefix + size.name);
			if (within) {
				maxSize = size.name;
			}
		}

		// Add the 'bp-max-XX' class to denote the current breakpoint
		for (i = 0; i < sizes.length; i++) {
			size = sizes[i];
			obj[size.name === maxSize ? 'add' : 'remove'].push(prefix + 'max-' + size.name);
		}

		obj.current = maxSize;

		return obj;
	}

	function onResize() {
		$('.breakpoints').each(function () {
			applySizeClass($(this));
		});
		$.publish('xom.breakpoints');
	}

	onResize();

	$(window).off('load resize', onResize);
	$(window).on('load resize', onResize);

}(window.jQuery));
;

(function ($) {

	var $html = $('html');

	addClass('MSIE', 'ie');
	addClass('MSIE 8', 'ie8');
	addClass('MSIE 9', 'ie9');
	addClass('MSIE 10', 'ie10');
	addClass('Mac OS X', 'mac');

	if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
		$html.addClass('ios');
	}

	if (/Android/.test(navigator.userAgent) && !window.MSStream) {
		$html.addClass('android');
	}

	$.publish('xom.browsers-detected');

	function addClass(browserId, className) {
		if (navigator.appVersion.indexOf(browserId) === -1) return;
		$html.addClass(className);
	}

}(window.jQuery));;

(function ($) {

	$('body').on('click', '.class-toggle', toggleClass);

	function toggleClass(e) {
		var self = $(this);
		var target = self.data('target') || self;
		var className = self.data('className');
		e.preventDefault();
		$(target).toggleClass(className);
	}

}(window.jQuery));;

(function ($, undefined) {

	var cookieName = 'EXXON_GEOLOCATION'; // should read from meta tag

	$(init);

	function init() {
		var location = getLocationCookie();
		if (location === undefined) {
			return;
		} else if (location === null) {
			getUserLocation();
		} else {
			notify(location);
		}
	}

	function getLocationCookie() {
		try {
			$.cookie.json = true;
			return $.cookie(cookieName);
		} catch (e) {
			return undefined;
		}
	}

	function setLocationCookie(data) {
		$.cookie.json = true;
		$.cookie(cookieName, data, { path: '/' });
	}

	function getUserLocation() {
		if (!window.navigator.geolocation) {
			console.warn('Geolocation not supported.');
			return;
		}
		window.navigator.geolocation.getCurrentPosition(onLocationFound, onLocationFailed, { timeout: 10000 });
	}

	function onLocationFound(position) {
		var key = $('meta[name=bingMapKey]').attr('content');
		if (!key) {
			console.warn('Cannot reverse geocode because Bing Map key is missing.');
			return;
		}

		var coords = position.coords;
		var settings = {
			data: {
				jsonp: 'GeocodeCallback',
				key: key
			},
			dataType: 'jsonp',
			jsonpCallback: 'GeocodeCallback',
			method: 'GET',
			url: 'https://dev.virtualearth.net/REST/v1/Locations/' + coords.latitude + ',' + coords.longitude
		};

		$.ajax(settings).done(function (data) {
			var location = {
				lat: coords.latitude,
				lng: coords.longitude
			};

			if (data.resourceSets.length > 0 && data.resourceSets[0].resources.length > 0) {
				var first = data.resourceSets[0].resources[0];
				location.name = first.name;
				location.countryRegion = first.address.countryRegion;
			}

			setLocationCookie(location);
			notify(location);
		});
	}

	function onLocationFailed(err) {
		console.warn('Geolocation failed', err);
	}

	function notify(location) {
		$(function () {
			$.publish('xom.geolocation', location);
		});
	}

}(window.jQuery));;

(function ($) {

	var INTERVAL_SPEED = 50;

	$.fn.iframeHeight = function () {
		this.each(function () {

			var $self = $(this);
			var $body;
			var $contentContainer;
			var lastHeight = -1;
			var interval;

			$self.load(function () {
				$body = $self.contents().find('body');
				$body.css('overflow-y', 'hidden');
				$contentContainer = $body.find('form').first(); /* using body{height:100%} in an iframe causes height to be reported as zero, so we'll target the top-level form element */
				checkHeight();
				interval = setInterval(checkHeight, INTERVAL_SPEED);
				$self.unload(release);
			});

			function checkHeight() {
				var height = $contentContainer.outerHeight(true) + parseInt($body.css('margin-top')) + parseInt($body.css('margin-bottom')) + parseInt($body.css('padding-top')) + parseInt($body.css('padding-bottom'));
				if (height === null || height == lastHeight) return;
				$self.css('height', height);
				lastHeight = height;
			}

			function release() {
				clearInterval(interval);
				lastHeight = -1;
			}
		});

		return this;
	};

	$(function () {
		$('.iframe-height').iframeHeight();
	});

}(window.jQuery));;

(function ($, m) {

	if (!$) {
		return console.log('localTime plugin requires jQuery');
	} else if (!m) {
		return console.log('localTime plugin requires Moment.js');
	}

	$.fn.localTime = function (options) {
		this.each(function () {
			var self = $(this);
			var config = $.extend({}, $.fn.localTime.defaults, self.data(), options);
			var utcTime = self.data('utc');
			self.text(m(utcTime).format(config.format));
		});
		return this;
	};

	$.fn.localTime.defaults = {
		format: 'dddd MMMM D, YYYY'
	};

	$(function () {
		$('.local-time').localTime();
	});

}(window.jQuery, window.moment));;

(function ($) {

	// Removes any height set on each child so its auto height can be calculated.
	// The height of the tallest child is then applied to all children. 
	function matchHeight(children) {
		var height = 0;
		children.css('height', 'auto');
		children.each(function () {
			height = Math.max(height, getHeight($(this)));
		});
		children.css('height', height + 'px');
	}

	// Avoid problems with box-sizing by using .css() instead of .height() or .outerHeight()
	function getHeight(element) {
		return parseInt(element.css('height'));
	}

	// Define the plugin
	$.fn.matchHeight = function () {
		this.each(function () {
			var $self = $(this),
				selectors = $self.attr('data-match-height-selectors').split(','),
				onResize = function () {
					for (var i = 0; i < selectors.length; i++) {
						matchHeight($self.find(selectors[i]));
					}
				};

			$(window).off('resize', onResize);
			$(window).on('resize', onResize);

			onResize();
		});

		return this;
	};

	// Apply the plugin at dom-ready
	$(function () {
		$('.match-height').matchHeight();
	});

}(window.jQuery));;

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

}(window.jQuery));;

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