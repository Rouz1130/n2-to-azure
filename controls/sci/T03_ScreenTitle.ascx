<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component screen-title screen-title-split-left">
		<h1 class="screen-title-title">Recent Obituaries</h1>
		<div class="screen-title-copy-wrap">
			<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<div class="screen-title-copy">
				<p>
					<span class="screen-title-subtitle">Improve hydraulic efficiency</span><br />
					Mobilgard 5100 is specially formulated to help protect engines that are susceptible to high levels of 'cold corrosion'.  It has been proven to be a more cost effective solution for engines suffering from cold corrosion versus the use of a lower BN oil at a higher feed rate.
				</p>
				<button class="btn btn-primary">Talk to an expert</button>
			</div>
		</div>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component screen-title screen-title-split-right">
		<h1 class="screen-title-title">Recent Obituaries</h1>
		<div class="screen-title-copy-wrap">
			<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<div class="screen-title-copy">
				<p>
					<span class="screen-title-subtitle">Improve hydraulic efficiency</span><br />
					Mobilgard 5100 is specially formulated to help protect engines that are susceptible to high levels of 'cold corrosion'.  It has been proven to be a more cost effective solution for engines suffering from cold corrosion versus the use of a lower BN oil at a higher feed rate.
				</p>
				<button class="btn btn-primary">Talk to an expert</button>
			</div>
		</div>
	</div>

<% } %>