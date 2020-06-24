<%@ page language="C#" autoeventwireup="true" inherits="Tools_test, App_Web_nr1g0rw0" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="color:gray;width:160px;height:60px;">
        <i class="fa fa-image" style="font-size: 5em;"></i>
        <div>上传网站Logo</div>
    </div>
    <div class="input-group text_400">
        <ZL:FileUpload runat="server" ID="Logo_UP" AllowExt="jpg,png,gif" Style="display: inline-block;" CssClass="form-control" />
        <span class="input-group-btn">
            <asp:Button runat="server" ID="Logo_Btn" CssClass="btn btn-info" Text="上传Logo" OnClick="Logo_Btn_Click"/>
        </span>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <link href="/App_Themes/User.css" rel="stylesheet" />
</asp:Content>