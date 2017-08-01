<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Snippet.ascx.cs" Inherits="XOMFL.CommonComponents.controls.Snippet" %>
<asp:PlaceHolder runat="server" ID="NotAvailable" Visible="false">
	<p>No HTML snippet is available.</p>
</asp:PlaceHolder>

<asp:PlaceHolder runat="server" ID="Markup" Visible="false">
	<pre class="ks-snippet collapse <%= Collapsed ? "" : "in" %>"><code class="html"><asp:Literal runat="server" ID="MarkupContent"/></code></pre>
</asp:PlaceHolder>