<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component surfaced-item surfaced-item-horizontal">
		<div class="surfaced-item-horizontal-row">
			<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
			<div class="surfaced-item-copy">
				<h3>Headline goes here</h3>
				<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
				<a class="glyph-link">Find out how</a>
			</div>
		</div>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component surfaced-item surfaced-item-vertical">
		<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
		<div class="surfaced-item-copy">
			<h3>Headline goes here</h3>
			<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
			<a class="glyph-link">Find out how</a>
		</div>
	</div>

<% } else if (Variation == 3) { %>

	<div class="component surfaced-item surfaced-item-horizontal">
		<div class="surfaced-intro-text">
			<h3>Headline goes here: <a href="#">Surfaced item title</a></h3>
		</div>
		<div class="surfaced-item-horizontal-row">
			<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
			<div class="surfaced-item-copy">
				<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
				<a class="glyph-link">Find out how</a>
			</div>
		</div>
	</div>

<% } else if (Variation == 4) { %>

	<div class="component surfaced-item surfaced-item-vertical">
		
		<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
      
		<h3>Planning related headline lorem ipsum dolor sit amet </h3>
		
		<div class="surfaced-item-copy">
			<a class="glyph-link">Find out how</a>
		</div>
	</div>

<% } else if (Variation == 5) { %>

	<div class="component surfaced-item surfaced-item-horizontal">
		<div class="surfaced-item-horizontal-row">
			<div class="surfaced-item-image static-map">
				<img class="static-map-map" src="http://dev.virtualearth.net/REST/v1/Imagery/Map/road/47.610,-122.107/14?mapSize=400,400&key=AifyqHviQoc5IJoiRfQJaUGtykDVrae0hqX0Nw22r04YLpRXwkdIOWRu_TLzGOH_" />
				<i class="icon icon-map-pin-blue-small"></i>
			</div>
			<div class="surfaced-item-copy">
				<h3>Headline goes here</h3>
				<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
				<a class="glyph-link">Find out how</a>
			</div>
		</div>
	</div>

<% } %>