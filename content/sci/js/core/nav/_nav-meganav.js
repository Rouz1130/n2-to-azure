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

}(window.jQuery));