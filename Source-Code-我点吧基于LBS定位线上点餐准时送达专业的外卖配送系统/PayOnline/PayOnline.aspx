<%@ Page Language="C#" ResponseEncoding="utf-8" AutoEventWireup="true" CodeFile="PayOnline.aspx.cs" Inherits="ZoomLa.WebSite.Shop.PayOnline" EnableViewStateMac="false" Debug="true"  %><!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit" />
<title>在线支付</title>
<script src="/JS/jquery-1.11.1.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
<link href="/App_Themes/User.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="main_div">
<div class="container padding_r10">
<div runat="server" id="logged_div" visible="false" class="pull-right">
<a href="#" class="grayremind" runat="server" id="logged_a" ></a>
<a href="/User/Order/OrderList1.aspx" class="btn btn-primary btn-xs">我的订单</a>
<a href="/User/Logout.aspx" class="btn btn-primary btn-xs">退出</a>
</div>
</div>
</div>
<div class="mainpay_div container">
<div class="margin_t10" runat="server" id="payinfo_div">
<div class="alert alert-info" role="alert">
订单提交成功，请您尽快付款!<br />
订单号：<asp:Label ID="OrderNo_L" runat="server"></asp:Label><br />
应付金额：<asp:Label ID="LblPayMoney" runat="server" CssClass="r_red"></asp:Label><br />
<asp:Label Text="手续费：" ID="Fee" runat="server"></asp:Label><asp:Label ID="LblRate" CssClass="r_red" runat="server"></asp:Label><br />
支付方式：<asp:Label ID="VMoneyPayed_L" runat="server" CssClass="r_orange"></asp:Label> <a href="/PayOnline/Orderpay.aspx?PayNo=<%:PayNo %>" class="margin_l5">重新选择</a><br />
</div>
<div>
<div class="margin_t10" runat="server" visible="false" id="Alipay_Btn">
<input type="button" value="确定付款" class="btn btn-primary" onclick="alipaySubmit();" />
</div>
<div class="margin_t10 text-center">
<asp:Button runat="server" Text="确定支付" class="btn btn-danger btn-lg" Visible="false" ID="Confirm_VMoney_Btn" OnClick="Confirm_Click" /><%//虚拟币,微信支付,Mobo %>
</div>
</div>
</div>
<div class="margin_t10" runat="server" id="AfterPay_Tb">
<div class="alert alert-info" role="alert">
恭喜您,下单成功！<br />
支付方式：<asp:Label ID="zfpt" runat="server" CssClass="r_orange"></asp:Label><br />
订单号：<asp:Label ID="ddh" runat="server"></asp:Label><br />
支付金额：<asp:Label ID="PayNum_L2" runat="server" CssClass="r_red"></asp:Label><br />
<asp:Label ID="fees" runat="server" Text="手续费："></asp:Label><asp:Label ID="sxf" runat="server" CssClass="r_red"></asp:Label><br />
<div id="ActualAmount" runat="server" visible="false"><span>实际金额：</span><asp:Label ID="sjhbje" runat="server" CssClass="r_red"></asp:Label></div>
<asp:Literal runat="server" ID="remindHtml" EnableViewState="false"></asp:Literal>
<div class="text-center">
<asp:HyperLink runat="server" ID="Rurl_Href" CssClass="btn btn-primary">我的订单</asp:HyperLink>
</div>
</div>
</div>
</div>
<div id="payremind_div" style="display:none;">
<div class="panel panel-primary">
<div class="panel-heading"><span class="glyphicon glyphicon-bookmark"></span><span class="margin_l5">登录平台支付</span></div>
<div class="panel-body">
<div style="padding-bottom: 15px; padding-left: 10px;">请您在新打开的支付平台页面进行支付,支付完成前请不要关闭该窗口</div>
<div class="text-center">
<a href="/User/Order/OrderList.aspx" class="btn btn-primary">已完成支付</a>
<a href="OrderPay.aspx?PayNo=<%:PayNo %>" class="btn btn-primary margin_l20">重选支付平台</a>
</div>
</div>
</div>
</div>
</form>
<asp:Panel runat="server" ID="alipay_form" style="display:none;"><div class="margin_t5" runat="server" id="LblHiddenValue"></div></asp:Panel>
<style type="text/css">
.r_orange {color: #F60;font-weight:bolder;font-size:1.1em;}
.paytable{margin: auto; width:100%; margin-top: 10px;border:1px solid #ccc;}
.paytable { line-height: 30px; background: #eaf3fc; padding: 20px;padding-bottom:10px; }
.paytable strong { font-size: 20px; color: #6699ff }
.paypwd_div {width:300px;}
.payed div {margin-top:5px;}
@media (max-width:768px) {.minwidth {width:100%;}}
</style>
<script>
function alipaySubmit() {
$("#payform").submit();
var diag = new ZL_Dialog();
diag.maxbtn = false;
diag.closebtn = false;
diag.backdrop = true;
diag.width = "minwidth";
diag.title = "正在支付";
diag.body = $("#payremind_div").show().html(); $("#payremind_div").remove();
diag.ShowModal();
}
</script>
</body>
</html>