<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<!-- This is used for heros -->
	<div class="component screen-title screen-title-overlay">
		<div class="screen-title-image-wrap">
			<img class="screen-title-image hidden-xs hidden-sm" src="<%=ResolveUrl("~/content/site/header.jpg")%>">
            <img class="screen-title-image hidden-md hidden-lg" src="<%=ResolveUrl("~/content/site/location-hero-mobile.png")%>">
            <div class="screen-title-title">
                 <p class="header-subtitle">FUNERAL, Cremation & CEMETERY </p>
			    <h1><ks:Content runat="server" DefaultContent="Chattanooga Funeral Home, Crematory & Florist-North Chapel and Hamilton Memorial Gardens" ContentKey="title" /></h1>
            </div>
		</div>
       <ks:Component runat="server" Code="SP05.1" />
	</div>

<% } else if (Variation == 2) { %>

	<div class="component screen-title screen-title-only">
		<h1 class="screen-title-title"><ks:Content runat="server" DefaultContent="I need to plan a funeral" ContentKey="t01_title" /></h1>
	</div>

<% } else if (Variation == 3) { %>

	<div class="component screen-title screen-title-no-image">
		<h1 class="screen-title-title">Obituaries</h1>
		<div class="screen-title-copy-wrap">
			<p class="paragraph screen-title-copy">Sleep on your keyboard claw pharetra et, jump kittens run faucibus sunbathe egestas purr. Sniff nam sniff run dolor chase the red dot, et rhoncus dolor bat. Tail flick enim shed everywhere consectetur, zzz bibendum attack tail flick accumsan eat the grass sleep on your keyboard.</p>
			<p class="screen-title-cta">
				<button class="btn btn-primary"><span>Talk to an expert</span></button>
			</p>
		</div>
	</div>

<% } else if (Variation == 4) { %>

	<div class="component screen-title screen-title-above">
		<h1 class="screen-title-title">Obituaries</h1>
		<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-thin.jpg")%>">
	</div>

<% } else if (Variation == 5) { %>

	<div class="component screen-title screen-title-below">
		<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-thin.jpg")%>">
		<h1 class="screen-title-title">Obituaries</h1>
	</div>

<% } %>