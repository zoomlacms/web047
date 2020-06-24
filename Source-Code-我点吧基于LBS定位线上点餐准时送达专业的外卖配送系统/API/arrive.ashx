<%@ WebHandler Language="C#" Class="arrive" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ZoomLa.BLL.API;
using ZoomLa.SQLDAL;
using ZoomLa.BLL;
using ZoomLa.Model;
using ZoomLa.BLL.Helper;
using Newtonsoft.Json;

public class arrive : System.Web.SessionState.IReadOnlySessionState, IHttpHandler
{
    public B_User buser = new B_User();
    public M_APIResult retMod = new M_APIResult();
    public B_Arrive arriveBll = new B_Arrive();
    M_Arrive arriveMod = new M_Arrive();
    public string Action { get { return Req("Action").ToLower(); } }
    public string CallBack { get { return Req("callback"); } }
    public string Req(string name) { return HttpContext.Current.Request[name] ?? ""; }
    private static Dictionary<string, DataTable> dic = new Dictionary<string, DataTable>();
    //必须为地址栏
    public void RepToClient(M_APIResult result)
    {
        HttpResponse rep = HttpContext.Current.Response;
        rep.Clear(); rep.Write(result.ToString()); rep.Flush(); rep.End();
    }
    public void ProcessRequest(HttpContext context)
    {
        //function.WriteErrMsg("接口默认关闭,请联系管理员开启");
        //M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "getarrive"://取出我周边指定范围内的景点
                    {
                        if (buser.GetLogin(false).UserID > 0)
                        {
                            string arrname = Req("arrname");
                            if (!string.IsNullOrEmpty(arrname))
                            {
                                SqlParameter[] sp = new SqlParameter[] { new SqlParameter("@arrname", arrname)};
                                DataTable dt1 = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_Arrive where ArriveName=@arrname And UserID=" + buser.GetLogin().UserID + " order by ID ASC", sp);
                                if (dt1.Rows.Count > 0)
                                {
                                    retMod.result = "0";
                                    retMod.retmsg = "您已领取过该优惠券了";
                                    retMod.retcode = M_APIResult.Failed;
                                }
                                else
                                {
                                    DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_Arrive where ArriveName=@arrname And State=1 And UserID=0 And EndTime>=GETDATE() order by ID ASC", sp);
                                    if (dt.Rows.Count > 0)
                                    {
                                        arriveMod = arriveBll.SelReturnModel(DataConvert.CLng(dt.Rows[0]["ID"]));
                                        arriveMod.UserID = buser.GetLogin().UserID;
                                        if(arriveBll.GetUpdate(arriveMod))
                                        {
                                            retMod.result = "1";
                                            retMod.retmsg = "领取成功";
                                            retMod.retcode = M_APIResult.Success;
                                        }
                                        else
                                        {
                                            retMod.result = "0";
                                            retMod.retmsg = "领取失败";
                                            retMod.retcode = M_APIResult.Failed;
                                        }
                                    }
                                    else
                                    {
                                        retMod.result = "0";
                                        retMod.retmsg = "优惠券已被领完了"+Req("arrname");
                                        retMod.retcode = M_APIResult.Failed;
                                    }
                                }
                            }
                            else
                            {
                                retMod.result = "-1";
                                retMod.retmsg = "优惠券名称不正确";
                                retMod.retcode = M_APIResult.Failed;
                            }
                        }
                        else
                        {
                            retMod.result = "-1";
                            retMod.retmsg = "未登录";
                            retMod.retcode = M_APIResult.Success;
                        }
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}