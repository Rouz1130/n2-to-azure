<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component special-screen-title">
	<ks:Content runat="server" ContentKey="a04_image"><DefaultContent>
		<img class="img-bordered" src="~/content/site/img-logo-title.png" />
	</DefaultContent></ks:Content>
	<div class="special-screen-title-text">
		<h1>
			<ks:Content runat="server" ContentKey="a04_title"><DefaultContent>
				Chattatoonga Funeral Home
			</DefaultContent></ks:Content>
		</h1>
		<ks:Content runat="server" ContentKey="a04_subtitle"><DefaultContent>
			<p>
				1233 James Ave, Chattatoonga TX<br />
				United States
			</p>
			<p><a class="special-screen-title-cta glyph-link" href="#">View additional information</a></p>
		</DefaultContent></ks:Content>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component special-screen-title">
	<img class="img-bordered" src="<%=ResolveUrl("~/content/site/img-logo-title.png")%>" />
	<div class="special-screen-title-text">
		<h1>Chattatoonga Funeral Home</h1>
		<p>
				1233 James Ave, Chattatoonga TX<br />
			United States
		</p>
		<p><a class="special-screen-title-favorite link-icon small" href="javascript:;"><i class="icon icon-favorite-off"></i><i class="icon icon-favorite-off"></i><i class="icon icon-favorite-off"></i><i class="icon icon-favorite-off"></i><i class="icon icon-favorite-off"></i></a></p>
	</div>
	<a href="#" class="special-screen-title-cta btn btn-primary">Contact us</a>
</div>

<% } %>