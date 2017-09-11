<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component featured-item featured-item-slide-topic">
	<img class="featured-item-slide-image" src="<%=ResolveUrl("~/content/site/flower-carousel.png")%>">
	<div class="featured-item-slide-title-copy">
		
		<h2 class="featured-item-title"><span class="current">3</span> / 4 </h2>
		<h2>Lorum ipsum et all dolor sit amert, erat elit donc feugiat</h2>
		<p><a href="#" class="glyph-link">Send flowers</a></p>
	</div>
</div>

<% } %>

<% if (Variation == 2) { %>

<div class="component featured-item featured-item-slide-topic">
	<img class="featured-item-slide-image" src="<%=ResolveUrl("~/content/site/carousel-01.jpg")%>">
</div>

<% } %>