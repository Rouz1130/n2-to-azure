<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %> 

<div class="component app-promotion">
	<div class="app-content">
		<p>Get real time maps, directions and station information with the Oltiva Fuel Finder app.</p>
	</div>
	<div class="app-img">
		<img src="<%=ResolveUrl("~/content/site/app-artwork.jpg")%>" />
	</div>
    <div class="app-content-links">
	    <a href="#" class="app-promotion-ios"><img src="<%=ResolveUrl("~/content/site/app-apple-store.png")%>" /></a>
	    <a href="#" class="app-promotion-android"><img src="<%=ResolveUrl("~/content/site/app-google-play.png")%>" /></a>
    </div>
</div>

<% } else if (Variation == 2) { %>

<div class="component app-promotion app-promotion-mini">
	<div class="app-content">
		<h3 class="h4">Get real time maps, directions and station information with the Oltiva Fuel Finder app.</h3>
	</div>
    <div class="app-content-links">
	    <a href="#" class="app-promotion-ios"><img src="<%=ResolveUrl("~/content/site/app-apple-store.png")%>" /></a>
	    <a href="#" class="app-promotion-android"><img src="<%=ResolveUrl("~/content/site/app-google-play.png")%>" /></a>
    </div>
</div>

<% } %>