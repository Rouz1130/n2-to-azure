// This solution "hijacks" input element containers and uses AJAX to submit the data instead of doing
// a full postback.  In the Sitecore development environment, this was causing a viewstate validation
// error that could not be reproduced outside of Sitecore.  So the following workaround was implemented:
// 
// 1) Set ASP.NET control ClientIDMode="static"
// 2) This script updates the "name" attribute of each input element to match its "id" attribute (add data-sync-name="false" to bypass this behavior)
// 3) The form handler checks for postback using Request.RequestType == "POST" and reads values as Request.Form[theControl.ClientID]

(function ($) {

	if (!$.fn.validate) {
		console.warn('jQuery Validation plugin not available');
		return;
	}

	bindEvents();

	function bindEvents() {
		$('body')
			.on('show.bs.modal', '.ajax-form', function (e) {
				captureInitialValues(e.target);
				resetForm(e.target);
			})
			.on('shown.bs.modal', '.ajax-form', function (e) {
				setFocusToFirstField(e.target);
			})
			.on('click', '.ajax-form button[type="submit"]', function (e) {
				e.preventDefault();
				var $form = $(e.target).closest('.ajax-form');
				onSubmitRequested($form);
			})
			.on('change', '.ajax-form .radio-buttons.required input[type="radio"]', function (e) {
				var $form = $(e.target).closest('.radio-buttons.required');
				validateRadioGroup($form);
			});
	}

	function captureInitialValues(target) {
		var $target = $(target);
		getFields(target).each(function () {
			var $this = $(this);
			if ($this.data('initialValue') !== undefined) return;
			$this.data('initialValue', $this.is('[type="radio"],[type="checkbox"]') ? $this.is(':checked') : $this.val());
		});
	}

	function restoreInitialValues(target) {
		var $target = $(target);
		getFields(target).each(function () {
			var $this = $(this);
			var initialValue = $this.data('initialValue');
			if (initialValue === null) return;
			if ($this.is('[type="radio"],[type="checkbox"]')) {
				$this.attr('checked', initialValue);
			} else {
				$this.val(initialValue);
			}
		});
	}

	function resetForm(target) {
		var $target = $(target);
		var fields = getFields(target);
		fields.each(setNameToId).removeClass('error').next('label.error').remove();
		$target.find('.form-submit,.form-cancel').removeClass('hidden');
		$target.find('.form-done').addClass('hidden');
		restoreInitialValues(target);
		show($(target), 'body');
	}

	function setNameToId() {
		var $el = $(this);
		var id = $el.attr('id');
		if (!id || $el.data('syncName') === false) return;
		$el.attr('name', id);
	}

	function setFocusToFirstField(target) {
		getFields(target).first().focus();
	}

	function onSubmitRequested($form) {
		var valid = getFields($form).valid();
		valid = validateRadios($form) && valid;
		if (valid) submitForm($form);
	}

	function submitForm($form) {
		var action = $form.attr('data-form-action');
		var serialized = $('form')
			.find('input,textarea,select,hidden')
			.not('#__VIEWSTATE,#__EVENTVALIDATION')
			.serialize();
		$.post(action, serialized)
			.done(function () { show($form, 'success'); })
			.fail(function () { show($form, 'failure'); })
			.always(function () {
				$form.find('.form-submit,.form-cancel').addClass('hidden');
				$form.find('.form-done').removeClass('hidden');
			});
	}

	function getFields(target) {
		return $(target).find('input,textarea,select');
	}

	function validateRadios($target) {
		var valid = true;
		$target.find('.radio-buttons.required').each(function () {
			if (!validateRadioGroup($(this))) value = false;
		});
		return valid;
	}

	function validateRadioGroup($group) {
		var radios = $group.find('input[type="radio"]');
		var message = $group.attr('data-required-message') || 'This field is required';
		var name = radios.first().attr('name');

		var hasValue = radios.is(':checked');
		if (hasValue) {
			radios.removeClass('error');
			clearRadioError($group);
			return true;
		}

		radios.addClass('error');
		showRadioError($group, name, message);
		return false;
	}

	function showRadioError($group, name, message) {
		var parent = $group.closest('.radio-buttons');
		var err = parent.find('label.error');
		if (err.length > 0) {
			err.show();
		} else {
			parent.append('<label class="error" for="' + name + '">' + message + '</label>');
		}
	}

	function clearRadioError($group) {
		$group.closest('.radio-buttons').find('label.error').remove();
	}

	function show($container, partial) {
		var partials = ['body', 'success', 'failure'];
		for (var i = 0; i < partials.length; i++) {
			var on = (partial == partials[i]);
			$container.find('.form-' + partials[i])[on ? 'removeClass' : 'addClass']('hidden');
		}
	}

}(window.jQuery));