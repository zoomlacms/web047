﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_Addcardtype, App_Web_trhqh1zy" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>VIP卡管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
	<table  class="table table-striped table-bordered table-hover">
		<tr align="center">
			<td colspan="2" class="spacingtitle">
			   <strong>卡类型</strong>
			</td>
		</tr>
		<tr>
			<td style="width:100px;">
				种类名称：</td>
			<td>
			 &nbsp;   <asp:TextBox ID="tx_typename" runat="server" class="form-control text_md"></asp:TextBox>
			</td>
		</tr>
	   
		 <tr>
			<td >
				折扣率：
			</td>
			<td>
				&nbsp;   <asp:TextBox ID="tx_count" runat="server" class="form-control text_md"></asp:TextBox>
			 </td>
		</tr>
		
	   
		 <tr>
			<td >
				<strong></strong>
			</td>
			<td>  &nbsp;
				<asp:Button ID="Button1" class="btn btn btn-primary" runat="server"  Text="提交" onclick="Button1_Click" />
				<asp:HiddenField ID="HiddenField1" runat="server" />
				<asp:HiddenField ID="ID_H" runat="server" />
			</td>
		</tr>
	</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>

