﻿<%@ page language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_UserZone_SetCenter_SC_FriendStatus, App_Web_mus4ydyh" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlSetCenterTop.ascx" TagName="WebUserControlSetCenterTop" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>设置中心</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
<script src='<%=ResolveUrl("~/JS/DatePicker/WdatePicker.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="index" data-ban="zone"></div>
<div class="container margin_t5"> 
	<ol class="breadcrumb">
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li> 
        <li class="active">征友状态</li>
    </ol>
</div> 
<div class="container btn_green">
<uc2:WebUserControlTop ID="WebUserControlTop1" runat="server" />
<uc1:WebUserControlSetCenterTop ID="WebUserControlSetCenterTop" runat="server" />
</div>
<div class="container btn_green u_cnt">
<div class="us_topinfo" style="margin-top: 10px; width: 98%">
	<table border="0" class="us_showinfo" width="100%" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>
				设置征友状态
			</td>
			<td>
				<asp:RadioButtonList ID="radioFStatus" runat="server" RepeatDirection="Horizontal">
					<asp:ListItem Value="0" Text="征友中" Selected="True" />
					<asp:ListItem Value="1" Text="已经找到了" />
					<asp:ListItem Value="-1" Text="暂停交友" />
				</asp:RadioButtonList>
			</td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="保存设置" OnClick="btnSave_Click" />
			</td>
		</tr>
	</table>
</div>
</div>
</asp:Content>