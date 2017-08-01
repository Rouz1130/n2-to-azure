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
