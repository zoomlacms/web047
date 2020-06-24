<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUserAddress1.aspx.cs" MasterPageFile="~/User/Default1.master" Inherits="User_Info_AddUserAddress1" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>地址管理</title>
<style>
body { background:#f5f5f5;}
.weui_cells { font-size:1em;}
.weui_label { font-size:1em; font-weight:normal; margin-bottom:0;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb" style="border-radius:0;">
<li><a title="会员中心" href="/User/Default1.aspx">会员中心</a></li>
<li><a href="UserRecei1.aspx">我的地址</a></li>
<li class="active">地址管理</li>
</ol>

<div class="weui_cells weui_cells_form">
<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">收件人</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm required" ID="ReceName_T" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">省</label></div>
<div class="weui_cell_bd weui_cell_primary">
<select id="province_dp" name="province_dp" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">市</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:HiddenField ID="pro_hid" runat="server" />
<select id="city_dp" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">区/县</label></div>
<div class="weui_cell_bd weui_cell_primary">
<select id="county_dp" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">详细地址</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm required" ID="Street_T" autofocus="true" TextMode="MultiLine" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">邮政编码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm num zipcode" ID="ZipCode_T" MaxLength="6" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">手机号码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm num phones" ID="MobileNum_T" MaxLength="13" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">电话号码</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" Style="width: 55px;" class="form-control pull-left input-sm num" ID="Area_T" placeholder="区号" MaxLength="4" />
<asp:TextBox runat="server" Style="width: 160px; margin-left: 10px;" class="form-control input-sm pull-left num" ID="Phone_T" placeholder="号码" MaxLength="8" />
</div>
</div>

<div class="weui_cell weui_cell_switch">
<div class="weui_cell_hd weui_cell_primary">默认地址</div>
<div class="weui_cell_ft">
<input type="checkbox" class="weui_switch" runat="server" id="Def_chk" />
</div>
</div>

</div>
<div class="padding10" style="margin-top:10px; margin-bottom:10px;">
<div class="col-xs-6 padding5"><asp:Button runat="server" ID="SaveBtn" Text="保存" OnClientClick="return CheckForm()" OnClick="SaveBtn_Click" CssClass="btn btn-danger btn-block" /></div>
<div class="col-xs-6 padding5"><a href="UserRecei1.aspx" class="btn btn-info btn-block">返回</a></div>
<div class="clearfix"></div>
</div>

<div id="toast" style="display:none;">
<div class="weui_mask_transparent" style="background:rgba(0,0,0,0.46)"></div>
<div class="weui_toast">
<i class="weui_icon_toast"></i>
<p class="weui_toast_content">保存成功！</p>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ID="script_content" ContentPlaceHolderID="ScriptContent">
<link href="/App_Themes/V3.css" rel="stylesheet" />
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<style type="text/css">.control-sm {width: 120px;display: inline-block;}</style>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="http://code.zoomla.cn/Area.js"></script>
<script src="/JS/Controls/ZL_PCC.js"></script>
<script src="/JS/jquery.validate.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
$(function () {
	ZL_Regex.B_Num(".num");
	var pcc = new ZL_PCC("province_dp", "city_dp", "county_dp");
	if ($("#pro_hid").val() == "") {
		pcc.ProvinceInit();
	}
	else {
		var attr = $("#pro_hid").val().split(' ');
		pcc.SetDef(attr[0], attr[1], attr[2]);
		pcc.ProvinceInit();
	}
	jQuery.validator.addMethod("phones", function (value) {
		return ZL_Regex.isMobilePhone(value);
	}, "请输入正确的手机号码!");
	jQuery.validator.addMethod("zipcode", function (value) {
		return ZL_Regex.isZipCode(value);
	}, "邮政编码格式不正确!");
	$("form").validate({});
});
function CheckForm() {
	$("#pro_hid").val($("#province_dp option:selected").text() + " " + $("#city_dp option:selected").text() + " " + $("#county_dp option:selected").text());
	var vaild = $("form").validate({ meta: "validate" });
	return vaild.form();

	//var flag = false;
	//if ($("#Street_T").val().length < 5) {
	//    $("#Street_T").focus();
	//    alert("详细地址字数必须大于5个字！");
	//}
	//else if (!ZL_Regex.isZipCode($("#ZipCode_T").val())) {
	//    alert("邮政编码格式不正确！");
	//    $("#ZipCode_T").focus();
	//}
	//else if (ZL_Regex.isEmpty($("#ReceName_T").val())) {
	//    alert("收货人姓名不能为空！");
	//    $("#ReceName_T").focus();
	//}
	//else if (!ZL_Regex.isMobilePhone($("#MobileNum_T").val()) && ZL_Regex.isEmpty($("#Phone_T").val())) {
	//    alert("请输入正确的手机号码或电话！");
	//    $("#MobileNum_T").focus();
	//}
	//else { flag = true; }
	//return flag;
}
function ReturnFun()
{
	window.location.href="UserRecei1.aspx";
}
function ShowSave()
{
	$("#toast").show();
	setTimeout("ReturnFun()",1000);
}
</script>
</asp:Content>
