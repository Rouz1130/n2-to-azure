<%@ Page Title="Retail Fuels Home Alt" Language="C#" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

	<div class="row">
		<div class="col-md-12 col-4">
			<div class="component featured-item featured-item-weather">
				<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/skyline-light.jpg")%>">
				<div class="featured-item-copy">
					<h2>Good morning</h2>
					<p>
						Oltiva is always nearby. Where are you today?<br />
						Tell us your location to find your nearest service station.
					</p>
					<div class="form-group">
						<input type="text" class="form-control" />
						<i class="icon icon-search"></i>
					</div>
					<div class="weather-right-now clearfix">
						<div class="weather-provider-info">
							Right now near
							<span class="weather-location">Cincinnati</span>
							<span class="weather-provider">Powered by OpenWeatherMap</span>
						</div>
						<div class="weather-detail">
							<i class="icon icon-cloud"></i> 25&deg;
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-4">
			<div class="component featured-item featured-title-split-left">
				<div class="featured-title-copy-wrap">
					<img class="featured-title-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
					<div class="featured-title-copy">
						<h2 class="featured-item-title">Improve hydraulic efficiency</h2>
						<h3 class="featured-item-subtitle">The cost effective solution</h3>
						<p>
							Mobilgard 5100 is specially formulated to help protect engines that are susceptible to high levels of 'cold corrosion'.  It has been proven to be a more cost effective solution for engines suffering from cold corrosion versus the use of a lower BN oil at a higher feed rate.
						</p>
						<a class="glyph-link">Talk to an expert</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-4">
			<!-- Slider component -->
			<div style="background: #eee; height: 300px; margin-bottom:50px;"><!-- placeholder div --></div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6 col-4">
			<h1>Watch how your engine turns energy into motion</h1>
			<p>This video goes inside an engine to show you how Oltiva and Oltiva gasoline works.</p>
			<strong><a class="glyph-link" href="#">See our fuel in action</a></strong>
		</div>
		<div class="col-md-6 col-4">
			<div class="component embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/YvR0UaEKjp0" allowfullscreen></iframe>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 col-4">
			<ul class="component list list-4-up breakpoints">
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
						<div class="surfaced-item-copy">
							<h3>Headline goes here</h3>
							<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
							<a class="glyph-link" href="#">Find out how</a>
						</div>
					</div>
				</li>
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
						<div class="surfaced-item-copy">
							<h3>Headline goes here</h3>
							<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
							<a class="glyph-link" href="#">Find out how</a>
						</div>
					</div>
				</li>
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
						<div class="surfaced-item-copy">
							<h3>Headline goes here</h3>
							<p>Sagittis vel judging you vestibulum, run vehicula faucibus non jump leap meow. Claw eat the grass neque tortor, knock over the lamp scratched lay down in your way lay down in your way eat the grass chase the red dot eat. Enim ut tristique give me fish rip the couch.</p>
							<a class="glyph-link" href="#">Find out how</a>
						</div>
					</div>
				</li>
				<li>
					<div class="component surfaced-item surfaced-item-horizontal breakpoints">
						<img class="surfaced-item-image" runat="server" src="~/content/site/surfaced-item.jpg">
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
