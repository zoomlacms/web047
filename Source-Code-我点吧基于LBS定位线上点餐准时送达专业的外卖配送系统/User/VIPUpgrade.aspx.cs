using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Components;
using ZoomLa.Model;

public partial class Test_VIPUpgrade : System.Web.UI.Page
{
    B_User buser = new B_User();
    RegexHelper regHelp = new RegexHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (function.isAjax())
        {
            string action = Request.Form["action"];
            string value = (Request.Form["value"] ?? "").Replace(" ", "");
            if ("UserIsExist".Equals(action))
            {
                Response.Write(CheckUserName(value));
                Response.Flush();
                Response.End();
            }
        }
        if (!IsPostBack)
        {
            M_UserInfo mu = buser.GetLogin(false);
            if (mu.RoomID > 0)
            {
                Response.Redirect("/User/Default1.aspx");
            }
        }
    }
    public void Submit_B_Click(object sender, EventArgs e)
    {
        string mobile = mobile_txt.Text;
        string code = mobile_code.Text;
        //string result = CheckUserName(UserName_T.Text.Replace(" ", ""));
        //if (result.Equals("disabled")) { function.WriteErrMsg("该用户名禁止注册，请输入不同的用户名!"); }
        //else if (result.Equals("false")) { function.WriteErrMsg("该用户名已被他人占用，请输入不同的用户名"); }

        M_UserInfo mu = buser.GetLogin();
        M_Uinfo baseMu = buser.GetUserBaseByuserid(mu.UserID);
        
        string serverCode = Cache["mobile_code_" + mobile] as string;
        if (mu.IsNull) { function.WriteErrMsg("用户未登录!"); }
        else if (string.IsNullOrEmpty(mobile)) { function.WriteErrMsg("手机号不能为空!"); }
        else if (!regHelp.IsMobilPhone(mobile)) { function.WriteErrMsg("手机格式不正确!"); }
        else if (string.IsNullOrEmpty(code)) { function.WriteErrMsg("校验码为空!"); }
        else if (serverCode == null || string.IsNullOrEmpty(serverCode)) { function.WriteErrMsg("无对应的校验码信息!"); }
        else if (!serverCode.Equals(code, StringComparison.CurrentCultureIgnoreCase)) { function.WriteErrMsg("校验码不匹配"); }
        else
        {
            mu.UserPwd = StringHelper.MD5(Password_T.Text);
            mu.GroupID = 2;
            mu.RoomID = 1;

            if (baseMu.IsNull)
            {
                baseMu.UserId = mu.UserID;
                mu.UserBase = baseMu;
            }
            baseMu.Mobile = mobile;
            buser.UpdateByID(mu);
            buser.UpdateBase(baseMu);
            Cache["mobile_code_" + mobile] = "";
            function.WriteSuccessMsg("注册成功!", "/User/Default1.aspx");
        }
    }
    private string CheckUserName(string username)
    {
        if (buser.IsExistUName(username))
        {
            return "false";
        }
        if (StringHelper.FoundInArr(SiteConfig.UserConfig.UserNameRegDisabled, username, "|"))
        {
            return "disabled";
        }
        return "true";
    }
}
