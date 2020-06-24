<%@ page language="C#" autoeventwireup="true" inherits="Design_User_Node_AddNode, App_Web_znbjbvne" masterpagefile="~/Design/Master/User.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link href="/Design/res/css/user.css" rel="stylesheet" />
<title>节点管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container siteinfo">
<ol class="breadcrumb">
    <li><a href="/User/Default.aspx">会员中心</a></li>
    <li><a href="/Design/User/">动力模块</a></li>
    <li><a href="NodeList.aspx?SiteID=<%:SiteID %>">节点列表</a></li>
    <li class="active">节点管理</li>
</ol>
<table class="table table-bordered table-striped">
     <tr><td>栏目名称</td><td><asp:TextBox runat="server" ID="NodeName_T" class="form-control text_300"/></td></tr>
     <tr><td>栏目图片</td><td><asp:TextBox runat="server" ID="NodePic_T" class="form-control text_300"></asp:TextBox></td></tr>
     <tr><td>栏目简介</td><td><asp:TextBox runat="server" ID="Description_T" class="form-control text_300"></asp:TextBox></td></tr>
     <tr><td>栏目META关键词</td><td><asp:TextBox TextMode="MultiLine" runat="server" ID="Meta_T" class="form-control" style="height:120px;"></asp:TextBox></td></tr>
     <tr><td>绑定模型</td><td>文章模型</td></tr>
     <tr><td>操作</td><td>
         <asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click" CssClass="btn btn-info" />
         <a href="NodeList.aspx?SiteID=<%:SiteID %>" class="btn btn-info">返回</a>
      </td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>