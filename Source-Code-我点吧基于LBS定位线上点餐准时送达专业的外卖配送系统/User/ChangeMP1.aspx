<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeMP1.aspx.cs" Inherits="User_ChangeMP1" EnableViewStateMac="false" MasterPageFile="~/User/Default1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>修改手机</title>
<style>
body { }
.weui_cells { font-size:1em;}
.weui_label { font-size:1em; font-weight:normal; margin-bottom:0;}
.weui_vcode i { position:absolute; top:10px; right:120px; font-size:1.5em;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li><a title="用户信息" href="/User/Info/UserInfo1.aspx">用户信息</a></li>
<li class="active">修改手机</li>
</ol>
<div class="alert alert-info" runat="server" id="Remind_Div" visible="false"></div>
<asp:Panel ID="step1_div" runat="server" Visible="false">

<div class="weui_cells weui_cells_form">

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">原手机</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="SMobile_T" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox>
</div>
</div>

<div class="weui_cell weui_vcode" style="padding-top:10px; padding-bottom:10px; padding-right:15px;">
<div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<input type="hidden" id="VCode_hid" name="VCode_hid" />
<asp:TextBox ID="VCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="weui_input" />
</div>
<div class="weui_cell_ft">
<img id="VCode_img" style="max-width:96px; max-height:22px" title="点击刷新验证码" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">校验码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<div class="input-group input-group-sm">
<asp:TextBox runat="server" ID="CheckNum_T" CssClass="form-control"></asp:TextBox>
<span class="input-group-btn">
<asp:Button runat="server" ID="SendCode_Btn" CssClass="btn btn-info" Text="发送校验码" OnClick="SendEMail_Btn_Click" />
</span>
</div><!-- /input-group -->
</div>
</div>

</div>

<div style="padding:10px;">
<asp:Button runat="server" ID="Next_Btn" Text="下一步" OnClick="Next_Btn_Click" CssClass="btn btn-info btn-block" />
</div>

</asp:Panel>
<asp:Panel ID="step2_div" runat="server" Visible="false">

<div class="weui_cells weui_cells_form">

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">新手机号</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="NewMobile_T" runat="server" CssClass="form-control input-sm" />
<asp:RequiredFieldValidator ID="RV2" runat="server" ControlToValidate="NewMobile_T" ForeColor="Red" Display="Dynamic" ErrorMessage="手机号不能为空" />
<asp:RegularExpressionValidator ID="RV4" Display="Dynamic" ForeColor="Red" runat="server" ControlToValidate="NewMobile_T" ErrorMessage="请输入正确的手机号码" ValidationExpression="^1\d{10}$" />
</div>
</div>

<div class="weui_cell weui_vcode" style="padding-top:10px; padding-bottom:10px; padding-right:15px;">
<div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<input type="hidden" id="NewVCode_hid" name="NewVCode_hid" />
<asp:TextBox ID="NewVCode" placeholder="验证码" MaxLength="6" runat="server" CssClass="weui_input" />
</div>
<div class="weui_cell_ft">
<img id="NewVCode_img" style="max-width:96px; max-height:22px" title="点击刷新验证码" />
</div>
<div>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">校验码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<div class="input-group input-group-sm">
<asp:TextBox runat="server" ID="NewCheckNum_T" CssClass="form-control"></asp:TextBox>
<span class="input-group-btn">
<asp:Button runat="server" ID="SendNewEmail_Btn" Text="发送校验码" CssClass="btn btn-info btn-sm" OnClick="SendNewEmail_Btn_Click" />
</span>
</div><!-- /input-group -->
</div>
</div>
</div>
<div style="padding:10px">
<asp:Button ID="BtnSubmit" runat="server" Text="提交" class="btn btn-danger btn-block" OnClick="BtnSubmit_Click" style=" text-align:center;" />
</div>
</asp:Panel>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ZL_ValidateCode.js"></script>
<script>
$(function () {
$("#VCode").ValidateCode({ submitchk: false });
$("#NewVCode").ValidateCode({ submitchk: false });
})
</script>
</asp:Content>
