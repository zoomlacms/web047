﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Exam_VersionList, App_Web_f1tmousp" masterpagefile="~/User/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>教材版本</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
	<li><a href="/user">用户中心</a></li>
	<li>教材版本[<a href="AddVersion.aspx">添加教材版本</a>]</li>
</ol>
</div>
<div class="container">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false"
	OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
	CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="你尚未定义教材版本">
	<Columns>
		<asp:TemplateField>
			<ItemTemplate>
				<input type="checkbox" name="idchk" value="<%#Eval("ID") %>" /></ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="版本名称">
			<ItemTemplate>
				<a href="AddVersion.aspx?id=<%#Eval("ID") %>"><%#Eval("VersionName") %></a>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:BoundField HeaderText="版本时间" DataField="VersionTime" />
		<asp:BoundField HeaderText="年级" DataField="GradeName" />
		<asp:BoundField HeaderText="科目" DataField="NodeName" />
		<asp:BoundField HeaderText="册序" DataField="Volume" />
		<asp:BoundField HeaderText="节名称" DataField="SectionName" />
		<asp:BoundField HeaderText="课名称" DataField="CourseName" />
		<asp:TemplateField HeaderText="操作">
			<ItemTemplate>
				<a class="option_style" href="AddVersion.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
				<asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>