<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component table-vertical">
	<table class="table table-maximized">
		<thead>
			<tr>
				<th>Type</th>
				<th>SAE Grade</th>
				<th>cSt @ 40&deg; C</th>
				<th>cSt @ 100&deg; C</th>
				<th>Viscosity Index ASTM D 2270</th>
				<th>Pour Point ASTM D 97</th>
				<th>Flash Point ASTM D 97</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td data-th="Type">Hydraulic oil</td>
				<td data-th="SAE Grade">50</td>
				<td data-th="cSt @ 40&deg; C">32</td>
				<td data-th="cSt @ 100&deg; C">6.3</td>
				<td data-th="Viscosity Index ASTM D 2270">148</td>
				<td data-th="Pour Point ASTM D 97">-57&deg; C</td>
				<td data-th="Flash Point ASTM D 97">236&deg; C</td>
			</tr>
			<tr>
				<td data-th="Type">Gear oil</td>
				<td data-th="SAE Grade">30</td>
				<td data-th="cSt @ 40&deg; C">32</td>
				<td data-th="cSt @ 100&deg; C">40.1</td>
				<td data-th="Viscosity Index ASTM D 2270">193</td>
				<td data-th="Pour Point ASTM D 97">-42&deg; C</td>
				<td data-th="Flash Point ASTM D 97">233&deg; C</td>
			</tr>
		</tbody>
	</table>
</div>

<% } else if (Variation == 2) { %>

<div class="component table-responsive">
	<table class="table table-minimized">
		<thead>
			<tr>
				<th>Type</th>
				<th>SAE Grade</th>
				<th>cSt @ 40&deg; C</th>
				<th>cSt @ 100&deg; C</th>
				<th>Viscosity Index ASTM D 2270</th>
				<th>Pour Point ASTM D 97</th>
				<th>Flash Point ASTM D 97</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td data-th="Type">Hydraulic oil</td>
				<td data-th="SAE Grade">50</td>
				<td data-th="cSt @ 40&deg; C">32</td>
				<td data-th="cSt @ 100&deg; C">6.3</td>
				<td data-th="Viscosity Index ASTM D 2270">148</td>
				<td data-th="Pour Point ASTM D 97">-57&deg; C</td>
				<td data-th="Flash Point ASTM D 97">236&deg; C</td>
			</tr>
			<tr>
				<td data-th="Type">Gear oil</td>
				<td data-th="SAE Grade">30</td>
				<td data-th="cSt @ 40&deg; C">32</td>
				<td data-th="cSt @ 100&deg; C">40.1</td>
				<td data-th="Viscosity Index ASTM D 2270">193</td>
				<td data-th="Pour Point ASTM D 97">-42&deg; C</td>
				<td data-th="Flash Point ASTM D 97">233&deg; C</td>
			</tr>
		</tbody>
	</table>
</div>

<% } %>
