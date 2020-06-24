<%@ Page Title="" Language="C#" MasterPageFile="~/User/Default1.master" AutoEventWireup="true" CodeFile="OrderList1.aspx.cs" Inherits="User_UserShop_OrderList1" ClientIDMode="Static" ValidateRequest="false" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的店铺</title>
<link href="/App_Themes/V3.css" rel="stylesheet" type="text/css" /> 
<style>
body { background:#f0f2f5;}
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
label { font-weight:normal; margin-bottom:0;}
.weui_cells { font-size:1em; margin-top:0;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">快速筛选</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:DropDownList ID="QuickSearch_DP" CssClass="form-control input-sm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="QuickSearch_DP_SelectedIndexChanged">
<asp:ListItem Value="0" Text="<%$Resources:L,所有订单 %>" Selected="True"></asp:ListItem>
<asp:ListItem Value="2" Text="<%$Resources:L,今天的新订单 %>"></asp:ListItem>
<asp:ListItem Value="4" Text="<%$Resources:L,最近10天内的新订单 %>"></asp:ListItem>
<asp:ListItem Value="5" Text="<%$Resources:L,最近一个月内的新订单 %>"></asp:ListItem>
<asp:ListItem Value="6" Text="<%$Resources:L,未确认的订单 %>"></asp:ListItem>
<asp:ListItem Value="7" Text="<%$Resources:L,未付款的订单 %>"></asp:ListItem>
<asp:ListItem Value="8" Text="<%$Resources:L,未付清的订单 %>"></asp:ListItem>
<asp:ListItem Value="9" Text="<%$Resources:L,未送货的订单 %>"></asp:ListItem>
<asp:ListItem Value="10" Text="<%$Resources:L,未签收的订单 %>"></asp:ListItem>
<asp:ListItem Value="11" Text="<%$Resources:L,未结清的订单 %>"></asp:ListItem>
<asp:ListItem Value="12" Text="<%$Resources:L,未开发票的订单 %>"></asp:ListItem>
<asp:ListItem Value="13" Text="<%$Resources:L,已经作废的订单 %>"></asp:ListItem>
<asp:ListItem Value="14" Text="<%$Resources:L,暂停处理的订单 %>"></asp:ListItem>
<asp:ListItem Value="15" Text="<%$Resources:L,已发货的订单 %>"></asp:ListItem>
<asp:ListItem Value="16" Text="<%$Resources:L,已签收的订单 %>"></asp:ListItem>
<asp:ListItem Value="17" Text="<%$Resources:L,已结清的订单 %>"></asp:ListItem>
<asp:ListItem Value="18" Text="<%$Resources:L,已申请退款的订单 %>"></asp:ListItem>
</asp:DropDownList>
</div>
</div>
</div>
<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">高级查询</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:DropDownList ID="SkeyType_DP" CssClass="form-control input-sm" runat="server">
<asp:ListItem Selected="True" Value="1" Text="<%$Resources:L,订单编号 %>"></asp:ListItem>
<asp:ListItem Value="2" Text="<%$Resources:L,客户名称 %>"></asp:ListItem>
<asp:ListItem Value="3" Text="<%$Resources:L,用户名 %>"></asp:ListItem>
<asp:ListItem Value="4" Text="<%$Resources:L,收货人 %>"></asp:ListItem>
<asp:ListItem Value="5" Text="<%$Resources:L,联系地址 %>"></asp:ListItem>
<asp:ListItem Value="6" Text="<%$Resources:L,联系电话 %>"></asp:ListItem>
<asp:ListItem Value="7" Text="<%$Resources:L,下单时间 %>"></asp:ListItem>
<asp:ListItem Value="8" Text="<%$Resources:L,备注留言 %>"></asp:ListItem>
<asp:ListItem Value="9" Text="<%$Resources:L,商品名称 %>"></asp:ListItem>
<asp:ListItem Value="10" Text="<%$Resources:L,收货人邮箱 %>"></asp:ListItem>
<asp:ListItem Value="11" Text="<%$Resources:L,发票信息 %>"></asp:ListItem>
<asp:ListItem Value="12" Text="<%$Resources:L,内部记录 %>"></asp:ListItem>
<asp:ListItem Value="13" Text="<%$Resources:L,跟单员 %>"></asp:ListItem>
</asp:DropDownList>
</div>
</div>
</div>
<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">关键字</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="Skey_T" class="form-control input-sm" placeholder="<%$Resources:L,请输入需要搜索的内容 %>" />
</div>
</div>
</div>
<div class="col-xs-12" style="margin-top:10px;">
<asp:LinkButton runat="server" CssClass="btn btn-success btn-block" ID="Skey_Btn" OnClick="Skey_Btn_Click"><i class="fa fa-search"></i> 搜索</asp:LinkButton>
</div>
<div class="clearfix"></div>
<div class="orderlist">
<ZL:ExRepeater runat="server" ID="Store_RPT" PageSize="10" PagePre="<tr id='page_tr'><td><input type='checkbox' id='chkAll'/></td><td colspan='12' id='page_td'>" PageEnd="</td></tr>" OnItemDataBound="Order_RPT_ItemDataBound">
<ItemTemplate>
<div class="order-item">
<div class="tips_div">
<div class="orderinfo">订单号：<%#Eval("OrderNo") %></div>
<div class="shopinfo">
<span><i class="fa fa-user"></i> zhengchen001</span>
<span class="gray9" style="margin-left:5px;"><i class="fa fa-clock-o"></i> <%#Eval("AddTime","{0:yyyy-MM-dd HH:mm:ss}") %></span>
</div>
<div class="prolist_t">
<span>实际金额：<%#GetPriceStr(Eval("id", "{0}"))%></span>
<span style="color:#c00;">收款金额：<%#Eval("Receivablesamount","{0:F2}")%></span>
<span style="color:#c00;"> <i class="fa fa-rmb"></i> 13.00</span><br>
(<%#formatzt(Eval("Paymentstatus", "{0}"),"1")%>) <%#formatzt(Eval("OrderStatus", "{0}"),"0")%> <span><%#formatzt(Eval("StateLogistics", "{0}"),"2")%></span><br>
<span><a href="OrderListInfo1.aspx?ID=<%#Eval("ID") %>"><i class="fa fa-file-text"></i> 订单详情</a></span>
<%#GetOP() %>
</div>
</div>
<div class="prolist" style="padding-top:0;">
<asp:Repeater ID="Pro_RPT" runat="server" EnableViewState="false" OnItemDataBound="Pro_RPT_ItemDataBound">
<ItemTemplate>
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
<FooterTemplate>
<tr>
<td colspan="13"><span>实际金额合计:</span><span class="rd_red_l"><%#GetTotalSum() %></span></td>
</tr>
</FooterTemplate>
</ZL:ExRepeater>


<asp:HiddenField runat="server" ID="TotalSum_Hid" />
<div class="btn_green"><asp:Button ID="Bat_Del" class="btn btn-primary" Text="删除订单" runat="server" OnClick="BatDel_Btn_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" /></div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
$(function () {
$("#chkAll").click(function () {
selectAllByName(this, "idchk");
});
})
function IsSelectedId() {
var checkArr = $("input[type=checkbox][name=idchk]:checked");
if (checkArr.length > 0)
return true
else
return false;
}
function ShowDetail(orderno) {
comdiag.maxbtn = false;
comdiag.reload = true;
ShowComDiag("/User/Order/OrderDetails.aspx?OrderNo=" + orderno, "订单明细");
}
function CloseDetail() {
CloseComDiag();
}
function ShowElement(id) {
$("#" + id).show();
}
</script>
</asp:Content>
