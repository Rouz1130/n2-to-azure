<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<p>Here we show <a href="#">a hyperlink</a> in the middle of a paragraph.</p>

<% } else if (Variation == 2) { %>

<p><a href="#" class="glyph-link">Hyperlink with right arrow</a></p> 

<% } else if (Variation == 3) { %>

<p><a href="#" class="link-icon"><i class="icon icon-download"></i>Download</a></p>
<p><a href="#" class="link-icon"><i class="icon icon-primary-pin"></i>Directions</a></p>
<p><a href="#" class="link-icon"><i class="icon icon-telephone"></i>Call us</a></p>

<% } else if (Variation == 4) { %>

<p><a href="#" class="glyph-link">SEE BIOGRAPHIES</a></p> 

<% } %>
