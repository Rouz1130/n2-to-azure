<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component radio-buttons">
	<div class="form-group">
		<input type="radio" id="<%=UniqueDomId("rb1a")%>" name="rb1" />
		<label for="<%=UniqueDomId("rb1a")%>"><span class="icon"></span>Option 1</label>
	</div>
	<div class="form-group">
		<input type="radio" id="<%=UniqueDomId("rb1b")%>" name="rb1" />
		<label for="<%=UniqueDomId("rb1b")%>"><span class="icon"></span>Option 2</label>
	</div>
	<div class="form-group">
		<input type="radio" id="<%=UniqueDomId("rb1c")%>" name="rb1" />
		<label for="<%=UniqueDomId("rb1c")%>"><span class="icon"></span>Option 3</label>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component radio-buttons form-inline">
	<div class="form-group">
		<input type="radio" id="<%=UniqueDomId("rb2a")%>" name="rb2" />
		<label for="<%=UniqueDomId("rb2a")%>"><span class="icon"></span>Option 1</label>
	</div>
	<div class="form-group">
		<input type="radio" id="<%=UniqueDomId("rb2b")%>" name="rb2" />
		<label for="<%=UniqueDomId("rb2b")%>"><span class="icon"></span>Option 2</label>
	</div>
	<div class="form-group">
		<input type="radio" id="<%=UniqueDomId("rb2c")%>" name="rb2" />
		<label for="<%=UniqueDomId("rb2c")%>"><span class="icon"></span>Option 3</label>
	</div>
</div>

<% } %>