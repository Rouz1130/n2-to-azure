<%@ Page Title="Status" Language="C#" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="XOMFL.CommonComponents.Status" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	
	<h2>Current Issues</h2>

	<table class="table">
		<thead>
			<tr>
				<th style="width:25%">Issue</th>
				<th style="width:15%">Owner</th>
				<th style="width:60%">Notes</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Issue tracking</td>
				<td>Rajesh/Xavier</td>
				<td>Rajesh create DCS export query; Xavier coordinate import to TFS</td>
			</tr>
			<tr>
				<td>Move</td>
				<td>Jared</td>
				<td>Move to source.avndscxom.com Oltiva.FnL; Jared make ZIP of FE code and dump on FTP for move to CL; Get FTP info from Rajesh</td>
			</tr>
			<tr>
				<td>Baidu Maps</td>
				<td>Kelly</td>
				<td>Track down production Baidu key</td>
			</tr>
			<tr>
				<td>Fuel Finder data</td>
				<td>Xavier</td>
				<td>Data import is pending; API needs to be updated; FE is ready</td>
			</tr>
			<tr>
				<td>Weather component</td>
				<td>Kelly</td>
				<td>Plumbed to event bus and Apiary; Need to understand if/how station locator integrates from a data and visual perspective; Need API proxy migrated</td>
			</tr>
			<tr>
				<td>Data analytics</td>
				<td>Jared/Audlin</td>
				<td>Initial script stubbed out and test page built.  Waiting on confirmation of tracking parameter names.</td>
			</tr>
			<tr>
				<td>Header customization</td>
				<td>Kelly/Khurram</td>
				<td>Waiting on full visual requirements for LOB styling options</td>
			</tr>
			<tr>
				<td>GEO IP</td>
				<td>Rajesh</td>
				<td>Need to confirm correct location is being returned; use http://whatismyipaddress.com/ to confirm</td>
			</tr>
			<tr>
				<td>Google Maps pins now showing</td>
				<td>Dhwani</td>
				<td>Need URL from Sang</td>
			</tr>
			<tr>
				<td>Map clustering</td>
				<td>Kelly</td>
				<td>Need to know new API contract and how to display clusters</td>
			</tr>
		</tbody>
	</table>

	<h2>Component Build</h2>

	<div class="clearfix">
		<p class="buckets pull-left">
			<span>Total: <%= BuildableComponents.Length %>c / <%= TotalVariations %>v</span>
			<span>Not started: <%= GetPercentage(XOMFL.CommonComponents.Model.ComponentStatus.NotStarted) %>%</span>
			<span>In work: <%= GetPercentage(XOMFL.CommonComponents.Model.ComponentStatus.InWork) %>%</span>
			<span>Ready for test: <%= GetPercentage(XOMFL.CommonComponents.Model.ComponentStatus.ReadyForTest) %>%</span>
			<span>Complete: <%= GetPercentage(XOMFL.CommonComponents.Model.ComponentStatus.Complete) %>%</span>
		</p>
		<p class="batches pull-right">
			Test batches:
			<% for (int i = 1; i < 5; i++) { %>
			<span><%= i %> <span class="percent"><%= BatchCompletion(i) %>%</span></span>
			<% } %>
		</p>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th style="width:1%">Batch</th>
				<th style="width:29%">Name</th>
				<th style="width:5%">OneNote</th>
				<th style="width:25%">Status</th>
				<th style="width:40%">Notes</th>
			</tr>
		</thead>
		<tbody>
			<asp:Repeater runat="server" DataSource="<%# Components.OrderBy(x => x.Batch > 0 ? x.Batch : int.MaxValue).ThenBy(x => x.Code) %>">
				<ItemTemplate>
					<tr class="batch-<%# (int)Eval("Batch") %>">
						<td class="text-center"><%# Eval("Batch") %></td>
						<td><a href="layouts/ComponentTest.aspx?Component=<%# Eval("Code") + ".1" %><%# ((string[])Eval("Children")).Any() ? "&Child=" + ((string[])Eval("Children")).First() + ".1" : "" %>"><%# Eval("Code") %>: <%# Eval("Name") %></a> <span class="small">(<%# Eval("Variations.Count") %>)</span></td>
						<td class="text-center"><a href="<%# Eval("Specs") %>" target="_blank" class="glyph-link">Specs</a></td>
						<td class="status status-<%# (int)Eval("Status") %>"><div class="progress"></div><span class="text"><%# XOMFL.CommonComponents.Model.Enums.GetName(Eval("Status")) %></span></td>
						<td><%# Eval("Notes") %></td>
					</tr>
				</ItemTemplate>
			</asp:Repeater>
		</tbody>
	</table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageStyles">
	<style type="text/css">
		.buckets span { margin-right: 20px; }
		.status { overflow: hidden; position: relative; }
		.status .progress { background-color: #00A14D; left: 0; height: 1000px; position: absolute; top: 0; }
		.status-4 .progress { background-color: #04D769; }
		.status .text { color: #fff; position: relative; z-index: 2; }
		.status-0 .text { color: #999; }
		.status-0 .progress { width: 0; }
		.status-1 .progress { width: 50%; }
		.status-2 .progress { width: 75%; }
		.status-3 .progress,
		.status-4 .progress { width: 100%; }
		.batches { color: #999; }
		.batches .percent { color: #000; font-size: 1.4rem; font-weight: bold; }
		.batches > span { margin-left: 15px; }
		.strike { text-decoration: line-through; }
	</style>
</asp:Content>