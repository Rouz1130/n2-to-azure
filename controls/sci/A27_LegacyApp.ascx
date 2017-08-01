<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %> 

<iframe src="<%=ResolveUrl("~/content/legacy/pairs-game/v2")%>" class="legacy-app iframe-height"></iframe>

<% } else if (Variation == 2) { %>

<iframe src="<%=ResolveUrl("~/content/legacy/marine-calculator")%>" class="legacy-app iframe-height"></iframe>

<% } else if (Variation == 3) { %>

<iframe src="<%=ResolveUrl("~/content/legacy/nose-to-tail")%>" class="legacy-app iframe-height"></iframe>

<% } else if (Variation == 4) { %>

<iframe src="<%=ResolveUrl("~/content/legacy/industrial-schematics/")%>" class="legacy-app iframe-height"></iframe>

<% } else if (Variation == 5) { %>

<button class="btn btn-sm">Small</button>

<% } else if (Variation == 6) { %>

<button class="btn btn-lg">Large button</button>

<% } else if (Variation == 7) { %>

<button class="btn btn-icon"><img runat="server" src="~/content/sci/img/icons/icon-share.png" class="icon"/> Button with icon</button>

<% } else if (Variation == 8) { %>

<button class="btn btn-badge">Button with badge <img runat="server" src="~/content/sci/img/icons/icon-badge-star.png" class="icon"/></button>

<% } %>