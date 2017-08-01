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

}(window.jQuery));