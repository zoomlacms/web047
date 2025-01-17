﻿<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="Manage_Zone_SchoolShow, App_Web_5lxd3neg" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>学校预览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
    <tr>
        <td class="td_m text-right">学校名称:</td>
        <td>
            <asp:Label ID="SchoolName_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">所属省市:</td>
        <td>
            <asp:Label ID="SchoolAddress_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校类型:</td>
        <td>
            <asp:Label id="SchoolType_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校性质:</td>
        <td>
            <asp:Label ID="SchoolDis_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校微标:</td>
        <td>
            <asp:Label ID="SchoolIcon_L" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="text-right">学校信息:</td>
        <td>
            <asp:Label ID="SchoolInfo_L" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<div class="text-center"><a href="AddSchool.aspx?id=<%=SchoolID %>" class="btn btn-primary">重新修改</a> <a href="SnsSchool.aspx" class="btn btn-primary">返回列表</a></div>
</asp:Content>


