﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Qmail_MailShow, App_Web_l0atfmr1" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>查看邮件</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div>
    <table class="table table-striped table-bordered table-hover">
      <tr>
        <td colspan="2" align="center" class="spacingtitle"> 查看邮件信息</td>
      </tr>
      <tr>
        <td align="center" id="tdtitle" runat="server" class="tdbgleft"></td>
      </tr>
      <tr>
        <td class="tdbgleft" id="tdtime" runat ="server" align="center"></td>
      </tr>
      <tr>
        <td id="tdcontext" runat="server" ></td>
      </tr>
      <tr>
        <td></td>
      </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
