<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component data-visualization">
	<div class="data-visualization-title">
		<p>Up to</p>
		<span class="text-plum-ruby">Virginia Sparks</span>
	</div>
	<div class="data-visualization-image">
		<img src="<%= ResolveUrl("~/content/site/data-visualization-graph.png") %>" />
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component data-visualization">
	<div class="data-visualization-title">
		<p>Up to</p>
		<span class="text-plum-ruby">Virginia Sparks</span>
	</div>
	<div class="data-visualization-text">
		Virginia Sparks, 93, born in Chatatoonga TX, died at her home on August 23rd, 2017
	</div>
</div>

<% } %>