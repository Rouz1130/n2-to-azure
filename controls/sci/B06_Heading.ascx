<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<h1>Page title in sentence case - h1</h1>

<% } else if (Variation == 2) { %>

<h2 class="large">Section subhead (home page) in sentence case - h2</h2>

<% } else if (Variation == 3) { %>

<h2>Section subhead in sentence case - h2</h2>

<% } else if (Variation == 4) { %>

<h3>Section subhead in sentence case - h3</h3>

<% } else if (Variation == 5) { %>

<h3 class="strong">Content subhead in sentence case - h3</h3>

<% } else if (Variation == 6) { %>

<h3 class="h4">Content subhead in sentence case - h3 (fake h4)</h3>

<% } else if (Variation == 7) { %>

<h3 class="h5">Content subhead in sentence case - h3 (fake h5)</h3>

<% } %>
