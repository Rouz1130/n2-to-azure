<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component screen-title screen-title-overlay">
		<div class="screen-title-image-wrap">
			<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header.jpg")%>">
			<h1 class="screen-title-title"><ks:Content runat="server" DefaultContent="Mining industry" ContentKey="title" /></h1>
		</div>
		<div class="screen-title-copy-wrap">
			<h3>Title subheading</h3>
			<p class="paragraph screen-title-copy">
				Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.
			</p>
			<p class="screen-title-cta">
				<button class="btn btn-primary">Talk to an expert</button>
			</p>
		</div>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component screen-title screen-title-only">
		<h1 class="screen-title-title"><ks:Content runat="server" DefaultContent="Oltiva industrial lubricants and greases" ContentKey="t01_title" /></h1>
	</div>

<% } else if (Variation == 3) { %>

	<div class="component screen-title screen-title-no-image">
		<h1 class="screen-title-title">Oltiva industrial lubricants and greases</h1>
		<div class="screen-title-copy-wrap">
			<p class="paragraph screen-title-copy">Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.</p>
			<p class="screen-title-cta">
				<button class="btn btn-primary">Talk to an expert</button>
			</p>
		</div>
	</div>

<% } else if (Variation == 4) { %>

	<div class="component screen-title screen-title-above">
		<h1 class="screen-title-title">Mining industry</h1>
		<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-thin.jpg")%>">
	</div>

<% } else if (Variation == 5) { %>

	<div class="component screen-title screen-title-below">
		<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-thin.jpg")%>">
		<h1 class="screen-title-title">Mining industry</h1>
	</div>

<% } %>