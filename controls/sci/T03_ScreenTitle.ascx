<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

	<div class="component screen-title screen-title-split-left">
		
		<div class="screen-title-copy-wrap">
			<img class="screen-title-image" src="<%=ResolveUrl("~/content/site/header-narrow.jpg")%>">
			<div class="screen-title-copy">
			    <h3 class="screen-title-title">Virginia Sparks</h3>
				<p>
					<span class="screen-title-subtitle">in Texas</span><br />
					Search for obituaries near you.
				</p>
				<button class="btn btn-primary">Talk to an expert</button>
			</div>
		</div>
	</div>

<% } else if (Variation == 2) { %>

	<div class="component screen-title screen-title-split-right">
		
		<a class="screen-title-copy-wrap" href="#">
            <div class="screen-title-image" style="background-image: url(<%=ResolveUrl("~/content/site/header-narrow.jpg")%>)">
			    
            </div>
			<div class="screen-title-copy">
			    <h3 class="screen-title-title">Carolyn Loyd Johnson</h3>
                <p class="header-subtitle">Visitation</p>
				<p>
				Thursday, July 27th at 7pm
				</p>
			
			</div>
		</a>
	</div>

<% } %>