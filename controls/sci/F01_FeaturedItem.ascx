<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component featured-item featured-item-title-overlay">
		<div class="featured-item-image-wrap">
			<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/skyline-dark.jpg")%>">
			<h2 class="featured-item-title">Featured item headline</h2>
		</div>
		<div class="featured-item-copy-wrap">
			<h3 class="featured-item-subtitle">The cost effective solution</h3>
			<p class="featured-item-copy">
				Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.
			</p>
			<p class="featured-item-cta">
				<button class="btn btn-primary">Call to action</button>
			</p>
		</div>
	</div>

<% } %>