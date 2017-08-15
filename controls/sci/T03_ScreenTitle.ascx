<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component screen-title screen-title-split-left">
		<h1 class="screen-title-title">Recent Obituaries</h1>
		<div class="screen-title-copy-wrap">
			<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<div class="screen-title-copy">
				<p>
					<span class="screen-title-subtitle">in Texas</span><br />
					Search for obituaries near you.
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
					<span class="screen-title-subtitle">in Texas</span><br />
					Search for obituaries near you.
				</p>
				<button class="btn btn-primary">Talk to an expert</button>
			</div>
		</div>
	</div>

<% } %>