<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orderpay.aspx.cs" Inherits="ZoomLa.WebSite.PayOnline.Orderpay" EnableViewStateMac="false" MasterPageFile="~/Cart/order1.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>选择支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<div class="alert alert-info margin_t10" role="alert">
订单号:<asp:Label ID="OrderNo_L" runat="server" ForeColor="Green"></asp:Label><br/>
应付金额:<asp:Label ID="TotalMoney_L" runat="server"></asp:Label>
<ul class="list-unstyled margin_t5">
<asp:Repeater runat="server" ID="PayPlat_RPT">
<ItemTemplate>
<li class="payplat_li plat_item col-lg-3 col-md-4 col-sm-6 col-xs-12 text-left" title="<%#Eval("PayPlatName") %>">
<input type="radio" class="payplat_rad" name="payplat_rad" value="<%#Eval("PayPlatID") %>" />
<img src="<%#GetPlatImg()%>" class="plat_item_img" />
</li>
</ItemTemplate>
</asp:Repeater>
<li class="clearfix"></li>
</ul>
<div runat="server" id="virtual_ul">
<ul class="dashpay_ul margin_t5" style="margin-bottom:0;">
<li runat="server" id="purseli" title="用户余额支付" visible="false">
<input type="radio" name="payplat_rad" value="Purse" />
<div class='pay_btn'><i class="fa fa-credit-card"> 余额支付</i></div>
</li>
<li runat="server" id="siconli" title="用户银币支付" visible="false">
<input type="radio" name="payplat_rad" value="SilverCoin" />
<div class='pay_btn'><i class="fa fa-rouble">银币支付</i></div>
</li>
<li runat="server" id="pointli" title="用户积分支付" visible="false">
<input type="radio" name="payplat_rad" value="Score" />
<div class='pay_btn'><i class="fa fa-money">积分支付</i></div>
</li>
<div class="clearfix"></div>
</ul>
</div>
<div class="clearfix"></div>

</div>
<div class="text-center">
<asp:Button ID="PoinPay_Btn" CssClass="btn btn-warning btn-block btn-lg" Text="积分兑换" runat="server" OnClick="PoinPay_Btn_Click" style="text-align:center;" Visible="false" />

<asp:Button ID="BtnSubmit" CssClass="btn btn-warning btn-block btn-lg" Text="确定支付方式" runat="server" OnClick="BtnSubmit_Click" style="text-align:center;" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.list_sp {min-width:60px;display:inline-block;text-align:right;font-weight:bold;line-height:20px;height:20px;margin-right:2px;}
.pay_head {padding:5px;padding-left:10px;}
.paytitle {color: #F60;height:30px;line-height:30px;font-weight:bold;}
.PayPlat_s {border-top: 1px solid #ccc; background: #fffdee; padding: 10px; }
.dashpay_ul{float:left;width:100%;margin-left:-10px;}
.dashpay_ul li{float:left;margin-left:10px; line-height:40px; color:#fff;cursor:pointer;margin-bottom:5px;}
.pay_btn{display:inline-block; border-radius:5px; width:149px; height:39px; background:#428bca;text-align:left; padding-left:15px;}
.pay_btn i{font-size:16px;font-weight:700;}
.payplat_li {cursor:pointer;padding-left:0;padding-right:0; float:left;margin-bottom:5px;}
.plat_item_img {border:1px solid #ddd;cursor:pointer;width:149px;height:39px;}
</style>
<script>
$(function () {
	$(".plat_item_img").click(function () { $(this).siblings(":radio")[0].checked = true; });
	$(".dashpay_ul li").click(function () {
		$(".dashpay_ul .active").removeClass('active');
		$(this).find('input')[0].checked = true;
		$(this).addClass('active');
	});
	if ($(".payplat_rad").length > 0) { $(".payplat_rad:first")[0].checked = true; }
})
</script>
</asp:Content>