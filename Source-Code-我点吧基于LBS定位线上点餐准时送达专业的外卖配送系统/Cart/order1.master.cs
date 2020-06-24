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

public partial class test_Cart_order1 : System.Web.UI.MasterPage
{
    B_User buser = new B_User();
    protected void Page_Load(object sender, EventArgs e)
    {
        int appid = DataConverter.CLng(Request.QueryString["appid"]);
        if (appid == 1)
        {
            footer_div1.Visible = true;
        }
        else if (appid == 2)
        {
            footer_div2.Visible = true;
        }
        else
        {
            footer_div1.Visible = true;
        }
        M_UserInfo mu = buser.GetLogin();
        if (mu != null && mu.UserID > 0)
        {
            logged_div.Visible = true;
            logged_a.InnerText = "欢迎回来," + mu.UserName;
        }
        else
        {
            nologin_div.Visible = true;
            if (Request.Cookies["UserState2"] != null)
            {
                string uname = Request.Cookies["UserState2"]["UserName"];
                login_a.InnerText = uname + ",请登录";
                login_a.HRef = "/User/Login.aspx?ReturnUrl=" + Request.RawUrl;
            }
            else { login_a.InnerText = "登录"; }
        }
    }
}
