<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component station-locator-panel">
	<div class="station-locator-data">
		<img src="<%=ResolveUrl("~/content/site/Oltiva-station.png")%>" />
		<div class="station-locator-titles">
			<h2 class="large">30th Street Service Station, Inc.</h2>
			<span>Mon - Sat 06:00 - 22:00 <span class="station-locator-open">Open Now</span>, Sun 07:00 - 22:00</span>
		</div>
		<div class="station-locator-point">
			<i class="icon icon-map-pin-blue-small"></i>
			<span>309 11th Ave. New York, New York 10001-1213 United States</span>
		</div>
		<div class="station-locator-information">
			<div class="station-telephone">
				<i class="icon icon-telephone-list"></i>
				<span>(212) 594-1515</span>
			</div>
		</div>
	</div>
	<div class="station-locator-options">
		<a class="btn btn-primary btn-sm btn-icon" href="#"><img class="icon" src="<%=ResolveUrl("~/content/sci/img/icons/icon-world-white.png")%>" /> Get directions</a>
		<a class="btn btn-secondary btn-sm btn-icon" href="#"><img class="icon" src="<%=ResolveUrl("~/content/sci/img/icons/icon-search-white.png")%>" /> Find a station</a>
	</div>
</div>

<% } %>