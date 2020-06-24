using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.SQLDAL;

public partial class User_UserFunc_WithDraw1 : System.Web.UI.Page
{
    B_Cash cashBll = new B_Cash();
    B_User buser = new B_User();
    private int SType { get { return DataConvert.CLng(Request.QueryString["SType"]); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            M_UserInfo mu = buser.GetLogin(false);
            NowMoney_L.Text = mu.SilverCoin.ToString("f2");
            //CDate_L.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
        }
    }
    protected void Sure_Btn_Click(object sender, EventArgs e)
    {
        M_UserInfo mu = buser.GetLogin(false);
        int money = DataConvert.CLng(Money_T.Text);
        if (BeforeCheck(mu, money))
        {
            //生成提现单据
            M_Cash cashMod = new M_Cash();
            cashMod.UserID = mu.UserID;
            cashMod.money = money;
            cashMod.YName = mu.UserName;
            cashMod.Account = Account_T.Text;
            cashMod.Bank = Bank_T.Text;
            cashMod.PeopleName = PName_T.Text;
            //cashMod.Remark = mu.UserName + "发起提现,金额:" + cashMod.money.ToString("f2");
            cashMod.yState = 0;
            cashMod.Classes = 0;
            cashMod.Remark = Remark_T.Text;
            buser.MinusVMoney(mu.UserID, money, M_UserExpHis.SType.SIcon, "提现至银行卡");
            cashBll.insert(cashMod);
            function.WriteSuccessMsg("提现申请成功,请等待管理员审核", "WithDrawLog1.aspx");
        }
        else { function.WriteErrMsg("提现申请拒绝"); }
    }
    private bool BeforeCheck(M_UserInfo mu, int money)
    {
        if (money < 200 || money % 200 != 0) { function.WriteErrMsg("提现金额不正确,必须是<span style='color:red;'>200</span>的倍数"); }
        else if (mu.SilverCoin < money) { function.WriteErrMsg("你仅有[<span style='color:red;'>" + mu.SilverCoin.ToString("f0") + "</span>],无法提现[<span style='color:red;'>" + money + "</span>]"); }
        else
        {
            return true;
        }
        return false;
    }
}