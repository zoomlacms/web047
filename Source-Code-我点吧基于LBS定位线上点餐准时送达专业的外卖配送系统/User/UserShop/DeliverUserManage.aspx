<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserShop_DeliverUserManage, App_Web_rzsczeru" clientidmode="Static" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>送货员管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container margin_t5">
<ol class="breadcrumb">
	<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
	<li><a href="ProductList.aspx">我的店铺</a></li>
	<li class="active">送货员管理</li>
</ol>
</div>
<div class="container">
<div class="btn_green"><uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" /></div>
<table class="table table-bordered table-striped table-hover margin_t5">
	<tr>
		<td colspan="4" class="text-center">已保存的送货员信息</td>
	</tr>
	<tr>
		<td class="title"></td>
		<td class="title">送货人姓名</td>
		<td class="title">手机号码</td>
		<td class="title">操作</td>
	</tr>
	<ZL:ExRepeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='6'><div class='text-center'>" PageEnd="</div></td></tr>">
		<ItemTemplate>
			<tr>
				<td><input name="idchk" type="checkbox" value='<%# Eval("id")%>' /></td>
				<td><%#Eval("DeName")%></td>
				<td><%#Eval("ModelNum")%></td>
				<td>
					<a href="DeliverUserManage.aspx?menu=upd&id=<%#Eval("id") %>">修改</a>
					<a href="DeliverUserManage.aspx?menu=del&id=<%#Eval("id") %>" onclick="return confirm('确定删除？');">删除</a></td>
			</tr>
		</ItemTemplate>
        <FooterTemplate></FooterTemplate>
	</ZL:ExRepeater>
</table>
<div class="btn_green">
	<asp:Button ID="BatDel_Btn" runat="server" CssClass="btn btn-primary" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定删除？');" Text="批量删除" CausesValidation="false" />&nbsp;
</div>
<div class="btn_green margin_t10">
	<asp:Label ID="lbl" runat="server" Style="color: Red; font-size: 14px; font-weight: bold" Visible="false"></asp:Label>
	<br />
	<asp:Label ID="lbltips" runat="server" Style="color: Green; font-size: 14px; font-weight: bold">添加送货员</asp:Label>
	姓名：<asp:TextBox ID="txtname" CssClass="form-control text_md" runat="server"></asp:TextBox>
	&nbsp;&nbsp;手机号码：<asp:TextBox ID="txtMobile" CssClass="form-control text_md" runat="server"></asp:TextBox>
	<asp:RegularExpressionValidator runat="server" Display="Dynamic" ID="RegularExpressionValidator4" ValidationExpression="^1\d{10}$" ControlToValidate="txtMobile" ErrorMessage="按照手机号规则输入"></asp:RegularExpressionValidator>
	&nbsp;<asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="提交" OnClick="btn_Click" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script>
    $(function () {
        $("#chkAll").click(function () {
            selectAllByName(this, "idchk");
        });
    })
</script>
</asp:Content>
