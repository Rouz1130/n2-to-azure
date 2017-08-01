<%@ Page Title="Analytics" %>
<%@ Register TagPrefix="xom" TagName="Component" Src="~/controls/Component.ascx" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<div class="row">
		<div class="col-md-12 col-4 breakpoints">
			<a id="test-link-1" href="#test" data-analytics='{ "cg": "in-page content group", "csg": "in-page content sub-group", "cn": "in-page component name", "ct": "in-page component type" }'>In-page link</a> | 
			<a id="test-link-2" target="_blank" href="http://www.google.com" data-analytics='{ "cg": "external content group", "csg": "external content sub-group", "cn": "external component name", "ct": "external component type" }'>External link</a> | 
			<a id="test-link-3" target="_blank" href="http://www.google.com">Google</a> |
			<a id="test-link-4" target="_blank" href="https://localexca.com:443/en/car-maintenance-tips">WEP map 1</a> |
			<a id="test-link-5" target="_blank" href="https://localexca.com:443/en/car-maintenance-tips">WEP map 2</a> |
			<a id="test-link-6" target="_blank" href="http://localexca.com:443/en/car-maintenance-tips">WEP map 3</a> |
			<a id="test-link-7" target="_blank" href="//localexca.com:443/en/car-maintenance-tips">WEP map 4</a> |
			<a id="test-link-8" target="_blank" href="//localexca.com:443/en/car-maintenance-tips" data-analytics='{ "cg": "child img element" }'><img src="<%= ResolveUrl("~/content/site/resource-153x153.jpg") %>" /></a>
		</div>
	</div>
</asp:Content>