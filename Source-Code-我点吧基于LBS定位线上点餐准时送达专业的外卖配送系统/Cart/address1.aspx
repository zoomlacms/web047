<%@ Page Language="C#" AutoEventWireup="true" CodeFile="address1.aspx.cs" Inherits="test_Cart_address1" MasterPageFile="~/Common/Master/Empty1.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>地址管理</title>
<link href="/App_Themes/V3.css" rel="stylesheet" />
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<style>
.weui_fade_toggle { background:#000;}
label { font-weight:normal; margin-bottom:0;}
.weui_cells { font-size:1em;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
<div id="actionSheet_wrap">
<div class="weui_mask_transition weui_fade_toggle" id="mask" style="display: block;"></div>
<div class="weui_actionsheet weui_actionsheet_toggle" id="weui_actionsheet" style="background:#fff;">
<div class="mobile_address">
<div class="mobile_address_t">收货地址</div>
<div class="mobile_address_c">
<div class="weui_cells weui_cells_form" style="margin-top:0;">

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">收件人</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm" ID="ReceName_T" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">省</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:HiddenField ID="pro_hid" runat="server" />
<select id="province_dp" name="province_dp" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">市</label></div>
<div class="weui_cell_bd weui_cell_primary">
<select id="city_dp" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">县/区</label></div>
<div class="weui_cell_bd weui_cell_primary">
<select id="county_dp" class="form-control input-sm"></select>
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">地址</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm" ID="Street_T" TextMode="MultiLine" />
</div>
</div>

<div class="weui_cell" style="display:none;">
<div class="weui_cell_hd"><label class="weui_label">邮编</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm" ID="ZipCode_T" MaxLength="6" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">手机</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" class="form-control input-sm num" ID="MobileNum_T" MaxLength="13" />
</div>
</div>

<div class="weui_cell" style="display:none;">
<div class="weui_cell_hd"><label class="weui_label">电话</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox runat="server" Style="width: 60px;" class="form-control input-sm pull-left num" ID="Area_T" placeholder="区号" MaxLength="4" />
<asp:TextBox runat="server" Style="width: 160px; margin-left: 10px;" class="form-control input-sm pull-left num" ID="Phone_T" placeholder="号码" MaxLength="8" />
</div>
</div>

<div class="weui_cell">
<div class="weui_cell_hd"><label class="weui_label">默认</label></div>
<div class="weui_cell_ft">
<input type="checkbox" class="weui_switch" runat="server" id="Def_chk" />
</div>
</div>

</div>
<div class="weui_btn_area">
<asp:Button runat="server" ID="SaveBtn" Text="保存" OnClientClick="return CheckForm()" OnClick="SaveBtn_Click" CssClass="weui_btn weui_btn_primary" />
</div>
</div>

<div class="mobile_address_b"><a href="getOrderInfo1.aspx?ids=<%=Request.QueryString["ids"] %>&ProClass=<%= Request.QueryString["ProClass"] %>&remark=<%= Request.QueryString["remark"] %>"><i class="fa fa-close"></i></a></div>

</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="http://code.zoomla.cn/Area.js"></script>
<script src="/JS/Controls/ZL_PCC.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script type="text/javascript">
$().ready(function () {
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
});
function CheckForm() {
	var flag = false;
	if ($("#Street_T").val().length < 5) {
		$("#Street_T").focus();
		alert("详细地址字数必须大于5个字！");
	}
//	else if (!ZL_Regex.isZipCode($("#ZipCode_T").val())) {
//		alert("邮政编码格式不正确！");
//		$("#ZipCode_T").focus();
//	}
	else if (ZL_Regex.isEmpty($("#ReceName_T").val())) {
		alert("收货人姓名不能为空！");
		$("#ReceName_T").focus();
	}
	else if (!ZL_Regex.isMobilePhone($("#MobileNum_T").val()) && ZL_Regex.isEmpty($("#Phone_T").val())) {
		alert("请输入正确的手机号码或电话！");
		$("#MobileNum_T").focus();
	}
	else { flag = true; }
	$("#pro_hid").val($("#province_dp option:selected").text() + " " + $("#city_dp option:selected").text() + " " + $("#county_dp option:selected").text());
	return flag;
}
function Refresh() {
	window.location.href="getOrderInfo1.aspx?ids=<%=Request.QueryString["ids"] %>&ProClass=<%= Request.QueryString["ProClass"] %>&remark=<%= Request.QueryString["remark"] %>";
	//if (parent && parent.Refresh) parent.Refresh();
	//parent.location = parent.window.location;
}
</script>
</asp:Content>