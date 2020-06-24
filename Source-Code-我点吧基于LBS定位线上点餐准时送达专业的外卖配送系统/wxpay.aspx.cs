using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.BLL.Helper;
using ZoomLa.BLL.WxPayAPI;
using ZoomLa.Model;

public partial class test_wxpay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BackMoney_Btn_Click(object sender, EventArgs e)
    {

    }
    /*
     * http://kf.qq.com/faq/140225MveaUz150107jmeaMv.html  参数一些解释,公众号APPID
     * 
     * 
     * 问:输入的商户号有误
     * 资料:报这个错误提示，要注意上传的请求参数要按照文档的要求：APPID这个参数要正确填写为：mch_appid，请注意。如下图
     */
    protected void Transfer_Btn_Click(object sender, EventArgs e)
    {
        WxPayData inputObj = new WxPayData();
        inputObj.SetValue("partner_trade_no", B_OrderList.CreateOrderNo(M_OrderList.OrderEnum.Cloud));
        inputObj.SetValue("openid", "oaLxyt7ZTVnjPmqkTI-SY-Z9akzw");
        inputObj.SetValue("check_name", "OPTION_CHECK");
        inputObj.SetValue("re_user_name", "徐喜平");
        inputObj.SetValue("amount", "100");
        inputObj.SetValue("desc", "提现");
        inputObj.SetValue("spbill_create_ip", "58.215.65.54");
        Transfer(inputObj);
    }
    /// <summary>
    /// 企业付款API,将资金打入对方微信钱包
    /// https://pay.weixin.qq.com/wiki/doc/api/tools/mch_pay.php?chapter=14_2
    /// </summary>
    /// <returns></returns>
    public static WxPayData Transfer(WxPayData inputObj)
    {
        string url = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
        //inputObj.SetValue("partner_trade_no", "");
        //inputObj.SetValue("openid", "");
        //inputObj.SetValue("check_name", "OPTION_CHECK");
        //inputObj.SetValue("re_user_name", "");
        //inputObj.SetValue("amount", "");
        //inputObj.SetValue("desc", "企业付款");
        //inputObj.SetValue("spbill_create_ip", "");
        inputObj.SetValue("mch_appid", "wx8c5c2dc7b10a36f3");//wx8c5c2dc7b10a36f3
        inputObj.SetValue("mchid", "1240446602");//商户号
        inputObj.SetValue("nonce_str", Guid.NewGuid().ToString().Replace("-", ""));//随机字符串
        inputObj.SetValue("sign", inputObj.MakeSign());//签名
        WxPayConfig.SSLCERT_PASSWORD = "1240446602";

        string xml = inputObj.ToXml();
        string response = Post(xml, url, true, 6);
        throw new Exception(response);

        WxPayData result = new WxPayData();
        result.FromXml(response);
        return result;
    }
    public static string Post(string xml, string url, bool isUseCert, int timeout)
    {
        System.GC.Collect();//垃圾回收，回收没有正常关闭的http连接

        string result = "";//返回结果

        HttpWebRequest request = null;
        HttpWebResponse response = null;
        Stream reqStream = null;

        try
        {
            //设置最大连接数
            ServicePointManager.DefaultConnectionLimit = 200;
            //设置https验证方式
            if (url.StartsWith("https", StringComparison.OrdinalIgnoreCase))
            {
                ServicePointManager.ServerCertificateValidationCallback =
                        new RemoteCertificateValidationCallback(HttpService.CheckValidationResult);
            }

            /***************************************************************
            * 下面设置HttpWebRequest的相关属性
            * ************************************************************/
            request = (HttpWebRequest)WebRequest.Create(url);

            request.Method = "POST";
            request.Timeout = timeout * 1000;

            //设置代理服务器
            //WebProxy proxy = new WebProxy();                          //定义一个网关对象
            //proxy.Address = new Uri(WxPayConfig.PROXY_URL);              //网关服务器端口:端口
            //request.Proxy = proxy;

            //设置POST的数据类型和长度
            request.ContentType = "text/xml";
            byte[] data = System.Text.Encoding.UTF8.GetBytes(xml);
            request.ContentLength = data.Length;

            //是否使用证书
            if (isUseCert)
            {
                //string path = HttpContext.Current.Request.PhysicalApplicationPath;
                //X509Certificate2 cert = new X509Certificate2("", WxPayConfig.SSLCERT_PASSWORD);


                X509Store store = new X509Store("MY", StoreLocation.LocalMachine);
                store.Open(OpenFlags.ReadOnly | OpenFlags.OpenExistingOnly);
                X509Certificate2 cert = store.Certificates.Find(X509FindType.FindBySubjectName, "江西龙悦餐饮管理有限公司", false)[0];//
                request.ClientCertificates.Add(cert);
            }
            //往服务器写入数据
            reqStream = request.GetRequestStream();
            reqStream.Write(data, 0, data.Length);
            reqStream.Close();

            //获取服务端返回
            response = (HttpWebResponse)request.GetResponse();

            //获取服务端返回数据
            StreamReader sr = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            result = sr.ReadToEnd().Trim();
            sr.Close();
        }
        catch (System.Threading.ThreadAbortException)
        {
            System.Threading.Thread.ResetAbort();
        }
        catch (WebException e)
        {
            if (e.Status == WebExceptionStatus.ProtocolError)
            {
            }
            throw new WxPayException(e.ToString());
        }
        catch (Exception e)
        {
            throw new WxPayException(e.ToString());
        }
        finally
        {
            //关闭连接和流
            if (response != null)
            {
                response.Close();
            }
            if (request != null)
            {
                request.Abort();
            }
        }
        return result;
    }
}