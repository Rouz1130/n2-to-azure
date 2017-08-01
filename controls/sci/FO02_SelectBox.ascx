<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="form-group">
	<label>Select box</label>
	<div class="select">
        <i class="icon icon-drop-arrow"></i>
		<div class="select-wrapper">
			<select class="form-control">
				<option></option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</select>
		</div>
	</div>
</div>

<% } %>