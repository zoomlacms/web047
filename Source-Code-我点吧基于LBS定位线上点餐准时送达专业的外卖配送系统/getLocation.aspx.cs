using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using ZoomLa.Common;
using System.Xml;
using ZoomLa.BLL;
using ZoomLa.Model;
using Newtonsoft.Json;
using System.Web.Security;
using ZoomLa.Components;
using ZoomLa.Model.Plat;
using ZoomLa.BLL.Plat;
using Newtonsoft.Json.Linq;
using ZoomLa.BLL.WxPayAPI;

public partial class getLocation : System.Web.UI.Page
{
    public string timestr = "";
    public string paySign = "";
    public string nonceStr = "Wm3WZYTPz0wzccnW";
    B_WX_APPID appBll = new B_WX_APPID();
    public M_WX_APPID appMod = new M_WX_APPID();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int appid = DataConverter.CLng(Request.QueryString["appid"]);

            try
            {   
                TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                timestr = Convert.ToInt64(ts.TotalSeconds).ToString();

                WxAPI wxapi = WxAPI.Code_Get(appid);
                appMod = appBll.SelReturnModel(appid);
                string result = APIHelper.GetWebResult("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=" + appMod.APPID + "&secret=" + appMod.Secret);
                if (result.Contains("errcode"))
                    wxapi.ErroMsg(result);
                //{"access_token":"7EHneznPapbfKYIQISQGVw4comvbkxIWe5e7JmTkp2Y5P93aIO5FjjEeyvk65L4lcPeL6VuMOMZ7CKel95L_ljZnjZrdi-MGPK9mZZOuSN8","expires_in":7200}
                JObject obj = JsonConvert.DeserializeObject<JObject>(result);
                appMod.Token = obj["access_token"].ToString();
                appMod.TokenDate = DateTime.Now;
                appBll.UpdateByID(appMod);

                string jsapi_ticket = APIHelper.GetWebResult("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + appMod.Token + "&type=jsapi");
                JObject jsapi_obj = (JObject)JsonConvert.DeserializeObject(jsapi_ticket);
                string stringA = "jsapi_ticket=" + jsapi_obj["ticket"].ToString() + "&noncestr=" + nonceStr + "&timestamp=" + timestr + "&url=" + Request.Url.AbsoluteUri;
                paySign = EncryptHelper.SHA1(stringA).ToLower();
            }
            catch (Exception ex) { }
        }
    }
}