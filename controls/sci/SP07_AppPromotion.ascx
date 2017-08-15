<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %> 

<div class="component app-promotion">
	<div class="app-content">
		<p>This is a callout box</p>
	</div>
	<div class="app-img">
		<img src="<%=ResolveUrl("~/content/site/app-artwork.jpg")%>" />
	</div>
     <div class="app-content-links">
	    <a href="#" class="app-promotion-ios">CTA link</a>
    </div>
</div>

<% } else if (Variation == 2) { %>

<div class="component app-promotion app-promotion-mini">
	<div class="app-content">
		<h3 class="h4">This is a callout box</h3>
	</div>
    <div class="app-content-links">
	    <a href="#" class="app-promotion-ios">CTA link</a>
    </div>
</div>

<% } %>