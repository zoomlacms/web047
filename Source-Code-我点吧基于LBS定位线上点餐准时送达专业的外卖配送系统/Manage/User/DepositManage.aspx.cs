using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.Model.User;
using ZoomLa.Common;
using System.Data;
using ZoomLa.Model;
using System.Data.SqlClient;
using ZoomLa.SQLDAL;
using ZoomLa.BLL.Shop;

public partial class Manage_User_DepositManage : System.Web.UI.Page
{
    B_User buser = new B_User();
    B_Cash cashBll = new B_Cash();
    public int State { get { return DataConverter.CLng(Request.QueryString["state"]); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Call.SetBreadCrumb(Master, "<li><a href='../Main.aspx'>工作台</a></li><li><a href='UserManage.aspx'>用户管理</a></li><li><a href='" + Request.RawUrl + "'>用户出金</a></li>");
            MyBind();
        }
    }
    private void MyBind(string username = "")
    {
        Deposit_RPT.DataSource = cashBll.SelByState(State, username);
        Deposit_RPT.DataBind();
        function.Script(this, "checkState(" + State + ")");
    }
    public string GetStatus()
    {
        string status = Eval("YState").ToString();
        switch (status)
        {
            case "1":
                return "<span>等待确认</span>";
            case "99":
                return "<span style='color:green'>成功出金</span>";
            case "-1":
                return "<span style='color:red'>拒绝出金</span>";
            default:
                return "等待确认";
        }
    }
    public string GetClass() 
    {
        switch (Convert.ToInt32(Eval("Classes")))
        {
            case 1:
                return "余额提现";
            case 0:
                return "银行卡";
            default:
                return Eval("Classes","");
        }
    }
    //批量确认
    protected void CheckDepos_B_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Form["idchk"]))
        {
            cashBll.UpdateState(Request.Form["idchk"],ZLEnum.WDState.Dealed);
            MyBind();
        }
    }
    protected void Deposit_RPT_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Check":
                int id = Convert.ToInt32(e.CommandArgument);
                M_Cash cashMod = cashBll.SelReturnModel(id);
                M_UserInfo mu = buser.SelReturnModel(cashMod.UserID);
                if (cashMod.yState != (int)ZLEnum.WDState.WaitDeal) { function.WriteErrMsg("申请单状态异常,特征码:[" + cashMod.yState + "]"); }
                if (mu.IsNull) { function.WriteErrMsg("提现用户信息错误"); }
                cashBll.UpdateState(id.ToString(), ZLEnum.WDState.Dealed);
                if (cashMod.Classes == 1)
                {
                    string codeNo = "WD" + DateTime.Now.ToString("yyyyMMddHHmmss") + cashMod.Y_ID;
                    //将申请的额度转入余额(银币已在申请时扣除)
                    buser.AddMoney(cashMod.UserID, cashMod.money, M_UserExpHis.SType.Purse, "余额提现,单号[" + codeNo + "]");
                    //余额提现相当于充值,享受充值包优惠
                    B_Shop_MoneyRegular regularBll = new B_Shop_MoneyRegular();
                    regularBll.AddMoneyByMin(mu, cashMod.money, ",余额提现,充值包优惠[" + codeNo + "]");
					//存入余额进行分红
					AutoUnit(mu, cashMod.money);
                }
                
                break;
        }
        MyBind();
    }
    public string GetOP()
    {
        string opstr = "";
        if (Convert.ToInt32(Eval("YState"))==(int)ZLEnum.WDState.WaitDeal)
        {
            opstr+= "<a href='javascript:;' onclick='checkFunc(this)'>确认</a> <a href='javascript:;' onclick='ShowBack("+Eval("Y_ID")+",this)'>拒绝</a>";
        }
        return string.IsNullOrEmpty(opstr)?"<span style='color:gray'>已完结</span>":opstr;
    }
    //拒绝提现
    protected void BackDe_B_Click(object sender, EventArgs e)
    {
        M_Cash cashMod = cashBll.SelReturnModel(Convert.ToInt32(backID_Hid.Value));
        if (cashMod.yState != (int)ZLEnum.WDState.WaitDeal) { function.WriteErrMsg("申请单状态异常,特征码:[" + cashMod.yState + "]"); }
        cashMod.yState = (int)ZLEnum.WDState.Rejected;
        cashMod.Result = BackDecs_T.Text;
        //返还银币
        buser.AddMoney(cashMod.UserID, cashMod.money, M_UserExpHis.SType.SIcon, "管理员拒绝提现申请,返还");
        cashBll.UpdateByID(cashMod);
        Response.Redirect(Request.RawUrl);
    }
    protected void Search_Btn_Click(object sender, EventArgs e)
    {
        MyBind(Search_T.Text);
    }
    //-------------------------------Logical
    //自动分成,仅三层
    private void AutoUnit(M_UserInfo mu, double money)
    {
        M_UserInfo pmu1 = buser.SelReturnModel(DataConvert.CLng(mu.ParentUserID));
        M_UserInfo pmu2 = buser.SelReturnModel(DataConvert.CLng(pmu1.ParentUserID));
        M_UserInfo pmu3 = buser.SelReturnModel(DataConvert.CLng(pmu2.ParentUserID));
        double retnum1 = 0.2;
        double retnum2 = 8;//积分与现金兑换比为100：1
        double retnum3 = 4;
        if (mu.GroupID == 3)
        {
            retnum1 = 4;
            retnum2 = 4;
        }
        if (!pmu1.IsNull)
        {
            //if (pmu1.GroupID == 6)
            //{
            //    //获取30%的返利入现金
            //    buser.AddMoney(pmu1.UserID, (money * 0.3), M_UserExpHis.SType.SIcon, "返利[第一层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "],备注：" + money.ToString("f2") + "*0.3(经销商获得30%)=" + Math.Round(money * 0.3));
            //}
            //获取20%的返利入现金
            buser.AddMoney(pmu1.UserID, (money * retnum1), M_UserExpHis.SType.SIcon, "返利[第一层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "],备注：" + money.ToString("f2") + "*" + retnum1 + "=" + Math.Round(money * retnum1));
        }
        if (!pmu2.IsNull)
        {
            //获取5%的返利入积分
            buser.AddMoney(pmu2.UserID, (money * retnum2), M_UserExpHis.SType.Point, "返利[第二层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "]," + pmu1.UserName + "[用户ID：" + pmu1.UserID + "],备注：" + money.ToString("f2") + "*" + retnum2 + "=" + Math.Round(money * retnum2));
        }
        if (!pmu3.IsNull)
        {
            //获取3%的返利入积分
            buser.AddMoney(pmu3.UserID, (money * retnum3), M_UserExpHis.SType.Point, "返利[第三层],来源:" + mu.UserName + "[用户ID：" + mu.UserID + "]," + pmu1.UserName + "[用户ID：" + pmu1.UserID + "]," + pmu2.UserName + "[用户ID：" + pmu2.UserID + "],备注：" + money.ToString("f2") + "*" + retnum3 + "=" + Math.Round(money * retnum3));
        }
    }
}