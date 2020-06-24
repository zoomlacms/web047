<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderList1.aspx.cs" MasterPageFile="~/User/Default1.master" Inherits="User_Order_OrderList1" %>
<%@ Register Src="~/User/ASCX/OrderTop.ascx" TagPrefix="ZL" TagName="OrderTop" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的订单</title>
<style>
body { background:#f0f2f5;}
.table {margin-bottom:0px;}
.orderlist .order-item { background:#fff; margin-top:10px; border-bottom:1px solid #e3e5e9;}
.orderlist .gray9{color:#999;}
.orderlist .orderinfo { }
.orderlist .shopinfo { font-size:12px;}
.orderlist .opinfo { position:absolute; top:50%; margin-top:-15px; right:15px; font-size:1.5em;}
.orderlist .opinfo a { color:#999; text-decoration:none;}
.orderlist .tips_div { padding-top:10px; padding-bottom:10px; padding-left:15px; padding-right:15px; border-top:1px solid #e3e5e9; border-bottom:1px solid #e3e5e9; position:relative;}
.orderlist .top_div{line-height:30px; background-color:#f5f5f5;margin-top:10px;}
.orderlist .prolist td{ line-height:70px; border-left:1px solid #ddd;height:70px;text-align:center;}
.orderlist .prolist td:last-child{border-right:none;}
.orderlist .proname div{padding:5px;}
.orderlist .goodservice {text-align:right;padding-right:20px;}
.orderlist .prolist .rowtd {line-height:20px;padding-top:30px;}
.orderlist .order_navs{position:relative;}
.search_div { padding:5px; background:#fff;}
.search_div .form-control { border-radius:0;}
.search_div .btn { border-radius:0;}
.orderlist .ordertime{color:#999;font-size:12px;}
.order_top { position:fixed; top:0; width:100%; height:44px; line-height:44px; z-index:2000; background-color: #ef473a; text-align:center; color:#fff;}
.order_top span.pull-left { position:absolute; left:0; top:0;}
.order_top span.pull-left a { display:block; width:42px; color:#fff; text-align:center; font-size:32px; text-decoration:none;}
.order_top span.pull-left a i { display:block; line-height:44px;}

.prolist { padding:10px 15px;}
.prolist .media { margin-top:10px;}
.prolist .media-left img { width:50px; height:50px; border:1px solid #e0e0e0; }
.prolist .media-heading { font-size:1em;}
.prolist .media p { margin-bottom:0; font-size:0.9em;}
.prolist .media p span { margin-right:5px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="input-group search_div">
<asp:TextBox ID="Skey_T" runat="server" placeholder="商品名称/商品编号/订单号" CssClass="form-control"></asp:TextBox>
<span class="input-group-btn">
<asp:LinkButton class="btn btn-danger" ID="Search_Btn" runat="server" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
</span>
</div>
<div class="orderlist">
<div class="order_navs">
<ul class="nav nav-tabs" id="OrderType_ul" role="tablist" hidden>
<li role="presentation" data-flag="all"><a href="?filter=">全部订单</a></li>
<li role="presentation" data-flag="needpay"><a href="?filter=needpay">待付款</a></li>
<li role="presentation" data-flag="receive"><a href="?filter=receive">待收货</a></li>
<li role="presentation" data-flag="comment"><a href="?filter=comment">待评价</a></li>
<li role="presentation" data-flag="recycle"><a href="?filter=recycle">回收站</a></li>
</ul>
</div>

<ZL:ExRepeater ID="Order_RPT" runat="server" OnPreRender="Order_RPT_PreRender" PagePre="<div class='clearfix'></div><div class='text-center' style='border:1px solid #ddd;padding:5px;border-top:none;'>" PageEnd="</div>"
OnItemDataBound="Order_RPT_ItemDataBound" OnItemCommand="Order_RPT_ItemCommand" PageSize="10">
<ItemTemplate>
<div class="order-item">
<div class="tips_div">
<div class="orderinfo">订单号：<%#Eval("OrderNo") %></div>
<div class="shopinfo"><span class="gray9"><i class="fa fa-home"> <asp:Label ID="Store_L" runat="server" /></i></span><span class="gray9" style="margin-left:10px;"><i class="fa fa-clock-o"></i> <%#Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %></span></div>
<div></div>
<div class="opinfo">
<asp:LinkButton runat="server" Visible="false" CommandArgument='<%#Eval("ID") %>' CommandName="del2" OnClientClick="return confirm('您确定要删除该订单吗？');"><i class="fa fa-trash" title="删除"></i></asp:LinkButton></th>
</div>
</div>
<div class="prolist">
<asp:Repeater ID="Pro_RPT" runat="server" EnableViewState="false" OnItemDataBound="Pro_RPT_ItemDataBound">
<ItemTemplate>
<div class="prolist_t">
<asp:Literal runat="server" ID="Order_Lit" EnableViewState="false"></asp:Literal>
<span><%#GetSnap() %></span>
</div>
<div class="media">
<div class="media-left media-middle"><a href="<%#GetShopUrl() %>"><img class="media-object" src="<%#GetImgUrl() %>" alt="<%#Eval("Proname") %>" onerror="this.src='/Images/nopic.gif'" /></a></div>
<div class="media-body">
<h4 class="media-heading"><%#Eval("Proname") %></h4>
<p>
<span style="color:#c00;">x<%#Eval("Pronum") %>=<%# Eval("AllMoney","{0:f2}") %></span>
</p>
</div>
</div>

</ItemTemplate>
</asp:Repeater>
</div>
</div>
</ItemTemplate>
<FooterTemplate></FooterTemplate>
</ZL:ExRepeater>

</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/Controls/DateHelper.js"></script>
<script>
	function ConfirmAction(obj, a) {
		if (!confirm("确定要执行该操作吗?")) { return false; }
		var oid = $(obj).data("oid");
		$.post("", { action: a, "oid": oid }, function (data) {
			location = location;
		})
	}
	function ShowDrawback(oid) {
		comdiag.maxbtn = false;
		comdiag.title = "取消订单";
		comdiag.url = "/User/Order/DrawBack.aspx?id=" + oid;
		comdiag.ShowModal();
	}
	function CheckOrderType(flag) {
		$("#OrderType_ul li").removeClass('active');
		$("#OrderType_ul [data-flag='" + flag + "']").addClass('active');
	}
	$(function () {
		ComputeTime();
		setInterval(function () { ComputeTime(); }, 1000);
	})
	//倒计时
	function ComputeTime() {
		$(".ordertime").each(function () {
			var seconds = parseInt($(this).data("time") - 1);
			var timeMod = DateHelper.SecondToTime((seconds));
			if (timeMod.isHasTime()) {
				var str = timeMod.hour + '小时' + timeMod.minute + '分'+timeMod.second+'秒';
				if (timeMod.day > 0) { str = timeMod.day + "天" + str; }
				$(this).html('<span class="glyphicon glyphicon-time"></span>' + str);
				$(this).data("time", seconds);
			}
			else { $(this).html('订单关闭'); }
		});
	}
</script>
</asp:Content>