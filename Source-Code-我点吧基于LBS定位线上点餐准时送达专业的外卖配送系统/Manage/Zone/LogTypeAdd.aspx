﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_LogTypeAdd, App_Web_5lxd3neg" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加族群类型</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td colspan="2" class="text-center">族群类型添加</td>
            </tr>
            <tr>
                <td class="tdleft td_l"><strong>类型名称：</strong></td>
                <td>
                    <asp:TextBox ID="Nametxt" class="form-control" runat="server" MaxLength="15"></asp:TextBox>
                    <span style="color: #ff0000">* </span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Nametxt" ErrorMessage="不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="addbtn" class="btn btn-primary" runat="server" Text="保存" OnClick="addbtn_Click" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
