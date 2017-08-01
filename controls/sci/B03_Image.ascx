<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<img class="img-block" src="~/content/site/placeholder.png" runat="server" />

<% } else if (Variation == 2) { %>

<img class="img-left" src="~/content/site/placeholder.png" runat="server" />

<% } else if (Variation == 3) { %>

<img class="img-right" src="~/content/site/placeholder.png" runat="server" />
 
<% } %> 