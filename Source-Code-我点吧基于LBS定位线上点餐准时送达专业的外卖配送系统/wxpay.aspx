<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wxpay.aspx.cs" Inherits="test_wxpay" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
    <asp:Button runat="server" ID="Transfer_Btn" Text="企业付款" OnClick="Transfer_Btn_Click" />
    <asp:Button runat="server" ID="BackMoney_Btn" Text="测试退款" OnClick="BackMoney_Btn_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>