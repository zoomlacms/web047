<%@ page language="C#" masterpagefile="~/User/Default1.master" autoeventwireup="true" inherits="User_Info_UserRecei, App_Web_mmvpaehb" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>用户地址薄</title>
<style>
body { background:#fbf9fe;}
.address_list_t a { display:block; padding:15px 20px; background:#f5f5f5; color:#666; border:1px solid #ddd; border-bottom:1px solid #ddd;}
.address_list_t a span { display:block; float:right; width:23px; height:23px; background:url(/Template/DianBa/style/images/plus_bg.png) center no-repeat;}
.address_list_c .panel { margin-top:10px; margin-bottom:0; border-radius:0;}
.address_list_c .panel-body p { margin-bottom:0;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb" style="margin-bottom:10px;">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li class="active">我的地址薄</li>
</ol>

<div class="address_list">
<div class="address_list_t"><a href="AddUserAddress1.aspx">新增收货地址<span></span></a></div>
<ZL:ExRepeater runat="server" ID="RPT" PageSize="10" PagePre="<div class='clearfix'></div><div class='text-center' style='margin-top:10px;'>" PageEnd="</div>" OnItemCommand="RPT_ItemCommand" OnItemDataBound="RPT_ItemDataBound">
<ItemTemplate>
<div class="address_list_c">
<div class="panel <%#Eval("isDefault","").Equals("1")?"panel-info":"panel-default" %>  text-left">
<div class="panel-heading">
<i class="fa fa-user"></i> <strong><%#Eval("ReceivName") %></strong> <i class="fa fa-mobile-phone" style="font-size:16px;"></i> <%#Eval("MobileNum")%>
<%#Eval("isDefault","").Equals("1")?" <i class='fa fa-check pull-right' title='默认'></i>":""%>
</div>
<div class="panel-body">
<p>所在地区：<span><%# Eval("Provinces") %></span><br/>
地址：<%# Eval("Street") %><br/>
邮编：<%# Eval("ZipCode") %></p>
</div>
<div class="panel-footer">
<a href="AddUserAddress1.aspx?id=<%#Eval("ID") %>" class="btn btn-danger" title="修改"><i class="fa fa-pencil"></i> 修改</a>
<asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" CssClass="btn btn-warning" CommandName="del"><i class="fa fa-trash"></i> 删除</asp:LinkButton>
<asp:LinkButton ID="Def_Btn" runat="server" CssClass="pull-right btn btn-info" CommandArgument='<%#Eval("ID") %>' CommandName="def">设为默认</asp:LinkButton>
</div>
</div>
</div>
</ItemTemplate>
<FooterTemplate></FooterTemplate>
</ZL:ExRepeater>
</div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.add_left {text-align:right;color:#999;display:inline-block;width:70px;line-height:22px;}
</style>
</asp:Content>