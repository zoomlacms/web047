<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VIPUpgrade.aspx.cs" Inherits="Test_VIPUpgrade" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>注册会员</title>
<link href="/Template/DianBa/style/global.css?v=20150909" rel="stylesheet" />
<link href="/dist/css/weui.min.css" rel="stylesheet"/>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/ZL_Regex.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mreg_body">
<div class="mreg_title">我点吧会员注册</div>
<div class="weui_cells weui_cells_form"  style="display:none">
<div class="weui_cell weui_cell_warn">
<div class="weui_cell_hd"><label class="weui_label">会员名</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="UserName_T" runat="server" class="weui_input" onblur="CheckUser();" placeholder="请输入会员名" />
<span class="d_err" id="CheckUserNameMessage"></span>
<asp:RegularExpressionValidator ID="RevUserName_T" runat="server" ControlToValidate="UserName_T" ValidationGroup="userVaid" ErrorMessage="不能包含特殊字符" ValidationExpression="^[^@#$%^&*()'?{}\[\];:,.]*$" Display="Dynamic" ForeColor="Red" />
<asp:RequiredFieldValidator runat="server" ID="ReqUserName" ControlToValidate="UserName_T"  ErrorMessage="用户名不能为空" Display="Dynamic" ValidationGroup="userVaid" ForeColor="Red" />
</div>
<div class="weui_cell_ft"><i class="weui_icon_warn"></i></div>
</div>

<div class="weui_cell weui_cell_warn">
<div class="weui_cell_hd"><label class="weui_label">电子邮箱</label></div>
<div class="weui_cell_bd weui_cell_primary">
<asp:TextBox ID="Email_T" runat="server" class="weui_input" placeholder="请输入电子邮箱"></asp:TextBox>
<asp:RequiredFieldValidator ID="ReqEmail_T" runat="server" ErrorMessage="联系邮箱不能为空" SetFocusOnError="false" ControlToValidate="Email_T" ValidationGroup="userVaid" Display="Dynamic" ForeColor="Red" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Email_T" ValidationGroup="userVaid" ErrorMessage="请输入正确的邮箱" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Display="Dynamic" ForeColor="Red" />
</div>
<div class="weui_cell_ft"><i class="weui_icon_warn"></i></div>
</div>
</div>
</div>

<div class="mobile_yan" id="mobile_yan">
<div class="mobile_yan_c">
<div class="mobile_yan_ct">手机验证</div>
<div class="mobile_yan_cf">
<asp:TextBox ID="Password_T" TextMode="Password"  runat="server" class="form-control" placeholder="请输入会员密码" style="margin-bottom:15px;"></asp:TextBox>
<asp:TextBox ID="ConfirmPwd_T" TextMode="Password"  runat="server" class="form-control" placeholder="请再次输入密码" style="margin-bottom:15px;"></asp:TextBox>
<asp:TextBox ID="mobile_txt"  runat="server" class="form-control" placeholder="请输入手机号"></asp:TextBox>
<div class="input-group">
<asp:TextBox ID="mobile_code"  runat="server" class="form-control" placeholder="请输入验证码"></asp:TextBox>
<span class="input-group-btn">
<button class="btn btn-info" type="button" onClick="GetMobileCode();">获取验证码</button>
</span>
</div><!-- /input-group -->
<asp:Button ID="Submit_B" runat="server" Text="注册" ValidationGroup="userVaid" class="btn btn-danger btn-block" OnClick="Submit_B_Click" OnClientClick="return CheckFun();" />
</div>
</div>
</div>

<div id="mobile_yantoast" style="display: none;">
<div class="weui_mask_transparent"></div>
<div class="weui_toast">
<i class="weui_icon_toast"></i>
<p class="weui_toast_content">已完成</p>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.weui_cells { font-size:15px;}
label { font-weight:normal;}
.d_ok {color:green;}
.d_err {color:red;}
</style>
<script>
function CheckFun()
{
	if($("#Password_T").val().length<6)
	{
		$("#Password_T").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;">请输入不少于6位的密码</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#Password_T").popover('show');
		setTimeout(function () { $("#Password_T").popover('destroy'); }, 2000);
		return false;
	}
	else if($("#ConfirmPwd_T").val()!=$("#Password_T").val())
	{
		$("#ConfirmPwd_T").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;">两次密码输入不一致</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#ConfirmPwd_T").popover('show');
		setTimeout(function () { $("#ConfirmPwd_T").popover('destroy'); }, 2000);
		return false;
	}
	else if(!ZL_Regex.isMobilePhone($("#mobile_txt").val()))
	{
		$("#mobile_txt").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;">请输入正确的手机号</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#mobile_txt").popover('show');
		setTimeout(function () { $("#mobile_txt").popover('destroy'); }, 2000);
		return false;
	}
	else if(ZL_Regex.isEmpty($("#mobile_code").val()))
	{
		$("#mobile_code").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;">请输入6位数验证码</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#mobile_code").popover('show');
		setTimeout(function () { $("#mobile_code").popover('destroy'); }, 2000);
		return false;
	}
	else
		return true;
}
//手机验证
function GetMobileCode()
{
	if(!ZL_Regex.isMobilePhone($("#mobile_txt").val()))
	{
		$("#mobile_txt").popover({
			animation: true,
			placement: 'top',
			content: '<span style="color:red;"><i class="fa fa-info-sign"></i> 请输入正确的手机号</span>',
			html: true,
			trigger: 'manual',
			delay: { show: 10000, hide: 100 }
		});
		$("#mobile_txt").popover('show');
		setTimeout(function () { $("#mobile_txt").popover('destroy'); }, 2000);
	}
	else
	{
		$(".mobile_yan_cf .btn-info").html("<span class='time_sp'>60</span>s后再次获取").attr("disabled","disabled");
		var wait=60;
		var timer = setInterval(function () {
			wait--;
			if (wait <= 1) 
			{
				clearInterval(timer);
				$(".mobile_yan_cf .btn-info").html("获取验证码").removeAttr("disabled");
			}
			$(".time_sp").text(wait);
		}, 1000);
		$.post("/API/mod/mobile.ashx?action=setmobile_1",{mobile:$("#mobile_txt").val()},function(data){
			var model = APIResult.getModel(data);
			if(APIResult.isok(model))
			{
				$("#mobile_txt").popover({
					animation: true,
					placement: 'top',
					content: '<span style="color:red;">验证码已发送至您的手机，请注意查看</span>',
					html: true,
					trigger: 'manual',
					delay: { show: 10000, hide: 100 }
				});
				$("#mobile_txt").popover('show');
				setTimeout(function () { $("#mobile_txt").popover('destroy'); }, 2000);
			}
			else
			{
				$("#mobile_txt").popover({
					animation: true,
					placement: 'top',
					content: '<span style="color:red;">'+model.retmsg+'</span>',
					html: true,
					trigger: 'manual',
					delay: { show: 10000, hide: 100 }
				});
				$("#mobile_txt").popover('show');
				setTimeout(function () { $("#mobile_txt").popover('destroy'); }, 2000);
			}
		});
	}
}
//----Register User
function CheckUser() {
    var userName = document.getElementById("UserName_T");
    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
    checkUserNameMessage.className = "";
    checkUserNameMessage.innerHTML = "";
    if (userName.value.toString().replace(" ", "") != "") {
        var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
        checkUserNameMessage.className = "";
        checkUserNameMessage.innerHTML = '<i class="fa fa-spinner fa-spin"></i>';
        $.ajax({
            type: "Post",
            data: { action: "UserIsExist", value: userName.value },
            success: function (data) {
                ReceiveServerData(data);
            },
            error: function (data) {
                console.log("错误" + data);
            }
        });
    }
}
function ReceiveServerData(result) {
    var checkUserNameMessage = document.getElementById("CheckUserNameMessage");
    checkUserNameMessage.innerHTML = "";
    if (result == "false") {
        checkUserNameMessage.innerHTML = "用户名已经被注册了！";
        checkUserNameMessage.className = "d_err";
    }
    if (result == "disabled") {
        checkUserNameMessage.innerHTML = "该用户名禁止注册！";
        checkUserNameMessage.className = "d_err";
    }
    if (result == "true") {
        checkUserNameMessage.innerHTML = "恭喜您，用户名可以使用！";
        checkUserNameMessage.className = "d_ok";
    }
}
</script>
</asp:Content>
