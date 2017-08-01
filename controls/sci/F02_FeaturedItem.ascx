<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component featured-item featured-item-full-overlay">
	<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/skyline-dark.jpg")%>">
	<div class="featured-item-copy-outer">
		<div class="featured-item-copy-inner featured-item-text-light">
			<h2 class="featured-item-title">Featured item headline</h2>
			<h3 class="featured-item-subtitle">The cost effective solution</h3>
			<p>Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur.</p>
			<a href="#" class="btn btn-primary">Call to action</a>
		</div>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component featured-item featured-item-full-overlay">
	<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/skyline-light.jpg")%>">
	<div class="featured-item-copy-outer">
		<div class="featured-item-copy-inner featured-item-text-dark">
			<h2 class="featured-item-title">Featured item headline</h2>
			<h3 class="featured-item-subtitle">The cost effective solution</h3>
			<p>Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur.</p>
			<a href="#" class="btn btn-primary">Call to action</a>
		</div>
	</div>
</div>

<% } %>