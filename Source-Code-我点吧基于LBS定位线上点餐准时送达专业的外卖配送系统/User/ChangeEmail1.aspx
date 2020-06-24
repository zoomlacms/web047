<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeEmail1.aspx.cs" Inherits="User_ChangeEmail1" EnableViewStateMac="false" MasterPageFile="~/User/Default1.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>修改邮箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb" style="margin-bottom:0;">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li><a title="用户信息" href="/User/Info/UserInfo1.aspx">用户信息</a></li>
<li class="active">修改邮箱</li>
</ol>

<div class="container">
<div class="alert alert-info" runat="server" id="Remind_Div" visible="false" style="margin-top:0px;margin-bottom:5px;"></div>
</div>

<asp:Panel ID="step1_div" runat="server" Visible="false">
<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">原邮箱</label></div>
<div class="weui_cell_bd weui_cell_primary">
<div class="input-group input-group-sm">
<asp:Label ID="SEmail_T" runat="server" CssClass="form-control"></asp:Label>
<span class="input-group-btn">
<asp:Button runat="server" ID="SendEMail_Btn" Text="发送验证邮件" OnClick="SendEMail_Btn_Click" CssClass="btn btn-info" />
</span>
</div><!-- /input-group -->
</div>
</div>
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="CheckNum_T" CssClass="form-control input-sm"></asp:TextBox>
</div>
</div>
</div>
<div style="padding:10px;">
<asp:Button runat="server" ID="Next_Btn" Text="下一步" OnClick="Next_Btn_Click" CssClass="btn btn-info btn-block btn-sm" />
</div>
</asp:Panel>
<asp:Panel ID="step2_div" runat="server" Visible="false">
<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">新邮箱</label></div>
<div class="weui_cell_bd weui_cell_primary">
<div class="input-group input-group-sm">
<asp:TextBox ID="NewEmail_T" runat="server" CssClass="form-control" />
<span class="input-group-btn">
<asp:Button runat="server" ID="SendNewEmail_Btn" Text="发送邮件" CssClass="btn btn-info" OnClick="SendNewEmail_Btn_Click" />
</span>
</div>
<!-- /input-group -->
<asp:RequiredFieldValidator ID="RV2" runat="server"  ControlToValidate="NewEmail_T" ForeColor="Red" Display="Dynamic" ErrorMessage="Email不能为空" />
<asp:RegularExpressionValidator ID="RV1" runat="server" ControlToValidate="NewEmail_T" ErrorMessage="邮件地址不规范" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Display="Dynamic" />
</div>
</div>
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">验证码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="NewCheckNum_T" CssClass="form-control input-sm"></asp:TextBox>
</div>
</div>
</div>
<div style="padding:10px;"><asp:Button ID="BtnSubmit" runat="server" Text="提交" class="btn btn-danger btn-block btn-sm" style="text-align:center;" OnClick="BtnSubmit_Click" /></div>
</asp:Panel>
</asp:Content>
