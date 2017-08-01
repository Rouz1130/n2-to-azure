<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %> 

<button class="btn btn-primary">Primary</button>

<% } else if (Variation == 2) { %>

<button class="btn btn-secondary">Secondary</button>

<% } else if (Variation == 3) { %>

<button class="btn btn-tertiary">Tertiary</button>

<% } else if (Variation == 4) { %>

<button class="btn btn-deemphasized">De-emphasized</button>

<% } else if (Variation == 5) { %>

<button class="btn btn-sm">Small</button>

<% } else if (Variation == 6) { %>

<button class="btn btn-lg">Large button</button>

<% } else if (Variation == 7) { %>

<button class="btn btn-icon"><img runat="server" src="~/content/sci/img/icons/icon-share.png" class="icon"/> Button with icon</button>

<% } else if (Variation == 8) { %>

<button class="btn btn-badge">Button with badge <img runat="server" src="~/content/sci/img/icons/icon-badge-star.png" class="icon"/></button>

<% } %>