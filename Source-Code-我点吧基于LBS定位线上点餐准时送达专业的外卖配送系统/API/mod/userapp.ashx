<%@ WebHandler Language="C#" Class="userapp" %>

using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Collections.Generic;
using Newtonsoft.Json;

//主用于APP用户整合
public class userapp : API_Base, IHttpHandler
{
    B_User buser = new B_User();
    B_User_API buapi = new B_User_API();
    public void ProcessRequest(HttpContext context)
    {
        //throw new Exception("接口默认关闭,请联系管理员开启");
        retMod.retcode = M_APIResult.Failed;
        retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "reg":
                    break;
                case "login":
                    {
                        string uname = Req("uname");
                        string upwd = Req("upwd");
                        M_UserInfo mu = buapi.Login(uname, upwd);
                        M_AJAXUser auMod = new M_AJAXUser(mu);
                        if (mu.IsNull) { retMod.retmsg = "用户不存在"; }
                        retMod.result = JsonConvert.SerializeObject(auMod);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "getlogin"://根据openid获取用户信息
                    {
                        string openid = Req("openid");
                        M_UserInfo mu = B_User_API.GetLogin(openid); 
                        if (mu == null || mu.IsNull) { retMod.retmsg = "用户未登录"; }
                        M_AJAXUser auMod = new M_AJAXUser(mu);
                        retMod.result = JsonConvert.SerializeObject(auMod);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                default:
                    {
                        retMod.retmsg = "[" + Action + "]接口不存在";
                    }
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}