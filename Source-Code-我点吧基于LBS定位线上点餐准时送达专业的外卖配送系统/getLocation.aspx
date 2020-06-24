<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getLocation.aspx.cs" Inherits="getLocation" Debug="true" %>
<!DOCTYPE HTML>
<html>
<head runat="server">
<meta charset="utf-8">
<meta name="msapplication-TileColor" content="#1A0066"/>
<meta name="msapplication-TileImage" content="/images/win8_symbol_140x140.png"/>
<title><%Call.Label("{$SiteName/}");%></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
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
	debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	jsApiList: ["onMenuShareAppMessage"], // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
	nonceStr: '<%=nonceStr%>', // 必填，生成签名的随机串
	signature: '<%=paySign%>',// 必填，签名，见附录1
	timestamp: '<%=timestr%>' // 必填，生成签名的时间戳
});
wx.ready(function () {
	// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
	wx.getLocation({
		type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
		success: function (res) {
			var para={
				lng:'',
				lat:'',
				page:cpage,
				psize:'1',
				limit:0
			}
			para.lat = res.latitude; // 纬度，浮点数，范围为90 ~ -90
			para.lng = res.longitude; // 经度，浮点数，范围为180 ~ -180。
			var speed = res.speed; // 速度，以米/每秒计
			var accuracy = res.accuracy; // 位置精度
			$.post('/API/nearby.ashx?action=mynear',para,function(data){
				alert(data)
				if(data.retcode=="1")
				{
					if(data.result!="")
					{
						data=JSON.parse(data.result);
						window.location.href="/Item/"+data[0].gid+".aspx?ProClass={$GetRequest(ProClass)$}";
					}
				}
			});
		}
	});
});
</script>
</head>
<body class="shop_find">
<div class="container">
<h1>正在为您寻找最近的门店，请稍候...</h1>
<div class="progress">
<div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
<span class="sr-only">45% Complete</span>
</div>
</div>
</div>
</body>
</html>