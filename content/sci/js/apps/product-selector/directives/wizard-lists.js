(function ($) {

	/*
	 * Because of the responsive nature of this component, we have to interrogate the DOM to determine
	 * state of the lists.  Whenever the number of lists change or the window is resized, we calculate
	 * the left position (%) of each list and the height of the list container.
	 * 
	 * The '.list-widths' element contains children that are hidden/shown by media queries, and we use
	 * those elements to determine the list width percentage since jQuery's css() method always returns
	 * pixel values.
	 */

	'use strict';

	angular.module('product-selector').directive('wizardLists', ['$timeout', function ($timeout) {

		return {
			restrict: 'C',
			link: function (scope, element) {
				var wizard = $(element);
				var slider = wizard.find('.lists-slider');
				var listCount = wizard.find('.list-count');

				function getMaxVisibleColumns() {
					return parseInt(listCount.children(':visible').last().text());
				}

				function configureSlider() {

					var lists = slider.find('.list');
					var button = slider.find('.view-recommendations');
					var hasRecommendation = button.hasClass('view-recommendations-active');
					var maxVisibleColumns = getMaxVisibleColumns();
					var columnPercentageWidth = 100 / maxVisibleColumns;
					var numColumns = lists.length + (hasRecommendation ? 1 : 0);
					var numVisibleColumns = Math.min(numColumns, maxVisibleColumns);
					var numHiddenColumns = numColumns - numVisibleColumns;
					var columnLeft = Math.min(0, -((numHiddenColumns + scope.listOffset) * columnPercentageWidth));
					var columnsToLeft = false;
					var columnsToRight = false;
					var height = 0;

					if (numHiddenColumns === 0) {
						scope.listOffset = columnLeft = 0;
					}

					columnsToLeft = (columnLeft < 0);

					lists.each(function () {
						var list = $(this);
						list.css({ left: columnLeft + '%', width: columnPercentageWidth + '%' });
						columnsToRight = (columnLeft >= 100);
						columnLeft += columnPercentageWidth;
						height = Math.max(height, list.outerHeight(true));
					});

					var buttonLeft = Math.max(columnLeft, 100 - columnPercentageWidth);
					button.css('left', buttonLeft + '%');

					slider.height(height);
					wizard.toggleClass('lists-to-left', columnsToLeft);
					wizard.toggleClass('lists-to-right', columnsToRight);
				}

				scope.$watch('[listOffset, hasRecommendation]', function (v) {
					$timeout(configureSlider);
				}, true);

				scope.$watchCollection('lists', function (v) {
					if (!v) return;
					$timeout(configureSlider);
				});

				$(window).resize(configureSlider);
			}
		};
	}]);

}(window.jQuery));