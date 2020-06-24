using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.User.Addon;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.User;
using ZoomLa.SQLDAL;

public partial class User_UserFunc_Money_UserWithDraw : System.Web.UI.Page
{
    B_Cash cashBll = new B_Cash();
    B_User buser = new B_User();
    B_UserAPP uaBll = new B_UserAPP();
    private string Mode { get { return (Request["mode"] ?? "").ToLower(); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        B_User.CheckIsLogged(Request.RawUrl);
        if (!IsPostBack)
        {
            M_UserInfo mu = buser.GetLogin(false);
            //buser.AddMoney(mu.UserID, 5000, M_UserExpHis.SType.SIcon, "system");
            ToPurse_Div.Visible = true;//只需要提现至余额
            //switch (Mode)
            //{
            //    case "wechat":
            //        M_WX_User wxmu = GetWxUser(mu);
            //        wxmu_face_img.Src = wxmu.HeadImgUrl;
            //        wxmu_name_sp.InnerText = wxmu.Name;
            //        ToWeChat_Div.Visible = true;
            //        break;
            //    case "purse":
            //    default:
                  
            //        break;
            //}
        }
    }
    protected void ToPurse_Btn_Click(object sender, EventArgs e)
    {
        M_UserInfo mu = buser.GetLogin(false);
        int money = DataConvert.CLng(Money_T.Text);
        if (BeforeCheck(mu, money))
        {
            //完成币值转换,并计算分成
            buser.MinusVMoney(mu.UserID, money, M_UserExpHis.SType.SIcon, "提现入余额");
            //buser.AddMoney(mu.UserID, money, M_UserExpHis.SType.Purse, "提现入余额");
            //AutoUnit(mu, money);
            ////生成提现记录,由后台管理员确认后再转入余额
            M_Cash cashMod = new M_Cash();
            cashMod.UserID = mu.UserID;
            cashMod.money = money;
            cashMod.YName = mu.UserName;
            cashMod.Bank = "余额";
            cashMod.Classes = 1;//余额提现
            cashBll.insert(cashMod);
            function.WriteSuccessMsg("申请成功,请等待管理员审核");
        }
    }
    protected void ToWeChat_Btn_Click(object sender, EventArgs e)
    {
        M_UserInfo mu = buser.GetLogin(false);
        int money = DataConvert.CLng(Money2_T.Text);
        if (BeforeCheck(mu, money))
        {
            //M_WX_User wxmu = GetWxUser(mu);
            ////生成提现记录,由后台管理员确认后再转入微信零钱
            //M_Cash cashMod = new M_Cash();
            //cashMod.UserID = mu.UserID;
            //cashMod.money = money;
            //cashMod.YName = wxmu.OpenID;//微信openID
            //cashMod.Bank = "微信零钱";
            //cashMod.PeopleName = re_user_name_t.Text.Trim();//微信实名验证
            //buser.MinusVMoney(mu.UserID, money, M_UserExpHis.SType.SIcon, "提现入微信零钱");
            //cashBll.insert(cashMod);
            ////AutoUnit(mu, money);
            //function.WriteSuccessMsg("提现申请成功,请等待管理员审核");
        }
    }
    //private M_WX_User GetWxUser(M_UserInfo mu)
    //{
    //    Appinfo ucMod = uaBll.SelModelByUid(mu.UserID, "wechat");
    //    if (ucMod == null || string.IsNullOrEmpty(ucMod.OpenID)) { function.WriteErrMsg("用户尚未绑定微信"); }
    //    return WxAPI.Code_Get().GetWxUserModel(ucMod.OpenID);
    //}
    private bool BeforeCheck(M_UserInfo mu,int money)
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