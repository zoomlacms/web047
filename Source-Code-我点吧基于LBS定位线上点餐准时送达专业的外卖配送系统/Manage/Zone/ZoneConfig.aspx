﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Zone_ZoneConfig, App_Web_5lxd3neg" masterpagefile="~/Manage/I/Default.master" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <title>会员空间配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td class="tdleft" style="width:300px">空间申请是否需要经过审核：</td>
                <td>
                    <input type="checkbox" runat="server" id="RadioButtonList1" class="switchChk" checked="checked" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>
