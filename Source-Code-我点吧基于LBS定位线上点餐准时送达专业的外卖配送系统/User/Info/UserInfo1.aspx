<%@ Page Language="C#" MasterPageFile="~/User/Default1.master"  AutoEventWireup="true" CodeFile="UserInfo1.aspx.cs" Inherits="ZoomLa.WebSite.User.UserInfo1" %>
<%@ Import Namespace="ZoomLa.Model" %>
<%@ Register Src="~/Manage/I/ASCX/UserInfoBar.ascx" TagPrefix="ZL" TagName="UserBar" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>注册信息</title>
<style>
.weui_navbar a { color:#333; text-decoration:none;}
.weui_cells { font-size:1em;}
.weui_label { font-size:1em; font-weight:normal; margin-bottom:0;}

</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="navbar" style="border:none;">
<div class="bd" style="height: 100%;">
<div class="weui_tab">
<div class="weui_navbar">
<a class="weui_navbar_item weui_bar_item_on" href="UserInfo1.aspx">注册信息</a>
<a class="weui_navbar_item" href="UserBase1.aspx">基本信息</a>
</div>
</div>
</div>
</div>

<div class="weui_cells">

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">用户名</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblUser" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">Email</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblEmail" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">会员组</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblGroup" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">加入时间</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblJoinTime" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">注册时间</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblRegTime" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">登录次数</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblLoginTimes" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">最近登录时间</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblLastLogin" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">最近登录IP</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblLastIP" runat="server" ></asp:Label></div>
</div>

<div class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">推荐人</label></div>
<div class="weui_cell_ft"><asp:Label ID="LblParentUserID" runat="server" ></asp:Label></div>
</div>



</div>

<div class="weui_cells weui_cells_access">

<a href="ConsumeDetail1.aspx?SType=1" class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">余额</label></div>
<div class="weui_cell_ft"><asp:Label ID="Purse_L" runat="server"></asp:Label></div>
</a>

<a href="ConsumeDetail1.aspx?SType=2" class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">银币</label></div>
<div class="weui_cell_ft"><asp:Label ID="Sicon_L" runat="server"></asp:Label></div>
</a>

<a href="ConsumeDetail1.aspx?SType=3" class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">积分</label></div>
<div class="weui_cell_ft"><asp:Label ID="Point_L" runat="server"></asp:Label></div>
</a>

<a href="ConsumeDetail1.aspx?SType=4" class="weui_cell">
<div class="weui_cell_bd weui_cell_primary"><label class="weui_label">点券</label></div>
<div class="weui_cell_ft"><asp:Label ID="UserPoint_L" runat="server"></asp:Label></div>
</a>

</div>

<div style="padding:10px;" hidden>
<input id="Button2" type="button" value="基本信息" class="btn btn-primary" onclick="javascript: location.href = 'UserBase.aspx'" />
<a href="/PayOnline/SelectPayPlat.aspx" target="_blank" class="btn btn-primary">充值金额</a>
<a href="/User/ChangPSW.aspx" class="btn btn-primary">修改密码</a>
<input type="button" value="兑换金额" class="btn btn-primary"  onclick="showMoneyConver();" />
<div style="height:5px;"></div>
<a href="ConsumeDetail.aspx?SType=<%:(int)M_UserExpHis.SType.Purse %>" class="btn btn-primary">金额明细</a>
<a href="ConsumeDetail.aspx?SType=<%:(int)M_UserExpHis.SType.SIcon %>" class="btn btn-primary">银币明细</a>
<a href="ConsumeDetail.aspx?SType=<%:(int)M_UserExpHis.SType.Point %>" class="btn btn-primary">积分明细</a>
<input type="button" value="赠送资金" class="btn btn-primary" onclick="showGive(<%:(int)M_UserExpHis.SType.Purse %>);"/>     
<input type="button" value="赠送银币" class="btn btn-primary" onclick="showGive(<%:(int)M_UserExpHis.SType.SIcon %>);"/>     
<input type="button" value="赠送积分" class="btn btn-primary" onclick="showGive(<%:(int)M_UserExpHis.SType.Point %>);"/>  
</div>


<div>
<table class="table table-striped table-bordered table-hover" hidden>
<tr>
<td style="text-align: right">最近修改密码时间：</td>
<td><asp:Label ID="LblLastModify" runat="server" ></asp:Label></td>
<td style="text-align: right">最近被锁定时间：</td>
<td><asp:Label ID="LblLastLock" runat="server" ></asp:Label></td>
</tr>
<tr>
<td style="text-align: right">虚拟币：</td>
<td>
<a href="ConsumeDetail.aspx?SType=5" title="点击查看变更详情"><asp:Label ID="DummyPurse_L" runat="server"></asp:Label></a>
</td>
<td style="text-align: right">卖家积分：</td>
<td><asp:Label ID="LblboffExp" runat="server" ></asp:Label></td>
</tr>
<tr>
<td style="text-align: right">消费积分：</td>
<td><asp:Label ID="LblConsumeExp" runat="server" ></asp:Label></td>
<td style="text-align: right">等级：</td>
<td><span id="LvIcon_Span" runat="server"></span> <asp:Label ID="gradeTxt" runat="server" ></asp:Label></td>
</tr>
<tr>
</tr>
<asp:Literal runat="server" ID="GroupModelField_Li"></asp:Literal>

</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
$("#mimenu_btn").click(function (e) {
if ($(".user_mimenu_left").width() > 0) {
$(".user_mimenu_left ul").fadeOut(100);
$(".user_mimenu_left").animate({ width: 0 }, 200);
}
else {
$(".user_mimenu_left").animate({ width: 150 }, 300);
$(".user_mimenu_left ul").fadeIn();
}
});
//会员搜索
$("#sub_btn").click(function (e) {
if ($("#key").val() == "")
alert("搜索关键字为空!");
else
window.location = "/User/SearchResult.aspx?key=" + escape($("#key").val());
});
//搜索回车事件
function IsEnter(obj) {
if (event.keyCode == 13) {
$("#sub_btn").click(); return false;
}
}
function showGive(stype) {
ShowComDiag("/User/UserFunc/Money/GiveMoney.aspx?stype=" + stype, "赠送金额");
}
function showMoneyConver() {
ShowComDiag("/User/UserFunc/Money/MoneyConver.aspx", "金额兑换");
}
</script>
</asp:Content>