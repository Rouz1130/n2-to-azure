<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component featured-item featured-item-slide-topic">
	<img class="featured-item-slide-image" src="<%=ResolveUrl("~/content/site/carousel-01.jpg")%>">
	<div class="featured-item-slide-title-copy">
		
		<h2 class="featured-item-title">Virginia Sparks</h2>
		<p class="featured-item-subtitle">Virginia Sparks, 97, of Signal Mountain, passed away Tuesday August 1 2017 at her home.</p>
		<p><a href="#" class="featured-item-cta glyph-link">Learn more</a></p>
	</div>
</div>

<% } %>

<% if (Variation == 2) { %>

<div class="component featured-item featured-item-slide-topic">
	<img class="featured-item-slide-image" src="<%=ResolveUrl("~/content/site/carousel-01.jpg")%>">
</div>

<% } %>