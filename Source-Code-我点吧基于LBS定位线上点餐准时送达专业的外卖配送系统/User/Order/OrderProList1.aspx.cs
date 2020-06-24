using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.Shop;
using ZoomLa.BLL.User.Addon;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.User;
using ZoomLa.SQLDAL;

public partial class User_OrderProList1 : System.Web.UI.Page
{
    B_OrderList orderBll = new B_OrderList();
    M_OrderList orderMod = new M_OrderList();
    B_CartPro cartProBll = new B_CartPro();
    B_S_FloPack packbll = new B_S_FloPack();
    B_Cart cartBll = new B_Cart();
    B_User buser = new B_User();
    OrderCommon orderCom = new OrderCommon();
    B_UserAPP uappBll = new B_UserAPP();
    Appinfo uappMod = new Appinfo();
    B_WX_User wxuserBll = new B_WX_User();
    B_Payment payBll = new B_Payment();
    M_Payment payMod = new M_Payment();
    double price = 0, fare = 0, arrive = 0, allamount = 0, point = 0;
    //CartID,OrderID,OrderNo
    public string OrderNo { get { return Request.QueryString["OrderNo"]; } }
    //0:订单,1:购物车
    public int SType { get { return DataConvert.CLng(Request.QueryString["SType"]); } }
    public int pronum = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MyBind();
        }
    }
    public void MyBind()
    {
        DataTable dt = new DataTable();
        M_UserInfo mu = buser.GetLogin();
        switch (SType)
        {
            case 0://订单
                orderMod = orderBll.SelModelByOrderNo(OrderNo);
                
                //Total_L.Text = orderMod.Balance_price.ToString("f2") + "+" + orderMod.Freight.ToString("f2") + "=" + orderMod.Ordersamount.ToString("f2") + "元 (金额+运费)";
                
                labelmoney01.Text = orderMod.Receivablesamount.ToString("f2");
                ExpressNum_T.Text = orderMod.ExpressNum;
                ExpressDelivery_T.Text = orderMod.ExpressDelivery;
                if (orderMod == null || orderMod.id == 0) function.WriteErrMsg("订单不存在");
                if (orderMod.Userid != mu.UserID) function.WriteErrMsg("该订单不属于你,无法查看");
                dt = SelByOrderID(orderMod.id);
                price = orderMod.Balance_price;
                fare = orderMod.Freight;
                allamount = orderMod.Ordersamount;
                DataTable dt1 = SqlHelper.ExecuteTable("select * from ZL_Payment where PaymentNum='" + orderMod.OrderNo + "' order by PayTime DESC");
                if (dt1.Rows.Count>0)
                {
                    payMod = payBll.SelModelByPayNo(dt1.Rows[0]["PayNo"].ToString());
                    allamount = (double)payMod.MoneyPay;
                    arrive = payMod.ArriveMoney;
                    point = payMod.UsePoint;
                }
                Total_L.Text = price.ToString("f2") + " + " + fare.ToString("f2") + " - " + arrive.ToString("f2") + "-" + (point * 0.01).ToString("f2") + "(" + point + ")" + " = " + allamount.ToString("f2");
                Total_L.Text = Total_L.Text + "　(商品总价+运费-优惠券-积分兑换=总额)";
                break;
            case 1://购物车
                dt = cartBll.GetCarProList(OrderNo);
                break;
        }
        if (orderMod.Paymentstatus != (int)M_OrderList.PayEnum.HasPayed)
        {
            PayUrl_A.Visible = true;
            DataTable dt1 = SqlHelper.ExecuteTable("select * from ZL_Payment where PaymentNum='" + orderMod.OrderNo + "' order by PayTime DESC");
            string payurl = "&OrderCode=" + orderMod.OrderNo;
            if (dt1.Rows.Count > 0)
            {
                payurl = "&PayNo=" + dt1.Rows[0]["PayNo"];
            }
            uappMod = uappBll.SelModelByUid(buser.GetLogin().UserID, "wechat");
            if (uappMod != null)
            {
                M_WX_User wxuserMod1 = wxuserBll.SelForOpenid(1, uappMod.OpenID);
                M_WX_User wxuserMod2 = wxuserBll.SelForOpenid(2, uappMod.OpenID);
                if (wxuserMod1 != null && wxuserMod2 == null)
                    PayUrl_A.HRef = "/PayOnline/OrderPay.aspx?appid=1" + payurl;
                else if (wxuserMod2 != null && wxuserMod1 == null)
                    PayUrl_A.HRef = "/PayOnline/OrderPay.aspx?appid=2" + payurl;
                else if (wxuserMod1 == null && wxuserMod2 == null)
                    PayUrl_A.HRef = "/PayOnline/OrderPay.aspx?" + payurl;
            }
            else
                PayUrl_A.HRef = "/PayOnline/OrderPay.aspx?" + payurl;
        }
        if (dt.Rows.Count > 0 && !string.IsNullOrEmpty(dt.Rows[0]["Additional"].ToString()))
        {
            User_Div.Visible = true;
            M_Cart_Travel model = JsonConvert.DeserializeObject<M_Cart_Travel>(dt.Rows[0]["Additional"].ToString());
            List<M_Cart_Contract> modelList = new List<M_Cart_Contract>();
            modelList.AddRange(model.Guest);
            modelList.AddRange(model.Contract);
            UserRPT.DataSource = modelList;
            UserRPT.DataBind();
        }
        pronum = dt.Rows.Count;
        RPT.DataSource = dt;
        RPT.DataBind();
    }
    public string GetMyPrice()
    {
        return OrderHelper.GetPriceStr(DataConvert.CDouble(Eval("AllMoney")), Eval("AllMoney_Json").ToString());
    }
    public string GetShopUrl() 
    {
        return orderCom.GetShopUrl(DataConvert.CLng(Eval("StoreID")), DataConvert.CLng(Eval("ProID")));
    }
    public string GetSnapUrl()
    {
        string url = "/UploadFiles/SnapDir/" +buser.GetLogin().UserID + "/" + OrderNo + "/"+Eval("ProID")+".html";
        if (File.Exists(Server.MapPath(url)))
        {
            return "<a href='" + url + "' target='_blank'>[交易快照]</a>";
        }
        return "";
    }
    public DataTable SelByOrderID(int orderListID)
    {
        return SqlHelper.JoinQuery("A.*,B.*", "ZL_CartPro", "ZL_Commodities", "A.ProID=B.ID", "A.OrderListID=" + orderListID);
    }
    public void GetTotal(DataTable dt, ref double price, ref double fare, ref double allamount)
    {
        foreach (DataRow dr in dt.Rows)
        {
            price += Convert.ToDouble(dr["Balance_price"]);
            fare += Convert.ToDouble(dr["Freight"]);
            allamount += Convert.ToDouble(dr["Ordersamount"]);
        }
    }
}