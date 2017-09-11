<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component alert" role="alert">
	
	<p>
		Note that something bad may or may not be happening.
        <a href="#">Click here for more details</a>
	</p>
</div>

<% } if (Variation == 2) { %>
<div class="component alert alert-danger" role="alert">
	
	<p>
		This is a high alert.
        <a href="#">Click here for more details</a>
	</p>
</div>
<% } %>