<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component breadcrumb-panel">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">Breadcrumb trail</a></li>
		<li class="glyph-link"><a href="#">Cemeteries</a></li>	
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery</a></li>
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery Events</a></li>
	</ul>
</div>

<% } else if (Variation == 2) { %>

<div class="component breadcrumb-panel-action">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">Breadcrumb trail</a></li>
		<li class="glyph-link"><a href="#">Cemeteries</a></li>	
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery</a></li>
		<li class="glyph-link"><a href="#">Chatatoonga Cemetery Events</a></li>
	</ul>
	<span class="change-language small">Interface language: <span class="current-language">English</span> (<a href="#" type="button" class="" data-toggle="modal" data-target="#<%=UniqueDomId("lb")%>">change</a>)</span>
</div>

<!-- Content -->
<div class="modal modal-change-language fade" id="<%=UniqueDomId("lb")%>" tabindex="-1" role="dialog" aria-labelledby="<%=UniqueDomId("lb")%>-label" aria-hidden="true" data-cookie-name="emfl-language" data-query-param="language">
	<div class="modal-dialog modal-breadcrumb">
		<div class="modal-content">
			<div class="modal-header">
				<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
				<h3 class="modal-title" id="<%=UniqueDomId("lb")%>-label">Select Language</h3>
				<p class="small">Select the language you would like to use (this does not limit what documents are returned).</p>
			</div>
			<div class="modal-body">
				<div class="row form-inline">
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb3a")%>" name="rb1" value="ar" />
							<label for="<%=UniqueDomId("rb3a")%>"><span class="icon"></span>Arabic</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2c")%>" name="rb1" value="zh" />
							<label for="<%=UniqueDomId("rb2c")%>"><span class="icon"></span>Chinese</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1a")%>" name="rb1" value="en" />
							<label for="<%=UniqueDomId("rb1a")%>"><span class="icon"></span>English</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1b")%>" name="rb1" value="fr" />
							<label for="<%=UniqueDomId("rb1b")%>"><span class="icon"></span>French</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2a")%>" name="rb1" value="de" />
							<label for="<%=UniqueDomId("rb2a")%>"><span class="icon"></span>German</label>
						</div>
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb1c")%>" name="rb1" value="es" />
							<label for="<%=UniqueDomId("rb1c")%>"><span class="icon"></span>Spanish</label>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<input type="radio" id="<%=UniqueDomId("rb2b")%>" name="rb1" value="th" />
							<label for="<%=UniqueDomId("rb2b")%>"><span class="icon"></span>Thai</label>
						</div>
					</div>
				</div>
				<div class="wrapper-submit-btn">
					<button type="button" class="btn btn-primary">Change</button>
					<button type="button" class="btn btn-link btn-cancel" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</div>

<% } else if (Variation == 3) { %>

<div class="component breadcrumb-back">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">[Application N1]</a></li>
	</ul>
</div>

<% } else if (Variation == 4) { %>

<div class="component breadcrumb-heading">
	<ul class="breadcrumb-list">
		<li class="glyph-link"><a href="#">[Application N1]</a></li>
		<li class="glyph-link"><a href="#">[Application N2]</a></li>
		<li class="glyph-link"><a href="#">[Application N3]</a></li>
	</ul>
</div>

<% } %>