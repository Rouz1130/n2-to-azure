<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component alert alert-info" role="alert">
	<span class="icon icon-success"></span>
	<p>
		<span class="alert-title">ECA-Approved fuel oil.</span>
		<a href="#" class="glyph-link">View all ECA-approved fuels</a>
	</p>
</div>

<% } else if (Variation == 2) { %>

<div class="component alert alert-danger" role="alert">
	<span class="icon icon-danger"></span>
	<p>
		<span class="alert-title">Not available for purchase in the United States.</span>
		<a href="#" class="glyph-link">Check availability in another location</a>
	</p>
</div>

<% } else if (Variation == 3) { %>

<div class="component alert alert-warning" role="alert">
	<span class="icon icon-warning"></span>
	<p>
		<span class="alert-title">Warning</span>
		Please be aware that something here my not be what you expect
	</p>
</div>

<% } else if (Variation == 4) { %>

<div class="component alert alert-success" role="alert">
	<span class="icon icon-success"></span>
	<p>
		<span class="alert-title">Success</span>
		Some action has been successfully completed.
	</p>
</div>

<% } %>