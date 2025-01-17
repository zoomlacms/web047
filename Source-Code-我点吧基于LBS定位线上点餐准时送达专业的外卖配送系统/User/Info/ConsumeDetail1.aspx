﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Info_ConsumeDetail, App_Web_mmvpaehb" masterpagefile="~/User/Default1.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<title>消费详情</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5"> 
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li class="active"><a href="<%=Request.RawUrl %>">金额变更详情</a></li>
</ol>
</div>
<div class="container">
<div class="panel panel-default">
<div class="panel-body">
<div class="input-group margin_l5" style="display:none">
<asp:TextBox runat="server" ID="STime_T" placeholder="起始时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
<asp:TextBox runat="server" ID="ETime_T" placeholder="结束时间" CssClass="form-control text_md" onclick="WdatePicker({})" />
<asp:TextBox runat="server" ID="Skey_T" CssClass="form-control text_md" placeholder="关键词" />
<span class="input-group-btn">
<asp:LinkButton runat="server" ID="Skey_Btn" CssClass="btn btn-default" OnClick="Skey_Btn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
</span>
</div>
</div>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
CssClass="table table-striped table-bordered table-hover" EmptyDataText="没有变更记录!!"
OnPageIndexChanging="EGV_PageIndexChanging">
<Columns>
<asp:TemplateField HeaderText="金额变更">
<ItemTemplate>
金额：<%#Eval("score","{0:f2}") %><br/>
日期：<%#Eval("HisTime","{0:yyyy年MM月dd日 HH:mm}") %><br/>
备注：<%#Eval("Detail")%>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>