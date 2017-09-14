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

}(window.jQuery));