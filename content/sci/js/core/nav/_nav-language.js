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

}(window.jQuery));