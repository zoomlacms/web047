<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wxpayonline.aspx.cs" Inherits="wxpayonline" Debug="true" %>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit" />
<title>在线支付</title>
<script src="/JS/jquery-1.11.1.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/dist/css/font-awesome.min.css" rel="stylesheet" />
<link href="/App_Themes/User.css" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
<div class="text-center">
<asp:Label runat="server" ID="Remind_L" ForeColor="Red"></asp:Label>
<asp:Label runat="server" ID="Client_L" ForeColor="Red"></asp:Label>
</div>
</form>
</body>
</html>
<script>
//a 97,n 110,p 112,s 115,t 116 
function onBridgeReady(){
    WeixinJSBridge.invoke(
        'getBrandWCPayRequest', {
            "appId": "<%=ZoomLa.BLL.WxPayAPI.WxPayConfig.APPID%>",     //公众号名称，由商户传入 
            "nonceStr": "<%=nonceStr%>", //随机串  
            "package": "prepay_id=<%=prepay_id%>",   
            "signType": "MD5",         //微信签名方式： 
            "timeStamp": "<%=timestr%>", //时间戳，自1970年以来的秒数     
            "paySign": "<%=paySign%>"//微信签名 
        },
        function (res) {
            $("#Client_L").text(JSON.stringify(res));
            if(res.err_msg == "get_brand_wcpay_request:ok" ) { window.location.href='/User/Default1.aspx'}     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
			else
			{ history.go(-1);}
        }
    ); 
}
    if (typeof WeixinJSBridge == "undefined") {
        if (document.addEventListener) {
            document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
        } else if (document.attachEvent) {
            document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
            document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
        }
    }
    else {
        onBridgeReady();
    }
</script>
