<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component table-responsive">
	<table class="table table-bordered product-list">
		<thead>
			<tr>
				<th colspan="2">Series</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="product-list-icon">
					<img class="product-list-img" src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="product-list-description">
					<span class="product-list-title">Video case study title</span>
					<p class="small">Lorem ipsum dolor sit amet, wisi sociis tristique ultrices elit mus, ac ultrices massa donec vestibulum amet pharetra, viverra eget lectus lectus rutrum, lectus dolor leo vel lorem scelerisque est. Purus mollis quis varius tempus lorem.</p>
				</td>
			</tr>
			<tr>
				<td class="product-list-icon">
					<img class="product-list-img" src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="product-list-description">
					<span class="product-list-title">White paper title</span>
					<p class="small">Lorem ipsum dolor sit amet, wisi sociis tristique ultrices elit mus, ac ultrices massa donec vestibulum amet pharetra, viverra eget lectus lectus rutrum, lectus dolor leo vel lorem scelerisque est. Purus mollis quis varius tempus lorem.</p>
				</td>
			</tr>
			<tr>
				<td class="product-list-icon">
					<img class="product-list-img" src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="product-list-description">
					<span class="product-list-title">Turorial title</span>
					<p class="small">Lorem ipsum dolor sit amet, wisi sociis tristique ultrices elit mus, ac ultrices massa donec vestibulum amet pharetra, viverra eget lectus lectus rutrum, lectus dolor leo vel lorem scelerisque est. Purus mollis quis varius tempus lorem.</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<% } %>