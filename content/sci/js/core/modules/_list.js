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

}(window.jQuery));