﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Status.ascx.cs" Inherits="XOMFL.CommonComponents.controls.Status" %>
<p class="status"><span class="glyphicon glyphicon-<%=Complete ? "ok" : "wrench"%>"></span> <span class="text"><%=Text%></span></p>