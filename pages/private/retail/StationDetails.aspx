<%@ Page Title="Station Details" Language="C#" Inherits="System.Web.UI.Page" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div class="row">
		<div class="col-md-12 col-4">
			<div class="component breadcrumb-panel">
				<ul class="breadcrumb-list">
					<li class="glyph-link"><a href="#">Oltiva and Oltiva Fuels</a></li>
					<li class="glyph-link"><a href="#">Our stations</a></li>
					<li class="glyph-link"><a href="#">Find a station</a></li>
					<li class="glyph-link"><a href="#">Bisma Oltiva</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="row">

		<div class="col-md-6">
			<!-- Basic Content Components -->
			<h1>Bisma Oltiva</h1>
			<p>718 11th Ave, New York, New York <a href="#">(212) 974-0243</a></p>
			<p>Oltiva gas station in New York, New York</p>
			<hr />

			<div class="component station-locator-panel">
				<div class="station-locator-data">
					<div class="station-locator-titles">
						<h4><strong>Hours of operation</strong></h4>
					</div>
					<div class="col-md-6 col-2">
						<p><strong>Gas</strong></p>
						<span>Open 24/7 <span class="station-locator-open">Open Now</span></span>
					</div>
					<div class="col-md-6 col-2">
						<p><strong>Convenience store</strong></p>
						<span>Open 24/7 <span class="station-locator-open">Open Now</span></span>
					</div>
				</div>
			</div>
			<!-- Linked Image component needed -->
			<div class="col-md-12 col-2">
				<div class="component">
				</div>
			</div>
			<!-- Bullet list component needed -->
			<div class="col-md-12 col-4">
				<div class="component smart-list">
					<h3 class="h4">Features</h3>
					<ul class="list list-bulleted">
						<li>List item 1</li>
						<li>List item 2</li>
						<li>List item 3</li>
						<li>List item 4</li>
						<li>List item 5</li>
						<li>List item 6</li>
					</ul>
					<ul class="list list-bulleted">
						<li>List item 7</li>
						<li>List item 8</li>
						<li>List item 9</li>
						<li>List item 10</li>
						<li>List item 11</li>
						<li>List item 12</li>
					</ul>
				</div>
			</div>

			<div class="col-md-12 col-2">
				
				<div class="component social-share">
					<a href="#" class="glyph-link">Submit station feedback</a>
					<span class="social-share-station-detail">
						<a href="#"><i class="icon icon-share"></i>Share</a>
					</span>
				</div>
			</div>
		</div>

		<div class="col-md-6">

			<div class="component">

				<div class="static-map">
					<img class="static-map-map" src="http://dev.virtualearth.net/REST/v1/Imagery/Map/road/47.610,-122.107/14?mapSize=900,400&key=AifyqHviQoc5IJoiRfQJaUGtykDVrae0hqX0Nw22r04YLpRXwkdIOWRu_TLzGOH_" />
					<i class="icon icon-map-pin-blue-small"></i>
				</div>

				<div class="station-locator-options">
					<a class="btn btn-primary btn-sm btn-icon" href="#"><img class="icon" src="<%=ResolveUrl("~/content/sci/img/icons/icon-world-white.png")%>" /> Get directions</a>
		
					<a class="btn btn-secondary btn-sm btn-icon" href="#"><img class="icon" src="<%=ResolveUrl("~/content/sci/img/icons/icon-search-white.png")%>" /> Find a station</a>
				</div>

			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-md-12 col-4">
			<ul class="component list list-3-up breakpoints">
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<div class="surfaced-item-content-image">
							<img runat="server" src="~/content/site/surfaced-item.jpg">
						</div>
						<div class="surfaced-item-copy">
							<h3>Headline goes here</h3>
							<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
							<a class="glyph-link" href="#">Find out how</a>
						</div>
					</div>
				</li>
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<div class="surfaced-item-content-image">
							<img runat="server" src="~/content/site/surfaced-item.jpg">
						</div>
						<div class="surfaced-item-copy">
							<h3>Headline goes here</h3>
							<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
							<a class="glyph-link" href="#">Find out how</a>
						</div>
					</div>
				</li>
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<div class="surfaced-item-content-image">
							<img runat="server" src="~/content/site/surfaced-item.jpg">
						</div>
						<div class="surfaced-item-copy">
							<h3>Headline goes here</h3>
							<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
							<a class="glyph-link" href="#">Find out how</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

</asp:Content>
