<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component surfaced-item surfaced-item-overlay">
		<a href="#" class="surfaced-item-content-image">
		    <img runat="server" src="~/content/site/surfaced-item.jpg" />
			<div class="surfaced-item-label-image">
				<h3>Content headline lorem ipsum dolor sit amet</h3>
			</div>
		</a>
		<div class="surfaced-item-copy">
		    <a href="#" class="glyph-link">Find out how</a>
		</div>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component surfaced-item surfaced-item-overlay">
		<a href="#" class="surfaced-item-content-image">
		    <img runat="server" src="~/content/site/surfaced-item.jpg" />
			<div class="surfaced-item-label-image">
				<h3>Content headline lorem ipsum dolor sit amet</h3>
			</div>

		</a>
		
	</div>

<% } %>