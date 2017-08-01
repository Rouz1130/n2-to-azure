<%@ Page Language="C#" Inherits="System.Web.UI.Page" MasterPageFile="~/Base.master" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">
    <p>Click the buttons to add or clear iframe content so its height increases.</p>
    <button type="button" class="btn btn-primary">Add Content</button>
    <button type="button" class="btn btn-secondary">Clear Content</button>
    <div id="sample-content"></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageStyles">
    <style type="text/css">
		body { background-color: #fff; }
        .container-fluid { padding: 0; }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="PageScript">
    <script>
        $(function () {
            $('.btn-primary').click(function () {
                $('#sample-content').append('<p>This is sample content</p>');
            });
            $('.btn-secondary').click(function () {
                $('#sample-content').html('');
            });
        });
    </script>
</asp:Content>