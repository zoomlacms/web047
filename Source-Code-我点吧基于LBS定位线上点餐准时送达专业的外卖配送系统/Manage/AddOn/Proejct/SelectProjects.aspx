﻿<%@ page language="C#" masterpagefile="~/Manage/I/Default.master" autoeventwireup="true" inherits="manage_AddOn_SelectProjects, App_Web_d4zgs1gi" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>选择管理员</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
	<ZL:ExGridView ID="Egv" runat="server" AllowPaging="True"
		AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="AdminID" OnPageIndexChanging="Egv_PageIndexChanging"
		  OnRowDataBound="Egv_RowDataBound" Width="100%">
		<Columns>
			<asp:BoundField DataField="AdminId" HeaderText="ID">
				<HeaderStyle Width="5%" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField HeaderText="管理员名" DataField="AdminName" ItemStyle-HorizontalAlign="Center">
				<HeaderStyle Width="10%" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField HeaderText="前台用户名" DataField="UserName" ItemStyle-HorizontalAlign="Center">
				<HeaderStyle Width="10%" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:BoundField HeaderText="管理员真实姓名" DataField="AdminTrueName"
				ItemStyle-HorizontalAlign="Center">
				<HeaderStyle Width="15%" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:BoundField>
			<asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
				<ItemTemplate>
                    <a href="javascript:;" onclick="getUser('<%# Eval("AdminName")%>')">选择</a> 
				</ItemTemplate>
				<HeaderStyle Width="10%" />
				<ItemStyle HorizontalAlign="Center" />
			</asp:TemplateField>
		</Columns>
		<RowStyle ForeColor="Black" CssClass="tdbg" Height="25px" />
		<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
		<PagerStyle CssClass="tdbg" ForeColor="Black" HorizontalAlign="Center" />
		<HeaderStyle CssClass="tdbg" Font-Bold="True" ForeColor="#E7E7FF" BorderStyle="None" Height="30px" Font-Overline="False" />
	</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
	function setvalue(objname, valuetxt) {
		if (parent.window.frames['main_right'].document.getElementById(objname)) {
			parent.window.frames['main_right'].document.getElementById(objname).value = valuetxt;
		}
		else {
			parent.document.frames['main_right'].document.getElementById(objname).value = valuetxt;
		}
	}
	function onstr() {
		parent.Dialog.close();
	}
	function getUser(name) {
	    parent.getHeader(name);
	}
</script>

</asp:Content>
