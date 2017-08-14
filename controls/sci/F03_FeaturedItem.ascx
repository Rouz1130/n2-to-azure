<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component featured-item featured-title-split-right">
		<div class="featured-title-copy-wrap">
			<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/screen-title-679x319.jpg")%>">
			<div class="featured-title-copy">
				<h2 class="featured-item-title">Under the care of</h2>
				<h3 class="featured-item-subtitle">Chattanooga Funeral Home</h3>
				<p>
					The Dignity Memorial network of more than 2,000 licensed providers is North America's largest and most trusted brand for funeral, cremation or cemetary needs. We proudly serve over 300,000 families a year.
				</p>
				<button class="btn btn-primary">Learn more</button>
			</div>
		</div>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component featured-item featured-title-split-left">
		<div class="featured-title-copy-wrap">
			<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/screen-title-679x319.jpg")%>">
			<div class="featured-title-copy">
				<h2 class="featured-item-title">Under the care of</h2>
				<h3 class="featured-item-subtitle">Chattanooga Funeral Home</h3>
			    <p>
					The Dignity Memorial network of more than 2,000 licensed providers is North America's largest and most trusted brand for funeral, cremation or cemetary needs. We proudly serve over 300,000 families a year.
				</p>
				<button class="btn btn-primary">Learn more</button>
			</div>
		</div>
	</div>

<% } else if (Variation == 3) { %>

	<div class="component featured-item featured-title-split-right featured-small-image">
		<div class="featured-title-copy-wrap">
			<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/header-small.jpg")%>">
			<div class="featured-title-copy">
				<h2 class="featured-item-title">Under the care of</h2>
				<h3 class="featured-item-subtitle">Chattanooga Funeral Home</h3>
				<p>
					The Dignity Memorial network of more than 2,000 licensed providers is North America's largest and most trusted brand for funeral, cremation or cemetary needs. We proudly serve over 300,000 families a year.
				</p>
				<button class="btn btn-primary">Learn more</button>
			</div>
		</div>
	</div>

<% } else if (Variation == 4) { %>

	<div class="component featured-item featured-title-split-left featured-small-image">
		<div class="featured-title-copy-wrap">
			<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/header-small.jpg")%>">
			<div class="featured-title-copy">
				<h2 class="featured-item-title">Under the care of</h2>
				<h3 class="featured-item-subtitle">Chattanooga Funeral Home</h3>
				<p>
					The Dignity Memorial network of more than 2,000 licensed providers is North America's largest and most trusted brand for funeral, cremation or cemetary needs. We proudly serve over 300,000 families a year.
				</p>
				<button class="btn btn-primary">Learn more</button>
			</div>
		</div>
	</div>

<% } %>