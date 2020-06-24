<%@ page language="C#" autoeventwireup="true" inherits="Design_Admin_TlpList, App_Web_yo0pux1s" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>模板列表</title>
<link href="/design/res/css/user.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="list-unstyled" id="tlp_ul" style="min-height:500px;">
<asp:Repeater runat="server" ID="RPT" OnItemCommand="RPT_ItemCommand">
<ItemTemplate>
<li>
    <img class="tlpimg" src="<%#Eval("PreviewImg") %>" onerror="this.src='/Images/nopic.gif';" />
    <div class="tlp_opdiv">
       <span class="r_gray">价格:<%#GetPrice() %></span>
        <div class="pull-right">
            <a href="/Design/Preview.aspx?TlpID=<%#Eval("ID") %>" class="btn btn-xs btn-info" target="_blank"><i class="fa fa-search"></i> 浏览</a>
            <asp:LinkButton runat="server" CssClass="btn btn-xs btn-info" CommandName="apply" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要应用此模板吗,将会覆盖你原有配置');"><i class="fa fa-adjust"></i> 应用</asp:LinkButton>
        </div>
    </div>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
#tlp_ul .tlpimg {display:inline-block;height:142px;width:182px;border:1px solid #ddd;padding:3px;}
</style>
</asp:Content>