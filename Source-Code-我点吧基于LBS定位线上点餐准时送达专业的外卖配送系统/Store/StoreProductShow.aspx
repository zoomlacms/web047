﻿<%@ page language="C#" autoeventwireup="true" inherits="Store_StoreProductShow, App_Web_p3apkybw" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
<title>商品展示</title>
</head>
<body>
<form id="form1" runat="server">
<div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td><div align="center">商品展示</div></td>
</tr>
<tr>
<td>&nbsp;<asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
    <ItemTemplate><a href="../StoreCart.aspx?id=<%#DataBinder.Eval(Container.DataItem, "ID") %>&Pronum=1" target="_blank">
        <asp:Image ID="Image1" runat="server" Height="61px" Width="83px" ImageUrl='<%#GetPic(DataBinder.Eval(Container.DataItem, "Clearimg").ToString()) %>' /></a>
        <br /><a href="../StoreCart.aspx?id=<%#DataBinder.Eval(Container.DataItem, "ID") %>&Pronum=1" target="_blank"><%#DataBinder.Eval(Container.DataItem, "Proname")%></a>
    </ItemTemplate>
    </asp:DataList></td>
</tr>
</table>
</div>
</form>
</body>
</html>
