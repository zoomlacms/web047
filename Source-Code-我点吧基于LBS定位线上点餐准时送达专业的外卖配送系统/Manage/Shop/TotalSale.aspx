﻿<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.TotalSale, App_Web_trhqh1zy" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>总体销售统计</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td align="center" style="height: 23px">
                从
                <asp:TextBox ID="toptime" runat="server" CssClass="form-control" Width="184px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" />
                至
                <asp:TextBox ID="endtime" runat="server" CssClass="form-control" Width="184px" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" />
                <asp:Button ID="Button1" Text="查询" runat="server" class="btn btn-primary" />
            </td>
        </tr>
    </table>
    <div align="center">
        客户平均订单金额
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td width="33%">总订单金额</td>
            <td width="33%">总订单数</td>
            <td width="33%">客户平均订单金额</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <div align="center">
        <br />
        <br />
        每次访问平均订单金额<br />
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td width="33%">总订单金额</td>
            <td width="33%">总订单数</td>
            <td width="33%">客户平均订单金额</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <div align="center">
        <br />
        匿名订单购买率<br />
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td width="33%">总订单金额</td>
            <td width="33%">总订单数</td>
            <td width="33%">客户平均订单金额</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label8" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <div align="center">
        <br />
        注册会员购买率<br />
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr align="center">
            <td width="33%">总订单金额</td>
            <td width="33%">总订单数</td>
            <td width="33%">客户平均订单金额</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label10" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label11" runat="server" Text=""></asp:Label></td>
            <td align="center">
                <asp:Label ID="Label12" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
