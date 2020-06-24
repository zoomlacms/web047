using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using ZoomLa.Common;
using System.Xml;
using ZoomLa.BLL;
using ZoomLa.Model;
using Newtonsoft.Json;
using System.Web.Security;
using ZoomLa.Components;
using ZoomLa.Model.Plat;
using ZoomLa.BLL.Plat;
using Newtonsoft.Json.Linq;
using System.Net;
using System.Text;
using ZoomLa.BLL.WxPayAPI;

public partial class wxpayonline : System.Web.UI.Page
{
    private M_Payment payMod = new M_Payment();//支付信息，同于支付日志类,不过只记录用现金，银联等付款
    private M_PayPlat payPlat = new M_PayPlat();
    private M_Order_PayLog paylogMod = new M_Order_PayLog();
    private B_PayPlat payPlatBll = new B_PayPlat();//支付平台
    private B_Payment paymentBll = new B_Payment();
    private B_OrderList orderBll = new B_OrderList();//订单业务类
    private B_CartPro cartBll = new B_CartPro();//数据库中购物车业务类
    private B_Order_PayLog paylogBll = new B_Order_PayLog();//支付日志类,用于记录用户付款信息
    private B_User buser = new B_User();
    private OrderCommon orderCom = new OrderCommon();
    public string PayNo { get { return Request.QueryString["payno"]; } }//OrderNo

    string baseUrl = SiteConfig.SiteInfo.SiteUrl;
    public string timestr = "";
    public string prepay_id = "";
    public string paySign = "";
    public string nonceStr = "5K8264ILTKCH16CQ2502SI8ZNMTM67VS";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(PayNo)) { function.WriteErrMsg("请传入订单号"); }
            payMod = paymentBll.SelModelByPayNo(PayNo);
            if (payMod == null || payMod.PaymentID < 1) { function.WriteErrMsg("支付单不存在"); }
			//Remind_L.Text=payMod.MoneyPay.ToString()+":"+payMod.PayNo;
            try
            {
                TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                timestr = Convert.ToInt64(ts.TotalSeconds).ToString();
                WeiXinPay();

                string stringA = "appId=" + WxPayConfig.APPID +  "&nonceStr=" + nonceStr + "&package=prepay_id="+ prepay_id + "&signType=MD5&timeStamp="+timestr;
                string stringSignTemp = stringA + "&key="+WxPayConfig.KEY;
				//BVowfoezoomlahx008flwelfwefweoif
                paySign = StringHelper.MD5(stringSignTemp).ToUpper();
            }
            catch(Exception ex) { Remind_L.Text = ex.Message; }
        }
    }
    public void WeiXinPay()
    {
        //M_OrderList orderMod = new M_OrderList();
        //orderMod = orderBll.SelModelByOrderNo(OrderNo);
         payMod= paymentBll.SelModelByPayNo(PayNo);
        //function.WriteErrMsg(DataConverter.CLng(payMod.MoneyPay * 100).ToString());
       // B_Payment payBll = new B_Payment();
        //payMod.PaymentNum = OrderNo;
       // payMod.PayNo = payBll.CreatePayNo();
        //payMod.UserID = mu.UserID;
        //payMod.Status = (int)M_Payment.PayStatus.NoPay;
        //payMod.Remark = orderMod.Ordermessage;
        //payMod.MoneyPay =Convert.ToDecimal(orderMod.Ordersamount);
        //payMod.MoneyReal = payMod.MoneyPay;
        //payMod.PaymentID = payBll.Add(payMod);

        //WXPayData签名存在但不合法,原因：金额为0
        //---------------------------------------------
        B_WX_APPID appBll = new B_WX_APPID();

		string code = Request.QueryString["code"];
        //M_WX_APPID appMod = new M_WX_APPID();//自行置入缓存,使用时取出
        //appMod.APPID = WxPayConfig.APPID;//"wx8af32f5bf73b2c81";
        //appMod.Secret = WxPayConfig.APPSECRET;//61c897f42cd3fcc1131f8f4fbafd3293
        //WxAPI wxapi = new WxAPI();
        WxAPI wxapi = WxAPI.Code_Get(1);
        //wxapi.AppId = appMod;

        string resultStr = APIHelper.GetWebResult("https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + wxapi.AppId.APPID + "&secret=" + wxapi.AppId.Secret + "&code=" + code + "&grant_type=authorization_code");
        JObject obj = (JObject)JsonConvert.DeserializeObject(resultStr);

        string urlReq1 = Request.Url.AbsoluteUri.ToString().Substring(0, Request.Url.AbsoluteUri.ToString().LastIndexOf('/'));
        WxPayData wxdata = new WxPayData();
        wxdata.SetValue("out_trade_no", payMod.PayNo);
        wxdata.SetValue("body", "我点吧");
        wxdata.SetValue("total_fee", Convert.ToInt32(payMod.MoneyPay * 100));//DataConverter.CLng(payMod.MoneyPay * 100)
        wxdata.SetValue("trade_type", "JSAPI");
        wxdata.SetValue("notify_url", urlReq1 + "/Return/WxPayReturn.aspx");
        wxdata.SetValue("product_id", payMod.PaymentNum);
        wxdata.SetValue("openid", obj["openid"].ToString());
        wxdata.SetValue("nonce_str", nonceStr);
        WxPayData result = WxPayApi.UnifiedOrder(wxdata);
        if (result.GetValue("return_code").ToString().Equals("FAIL"))
            function.WriteErrMsg("商户" + result.GetValue("return_msg"));
        prepay_id = result.GetValue("prepay_id").ToString();
    }
}