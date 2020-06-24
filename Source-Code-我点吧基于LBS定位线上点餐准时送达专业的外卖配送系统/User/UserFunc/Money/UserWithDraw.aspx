<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserWithDraw.aspx.cs" Inherits="User_UserFunc_Money_UserWithDraw" MasterPageFile="~/User/Default1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>用户提现</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="muser_tixian">
<div class="muser_tixian_t">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li><a href="/Class_106/NodePage.aspx">提现申请</a></li>
<li class="active">存入余额</li>
</ol>
</div>
<div class="container muser_tixian_a" style="display:none;">
<div class="alert alert-info" role="alert"></div>
</div>
<div class="muser_tixian_c" style="display:none;">
<div runat="server" id="ToPurse_Div" visible="false">
<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">现有返利</label></div>
<div class="weui_cell_bd weui_cell_primary">
<span style="color:#c00;"><%Call.Label("{ZL.Label id=\"获取当前用户返利总金额\" /}");%></span>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">提现金额</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" id="Money_T" class="form-control input-sm money" autocomplete="off" Text="200" />
</div>
</div>

</div>

<div class="weui_btn_area">
<asp:Button runat="server" ID="ToPurse_Btn" CssClass="weui_btn weui_btn_primary" OnClick="ToPurse_Btn_Click" Text="存入余额" OnClientClick="return purseCheck();" />
</div>
</div>

</div>
</div>
<div runat="server" id="ToWeChat_Div" visible="false">
<table class="table table-bordered table-striped">
<tr>
<td class="td_m">提现金额：</td>
<td>
<asp:TextBox runat="server" id="Money2_T" class="form-control text_300 money" autocomplete="off" Text="200" />
</td>
</tr>
<tr>
<td>微信用户：</td>
<td>
<img runat="server" id="wxmu_face_img" title="头像" style="width:100px;height:100px;" />
<span runat="server" id="wxmu_name_sp"></span>
</td>
</tr>
<tr>
<td>姓名校验：</td>
<td>
<asp:TextBox runat="server" ID="re_user_name_t"></asp:TextBox>
<div class="alert alert-info">如未实名认证,此项可为空,否则必填</div>
</td>
</tr>
<tr>
<td></td>
<td>
<asp:Button runat="server" ID="ToWeChat_Btn" Text="提现至微信零钱" CssClass="btn btn-info" OnClick="ToWeChat_Btn_Click" OnClientClick="return wechatCheck();" />
</td>
</tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ZL_Regex.js"></script>
<script>
$(function () { ZL_Regex.B_Num(".money");})
function wechatCheck() {
	var money = Convert.ToInt($("#Money2_T").val());
	if (money < 200 || money % 200 != 0) { alert("提现金额必须是200的倍数"); return false; }
	return true;
}
function purseCheck() {
	var money = Convert.ToInt($("#Money_T").val());
	if (money < 200 || money % 200 != 0) { alert("提现金额必须是200的倍数"); return false; }
	return true;
}
$().ready(function(e) {
	ZL_Regex.B_Num(".money");
	var money="<%Call.Label("{ZL.Label id=\"获取当前用户充值金额\" /}");%>";
	var status="<%Call.Label("{ZL.Label id=\"获取当前会员认证状态\" /}");%>";
	if(money<198)
	{
		$(".muser_tixian_c").remove();
		$(".muser_tixian_a").show();
		$(".muser_tixian_a .alert").html("充值未满198元不能申请提现！点击<a href=\"/PayOnline/SelectPayPlat1.aspx\" class=\"btn btn-danger\">我要充值</a>立即前往充值。");
	}
	else
	{
		if(status==""||status<0)
		{
			$(".muser_tixian_c").remove();
			$(".muser_tixian_a").show();
			$(".muser_tixian_a .alert").html("未实名认证（提现需要实名认证）！点击<a href=\"/User/Content/AddContent1.aspx?NodeID=106&ModelID=54\" class=\"btn btn-danger\">我要认证</a>立即前往认证。");
		}
		else if(status=="0")
		{
			$(".muser_tixian_c").remove();
			$(".muser_tixian_a").show();
			$(".muser_tixian_a .alert").html("您的会员认证资料正在审核中，请耐性等待！");
		}		
		else if(status=="99")
		{
			$(".muser_tixian_a .alert").html("您充值已满198元，会员认证已通过审核，可以申请提现，且提现必须是200的倍数，点击<a href=\"/User/UserFunc/Money/WithdrawLog1.aspx\" class=\"btn btn-info\">提现日志</a>可查看提现申请记录！");
			$(".muser_tixian_a").show();
			$(".muser_tixian_c").show();

		}
	}
});
</script>
</asp:Content>