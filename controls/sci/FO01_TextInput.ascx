<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="form-group">
	<label for="<%=UniqueDomId("input-a")%>">Name</label>
	<input id="<%=UniqueDomId("input-a")%>" type="text" class="form-control" value="This is sample text" />
</div>

<% } else if (Variation == 2) { %>

<div class="form-group">
	<label for="<%=UniqueDomId("input-b")%>">Company<span class="input-optional">Optional</span></label>
	<input id="<%=UniqueDomId("input-b")%>" type="text" class="form-control" value="This is sample text" />
</div>

<% } else if (Variation == 3) { %>

<div class="form-group">
	<label for="<%=UniqueDomId("input-c")%>">Email address</label>
	<input id="<%=UniqueDomId("input-c")%>" type="email" class="form-control" value="name@domain.com" />
</div>

<% } %>