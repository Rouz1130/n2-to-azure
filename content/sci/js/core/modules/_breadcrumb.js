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

}(window.jQuery));