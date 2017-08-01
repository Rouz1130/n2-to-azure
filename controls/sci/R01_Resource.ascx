<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component resource">
	<span class="resource-image">
		<img data-src='{ "sm": "<%= ResolveUrl("~/content/site/resource-90x90.jpg") %>", "md": "<%= ResolveUrl("~/content/site/resource-153x153.jpg") %>", "xl": "<%= ResolveUrl("~/content/site/resource-339x339.jpg") %>" }' />
	</span>
	<span class="resource-text">
		<a href="#" class="resource-title">Oil and gas processing</a>
		Switching to Oltiva SHC™ 626 helped one customer lower the operating temperature in their tower fan gearboxes to realize big savings.
	</span>
</div>

<% } %>