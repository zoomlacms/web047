﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_User_EditJobsinfos, App_Web_pm0re3oi" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>会员组模型</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <asp:HiddenField runat="server" ID="Label1" Value="Label" />
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td colspan="2" style="line-height: 30px">
                <h1 style="text-align: center; font-size: 14px;">
                    <asp:Label ID="LblModelName" runat="server" Text="Label"></asp:Label>
                </h1>
            </td>
        </tr>
      <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
      <tr class="tdbgbottom">
        <td colspan="2"><asp:HiddenField ID="HdnModel" runat="server" />
          <asp:HiddenField ID="HdnModelName" runat="server" />
          <asp:HiddenField ID="HdnID" runat="server" />
          <asp:HiddenField ID="HdnType" runat="server" />
          <asp:TextBox ID="TextBox1" runat="server" Text="fbangd" Style="display: none"></asp:TextBox>
          <asp:Button ID="Button2" Text="保存" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary"/>
          <asp:Button ID="Button3" Text="返回"  runat="server" onclick="Button1_Click" class="btn btn-primary" /></td>
      </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Common.js" type="text/javascript"></script>

</asp:Content>
