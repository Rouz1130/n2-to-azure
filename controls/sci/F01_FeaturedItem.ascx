<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component featured-item featured-item-title-overlay">
		<div class="featured-item-image-wrap">
			<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<a class="featured-item-title"  data-toggle="modal" data-target="#<%=UniqueDomId("featuredLightbox")%>">
			    <h2>+23</h2>
                <p>see more</p>
			</a>
		</div>
		
	</div>

<div class="modal fade" id="<%=UniqueDomId("featuredLightbox")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("featuredLightbox")%>-label" aria-hidden="true" data-analytics='{ "manual": true, "en": "CTA", "cg": "Contact our technical help desk", "cn": "Contact expert", "ct": "Link" }'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h2 class="modal-title" id="<%=UniqueDomId("lb")%>-label">Modal title - H2</h2>
			</div>
			<div class="modal-body">
			    
                <!-- add carousel component here -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary"><span>Send</span></button>
				<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal"><span>Cancel</span></button>
			</div>
		</div>
	</div>
</div>

<% } %>

<% if (Variation == 2) { %>

	<div class="component featured-item featured-item-title-overlay featured-item-gallery">
		<div class="featured-item-image-wrap">
			<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<a class="featured-item-title"  data-toggle="modal" data-target="#<%=UniqueDomId("featuredLightbox")%>">
			    <h2>+23</h2>
                <p>see more</p>
			</a>
		</div>
		
	</div>

<div class="modal fade" id="<%=UniqueDomId("featuredLightbox")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("featuredLightbox")%>-label" aria-hidden="true" data-analytics='{ "manual": true, "en": "CTA", "cg": "Contact our technical help desk", "cn": "Contact expert", "ct": "Link" }'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
                <h2 class="modal-title" id="<%=UniqueDomId("lb")%>-label">Opcional title</h2>
			</div>
			<div class="modal-body">
                <!-- carousel -->
			    <ks:Component runat="server" Code="C03.1" Child="F04.2" />  
                <!-- end carousel -->
			</div>
		</div>
	</div>
</div>

<% } %>