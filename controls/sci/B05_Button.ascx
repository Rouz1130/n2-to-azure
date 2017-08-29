<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %> 

<button class="btn btn-primary"><span>Primary</span></button>

<% } else if (Variation == 2) { %>

<button class="btn btn-secondary"><span>Secondary</span></button>

<% } else if (Variation == 3) { %>

<button class="btn btn-tertiary"><span>Tertiary</span></button>

<% } else if (Variation == 4) { %>

<button class="btn btn-deemphasized"><span>De-emphasized</span></button>

<% } else if (Variation == 5) { %>

<button class="btn btn-sm"><span>Small</span></button>

<% } else if (Variation == 6) { %>

<button class="btn btn-lg"><span>Large button</span></button>

<% } else if (Variation == 7) { %>

<button class="btn btn-icon"><span><img runat="server" src="~/content/sci/img/icons/icon-share.png" class="icon"/> Button with icon</span></button>

<% } else if (Variation == 8) { %>

<button class="btn btn-badge"><span>Button with badge <img runat="server" src="~/content/sci/img/icons/icon-badge-star.png" class="icon"/></span></button>

<% } %>