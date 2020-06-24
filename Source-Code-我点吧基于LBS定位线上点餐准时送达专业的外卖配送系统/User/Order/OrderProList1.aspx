<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderProList1.aspx.cs" Inherits="User_OrderProList1" MasterPageFile="~/User/Default1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>订单商品列表</title>
<style>
    body { background:#fbf9fe;}
    .SumDiv li {list-style: none;display:inline-table;margin-right: 50px;line-height: 10px;}
    .orderpro_list .media-left img { width:50px; height:50px;}
    .weui_media_appmsg_thumb { border:1px solid #ddd; width:60px; height:60px;}
    .weui_media_box .weui_media_title { margin-top:0; font-size:1.1em;}
    .weui_media_desc { margin-bottom:0;}
    .orderpro_list a { text-decoration:none;}
    .orderpro_pay { padding:10px 0; margin-top:10px; background:#fff; border-top:1px solid #e5e5e5; border-bottom:1px solid #e5e5e5;}
    .orderpro_pay_t { margin-bottom:5px; padding:0 10px; font-size:13px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li><a href="OrderList1.aspx">我的订单</a></li>
<li class="active">商品列表</li>
</ol>
<div class="orderpro_list">
<div class="weui_panel weui_panel_access">
<div class="weui_panel_hd">共计<%= pronum %>个商品</div>
<div class="weui_panel_bd">
<asp:Repeater ID="RPT" runat="server">
<ItemTemplate>
<a href="<%#GetShopUrl()%>" class="weui_media_box weui_media_appmsg">
<div class="weui_media_hd"><img class="weui_media_appmsg_thumb" src="<%# ZoomLa.Components.SiteConfig.SiteOption.UploadDir + Eval("Thumbnails") %>" alt="<%# Eval("Proname") %>" onerror="javascript:this.src='/UploadFiles/nopic.gif';" /></div>
<div class="weui_media_bd">
<h4 class="weui_media_title"><%# Eval("Proname") %></h4>
<p class="weui_media_desc">
<span>数量：<%# Eval("Pronum") %></span>
<span>总计金额：<i class="fa fa-rmb"></i> <%#GetMyPrice() %></span><br />
<span>日期：<%#Eval("AddTime","{0:yyyy年MM月dd日 HH:mm}") %></span>
</p>
</div>
</a>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
</div>
<div class="orderpro_pay">
<div class="orderpro_pay_t">
<asp:Label runat="server" ID="Total_L"></asp:Label><br />
已付款：<asp:Label ID="labelmoney01" runat="server"></asp:Label>元<br />
快递公司：<asp:Label ID="ExpressNum_T" runat="server"></asp:Label><br />
物流单号：<asp:Label ID="ExpressDelivery_T" runat="server"></asp:Label>
</div>
<div class="padding10">
<a href="#" visible="false" runat="server" id="PayUrl_A" class="btn btn-danger btn-block">前往付款</a>
<a  href="javascript:history.back();"  class="btn btn-info btn-block">返回列表</a>
</div>
<div class="panel panel-primary" runat="server" id="User_Div" visible="false">
<div class="panel-heading"><span class="glyphicon glyphicon-user"></span><span class="margin_l5">客户详情</span></div>
<div class="panel-body">
<table class="table table-bordered">
<tr>
<td class="td_m">姓名</td>
<td>证件号</td>
<td>手机</td>
<td>备注</td>
</tr>
<asp:Repeater runat="server" ID="UserRPT" EnableViewState="false">
<ItemTemplate>
<tr>
<td><%#Eval("Name") %></td>
<td><%#Eval("CertCode") %></td>
<td><%#Eval("Mobile") %></td>
</tr>
</ItemTemplate>
</asp:Repeater>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>