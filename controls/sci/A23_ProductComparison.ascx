﻿<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component product-comparison table-responsive">
	<table class="table table-bordered">
		<thead>
			<tr class="product-categories">
				<th>&nbsp;</th>
				<th>High Performance Classification (HPC)</th>
				<th>High Thermal Stability (HTS)</th>
				<th>High Performance Classification</th>
			</tr>
		</thead>
		<tbody>
			<tr class="product-names">
				<td>&nbsp;</td>
				<td>Product One</td>
				<td>Product Two</td>
				<td>Product One</td>
			</tr>
			<tr>
				<td>Wear Protection</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
				</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
			</tr>
			<tr>
				<td>Corrosion Protection</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
			</tr>
			<tr>
				<td>Deposit Control</td>
				<td><i class="icon icon-blue-diamond"></i></td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
			</tr>
			<tr>
				<td>Thermal &amp; Oxidation Stability</td>
				<td><i class="icon icon-blue-diamond"></i></td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
				<td>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
					<i class="icon icon-blue-diamond"></i>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="product-legend">
		<span>Premium <i class="icon icon-blue-diamond"></i></span>
		<span>Superior <i class="icon icon-blue-diamond"></i> <i class="icon icon-blue-diamond"></i></span>
		<span>Ultimate <i class="icon icon-blue-diamond"></i> <i class="icon icon-blue-diamond"></i> <i class="icon icon-blue-diamond"></i></span>
	</div>
</div>

<% } %>