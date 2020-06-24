using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.User.Addon;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.Model;
using ZoomLa.Model.User;

public partial class User_I_Default1 : System.Web.UI.MasterPage
{
    M_UserInfo info = new M_UserInfo();
    B_User buser = new B_User();
    B_Admin badmin = new B_Admin();
    B_UserAPP uappBll = new B_UserAPP();
    Appinfo uappMod = new Appinfo();
    B_WX_User wxuserBll = new B_WX_User();

    protected void Page_Init(object sender, EventArgs e)
    {
        if (buser.CheckLogin())
        {
            M_UserInfo mu = buser.GetLogin();
            if (mu == null || mu.IsNull || mu.UserID < 1)
            {
                Response.Redirect("/wxpromo.aspx?r=" + Request.RawUrl);
                //Response.Redirect("/User/Login.aspx");
            }
            else if (mu.Status != 0) { function.WriteErrMsg("你的帐户未通过验证或被锁定，请与网站管理员联系", "/User/Login.aspx"); }
            uappMod = uappBll.SelModelByUid(mu.UserID, "wechat");
            if (uappMod != null)
            {
                M_WX_User wxuserMod1 = wxuserBll.SelForOpenid(1, uappMod.OpenID);
                M_WX_User wxuserMod2 = wxuserBll.SelForOpenid(2, uappMod.OpenID);
                if (wxuserMod1 != null)
                    footer_div1.Visible = true;
                if (wxuserMod2 != null)
                    footer_div2.Visible = true;
                if (wxuserMod1 == null && wxuserMod2 == null)
                    footer_div1.Visible = true;
            }
        }
        else
        {
            B_User.CheckIsLogged(Request.RawUrl);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //M_UserInfo mu = buser.GetLogin();
        //uName.Text = mu.UserName;
    }
}
