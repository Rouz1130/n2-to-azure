<%@ Page %>

<asp:Content runat="server" ContentPlaceHolderID="PageStyles">
	<style type="text/css">
		#image-specs td,
		#image-specs th {
			text-align: center;
			vertical-align: middle;
		}
		#image-specs td:first-child,
		#image-specs th:first-child {
			text-align: left;
		}
		#image-specs td.dim {
			color: #ccc;
		}
	</style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<table id="image-specs" class="table table-condensed table-striped table-bordered">
		<thead>
			<tr>
				<th>Size</th>
				<th>XS</th>
				<th>SM</th>
				<th>MD</th>
				<th>LG</th>
				<th>XL</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Container width range</td>
				<td>0-339</td>
				<td>340-439</td>
				<td>440-679</td>
				<td>680-963</td>
				<td>964-1340</td>
			</tr>
			<tr>
				<td><br /><b>Image type</b></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Full-width screen title / featured item</td>
				<td>339x158</td>
				<td>439x205</td>
				<td>679x318</td>
				<td>963x287</td>
				<td>1340x400</td>
			</tr>
			<tr>
				<td>Half-width featured item / surface item</td>
				<td>339x158</td>
				<td>439x205</td>
				<td class="dim">679x318</td>
				<td class="dim">679x318</td>
				<td>679x318</td>
			</tr>
			<tr>
				<td>Surface item - square</td>
				<td>339x158</td>
				<td>153x153</td>
				<td class="dim">319x319</td>
				<td class="dim">319x319</td>
				<td>319x319</td>
			</tr>
			<tr>
				<td>Surface item - overlay</td>
				<td>339x216</td>
				<td class="dim">439x280</td>
				<td class="dim">439x280</td>
				<td class="dim">439x280</td>
				<td>439x280</td>
			</tr>
			<tr>
				<td>Resource</td>
				<td class="dim">90x90</td>
				<td class="dim">90x90</td>
				<td class="dim">90x90</td>
				<td class="dim">90x90</td>
				<td>90x90</td>
			</tr>
		</tbody>
	</table>
</asp:Content>