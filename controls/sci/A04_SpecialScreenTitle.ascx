<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component special-screen-title">
	<ks:Content runat="server" ContentKey="a04_image"><DefaultContent>
		<img class="img-bordered" src="~/content/site/img-logo-title.png" />
	</DefaultContent></ks:Content>
	<div class="special-screen-title-text">
		<h1>
			<ks:Content runat="server" ContentKey="a04_title"><DefaultContent>
				Oltiva SHC<sup>TM</sup> 600 Series PDS
			</DefaultContent></ks:Content>
		</h1>
		<ks:Content runat="server" ContentKey="a04_subtitle"><DefaultContent>
			<p>
				Oltiva Lubricants &amp; Specialties Europe<br />
				United States
			</p>
			<p><a class="special-screen-title-cta glyph-link" href="#">View additional product information</a></p>
		</DefaultContent></ks:Content>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component special-screen-title">
	<img class="img-bordered" src="<%=ResolveUrl("~/content/site/img-logo-title.png")%>" />
	<div class="special-screen-title-text">
		<h1>Oltiva SHC<sup>TM</sup> 600 Series PDS</h1>
		<p>
			Oltiva Lubricants &amp; Specialties Europe<br />
			United States
		</p>
		<p><a class="special-screen-title-favorite link-icon small" href="javascript:;"><i class="icon icon-favorite-off"></i>Save as favorite</a></p>
	</div>
	<a href="#" class="special-screen-title-cta btn btn-primary">Contact us</a>
</div>

<% } %>