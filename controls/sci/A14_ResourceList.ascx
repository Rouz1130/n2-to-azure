<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component table-responsive">
	<table class="table table-bordered information resource-list">
		<tbody>
			<tr>
				<td class="resource-list-icon">
					<img src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="resource-list-description">
					<span class="resource-list-title">English</span>
					<span>890kb PDF</span>
				</td>
				<td class="resource-list-action">
					<a href="#" class="link-icon"><i class="icon icon-download"></i>Download</a>
				</td>
				<td class="resource-list-action">
					<a href="#" class="link-icon"><i class="icon icon-share-orange"></i>Share</a>
				</td>
			</tr>
			<tr>
				<td class="resource-list-icon">
					<img src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="resource-list-description">
					<span class="resource-list-title">French - European</span>
					<span>615kb PDF</span>
				</td>
				<td class="resource-list-action">
					<a href="#" class="link-icon"><i class="icon icon-download"></i>Download</a>
				</td>
				<td class="resource-list-action">
					<a href="#" class="link-icon"><i class="icon icon-share-orange"></i>Share</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<% } %>