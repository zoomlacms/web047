<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WithdrawLog1.aspx.cs" Inherits="User_UserFunc_WithdrawLog1" MasterPageFile="~/User/Default1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<title>提现日志</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb container">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="/Class_106/NodePage.aspx">提现申请</a></li>
<li class="active">提现日志</li>
</ol>

<div class="weui_cells weui_cells_form">

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">起始时间</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="STime_T" placeholder="起始时间" CssClass="weui_input" type="date" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">结束时间</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" ID="ETime_T" placeholder="结束时间" CssClass="weui_input" type="date" />
</div>
</div>

</div>

<div class="weui_btn_area">
<asp:LinkButton runat="server" ID="Skey_Btn" CssClass="weui_btn weui_btn_primary" OnClick="Skey_Btn_Click"><i class="fa fa-search"></i> 查找记录</asp:LinkButton>
</div>
<div class="container">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="无提现记录!!" OnPageIndexChanging="EGV_PageIndexChanging">
<Columns>
<asp:TemplateField HeaderText="提现记录">
<ItemTemplate>
申请日期：<%#Eval("sTime","{0:yyyy年MM月dd日 HH:mm:ss}") %><br />
提现金额：<%#Eval("money","{0:f2}") %><br />
状态：<%#GetStatus() %><br />
处理记录：<%# Eval("Result") %><br />
备注：<%# Eval("Remark") %>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
