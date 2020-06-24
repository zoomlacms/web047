<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.MessageRead, App_Web_1fohelez" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>阅读站内邮</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container btn_green">
<ol class="breadcrumb">
    <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
    <li><a href="Message.aspx">消息中心</a></li>
    <li class="active">阅读站内邮</li>
</ol>
<div class="btn-group">
    <a href="MessageSend.aspx" class="btn btn-primary">新消息</a>
    <a href="Message.aspx" class="btn btn-primary">收件箱</a>
    <a href="MessageOutbox.aspx" class="btn btn-primary">发件箱</a>
    <a href="MessageDraftbox.aspx" class="btn btn-primary">草稿箱</a>
    <a href="MessageGarbagebox.aspx" class="btn btn-primary">垃圾箱</a>
    <a href="Mobile.aspx" class="btn btn-primary">手机短信</a>
</div>
<div class="margin_t10">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="text-right td_m">发件人</td>
            <td class="tdRight">
                <asp:Label ID="LblSender" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">收件人</td>
            <td class="tdRight">
                <asp:Label ID="LblIncept" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">标题</td>
            <td class="tdRight">
                <asp:Label ID="LblTitle" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">发送时间</td>
            <td class="tdRight">
                <asp:Label ID="LblSendTime" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">内容</td>
            <td class="tdRight">
                <asp:Literal runat="server" ID="txt_Content"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="text-right">附件</td>
            <td>
                <div id="uploader" class="uploader">
                    <ul class="filelist"></ul>
                </div>
                <asp:HiddenField runat="server" ID="Attach_Hid" />
            </td>
        </tr>
        <tr>
            <td class="text-right">操作</td>
            <td class="tdRight">
                <a href="MessageSend.aspx?id=<%:Mid %>" class="btn btn-primary">回复</a>
                <asp:Label ID="CC_Btn" runat="server" Text="抄送文件无法操作" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ICMS/ZL_Common.js"></script>
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Webup.js"></script>
<script>
    $(function () {
        ZL_Webup.AddReadOnlyLi($("#Attach_Hid").val());
    })
</script>
</asp:Content>
