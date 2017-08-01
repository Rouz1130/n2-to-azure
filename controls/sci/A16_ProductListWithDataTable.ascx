<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component table-responsive">
	<table class="table table-bordered product-list">
		<thead>
			<tr>
				<th class="text-left" colspan="2">Product</th>
				<th class="text-center">TBN mg KOH/g</th>
				<th class="text-center">SAE</th>
				<th class="text-center">ISO</th>
				<th class="text-center">Pour Point &deg;C</th>
				<th class="text-center">Specific Gravity</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="product-list-icon">
					<img class="product-list-img" src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="product-list-description">
					<span class="product-list-title">Oltiva Dynagear Series</span>
					<p class="small">for [category 1] and [category 2]</p>
				</td>
				<td>25</td>
				<td>50</td>
				<td>---</td>
				<td>-9</td>
				<td>0.909</td>
			</tr>
			<tr>
				<td class="product-list-icon">
					<img class="product-list-img" src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="product-list-description">
					<span class="product-list-title">Oltiva Dynagear Series</span>
					<p class="small">for [category 1] and [category 2]</p>
				</td>
				<td>25</td>
				<td>50</td>
				<td>---</td>
				<td>-9</td>
				<td>0.909</td>
			</tr>
			<tr>
				<td class="product-list-icon">
					<img class="product-list-img" src="~/content/site/faux-img.png" runat="server" />
				</td>
				<td class="product-list-description">
					<span class="product-list-title">Oltiva Dynagear Series</span>
					<p class="small">for [category 1] and [category 2]</p>
				</td>
				<td>25</td>
				<td>50</td>
				<td>---</td>
				<td>-9</td>
				<td>0.909</td>
			</tr>
		</tbody>
	</table>
</div>

<% } %>