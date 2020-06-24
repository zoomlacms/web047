<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wxshare.aspx.cs" Inherits="wxshare" Debug="true" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<meta charset="utf-8">
<meta name="msapplication-TileColor" content="#1A0066"/>
<meta name="msapplication-TileImage" content="/images/win8_symbol_140x140.png"/>
<title>我点吧-饺饺舒心|全额返赠|分享就赢财富真的很方便|南昌首席健康生活产品|开心购物轻松赚钱更轻松</title>
<meta name="Keywords" content="META关键字">
<meta name="Description" content="META网页描述">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<link href="/dist/css/bootstrap.min.css" rel="stylesheet"/>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/JS/jquery-1.11.1.min.js" ></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/Template/DianBa/style/global.css" rel="stylesheet"/>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    wx.config({
        appId: '<%=appMod.APPID%>', // 必填，公众号的唯一标识
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        jsApiList: ["onMenuShareAppMessage"], // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        nonceStr: '<%=nonceStr%>', // 必填，生成签名的随机串
        signature: '<%=paySign%>',// 必填，签名，见附录1
        timestamp: '<%=timestr%>' // 必填，生成签名的时间戳
    });
    wx.ready(function () {
        // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
        wx.onMenuShareAppMessage({
            title: '我点吧', // 分享标题
            desc: '新鲜餐饮生活就上wodian8.com,江西龙悦餐饮旗下', // 分享描述
            link: 'http://v.wodian8.com/wxpromo.aspx?userid=<%Call.Label("{ZL:GetuserID()/}"); %>', // 分享链接
            imgUrl: 'http://v.wodian8.com/UploadFiles/bLOGO.jpg', // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
//		wx.getLocation({
//			type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
//			success: function (res) {
//				var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
//				var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
//				var speed = res.speed; // 速度，以米/每秒计
//				var accuracy = res.accuracy; // 位置精度
//				alert(latitude+"|"+longitude);
//			}
//		});
    });
</script>
<style>
.mobile_footer li a { color:#ff7000;}
#logos{margin:auto; width:80%; box-shadow:none; margin-bottom:20px;}
.logos .cls-1,.logos .cls-2,.logos .cls-3{fill:#fff;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="tui_body">
<div class="tui_body_t">


<svg id="logos" data-name="图层 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 331.79 84.53"><defs><style>.cls-1,.cls-2,.cls-3{fill:#fff;}.cls-2{font-size:18px;}.cls-2,.cls-3{font-family:Microsoft YaHei;}.cls-3{font-size:17px;}</style></defs><title>logo_clor</title><path class="cls-1" d="M151.11,268.67h47.7V349h-47.7C114.61,349,114.61,268.67,151.11,268.67Z" transform="translate(-123.74 -268.18)"/><path class="cls-1" d="M222.51,269.52h7.31a1,1,0,0,1,.84.84v3.09q0,5.91-3.66,5.91h-1.69v3.94h9.56V270.36c0-.56.18-0.84,0.56-0.84h8.16a0.91,0.91,0,0,1,.56.84V283.3h14.34a0.5,0.5,0,0,1,.56.56V290a0.5,0.5,0,0,1-.56.56H244.16V305.8h6.19a0.5,0.5,0,0,0,.56-0.56v-11a0.9,0.9,0,0,1,.84-0.56h6.75a0.5,0.5,0,0,1,.56.56V308q0,5.35-6.47,5.34h-8.44v3.09a1.59,1.59,0,0,0,1.13,1.13h13.22a0.5,0.5,0,0,1,.56.56v5.91a0.5,0.5,0,0,1-.56.56h-18q-5.63,0-5.62-4.5V290.61h-9.56V296h5.34a0.5,0.5,0,0,1,.56.56v7a0.5,0.5,0,0,1-.56.56h-5.34v16.31q0,3.38-5.06,4.5-4.22-.28-6.75-0.28h-6.75c-0.56,0-.84-0.19-0.84-0.56v-5.91a0.9,0.9,0,0,1,.84-0.56H216l0.28-1.69v-7q-3.94,3.38-7.31,3.38s-4.32-7.4-1.69-8.16q9-7,9-7.31v-6.19H204.79c-0.56,0-.84-0.18-0.84-0.56v-6.19a0.9,0.9,0,0,1,.84-0.56h11.53v-3.94h-11a0.49,0.49,0,0,1-.56-0.56Zm26.44-.84a36.32,36.32,0,0,1,9.28,9.28v1.69q-5.91,2.25-7.31,2.25,0-.28-2.53-12.94Z" transform="translate(-123.74 -268.18)"/><path class="cls-1" d="M277,268.18h8.72a0.5,0.5,0,0,1,.56.56v2h27.56a12.49,12.49,0,0,0,3.09-1.12q7,0.84,7,2v6.19a0.5,0.5,0,0,1-.56.56H286.31v5.06h37.13a0.5,0.5,0,0,1,.56.56V302.5q-3.37,4.5-5.34,5.63s-5.19-1.69-7-1.69c-1.45,0-4.64,1.72-6.81,1.72-7.3,0-18.06,4.19-23.52,0a11.58,11.58,0,0,0-6.68-2.19c-0.67,0-2.66.2-2.66,0.2-0.38,0-2.84,1.8-2.84,1.42V283.93a0.5,0.5,0,0,1,.56-0.56h6.75V268.75A0.5,0.5,0,0,1,277,268.18ZM279.84,291v9.28h33.47V291H279.84Z" transform="translate(-123.74 -268.18)"/><path class="cls-1" d="M321.48,309c-0.48.48-4.44,8.29-4.75,6-1.76-13.15-9.66-5.4-17.12-2.37-19.43,7.88-19-.68-19.9-1.15-2.88-1.43-4.5.46-7,2.5s-6.15,6-4.14,8.54a8.66,8.66,0,0,0,5.49,2.78l4.94-4.8c2.38-4.09,3.17,1.95,4.34,1.81,5.1-.59,16.48-0.14,23.73-3.12,2.74-1.13,6.21,12.42,11.66,7.12,1.55-1.5,2.75-3.4,6-6.17s7.27-6.2,6.27-8.2C329.75,309.25,324.86,305.58,321.48,309Z" transform="translate(-123.74 -268.18)"/><circle class="cls-1" cx="90" cy="36.28" r="9.9"/><circle class="cls-1" cx="151.36" cy="48.72" r="9.9"/><polygon class="cls-1" points="309.45 20.24 262.12 20.24 262.12 14.65 305.29 14.65 309.45 20.24"/><polygon class="cls-1" points="331.79 29.24 262.12 29.24 262.12 23.47 328.34 23.47 331.79 29.24"/><polygon class="cls-1" points="312.12 37.76 262.12 37.76 262.12 31.99 315.39 31.99 312.12 37.76"/><text class="cls-2" transform="translate(206.36 79.82)">wodian8.com</text><text class="cls-3" transform="translate(84.51 79.82)">健康幸福全搞定</text><path class="cls-1" d="M340.61,272.21h3.16a8.38,8.38,0,0,1,8.38,8.38l0,36.4a8.38,8.38,0,0,1-8.27,8.39l-3.18,0a8.38,8.38,0,0,1-8.5-8.38V280.59A8.38,8.38,0,0,1,340.61,272.21Zm1.56,6.94h0a1.19,1.19,0,0,0-1.19,1.19v36.8a1.19,1.19,0,0,0,1.19,1.19h0a1.19,1.19,0,0,0,1.19-1.19l0-36.8A1.19,1.19,0,0,0,342.17,279.15Zm13.6-7.44h27.68a1.19,1.19,0,0,1,1.19,1.19V298a1.19,1.19,0,0,1-.37.86l-7.58,7.23a1.19,1.19,0,0,1-.82.33H365a1.19,1.19,0,0,0-1.19,1.19v10.28a1.19,1.19,0,0,0,1.19,1.19l20.31,0.59-29.57,6.15a1.19,1.19,0,0,1-1.19-1.19V272.89A1.19,1.19,0,0,1,355.76,271.71Zm8.55,28h0.53a1.19,1.19,0,0,0,1.19-1.19V279.69a1.19,1.19,0,0,0-1.19-1.19h-0.53a1.19,1.19,0,0,0-1.19,1.19v18.84A1.19,1.19,0,0,0,364.32,299.72ZM375,278.5h-0.53a1.19,1.19,0,0,0-1.19,1.19v18.84a1.19,1.19,0,0,0,1.19,1.19H375a1.19,1.19,0,0,0,1.19-1.19V279.69A1.19,1.19,0,0,0,375,278.5Z" transform="translate(-123.74 -268.18)"/></svg>


<asp:Image ID="Image1" runat="server" AlternateText="推广二维码" Width="240" />
</div>
<div class="tui_body_b">
<h3>长按上图/识别图中二维码/轻松搞定!</h3>
<div class="media">
<div class="media-left"><img class="media-object" src="" alt="" onerror="javascript:this.src='/Images/userface/noface.gif';" /></div>
<div class="media-body">
<h4 class="media-heading">我是<span></span></h4>
<p>我为<span>我点吧</span>代言</p>
</div>
</div>
</div>
<div class="mobile_footer" id="footer_div1" runat="server" visible="false">
<ul>
<li><a href="/Class_57/Default.aspx"><i class="fa fa-shopping-bag"></i><span>淘吧</span></a></li>
<li><a href="/Class_28/Default.aspx"><i class="fa fa-compass"></i><span>活动</span></a></li>
<li><a href="/User/Default1.aspx"><i class="fa fa-user"></i><span>会员</span></a></li>
<div class="clearfix"></div>
</ul>
</div>
<div class="mobile_footer" id="footer_div2" runat="server" visible="false">
<ul>
<li><a href="/Class_32/NodePage.aspx?ProClass=1"><i class="fa fa-home"></i><span>堂食</span></a></li>
<li><a href="/Class_2/Default.aspx?ProClass=2"><i class="fa fa-bicycle"></i><span>外卖</span></a></li>
<li><a href="/User/Default2.aspx"><i class="fa fa-user"></i><span>会员</span></a></li>
<div class="clearfix"></div>
</ul>
</div>
</div>
</form>
</body>
</html>
<script src="/JS/Controls/B_User.js"></script>
<script>
$.get("/wxpage.aspx?appid=<%=Request.QueryString["appid"]%>&code=<%Call.Label("{$GetRequest(code)$}");%>", function(data){
	try
	{
		var userinfo=JSON.parse(data);
		console.log(userinfo)
		$(".tui_body_b img").attr("src",userinfo.headimgurl).attr("alt",userinfo.nickname);
		$(".tui_body_b h4 span").html(userinfo.nickname);
	}
	catch(e)
	{
		console.log(e);
	}
});
</script>