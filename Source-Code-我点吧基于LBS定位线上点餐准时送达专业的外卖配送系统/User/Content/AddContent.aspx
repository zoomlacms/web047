﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.AddContentpage, App_Web_v2chwyce" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>内容管理</title>
<script charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li><a href="Mycontent.aspx?NodeID=<%=  this.NodeID%>">投稿管理</a></li>
<li class="active"><%=Tips_L.Text %> <a href="javascript:;" title="百度翻译" id="BaiduTrans_a"><i class="glyphicon glyphicon-book"></i></a></li> 
</ol> 
</div>
<div class="container btn_green addcontent">       
<table id="mainTable" class="table table-bordered table_padding0 addcontent_modeltale" >
		<tr>
			<td colspan="2" class="text-center">
				<asp:Label ID="Tips_L" runat="server"></asp:Label>
			</td>
		</tr>
		<tr>
	<td class="text-right">所属节点</td>
		<td>
			<asp:Label ID="Node_L" runat="server" Text=""></asp:Label>
		</td>
	</tr>
		<tr>
			<td style="overflow-x:hidden;" class="col-sm-1 col-xs-1 text-right"><asp:Label ID="bt_txt" runat="server" Text="标题"></asp:Label>&nbsp;&nbsp;</td>
			<td class="col-sm-11 col-xs-11">
				<asp:TextBox ID="txtTitle" style="background:url(/Images/bg1.gif) repeat-x;" CssClass="form-control m715-50" onkeyup="isgoEmpty('txtTitle','span_txtTitle');Getpy('txtTitle','PYtitle')"  runat="server"></asp:TextBox>
				<span class="vaild_tip">*</span>
				<a href="javascript:;" id="Button11" class="btn btn-info btn-sm" onclick="ShowTitle()" ><i class="fa fa-info"></i> 标题属性</a>
				<button type="button" class="btn btn-info btn-sm" onclick="ShowSys();"><i class="fa fa-list"></i></button>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="标题不能为空" ForeColor="Red" Display="Dynamic" />
				<span id="span_txtTitle" name="span_txtTitle"></span>
				<asp:HiddenField ID="ThreadStyle" runat="server" />
				<div id="duptitle_div" class="alert alert-warning" style="position: absolute;margin-left:315px;display:none;">
					<ul id='duptitle_ul'></ul>
				</div>
			</td>
		</tr>
		<tbody id="Sys_Fied" runat="server" style="display:none;">
		<tr>
			<td class="text-right"><asp:Label ID="py" runat="server" Text="拼音缩写"></asp:Label>&nbsp;&nbsp;</td>
			<td>
				<asp:TextBox ID="PYtitle" CssClass="form-control m715-50" runat="server" />
			</td>
		</tr>
	   <tr id="spec_tr">
			<td class="text-right">所属专题&nbsp;&nbsp;</td>
			<td>
				<div class="specDiv"></div>
				<span id="specbtn_span"><asp:Literal ID="SpecInfo_Li" runat="server"></asp:Literal></span>
				<asp:HiddenField ID="Spec_Hid" runat="server" />
			</td>
		</tr>
		<tr runat="server">
			<td class="tdbgleft" align="right"> 
				<asp:Label ID="gjz_txt" runat="server" Text="关键字"></asp:Label>
				&nbsp;
			</td>
			<td>                             
				<div id="OAkeyword"></div>
				<asp:TextBox ID="Keywords" runat="server" CssClass="form-control" /><span>(空格或回车键分隔，长度不超过10字符或5汉字)</span>  
			 </td>                        
		</tr>
		<tr runat="server">
			<td class="text-right"><asp:Label ID="Label4" runat="server" Text="副标题"></asp:Label>&nbsp;&nbsp;</td>
			<td>
				<asp:TextBox ID="Subtitle" CssClass="form-control m715-50" runat="server"></asp:TextBox>
			</td>
		</tr>
		</tbody>
		<asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
		<tr id="CreateHTML" runat="server">
			<td class="text-right">
				<asp:Label ID="Label1" runat="server" Text="生成"></asp:Label>&nbsp;
			</td>
			<td>
				<asp:CheckBox ID="quickmake" runat="server" Checked="false" Text="是否立即生成" />&nbsp;
			</td>
		</tr>
    <tr>
        <td></td>
        <td>
            <asp:HiddenField runat="server" ID="RelatedIDS_Hid" />
            <asp:Button runat="server" CssClass="btn btn-primary" ID="EBtnSubmit" Text="添加项目" OnClick="EBtnSubmit_Click" />
            <a href="MyContent.aspx?NodeID=<%=NodeID %>" class="btn btn-primary">返回列表</a>
        </td>
    </tr>
	</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
var zlconfig = {
  updir: "<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>",
duptitlenum: "<%=ZoomLa.Components.SiteConfig.SiteOption.DupTitleNum%>",
modelid: "<%=ModelID%>"
};
</script>
<script src="/JS/OAKeyWord.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/chinese.js"></script>
<script src="/JS/Common.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ICMS/tags.json"></script>
<script src="/JS/ZL_Content.js"></script>
<script src="/JS/jquery.zclip.min.js"></script>
<script src="/JS/Plugs/transtool.js"></script>
<script>
$(function () { Tlp_initTemp(); $("#BaiduTrans_a").TransTools({ top: 120 }); });
function OnTemplateViewCheck(value) { $("#TxtTemplate_hid").val(value); }
</script>
</asp:Content>
