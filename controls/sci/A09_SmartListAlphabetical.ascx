<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) {
	   var index = "#AbcDeFGHijkLmNOPQRSTuVwXYz"; // Lowercase letters indicate an empty section
	   var breaks = "iR"; // This will trigger a new column to be started on these characters
%>

<div class="component smart-list-alphabetical">
	<ul class="list smart-list-alphabetical-index">
		<% foreach (var c in index) { %>
		<li><%= Char.IsUpper(c) ? "<a href=\"#\">" + c + "</a>" : c.ToString().ToUpper() %></li>
		<% } %>
	</ul>
	<div class="smart-list smart-list-alphabetical-columns">
		<div class="list">
		<% foreach (var c in index) {
		 var u = c.ToString().ToUpper();
			if (breaks.IndexOf(c) != -1) { %></div><div class="list"><% } %>
			<ul class="list smart-list-alphabetical-section <%= Char.IsUpper(c) ? "" : "smart-list-disabled" %>">
				<li><%= u %></li>
				<% for (var i = 1; i < 4; i++) { %>
				<li><%= Char.IsUpper(c) ? "<a href=\"#\">" + u + " list item " + i + "</a>" : u + " list item " + i %></li>
				<% } %>
			</ul>
		<% } %>
		</div>
	</div>
</div>

<% } %>