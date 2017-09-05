<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component featured-item featured-item-title-overlay">
		<div class="featured-item-image-wrap">
			<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<a class="featured-item-title">
			    <h2>+23</h2>
                <p>see more</p>
			</a>
		</div>
		
	</div>

<% } %>