<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WithDraw1.aspx.cs" Inherits="User_UserFunc_WithDraw1" MasterPageFile="~/User/Default1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>提现申请</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="muser_tixian">
<div class="muser_tixian_t">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li><a href="/Class_106/NodePage.aspx">提现申请</a></li>
<li class="active">存入银行卡</li>
</ol>
</div>
</div>
<div class="container muser_tixian_a" style="display:none;">
<div class="alert alert-info" role="alert"></div>
</div>

<div class="muser_tixian_c">
<div class="weui_cells weui_cells_form">

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">现有返利</label></div>
<div class="weui_cell_bd weui_cell_primary">
<span style="color:#c00;"><asp:Label runat="server" ID="NowMoney_L" /></span>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">提现金额</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="Money_T" CssClass="form-control input-sm money" Text="200" />
<asp:RequiredFieldValidator runat="server" ID="MR1" ControlToValidate="Money_T" ErrorMessage="提现金额不能为空" ForeColor="Red" Display="Dynamic" />
<asp:RegularExpressionValidator runat="server" ID="MR2" ControlToValidate="Money_T" ErrorMessage="金额必须是数字" ForeColor="Red" ValidationExpression="([0-9]+)" Display="Dynamic"/>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">开户人</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" CssClass="form-control input-sm" ID="PName_T" />
<asp:RequiredFieldValidator runat="server" ID="R1" Display="Dynamic" ControlToValidate="PName_T" ErrorMessage="开户人姓名不能为空" ForeColor="Red" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">银行名称</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" CssClass="form-control input-sm" ID="Bank_T" />
<asp:RequiredFieldValidator runat="server" ID="R2" Display="Dynamic" ControlToValidate="Bank_T" ErrorMessage="银行名称不能为空" ForeColor="Red" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">开户银行</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="Remark_T" TextMode="MultiLine" CssClass="form-control input-sm" Rows="3" style="resize:none;" />
<asp:RequiredFieldValidator runat="server" ID="RV5" Display="Dynamic" ControlToValidate="Remark_T" ErrorMessage="开户银行不能为空" ForeColor="Red" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">银行卡号</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" CssClass="form-control input-sm" ID="Account_T" />
<asp:RequiredFieldValidator runat="server" ID="R3" ControlToValidate="Account_T" ErrorMessage="银行卡号不能为空" ForeColor="Red" Display="Dynamic"/>
<asp:RegularExpressionValidator runat="server" ID="R4" ControlToValidate="Account_T" ErrorMessage="请输入16或19位银行卡号" ForeColor="Red" ValidationExpression="^(\d{16}|\d{19})$" Display="Dynamic"/>
</div>
</div>

</div>

<div class="weui_btn_area">
<asp:Button runat="server" CssClass="weui_btn weui_btn_primary" ID="Sure_Btn" Text="申请提现" OnClick="Sure_Btn_Click" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ZL_Regex.js"></script>
<script>
$().ready(function(e) {
    ZL_Regex.B_Num(".money");
});
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
