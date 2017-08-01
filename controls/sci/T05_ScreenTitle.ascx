<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component weather weather-day" data-weather='{ "style": "Clear", "value": 800, "imageBaseUrl": "<%= ResolveUrl("~/content/sci/img/weather/") %>", "apiUrl": "http://private-c4d05-weather22.apiary-mock.com/weather/" }'>
	<div class="weather-animation">
		<div class="viewport-wrapper">
			<div class="viewport">
				<div class="background-fade"></div>
				<div class="world"></div>
			</div>
			<img class="lens-flare-img day" src="<%= ResolveUrl("~/content/sci/img/weather/lens-flare.png") %>" width="818" height="550" alt="Lens flare image">
			<img class="lens-flare-img sml day" src="<%= ResolveUrl("~/content/sci/img/weather/lens-flare-sml.png") %>" width="818" height="550" alt="Lens flare image">
			<img class="station-img day" src="<%= ResolveUrl("~/content/sci/img/weather/station-day.png") %>" width="1065" height="320" alt="Station">
			<img class="station-img eve" src="<%= ResolveUrl("~/content/sci/img/weather/station-night.png") %>" width="1065" height="320" alt="Station">
			<img class="station-img no-shadow" src="<%= ResolveUrl("~/content/sci/img/weather/station-day-no-shadows.png") %>" width="1065" height="320" alt="Station in the day">
		</div>
	</div>
</div>

<% } %>