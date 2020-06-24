<%@ WebHandler Language="C#" Class="Common" %>

using System;
using System.Web;
using ZoomLa.Common;
using ZoomLa.BLL;
using ZoomLa.Model;
using System.Data.SqlClient;
using ZoomLa.SQLDAL;
/*
 * 仅允许Form提交
 * 用于价格计算,增减商品
 * -1:失败,1:成功或直接返回值
 */
public class Common : IHttpHandler, System.Web.SessionState.IRequiresSessionState{
    B_Cart cartBll = new B_Cart();
    M_Cart cartMod = new M_Cart();
    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest request = context.Request;
        string action = context.Request["action"];
        string cartCookID = GetCartCookID(context);
        string result = "";
        switch (action)
        {
            case "setnum"://ID,数量,Cookies,可不登录,数量不能小于1
                {
                    int id = DataConverter.CLng(request["mid"]);
                    int pronum = DataConverter.CLng(request["pronum"]);
                    if (id < 1 || pronum < 1 || string.IsNullOrEmpty(cartCookID))
                    {
                        result = "-1";
                    }
                    else
                    {
                        cartBll.UpdateProNum(cartCookID, id, pronum);
                        result = "1";
                    }
                }
                break;
            case "getprice":
                break;
            case "deladdress":
                {
                    B_UserRecei receBll = new B_UserRecei();
                    M_UserInfo mu = buser.GetLogin();
                    int id = DataConverter.CLng(request["id"]);
                    if (mu == null || mu.UserID == 0 || id < 1) { result = "-1"; }
                    else
                    {
                        receBll.U_DelByID(id, mu.UserID);
                    }
                }
                break;
            case "arrive"://优惠券
                {
                    string code = request["code"];
                    string pwd = request["pwd"];
                    double money = double.Parse(request["money"]);
                    string remind = "";
                    B_Arrive arriveBll = new B_Arrive();
                    var amount = GetArriveByaa(code, pwd, money, out remind);
                    result = "{\"amount\":\"" + amount + "\",\"remind\":\"" + remind + "\"}";
                }
                break;
        }
        context.Response.Write(result); context.Response.Flush(); context.Response.End();
    }
    public bool IsReusable { get { return false; } }
    public string GetCartCookID(HttpContext context) { return buser.GetLogin().UserID.ToString(); }
    /// <summary>
    /// 搜索未绑定用户且已激活的优惠券
    /// </summary>
    /// <returns></returns>
    public decimal GetArriveByaa(string ArriveNo, string ArrivePwd,double money,out string remind)
    {
        remind = "";//提示信息
        SqlParameter[] sp = new SqlParameter[] { new SqlParameter("ArriveNo", ArriveNo), new SqlParameter("ArrivePwd", ArrivePwd) };
        decimal dm = 0;
        string strWhere = "WHERE  ArriveNO = @ArriveNo AND ArrivePwd =@ArrivePwd AND State=1 AND getdate()<=EndTime";
        using (SqlDataReader reader = Sql.SelReturnReader("ZL_Arrive", strWhere, sp))
        {
            if (reader.Read())
            {
                M_Arrive arriveModel = new M_Arrive().GetModelFromReader(reader);
                if (arriveModel.MaxAmount == 0 || (money > arriveModel.MinAmount && money < arriveModel.MaxAmount))//最大值为0则不限制,或大于MIN，小于Max
                {
                    remind = "该券能正常使用";
                    return DataConvert.CDecimal(arriveModel.Amount);
                }
                else
                {
                    remind = "该券只能用于" + arriveModel.MinAmount + "至" + arriveModel.MaxAmount + "总价的商品";
                }
            }
            else
            { remind = "该优惠券已被使用或不存在"; }
        }
        return dm;
    }
}