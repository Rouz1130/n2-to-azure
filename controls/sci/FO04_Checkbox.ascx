<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component checkboxes">
	<div class="form-group">
		<input type="checkbox" id="<%=UniqueDomId("cb1a")%>" />
		<label for="<%=UniqueDomId("cb1a")%>"><span class="icon"></span>Option 1</label>
	</div>
	<div class="form-group">
		<input type="checkbox" id="<%=UniqueDomId("cb1b")%>" />
		<label for="<%=UniqueDomId("cb1b")%>"><span class="icon"></span>Option 2</label>
	</div>
	<div class="form-group">
		<input type="checkbox" id="<%=UniqueDomId("cb1c")%>" />
		<label for="<%=UniqueDomId("cb1c")%>"><span class="icon"></span>Option 3</label>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component checkboxes form-inline">
	<div class="form-group">
		<input type="checkbox" id="<%=UniqueDomId("cb2a")%>" />
		<label for="<%=UniqueDomId("cb2a")%>"><span class="icon"></span>Option 1</label>
	</div>
	<div class="form-group">
		<input type="checkbox" id="<%=UniqueDomId("cb2b")%>" />
		<label for="<%=UniqueDomId("cb2b")%>"><span class="icon"></span>Option 2</label>
	</div>
	<div class="form-group">
		<input type="checkbox" id="<%=UniqueDomId("cb2c")%>" />
		<label for="<%=UniqueDomId("cb2c")%>"><span class="icon"></span>Option 3</label>
	</div>
</div>

<% } %>