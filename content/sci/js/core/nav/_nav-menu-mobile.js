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
		//var $link = $(this),
		//	target = $link.attr('href'),
		//	isMenuNav = (target[0] === '#');

		//if (!isMenuNav) return;

		//e.preventDefault();

		//if (target === '#') {
		//	toggleMobileMenu();
		//	return;
		//}

		//var $thisPanel = $link.closest('.' + PANEL),
		//	$targetPanel = $(target),
		//	isBackNav = ($link.parent().index() === 0);

		//setActivePanel($targetPanel);
		//setTransitionClass(isBackNav ? $thisPanel : $targetPanel, PANEL_HIGHEST);
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

}(window.jQuery));