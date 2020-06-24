using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.Shop;
using ZoomLa.BLL.WxPayAPI;
using ZoomLa.BLL.User.Addon;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.Shop;
using ZoomLa.Model.User;
using ZoomLa.SQLDAL;

public partial class PayOnline_WxPayReturn : System.Web.UI.Page
{
    ZoomLa.BLL.WxPayAPI.Notify wxnotify = null;
    B_Payment payBll = new B_Payment();
    private B_Order_PayLog paylogBll = new B_Order_PayLog();//支付日志类,用于记录用户付款信息
    private B_OrderList orderBll = new B_OrderList();
    private OrderCommon orderCom = new OrderCommon();
    B_User buser = new B_User();
    B_Shop_PrintTlp tlpBll = new B_Shop_PrintTlp();
    B_Shop_PrintDevice devBll = new B_Shop_PrintDevice();
    B_Shop_APIPrinter printBll = new B_Shop_APIPrinter();
    B_Shop_PrintMessage msgBll = new B_Shop_PrintMessage();
    OrderCommon orderCOM = new OrderCommon();
    B_UserAPP userappBll = new B_UserAPP();
    Appinfo userappMod = new Appinfo();
    //微信异步
    protected void Page_Load(object sender, EventArgs e)
    {
		ZLLog.L("has init");
		string result ="";
        wxnotify = new ZoomLa.BLL.WxPayAPI.Notify(this);
        result =ProcessNotify();
		Response.Clear(); Response.Write(result); Response.Flush(); Response.End();
    }
    public string ProcessNotify()
    {
        WxPayData notifyData = GetNotifyData(Request.InputStream);
        //检查支付结果中transaction_id是否存在
		ZLLog.L("1.1");
        if (!notifyData.IsSet("out_trade_no"))
        {
            //若transaction_id不存在，则立即返回结果给微信支付后台
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "FAIL");
            res.SetValue("return_msg", "支付结果中微信订单号不存在");
            ZLLog.L(ZLEnum.Log.pay, new M_Log()
            {
                Action = "支付平台异常",
                Message = "平台:微信,原因:支付结果中微信订单号不存在!"
            });
            return res.ToXml();
        }
		ZLLog.L("2");
        string transaction_id = notifyData.GetValue("out_trade_no").ToString();
        //查询订单，判断订单真实性
        if (!QueryOrder(transaction_id))
        {
            //若订单查询失败，则立即返回结果给微信支付后台
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "FAIL");
            res.SetValue("return_msg", "订单查询失败");
            ZLLog.L(ZLEnum.Log.pay, new M_Log()
            {
                Action = "支付平台异常",
                Message = "平台:微信,支付单:" + transaction_id + ",原因:订单查询失败!"
            });
            return res.ToXml();
        }
        //查询订单成功
        else
        {
			ZLLog.L("3");
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "SUCCESS");
            res.SetValue("return_msg", "OK");
            try
            {
                PayOrder_Success(notifyData);
            }
            catch (Exception ex)
            {
                ZLLog.L(ZLEnum.Log.pay, new M_Log() { Action = "微信支付报错,支付单:" + transaction_id, Message = ex.Message });
            }
            return res.ToXml();
        }
    }
    //支付成功时执行的操作
    private void PayOrder_Success(WxPayData result)
    {
        ZLLog.L(ZLEnum.Log.pay, "微信:微信支付 支付单:"+ result.GetValue("out_trade_no")+" 金额:"+ result.GetValue("total_fee"));
        try
        {
            M_Order_PayLog paylogMod = new M_Order_PayLog();
            M_Payment pinfo = payBll.SelModelByPayNo(result.GetValue("out_trade_no").ToString());
            if (pinfo == null) { throw new Exception("支付单不存在"); }//支付单检测合为一个方法
            if (pinfo.Status != (int)M_Payment.PayStatus.NoPay) { throw new Exception("支付单状态不为未支付"); }
            pinfo.Status = (int)M_Payment.PayStatus.HasPayed;
            pinfo.PlatformInfo = "微信扫码|公众号支付";
            pinfo.SuccessTime = DateTime.Now;
            pinfo.PayTime = DateTime.Now;
            pinfo.CStatus = true;
            //1=100,
            double tradeAmt = Convert.ToDouble(result.GetValue("total_fee")) / 100;
            pinfo.MoneyTrue = tradeAmt;
            payBll.Update(pinfo);
            DataTable orderDT = orderBll.GetOrderbyOrderNo(pinfo.PaymentNum);
            foreach (DataRow dr in orderDT.Rows)
            {
                M_OrderList orderMod = orderBll.SelModelByOrderNo(dr["OrderNo"].ToString());
                OrderHelper.FinalStep(pinfo, orderMod, paylogMod);
                if (orderMod.Ordertype == (int)M_OrderList.OrderEnum.Purse)
                {
                    M_UserInfo mu = buser.SelReturnModel(orderMod.Userid);
                    new B_Shop_MoneyRegular().AddMoneyByMin(mu, orderMod.Ordersamount, ",订单号[" + orderMod.OrderNo + "]");
                }
                orderCom.SendMessage(orderMod, paylogMod, "payed");
                //orderCom.SaveSnapShot(orderMod);

                if(orderMod.Ordertype!=6)
                {
                    buser.ChangeVirtualMoney(orderMod.Userid, new M_UserExpHis()
                    {
                        score = orderMod.Ordersamount,
                        ScoreType = 3,
                        detail = "在线消费赠送积分：" + orderMod.Ordersamount
                    });
                }
                //订单返利
                OrderRebates(orderMod.Userid, orderMod.Ordersamount);
                //订单打印
                int orderID = DataConvert.CLng(dr["ID"].ToString());
				int StoreID = DataConvert.CLng(dr["StoreID"].ToString());
                int devID = GetPrintDevice(StoreID);//设备ID
                int tlpID = GetPrintModelID(StoreID);//模板ID
                int printnum = GetPrintNum(StoreID);
                //------------------------------
                DataTable orderDT1 = DBCenter.Sel("ZL_OrderInfo", "ID=" + orderID);
                M_Shop_PrintTlp tlpMod = tlpBll.SelReturnModel(tlpID);
                M_Shop_PrintDevice devMod = devBll.SelReturnModel(devID);
                string msg = orderCOM.TlpDeal(tlpMod.Content, orderDT1);
                ZLLog.L(ZLEnum.Log.pay, msg);
                msgBll.Insert(msg, tlpMod.ID, devMod, printnum);
                //function.WriteSuccessMsg("信息已发送", "MessageList.aspx");

                //发送微信通知
                try
                {
                    userappMod = userappBll.SelModelByUid(DataConvert.CLng(dr["UserID"]), "wechat");
                    if (userappMod != null)
                    {
                        WxAPI wxapi = WxAPI.Code_Get(1);
                        if(dr["Ordertype"].ToString()=="6")
                        {
                            M_UserInfo userMod = buser.GetUserByUserID(DataConvert.CLng(dr["UserID"]));
                            wxapi.Tlp_SendTlpMsg(userappMod.OpenID, "vRUiDj-k6EGjwQC2GO4oU1G37CJjiu2fZ-ePBj1jJ60", "http://v.wodian8.com/User/Order/OrderList1.aspx", "{\"first\": {\"value\":\"您好，您已经充值成功。\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"" + DataConvert.CDouble(dr["Ordersamount"]).ToString("0.00") + "\",\"color\":\"#173177\"},\"keyword2\": {\"value\":\"" + DateTime.Now.ToString("yyyy年MM月dd日 HH:mm:ss") + "\",\"color\":\"#173177\"},\"keyword3\": {\"value\":\"" + userMod.Purse.ToString("0.00") + "\",\"color\":\"#173177\"},\"remark\":{\"value\":\"感谢您对我们的信任，我们将为您提供更优质的服务。\",\"color\":\"#173177\"}}");
                        }
                        else
                        {
                            wxapi.Tlp_SendTlpMsg(userappMod.OpenID, "E-yWv8GVKeJHymtTB0zOGKnEv6LXodjr-M6tj1sLzfM", "http://v.wodian8.com/User/Order/OrderList1.aspx", "{\"first\": {\"value\":\"您的订单支付成功！\",\"color\":\"#173177\"},\"keyword1\":{\"value\":\"" + dr["OrderNo"].ToString() + "\",\"color\":\"#173177\"},\"keyword2\": {\"value\":\"" + GetProname(DataConvert.CLng(dr["ID"])) + "\",\"color\":\"#173177\"},\"keyword3\": {\"value\":\"" + DataConvert.CDouble(dr["Ordersamount"]).ToString("0.00") + "\",\"color\":\"#173177\"},\"keyword4\": {\"value\":\"" + DateTime.Now.ToString("yyyy年MM月dd日 HH:mm:ss") + "\",\"color\":\"#173177\"},\"remark\":{\"value\":\"点击查看订单详情！\",\"color\":\"#173177\"}}");
                        }
                    }
                }
                catch (Exception ex)
                {
                    ZLLog.L(ZLEnum.Log.pay, new M_Log()
                    {
                        Action = "发送微信通知报错",
                        Message = "原因:" + ex.Message
                    });
                    throw;
                }
            }
            ZLLog.L(ZLEnum.Log.pay, "微信支付成功!支付单:" + result.GetValue("out_trade_no").ToString());
        }
        catch (Exception ex)
        {
            ZLLog.L(ZLEnum.Log.pay, new M_Log()
            {
                Action = "支付回调报错",
                Message = "平台:微信,支付单:" + result.GetValue("out_trade_no").ToString() + ",原因:" + ex.Message
            });
        }
    }
    //查询订单
    private bool QueryOrder(string transaction_id)
    {
        WxPayData req = new WxPayData();
        req.SetValue("out_trade_no", transaction_id);
        WxPayData res = WxPayApi.OrderQuery(req, WxPayApi.Pay_GetByID(1));
        if (res.GetValue("return_code").ToString() == "SUCCESS" &&
            res.GetValue("result_code").ToString() == "SUCCESS")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    private int GetPrintModelID(int orderid)
    {
        int modelid = 2;
		DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_CommonModel left join ZL_Store_reg on ItemID=ID where ModelID=24 And Status=99 And GeneralID=" + orderid, null);
        //DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select PrintModel from ZL_CommonModel left join ZL_C_mdmx on ItemID=ID where ModelID=51 And Status=99 And Inputer=(select AddUser from ZL_Commodities where ID=(select top 1 ProID from ZL_CartPro where Orderlistid=" + orderid + "))", null);
        if (dt.Rows.Count > 0)
            modelid = DataConvert.CLng(dt.Rows[0]["PrintModel"]);
        return modelid;
    }
    private int GetPrintDevice(int orderid)
    {
        int deviceid = 1;
		DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_CommonModel left join ZL_Store_reg on ItemID=ID where ModelID=24 And Status=99 And GeneralID=" + orderid, null);
        //DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select PrintDevice from ZL_CommonModel left join ZL_C_mdmx on ItemID=ID where ModelID=51 And Status=99 And Inputer=(select AddUser from ZL_Commodities where ID=(select top 1 ProID from ZL_CartPro where Orderlistid=" + orderid + "))", null);
        if (dt.Rows.Count > 0)
            deviceid = DataConvert.CLng(dt.Rows[0]["PrintDevice"]);
        return deviceid;
    }
    public string GetProname(int orderid)
    {
        B_CartPro cartProBll = new B_CartPro();
        string result = "";
        DataTable dt = cartProBll.SelByOrderID(orderid);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            result += dt.Rows[i]["Proname"].ToString() + "x" + dt.Rows[i]["Pronum"].ToString() + " ￥" + DataConvert.CDouble(dt.Rows[i]["AllMoney"].ToString()).ToString("0.00") + "元 ";
        }
        return result;
    }
	public WxPayData GetNotifyData(System.IO.Stream s)
    {
        //接收从微信后台POST过来的数据
        //System.IO.Stream s = page.Request.InputStream;
        int count = 0;
        byte[] buffer = new byte[1024];
        System.Text.StringBuilder builder = new System.Text.StringBuilder();
        while ((count = s.Read(buffer, 0, 1024)) > 0)
        {
            builder.Append(System.Text.Encoding.UTF8.GetString(buffer, 0, count));
        }
        s.Flush();
        s.Close();
        s.Dispose();

        //转换数据格式并验证签名
        WxPayData data = new WxPayData();
        try
        {
            data.FromXml(builder.ToString());
        }
        catch (WxPayException ex)
        {
            //若签名错误，则立即返回结果给微信支付后台
            WxPayData res = new WxPayData();
            res.SetValue("return_code", "FAIL");
            res.SetValue("return_msg", ex.Message);
            data = res;
        }
        return data;
    }
    //订单返利
    public void OrderRebates(int userid, double money)
    {
        M_UserInfo mu = buser.GetUserByUserID(userid);
        M_UserInfo pmu1 = buser.SelReturnModel(DataConvert.CLng(mu.ParentUserID));
        M_UserInfo pmu2 = buser.SelReturnModel(DataConvert.CLng(pmu1.ParentUserID));
        M_UserInfo pmu3 = buser.SelReturnModel(DataConvert.CLng(pmu2.ParentUserID));
        //普通会员返利分成为 20/8/4
        double retnum1 = 0.2;
        double retnum2 = 8;//积分与现金兑换比为100：1
        double retnum3 = 4;
        if (mu.GroupID == 3)
        {
            //VIP会员返利分成为 4/4/4
            retnum1 = 0.04;
            retnum2 = 4;
            retnum3 = 4;
        }
        if (!pmu1.IsNull)
        {
            //第一层获得返利
            buser.AddMoney(pmu1.UserID, (money * retnum1), M_UserExpHis.SType.SIcon, "返利[第一层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "],备注：" + money.ToString("f2") + "*" + retnum1 + "=" + Math.Round(money * retnum1));
        }
        if (!pmu2.IsNull)
        {
            //第二层获得返利
            buser.AddMoney(pmu2.UserID, (money * retnum2), M_UserExpHis.SType.Point, "返利[第二层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "]," + pmu1.UserName + "[用户ID：" + pmu1.UserID + "],备注：" + money.ToString("f2") + "*" + retnum2 + "=" + Math.Round(money * retnum2));
        }
        if (!pmu3.IsNull)
        {
            //第三层获得返利
            buser.AddMoney(pmu3.UserID, (money * retnum3), M_UserExpHis.SType.Point, "返利[第三层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "]," + pmu1.UserName + "[用户ID：" + pmu1.UserID + "]," + pmu2.UserName + "[用户ID：" + pmu2.UserID + "],备注：" + money.ToString("f2") + "*" + retnum3 + "=" + Math.Round(money * retnum3));
        }
    }
    public int GetPrintNum(int storeid)
    {
        int printnum = 1;
        DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_CommonModel left join ZL_Store_reg on ItemID=ID where ModelID=24 And Status=99 And GeneralID=" + storeid, null);
        //DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select PrintModel from ZL_CommonModel left join ZL_C_mdmx on ItemID=ID where ModelID=51 And Status=99 And Inputer=(select AddUser from ZL_Commodities where ID=(select top 1 ProID from ZL_CartPro where Orderlistid=" + orderid + "))", null);
        if (dt.Rows.Count > 0)
            printnum = DataConvert.CLng(dt.Rows[0]["OrderPrintNum"]);
        return printnum;
    }
}