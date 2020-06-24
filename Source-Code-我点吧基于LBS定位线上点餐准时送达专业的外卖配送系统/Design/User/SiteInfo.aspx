<%@ page language="C#" autoeventwireup="true" inherits="Design_User_SiteInfo, App_Web_at5bm4te" masterpagefile="~/Design/Master/User.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link href="/Design/res/css/user.css" rel="stylesheet" />
<title>站点配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="siteinfo container">
    <ol class="breadcrumb">
        <li><a href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/Design/User/">动力模块</a></li>
        <li class="active">站点配置</li>
    </ol>
    <div class="itemBody">
        <div class="item">
            <span class="left_sp">站点名</span>
            <span class="mid_sp">
                <asp:TextBox runat="server" ID="SiteName_T" CssClass="form-control text_300" />
                <asp:RequiredFieldValidator runat="server" ID="R1" ForeColor="Red" ControlToValidate="SiteName_T" ErrorMessage="站点名不能为空" Display="Dynamic" />
            </span>
            <span class="right_sp"></span>
        </div>
        <div class="item" style="line-height:normal;height:auto;">
            <span class="left_sp">站点Logo</span>
            <div class="mid_sp">
                <ZL:FileUpload runat="server" ID="Logo_UP" AllowExt="jpg,png,gif" Style="display: inline-block;" />
                <asp:Image runat="server" ID="Logo_Img" Visible="false" Style="max-width: 200px; max-height: 100px;" />
            </div>
        </div>
        <div class="item">
            <span class="left_sp">站点地址</span>
            <span class="mid_sp">
                <asp:Label runat="server" ID="Domain_L"></asp:Label></span>
            <span class="right_sp"></span>
        </div>
        <div class="item">
            <span class="left_sp">状态</span>
            <span class="mid_sp">运行中</span>
            <span class="right_sp"></span>
        </div>
        <div class="item">
            <span class="left_sp"></span>
            <div class="mid_sp">
                <asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click" class="btn btn-primary" />
                <a href="Default.aspx" class="btn btn-default">返回</a>
            </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>