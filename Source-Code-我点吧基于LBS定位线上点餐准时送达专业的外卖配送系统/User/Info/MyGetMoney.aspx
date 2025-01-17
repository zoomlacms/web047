﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Info_MyGetMoney, App_Web_mmvpaehb" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的收入</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="group" data-ban="MyGetMoney"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">我的收入</li>
</ol>
</div>
<div class="container u_cnt">
<div class="alert alert-success" id="nocontent" runat="server">您目前还没有成功推荐好友注册!</div>
<div align="center" runat="server" id="content">
<table width="100%" class="table table-striped table-bordered table-hover">
<tr>
  <td colspan="4" class="text-center">我的收入</td>
</tr>
<tr>
  <td align="center" width="25%">推荐好友帐号</td>
  <td align="center" width="25%">推荐好友名称</td>
  <td align="center" width="25%">时间</td>
  <td align="center" width="25%">有效用户</td>
</tr>
<ZL:ExRepeater ID="repf" PagePre="<tr><td colspan='4' class='text-center'><input type='checkbox' id='CheckAll' />" PageEnd="</td></tr>" runat="server">
  <ItemTemplate>
	<tr>
	  <td align="center" width="25%"><asp:Label ID="Points" runat="server" Text='<%#Eval("RecommUserId" )%>'></asp:Label></td>
	  <td align="center" width="25%"><asp:Label ID="Label1" runat="server" Text='<%#GetName(Eval("RecommUserId","{0}"))%>'></asp:Label></td>
	  <td align="center" width="25%"><asp:Label ID="Type" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"RegData","{0:yyyy-MM-dd}") %>'> </asp:Label></td>
	  <td align="center" width="25%"><asp:Label ID="Remark" runat="server" Text='<%# GetisVal(Eval("isValid","{0}") )%>'></asp:Label></td>
	</tr>
  </ItemTemplate>
  <FooterTemplate></FooterTemplate>
</ZL:ExRepeater>
</table>
<table width="100%" class="table table-striped table-bordered table-hover">
<tr>
  <td width="30%">合计:
	<asp:Label ID="lblCountNum" runat="server"></asp:Label></td>
  <td width="30%">&nbsp;</td>
  <td width="30%">合计:
	<asp:Label ID="lblCountIsVal" runat="server"></asp:Label></td>
</tr>
<tr align="left">
  <td colspan="3" valign="bottom"><div style="float: left" class="tips"> 我的收入：
	  <asp:Label ID="lblIncome" runat="server"></asp:Label>
	  <asp:HiddenField ID="hfRemoney" runat="server" />
	  &nbsp; &nbsp; &nbsp;
	  <asp:Button ID="btnRe" runat="server" Text="转入我的资金" OnClick="btnRe_Click" CssClass="btn btn-primary" OnClientClick="return confirm('转入后所有记录归零,确定转入?')" />
	</div>
	<div id="tips" style="float: left;" class="tips">(如果转入我的资金,则以上所有记录清空,收入从头计算)</div></td>
</tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Common/Common.js" type="text/javascript"></script>
<script language="javascript">
function CheckAll(spanChk)//CheckBox全选
{
	var oItem = spanChk.children;
	var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
	xState = theBox.checked;
	elm = theBox.form.elements;
	for (i = 0; i < elm.length; i++)
		if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
			if (elm[i].checked != xState)
				elm[i].click();
		}
}
</script>
</asp:Content>