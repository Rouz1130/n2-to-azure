﻿<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component search-box" data-cookie-name="kitchen-sink-searches">
	<div class="form-group form-group-lg">
		<input type="text" class="form-control" placeholder="Search by country, state, city, postal code, or distributor name" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' />
		<span class="form-group-btn">
			<button type="button" class="btn btn-primary search" data-analytics='{ "manual": true, "cg": "Search", "ct": "Button" }'>Search</button>
		</span>
	</div>
	<div class="recent-searches">
		Your recent searches: <span class="recent-searches-links"></span>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component search-box search-box-with-settings" data-url="<%= ResolveUrl("~/pages/SearchResults.aspx") %>" data-event-name="xom.site-search" data-search-key="q" data-cookie-name="kitchen-sink-searches" data-settings-cookie="kitchen-sink-search-settings">
	<div class="form-group form-group-lg">
		<input type="text" class="form-control" placeholder="Search MSDS and PDS" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' />
		<span class="form-group-btn">
			<button class="btn btn-primary search" type="button" data-analytics='{ "manual": true, "cg": "Search", "ct": "Button" }'>Search</button>
		</span>
	</div>
	<ul class="search-box-settings">
		<li>Product family: <span class="search-box-setting" data-key="lob" data-value="Aviation">Aviation</span> <a href="#" data-toggle="modal" data-target="#<%=UniqueDomId("lb-lob")%>">(change)</a></li>
		<li>Country: <span class="search-box-setting" data-key="country" data-value="BRA">Brazil</span> <a href="#" data-toggle="modal" data-target="#<%=UniqueDomId("lb-country")%>">(change)</a></li>
	</ul>
	<div class="recent-searches">
		Your recent searches: <span class="recent-searches-links"></span>
	</div>
</div>

<!-- Content -->
<div class="modal fade" id="<%=UniqueDomId("lb-lob")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("lb-lob")%>-label" aria-hidden="true" data-search-key="lob">
	<div class="modal-dialog modal-breadcrumb">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h3 class="modal-title" id="<%=UniqueDomId("lb-lob")%>-label">Line of Business</h3>
				<p class="small">Select the options you would like to use.</p>
			</div>
			<div class="modal-body">
				<div class="row form-inline">
					<div class="col-sm-4">
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb1a")%>" value="Ancillary" />
							<label for="<%=UniqueDomId("cb1a")%>"><span class="icon"></span>Ancillary</label>
						</div>
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb1b")%>" value="Asphalt" />
							<label for="<%=UniqueDomId("cb1b")%>"><span class="icon"></span>Asphalt</label>
						</div>
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb1c")%>" value="Aviation" />
							<label for="<%=UniqueDomId("cb1c")%>"><span class="icon"></span>Aviation</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb2a")%>" value="Basestocks" />
							<label for="<%=UniqueDomId("cb2a")%>"><span class="icon"></span>Basestocks</label>
						</div>
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb2b")%>" value="Commercial Fuel" />
							<label for="<%=UniqueDomId("cb2b")%>"><span class="icon"></span>Commercial Fuel</label>
						</div>
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb2c")%>" value="Commercial Vehicle Lube" />
							<label for="<%=UniqueDomId("cb2c")%>"><span class="icon"></span>Commercial Vehicle Lube</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="checkbox" id="<%=UniqueDomId("cb3a")%>" value="Grease" />
							<label for="<%=UniqueDomId("cb3a")%>"><span class="icon"></span>Grease</label>
						</div>
					</div>
				</div>
				<div class="wrapper-submit-btn">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Change</button>
					<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="<%=UniqueDomId("lb-country")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("lb-country")%>-label" aria-hidden="true" data-search-key="country">
	<div class="modal-dialog modal-breadcrumb">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h3 class="modal-title" id="<%=UniqueDomId("lb-country")%>-label">Country</h3>
				<p class="small">Select the option you would like to use.</p>
			</div>
			<div class="modal-body">
				<div class="row form-inline">
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1a")%>" name="rb1" value="USA" />
							<label for="<%=UniqueDomId("rb1a")%>"><span class="icon"></span>United States</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1b")%>" name="rb1" value="CAN" />
							<label for="<%=UniqueDomId("rb1b")%>"><span class="icon"></span>Canada</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1c")%>" name="rb1" value="MEX" />
							<label for="<%=UniqueDomId("rb1c")%>"><span class="icon"></span>Mexico</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2a")%>" name="rb1" value="BLZ" />
							<label for="<%=UniqueDomId("rb2a")%>"><span class="icon"></span>Belize</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2b")%>" name="rb1" value="BOL" />
							<label for="<%=UniqueDomId("rb2b")%>"><span class="icon"></span>Bolivia</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2c")%>" name="rb1" value="BRA" />
							<label for="<%=UniqueDomId("rb2c")%>"><span class="icon"></span>Brazil</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb3a")%>" name="rb1" value="CHN" />
							<label for="<%=UniqueDomId("rb3a")%>"><span class="icon"></span>China</label>
						</div>
					</div>
				</div>
				<div class="wrapper-submit-btn">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Change</button>
					<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

<% } else if (Variation == 3) { %>

<div class="component search-box">
	<div class="form-group form-group-lg">
		<input type="text" class="form-control typeahead" data-url="<%=ResolveUrl("~/CoveoMock.ashx?q=%QUERY")%>" data-wildcard="%QUERY" data-options='{"minLength":2}' data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' placeholder="Search for 'in' to get suggestions" />
		<span class="form-group-btn">
			<button class="btn btn-primary search" type="button" data-analytics='{ "manual": true, "cg": "Search", "ct": "Button" }'>Search</button>
		</span>
	</div>
</div>

<% } else if (Variation == 4) { %>

<div class="component search-box search-box-small">
	<div class="form-group">
		<input type="text" class="form-control" placeholder="Search" data-analytics='{ "manual": true, "cg": "Search", "ct": "Text field" }' />
		<span class="form-group-btn"></span>
	</div>
</div>

<% } %>