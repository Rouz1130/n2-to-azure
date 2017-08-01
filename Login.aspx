<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Base.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="XOMFL.CommonComponents.Login" %>

<asp:Content runat="server" ContentPlaceHolderID="BodyContent">
	<div class="container" style="padding-top:50px;">
		<div class="row">
			<div class="col-md-4 col-md-push-4">
				<div class="form-group">
					<label>Username</label>
					<asp:TextBox runat="server" ID="Username" MaxLength="16" CssClass="form-control" />
				</div>
				<div class="form-group">
					<label>Password</label>
					<asp:TextBox runat="server" ID="Password" MaxLength="16" CssClass="form-control" TextMode="Password" />
				</div>
				<p class="text-center"><input type="submit" class="btn btn-primary" value="Log in here" /></p>
				<asp:Literal runat="server" ID="Error">
					<p class="well error text-center">Invalid credentials.</p>
				</asp:Literal>
			</div>
		</div>
	</div>
</asp:Content>
