<%@ page language="C#" masterpagefile="~/User/Default1.master" autoeventwireup="true" inherits="User_Info_UserBase, App_Web_mmvpaehb" clientidmode="Static" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<%@ Register Src="~/Manage/I/ASCX/UserInfoBar.ascx" TagPrefix="ZL" TagName="UserBar" %>
<asp:Content ContentPlaceHolderID="Head" runat="Server">
<title>基本信息</title>
<script src="http://code.zoomla.cn/Area.js"></script>
<script src="/JS/Controls/ZL_PCC.js"></script>
<style>
.weui_cells { font-size:1em;}
.weui_label { font-size:1em; font-weight:normal; margin-bottom:0;}
.weui_navbar a { color:#333; text-decoration:none;}
</style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div class="navbar" style="border:none;">
<div class="bd" style="height: 100%;">
<div class="weui_tab">
<div class="weui_navbar">
<a class="weui_navbar_item" href="UserInfo1.aspx">注册信息</a>
<a class="weui_navbar_item weui_bar_item_on" href="UserBase1.aspx">基本信息</a>
</div>
</div>
</div>
</div>


<div class="weui_cells weui_cells_form">

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">真实姓名</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="tbTrueName" CssClass="form-control input-sm" runat="server"/>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">昵称</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="txtHonName" CssClass="form-control input-sm " runat="server"/>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">性别</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:RadioButtonList ID="tbUserSex" runat="server" RepeatDirection="Horizontal">
<asp:ListItem Selected="True" Value="1">男</asp:ListItem>
<asp:ListItem Value="0">女</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">出生日期</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="tbBirthday" CssClass="form-control input-sm" runat="server" type="date" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">QQ号码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="tbQQ" CssClass="form-control input-sm" runat="server"/>
<asp:RegularExpressionValidator runat="server" Display="Dynamic" ID="RegularExpressionValidator3" ValidationExpression="^[0-9]*$" ControlToValidate="tbQQ" CssClass="tips" ErrorMessage="只接受数字输入"/>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">手机号码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<div class="input-group input-group-sm">
<asp:TextBox runat="server" ID="Mobile_L" CssClass="form-control" Enabled="false" />
<span class="input-group-btn">
<a href="../ChangeMP1.aspx" title="修改手机号" class="btn btn-info btn-sm">修改手机</a>
</span>
</div><!-- /input-group -->
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">邮箱</label></div>
<div class="weui_cell_bd weui_cell_primary">
<div class="input-group input-group-sm">
<asp:TextBox runat="server" ID="Email_L" CssClass="form-control" Enabled="false" />
<span class="input-group-btn">
<a href="../ChangeEmail1.aspx" title="修改邮箱" class="btn btn-info">修改邮箱</a>
</span>
</div><!-- /input-group -->
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">省</label></div>
<div class="weui_cell_bd weui_cell_primary">
<input id="address" runat="server" type="hidden" />
<select id="tbProvince" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">市</label></div>
<div class="weui_cell_bd weui_cell_primary">
<select id="tbCity" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">区/县</label></div>
<div class="weui_cell_bd weui_cell_primary">
<select id="tbCounty" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">联系地址</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="tbAddress" CssClass="form-control input-sm" runat="server"/>
</div>
</div>

</div>

<div style="padding:10px;">
<asp:Button ID="btnSave" CssClass="btn btn-primary btn-block" OnClientClick="return SaveAdress()" runat="server" Text="更新信息" OnClick="btnSave_Click" />
</div>

<div hidden>
<asp:HiddenField ID="switchID" runat="server" />
<table class="table table-striddped table-bordered">
<tbody id="Tabs0">
<%--<tr><td colspan="4"><ZL:UserBar ID="UserBar_U" Width="300" runat="server" /></td></tr>--%>
<tr id="DivCompany" runat="server" visible="false">
<td><strong>企业名称：</strong></td>
<td>
<asp:TextBox ID="txtCompanyName" class="form-control text_md" runat="server" /></td>
<td><strong>企业简介：</strong></td>
<td><asp:TextBox ID="txtCompanyDescribe" class="form-control text_md" runat="server" TextMode="MultiLine" Height="60" /></td>
</tr>
<tr>
<td class="text-right">办公电话： </td>
<td>
<asp:TextBox ID="tbOfficePhone" CssClass="form-control text_md" runat="server"/>
<asp:RegularExpressionValidator ID="RV1" CssClass="tips" runat="server" ControlToValidate="tbOfficePhone" ErrorMessage="请输入数字！" Display="Dynamic" ValidationExpression="^\d+(\d+)?$"/></td>
</tr>
<tr>
<td class="text-right">家庭电话： </td>
<td><asp:TextBox ID="tbHomePhone" CssClass="form-control text_md" runat="server"/>
<asp:RegularExpressionValidator ID="RV8" runat="server" ControlToValidate="tbHomePhone" ErrorMessage="请输入区位号-数字！" CssClass="tips" Display="Dynamic" ValidationExpression="^\d+-(\d+)?$"/></td>
<td class="text-right">传真： </td>
<td><asp:TextBox ID="tbFax" CssClass="form-control text_md" runat="server"/>
<asp:RegularExpressionValidator runat="server" ID="RV2" ValidationExpression="^\d+(\d+)?$" ControlToValidate="tbFax" CssClass="tips" ErrorMessage="只能输入整数"/></td>
</tr>
<tr>
<td class="text-right">邮政编码： </td>
<td><asp:TextBox ID="tbZipCode" CssClass="form-control text_md" runat="server"/>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ValidationExpression="\d{6}" ControlToValidate="tbZipCode" ErrorMessage="只能输入正确的邮政编码"/></td>
<td class="text-right">身份证号码： </td>
<td><asp:TextBox ID="tbIDCard" CssClass="form-control text_md" runat="server" Columns="30"/>
<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ValidationExpression="(^\d{15}$)|(^\d{17}([0-9]|X)$)" ControlToValidate="tbIDCard" CssClass="tips"  ErrorMessage="请输入正确身份证号"/></td>
</tr>
<tr>
<td class="text-right">个人主页： </td>
<td><asp:TextBox ID="tbHomepage" CssClass="form-control text_md" runat="server" Columns="30">http://</asp:TextBox></td>
</tr>
<tr>
<td class="text-right">职务：</td>
<td><asp:TextBox runat="server" CssClass="form-control text_md" ID="Position"/></td>
</tr>
<tr>
<td class="text-right">公司名：</td>
<td><asp:TextBox runat="server" CssClass="form-control text_300" ID="CompanyName"/></td>
<td class="text-right">UC帐号： </td>
<td><asp:TextBox ID="tbUC" CssClass="form-control text_md" runat="server"/>
<asp:RegularExpressionValidator runat="server" ID="REV12" ValidationExpression="^[0-9]*$" CssClass="tips" ControlToValidate="tbUC" ErrorMessage="只接受数字输入"/></td>
</tr>
<tr>
<td class="text-right">签名档： </td>
<td><asp:TextBox ID="tbSign" runat="server" class="form-control text_300" TextMode="MultiLine" Height="60"/></td>
<td rowspan="2" class="text-right">隐私设定： </td>
<td rowspan="2"><asp:RadioButtonList ID="tbPrivacy" runat="server">
<asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
<asp:ListItem Value="1">只对好友公开</asp:ListItem>
<asp:ListItem Value="2">完全保密</asp:ListItem>
</asp:RadioButtonList>

</tr>
<tr>
<asp:Literal ID="lblHtml" runat="server"></asp:Literal>
</tr>
</tbody>
<tbody id="Tabs1" style="display:none;">
<tr>
<td class="text-right" style="line-height:128px;">头像地址： </td>
<td style="line-height:128px;">
<ZL:SFileUp ID="SFile_Up" runat="server" FType="Img" MaxWidth="500" MaxHeight="500" />
<asp:Button ID="BtUpImage_Btn" runat="server" OnClick="BtUpImage_Btn_Click" CssClass="btn btn-primary" Text="上传" CausesValidation="false" />
<asp:HiddenField ID="UserFace_Hid" runat="server" />
</td>
<td class="text-right" style="line-height:128px;">头像预览：</td>
<td>
<asp:Image ID="UserFace_Img" runat="server" Height="111" Width="111" ImageUrl="~/Images/userface/noface.gif" />
<button class="btn btn-primary btn-xs" onclick="SetCutPic()" type="button">裁剪</button>
</td>
</tr>
<tr><td class="text-right">头像选择：</td><td colspan="3">
<asp:TextBox ID="UserFace_T" CssClass="form-control text_300" runat="server" Text="/Images/userface/noface.gif"/>
<select id="sysface_dp" onchange="changeFace(this);" class="form-control text_md">
<option value="/Images/userface/1.gif">01.gif</option>
<option value="/Images/userface/2.gif">02.gif</option>
<option value="/Images/userface/3.gif">03.gif</option>
<option value="/Images/userface/4.gif">04.gif</option>
<option value="/Images/userface/5.gif">05.gif</option>
<option value="/Images/userface/6.gif">06.gif</option>
<option value="/Images/userface/7.gif">07.gif</option>
<option value="/Images/userface/8.gif">08.gif</option>
<option value="/Images/userface/9.gif">09.gif</option>
<option value="/Images/userface/10.gif">10.gif</option>
<option value="/Images/userface/11.gif">11.gif</option>
<option value="/Images/userface/12.gif">12.gif</option>
<option value="/Images/userface/13.gif">13.gif</option>
<option value="/Images/userface/14.gif">14.gif</option>
<option value="/Images/userface/15.gif">15.gif</option>
<option value="/Images/userface/16.gif">16.gif</option>
<option value="/Images/userface/17.gif">17.gif</option>
<option value="/Images/userface/18.gif">18.gif</option>
<option value="/Images/userface/19.gif">19.gif</option>
<option value="/Images/userface/20.gif">20.gif</option>
</select>
</td></tr>
<tr runat="server"  visible="false">
<td class="text-right">头像宽度： </td>
<td><asp:TextBox CssClass="form-control text_md" ID="tbFaceWidth" runat="server">111</asp:TextBox></td>
<td style="text-align: right;">头像高度： </td>
<td><asp:TextBox CssClass="form-control text_md" ID="tbFaceHeight" runat="server">111</asp:TextBox></td>
</tr>
</tbody>
<tr>
<td class="btn_green text-center" colspan="4">
</td>
</tr>
</table>
</div>
<div class="u_sign" id="u_UserInfo"></div>
<asp:HiddenField ID="UserFieldCount_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.modal {z-index:10000;}
.cutImg {width: 1100px;}
</style>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="/JS/Common.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Content.js"></script>
<script>
//判断div元素是否满屏，不满则自动补充高度，
$(function (e) {
	$("#prefile_img").hide();
    if ($("#switchID").val() == "Tabs1") 
	{
        $(".nav-tabs li").removeClass("active");
        $(".nav-tabs li:eq(2)").addClass("active");
    }
});
$("body").ready(function () {
    switchTab("<%=switchID.Value %>");
    var pcc = new ZL_PCC("tbProvince", "tbCity", "tbCounty");
    if ($("#address").val() != "") {
        var attr = $("#address").val().split(',');
        pcc.SetDef(attr[0], attr[1], attr[2]);
    }
    pcc.ProvinceInit();
});
function SaveAdress() {
	$("#address").val($("#tbProvince").val() + ',' + $("#tbCity").val() + ',' + $("#tbCounty").val());
	return true;
}
function SetCutPic() {
	var ipath = $("#UserFace_Hid").val();
	if (!ipath) { alert("请先指定头像"); return; }
	ShowComDiag("/Plugins/PicEdit/CutPic_User.aspx?ipath=" +ipath ,"图片编辑");
}
function setCutUrl(url) {
	$("#face").attr("src", url);
	$("#tbUserFace").val(url);
}
function PageCallBack(action, url, pval) {
	$("#tbUserFace").val(url);
	$("#face").attr("src", url + "?" + Math.random());
	CloseComDiag();
}
$("#mimenu_btn").click(function(e) { 
	if($(".user_mimenu_left").width()>0){ 
		$(".user_mimenu_left ul").fadeOut(100);
		$(".user_mimenu_left").animate({width:0},200); 	
	}
	else{ 
		$(".user_mimenu_left").animate({width:150},300); 
		$(".user_mimenu_left ul").fadeIn();
	}
}); 
//会员搜索
$("#sub_btn").click(function(e) { 
	if($("#key").val()=="")
		alert("搜索关键字为空!");
	else
		window.location="/User/SearchResult.aspx?key="+escape($("#key").val());	
});
//搜索回车事件
function IsEnter(obj) {
	if (event.keyCode == 13) {
		$("#sub_btn").click(); return false;
	}
}
function switchTab(id) {
    switch (id) {
        case "Tabs0":
            $("#Tabs0").show();
            $("#Tabs1").hide();
            $("#switchID").val("Tabs0");
            break;
        case "Tabs1":
            $("#Tabs0").hide();
            $("#Tabs1").show();
            $("#switchID").val("Tabs1");
            break;
    }
    $("#switchID").val(id);
}
function changeFace(obj) { $("#UserFace_Img").attr("src", obj.value); $("#UserFace_T").val(obj.value); }
</script>
</asp:Content>