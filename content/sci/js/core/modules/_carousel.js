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
			var useThumbs = self.hasClass('carousel-thumb'); // TODO remove this, replace with check for multiple items			
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

			$('.carousel-multiple-items').slick({
			    infinite: true,
			    slidesToShow: 2.5,
			    slidesToScroll: 3
			});
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

}(window.jQuery));