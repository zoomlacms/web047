<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="User_Default2" ClientIDMode="Static" %><!DOCTYPE html>
<%@ Register Src="~/User/ASCX/DefaultTop.ascx" TagName="UserMenu" TagPrefix="ZL" %><!DOCTYPE html>
<%@ Register Src="~/Manage/I/ASCX/UserInfoBar.ascx" TagPrefix="ZL" TagName="UserBar" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>会员中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="/App_Themes/User.css" />
<link href="/Template/DianBa/style/global.css?v=<%Call.Label("{ZL.Label id=\"前端样式版本号\"/}");%>" rel="stylesheet" />
<link href="/dist/css/weui.min.css" rel="stylesheet"/>
<script src="/JS/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<style>
.weui_mask, .weui_mask_transition, .weui_mask_transparent { z-index:2001;}
.weui_dialog { z-index:2013;}
.weui_mask { background:rgba(0,0,0,.3);}
.user_top_ps a { padding:2px 5px; background:#5bc0de; border-radius:3px; font-size:12px; text-decoration:none;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="container user_top">
<div class="user_top_t"><a href="/User/Info/UserInfo1.aspx"><asp:Image ID="imgUserPic" AlternateText="" onerror="this.src='/images/userface/noface.gif'" runat="server" /></a></div>
<div class="user_top_p">
会员名称：<%Call.Label("{ZL.Label id=\"获取当前用户真实姓名\" /}");%><asp:Label ID="UserNameLb" runat="server" Text="" CssClass="hide"></asp:Label><br/>
会员组：<%Call.Label("{ZL.Label id=\"获取当前登录会员组名\" /}");%><a href="#"></a><br/>
余额：<a href="info/ConsumeDetail1.aspx?SType=1" title="点击查看资金明细"><asp:Label ID="UserYeLb" runat="server" Text=""></asp:Label></a>
<span>积分：<asp:Label ID="UserJfLb" runat="server" Text=""></asp:Label></span>
<p style="margin-bottom:0;">充值可得积分,积分可用于<a href="/Class_57/Default.aspx" class="btn btn-info btn-xs">兑换商品</a>哦</p>
</div>
</div>

<div class="u_info" hidden>
<div class="container">
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12 u_face">
<ZL:UserBar ID="UserBar_U" runat="server" Width="100" />
</div>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 u_syn">
<ul class="list-unstyled">
<li>
<ul class="list-unstyled">
<li>等级： <asp:Literal id="LvIcon_Li" runat="server"></asp:Literal> <asp:Label ID="UserLvLb" runat="server" Text=""></asp:Label></li>
<li>加入时间：<asp:Label ID="UserRegTimeLb" runat="server" Text=""></asp:Label></li>
</ul>
</li>
<li><i class="glyphicon glyphicon-map-marker"></i>地址：<asp:Label ID="UserAddressLb" runat="server" Text=""></asp:Label></li>
<li><i class="glyphicon glyphicon-edit"></i>个性签名：<asp:Label ID="UserSignLb" runat="server" Text=""></asp:Label></li>
<li>
<ul class="list-unstyled">
<li><i class="glyphicon glyphicon-usd"></i>
<a href="/PayOnline/SelectPayPlat.aspx" target="_blank">[在线充值]</a>
<a href="UserFunc/Money/WithDraw.aspx">[申请提现]</a>
</li>
<li>银币：<asp:Label ID="UserJbLb" runat="server" Text=""></asp:Label></li><li></li>
</ul>
</li>
</ul>
</div>
</div>
</div>

<div class="container padding0 user_flist">
<ul class="user_group" style="display:none;">
<li class="col-xs-4 padding5"><a href="/PayOnline/SelectPayPlat1.aspx"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-rmb fa-inverse fa-stack-1x"></i></span><br>充值</a></li>
<li class="col-xs-4 padding5"><a href="/Class_2/Default.aspx?ProClass=2"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-plus fa-inverse fa-stack-1x"></i></span><br>外卖</a></li>
<li class="col-xs-4 padding5"><a href="/Class_1/NodeHot.aspx"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-child fa-inverse fa-stack-1x"></i></span><br>推广</a></li>
<li class="col-xs-4 padding5"><a href="/Class_28/Default.aspx"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-volume-up fa-inverse fa-stack-1x"></i></span><br>公告</a></li>
<li class="col-xs-4 padding5"><a href="/User/Order/OrderList1.aspx"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-shopping-cart fa-inverse fa-stack-1x"></i></span><br>订单</a></li>
<li class="col-xs-4 padding5"><a href="/User/Info/ConsumeDetail1.aspx?SType=1"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-money fa-inverse fa-stack-1x"></i></span><br>财务</a></li>
<li class="col-xs-4 padding5"><a href="/User/Info/ConsumeDetail1.aspx?SType=3"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-credit-card-alt fa-inverse fa-stack-1x"></i></span><br>积分</a></li>
<li class="col-xs-4 padding5"><a href="/User/Info/UserBase1.aspx?sel=Tabs1"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-cog fa-inverse fa-stack-1x"></i></span><br>设置</a></li>
<li class="col-xs-4 padding5"><a href="/User/Info/UserRecei1.aspx"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-map-marker fa-inverse fa-stack-1x"></i></span><br>地址</a></li>
</ul>
<ul class="user_group user_group5" style="display:none;">
<li class="col-xs-6 padding5"><a href="/User/UserShop/OrderList1.aspx"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-shopping-cart fa-inverse fa-stack-1x"></i></span><br>门店订单</a></li>
<li class="col-xs-6 padding5"><a href="/User/Info/ConsumeDetail1.aspx?SType=1"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-money fa-inverse fa-stack-1x"></i></span><br>门店财务</a></li>
</ul>
</div>

<div class="container">
<div class="user_share">
<asp:LinkButton ID="Share_Btn" runat="server" CssClass="btn btn-info btn-block" OnClick="Share_Btn_Click"><i class="fa fa-share"></i> 点击分享给朋友，赚佣金！</asp:LinkButton>
<a href="/User/VIPUpgrade.aspx" class="btn btn-warning btn-block">注册正式会员</a>
</div>
</div>
 
<div class="container" hidden>  
<div class="u_menu">
<asp:Literal ID="UserApp_Li" runat="server" EnableViewState="false"></asp:Literal>
<div class="clearfix"></div>
</div>
</div> 
<div class="u_menu_more text-center" hidden>
<a href="javascript:;" id="more_btn" title="点击显示更多">More <i class="fa fa-angle-double-down"></i></a>
</div>
<div class="user_menu_sub"> 
<ul class="list-unstyled text-center">
<asp:Literal runat="server" ID="onther_lit" EnableViewState="false"></asp:Literal>
</ul>
<div class="clearfix"></div>
</div>  
</form>
<div style="height:56px;"></div>
<div class="mobile_footer">
<ul>
<li><a href="/Class_32/NodePage.aspx?ProClass=1"><i class="fa fa-home"></i><span>堂食</span></a></li>
<li><a href="/Class_2/Default.aspx?ProClass=2"><i class="fa fa-bicycle"></i><span>外卖</span></a></li>
<li><a href="/User/Default2.aspx"><i class="fa fa-user"></i><span>会员</span></a></li>
</ul>
</div>

<div class="modal-backdrop fade in" style="display:none;" id="closed_body"></div>
<div class="weui_dialog_alert" id="dialog2" style="display:none">
<div class="weui_mask"></div>
<div class="weui_dialog">
<div class="weui_dialog_hd"><strong class="weui_dialog_title">友情提示</strong></div>
<div class="weui_dialog_bd">您当前会员级别为:微信会员，升级为官方正式会员，才能使用该功能哦^_^</div>
<div class="weui_dialog_ft">
<a href="/User/VIPUpgrade.aspx" class="weui_btn_dialog primary">立即升级</a>
<a href="javascript:$('#closed_body').hide();$('#dialog2').hide();" class="weui_btn_dialog default">我知道了</a>
</div>
</div>
</div>


<div class="mobile_yan" id="mobile_yan" runat="server" visible="false">
<div class="mobile_yan_c">
<div class="mobile_yan_ct">手机验证</div>
<div class="mobile_yan_cf">
<input type="text" class="form-control" id="mobile_txt" placeholder="请输入手机号" />
<div class="input-group">
<input type="text" class="form-control" id="mobile_code" placeholder="请输入验证码" />
<span class="input-group-btn">
<button class="btn btn-info" type="button" onClick="GetMobileCode();">获取验证码</button>
</span>
</div><!-- /input-group -->
<button type="button" class="btn btn-danger btn-block" onClick="CheckCode();">确定</button>
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
</body>
</html>
<script>
var code='<%Call.Label("{$GetRequest(code)$}");%>';
$.get("/wxpage.aspx?appid=2&code=<%Call.Label("{$GetRequest(code)$}");%>", function(data){
	try
	{
		var userinfo=JSON.parse(data);
		console.log(userinfo)
		$(".user_top_t img").attr("src",userinfo.headimgurl).attr("alt",userinfo.nickname);
	}
	catch(e)
	{
		console.log(e);
	}
});
$().ready(function (e) {//菜单颜色配置
	var colorArr=new Array('#c47f3e','#669933','#27a9e3','#f05033','#990066','#9999FF','#E48632','#990000','#22afc2','#6633FF','#9900FF','#1FA67A');
	var count=$(".user_menu_sub li").length;
	for(var i=0; i<count; i++){
		$(".user_menu").eq(i).css("background",colorArr[i%12]);	
	}
    if ($(".user_menu_sub li").length < 1)
        $(".u_menu_more").remove();
	if("<%Call.Label("{ZL.Label id=\"获取当前登录会员组ID\" /}");%>"=="5")
	{
		$(".user_group5").show();
		$(".user_group5").siblings("ul").remove();
		$(".user_share").remove();
	}
	else
	{
		$(".user_group5").siblings("ul").show();
		$(".user_group5").remove();
	}
//	var status=$(".user_top_ps").data("status");
//	if(status=="2")
//		$(".user_top_ps").html("<a href='javascript:;'>已认证</a>");
//	else if(status=="0")
//		$(".user_top_ps").html("<a href='javascript:;'>待审核</a>");
//	else
//		$(".user_top_ps").html("<a href='/User/Content/AddContent1.aspx?NodeID=106&ModelID=54'>未认证</a>");
})
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
//会员菜单更多显示/隐藏
$("#more_btn").click(function(e) {
	if($(".user_menu_sub").css("display")=="none"){  
	    $(".user_menu_sub").slideDown();
		$(this).find("i").removeClass("fa-angle-double-down");
		$(this).find("i").addClass("fa-angle-double-up");
	}
	else {  
	    $(".user_menu_sub").slideUp(200); 
		$(this).find("i").removeClass("fa-angle-double-up");
		$(this).find("i").addClass("fa-angle-double-down");
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
$().ready(function(e) {
    if("<%Call.Label("{ZL.Label id=\"获取当前登录会员组ID\" /}");%>"==1)
	{
		$(".user_flist li:eq(0) a").attr("href","javascript:;").attr("onclick","ShowUpdate();").css("opacity","0.5");
		$(".user_flist li:eq(2) a").attr("href","javascript:;").attr("onclick","ShowUpdate();").css("opacity","0.5");
		$(".user_flist li:eq(6) a").attr("href","javascript:;").attr("onclick","ShowUpdate();").css("opacity","0.5");
	}
	else
	{
		$(".user_share .btn-warning").remove();
	}
});
function ShowUpdate()
{
	$("#closed_body").show();
	$("#dialog2").show();
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
function CheckCode()
{
	if(!ZL_Regex.isMobilePhone($("#mobile_txt").val()))
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
	}
	else
	{
		$.post("/API/mod/mobile.ashx?action=setmobile_2",{mobile:$("#mobile_txt").val(),code:$("#mobile_code").val()},function(data){
			var model = APIResult.getModel(data);
			if(APIResult.isok(model))
			{
				console.log(model);
				$("#mobile_yantoast").show();
				setTimeout(function () { window.location.href=window.location.href; }, 3000);
			}
			else
			{
				$("#mobile_code").popover({
					animation: true,
					placement: 'top',
					content: '<span style="color:red;">'+model.retmsg+'</span>',
					html: true,
					trigger: 'manual',
					delay: { show: 10000, hide: 100 }
				});
				$("#mobile_code").popover('show');
				setTimeout(function () { $("#mobile_code").popover('destroy'); }, 2000);
			}
		});
	}
}
</script>