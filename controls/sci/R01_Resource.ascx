<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component resource">
	<span class="resource-image">
		<img data-src='{ "sm": "<%= ResolveUrl("~/content/site/resource-90x90.jpg") %>", "md": "<%= ResolveUrl("~/content/site/resource-153x153.jpg") %>", "xl": "<%= ResolveUrl("~/content/site/resource-339x339.jpg") %>" }' />
	</span>
	<span class="resource-text">
		<a href="#" class="resource-title">Link to other page</a>
		This is about the image
	</span>
</div>

<% } %>