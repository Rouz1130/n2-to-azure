<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component embed-responsive embed-responsive-16by9">
	<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/YvR0UaEKjp0?showinfo=0" allowfullscreen></iframe>
</div>

<% } else if (Variation == 2) { %>

<div class="component embed-responsive embed-responsive-4by3">
	<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/YvR0UaEKjp0?showinfo=0" allowfullscreen></iframe>
</div>

<% } %>