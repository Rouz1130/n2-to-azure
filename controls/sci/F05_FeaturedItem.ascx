<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component featured-item featured-item-weather">
	<img class="featured-item-image" src="<%=ResolveUrl("~/content/site/skyline-light.jpg")%>">
	<div class="featured-item-copy">
		<h2>Good morning</h2>
		<p>
			
			Tell us your location to find a funeral home near you.
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

<% } %>