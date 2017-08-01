<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component data-visualization">
	<div class="data-visualization-title">
		<p>Up to</p>
		<span class="text-plum-ruby">6 times longer oil life</span>
	</div>
	<div class="data-visualization-image">
		<img src="<%= ResolveUrl("~/content/site/data-visualization-graph.png") %>" />
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component data-visualization">
	<div class="data-visualization-title">
		<p>Up to</p>
		<span class="text-plum-ruby">6 times longer oil life</span>
	</div>
	<div class="data-visualization-text">
		Oltiva SHC 600 lubricants provide excellent performance 
        in extreme service applicants at high and low temperatures - 
        well beyond the capabilities of standard mineral oils
	</div>
</div>

<% } %>