<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<a href="#" class="component surfaced-item surfaced-item-overlay">
		<div class="surfaced-item-content-image">
			<img runat="server" src="~/content/site/surfaced-item.jpg">
			<div class="surfaced-item-label-image">
			   <h3>Supply reliability</h3>
			</div>
		</div>
	</a>

<% } else if (Variation == 2) { %>

	<div class="component surfaced-item surfaced-item-overlay">
		<a href="#" class="surfaced-item-content-image">
			<img runat="server" src="~/content/site/surfaced-item.jpg">
			<div class="surfaced-item-label-image">
				<h3>Supply reliability</h3>
			</div>
		</a>
		<div class="surfaced-item-copy">
			<h3>Headline goes here</h3>
			<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
			<a href="#" class="glyph-link">Find out how</a>
		</div>
	</div>

<% } %>