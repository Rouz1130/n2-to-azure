(function ($) {

	initActivePanels();
	bindPanelEvents();

	function bindPanelEvents() {
		$('body')
			.on('show.bs.collapse', '.panel-group', function (e) {
				handlePanelClick(e.target, true);
			})
			.on('hide.bs.collapse', '.panel-group', function (e) {
				handlePanelClick(e.target, false);
			});
	}

	function handlePanelClick(target, active) {
		var panel = getPanel($(target));
		setPanelState(panel, active);
		if (active) {
			$.publish(getEventName(panel), getEventData(panel));
		}
	}

	function getPanel(child) {
		return child.closest('.panel');
	}

	function initActivePanels() {
		$('.panel-group .in').each(function () {
			setPanelState(getPanel($(this)), true);
		});
	}

	function setPanelState(panel, active) {
		panel[active ? 'addClass' : 'removeClass']('active');
	}

	function getEventName(panel) {
		return panel.data('eventName') || panel.closest('.panel-group').data('eventName') || 'accordion';
	}

	function getEventData(panel) {
		return panel.data('eventData') || panel.find('.panel-heading a:first').text();
	}

}(window.jQuery));