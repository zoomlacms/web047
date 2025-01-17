﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wxpay_mp.aspx.cs" Inherits="API_pay_wxpay_mp" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>公众号支付</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%--<div class="text-center" style="margin-top: 40%;">
    <a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=<%:AppID %>&redirect_uri=<%:siteurl %>&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirectx" class="btn btn-danger">发起支付</a>
    <asp:Label runat="server" ID="Remind_L" ForeColor="Red"></asp:Label>
    <asp:Label runat="server" ID="Client_L" ForeColor="Red"></asp:Label>
</div>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    //a 97,n 110,p 112,s 115,t 116 
    function onBridgeReady() {
        WeixinJSBridge.invoke(
            'getBrandWCPayRequest', {
                "appId": "<%=appMod.Pay_APPID%>",     //公众号名称，由商户传入 
                "nonceStr": "<%:ZoomLa.BLL.WxAPI.nonce%>", //随机串  
                "package": "prepay_id=<%=prepay_id%>",
                "signType": "MD5",         //微信签名方式： 
                "timeStamp": "<%=timestr%>", //时间戳，自1970年以来的秒数     
                "paySign": "<%=paySign%>"//微信签名 
            },
            function (res) {
                $("#Client_L").text(JSON.stringify(res));
                if (res.err_msg == "get_brand_wcpay_request:ok") { window.location.href = "/User/Default1.aspx";}     // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。 
                else { history.go(-1);}
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
    } else {
        onBridgeReady();
    }
</script>
</asp:Content>