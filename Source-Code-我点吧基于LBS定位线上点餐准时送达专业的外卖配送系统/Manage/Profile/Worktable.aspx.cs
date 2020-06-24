using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.SQLDAL;
using Newtonsoft.Json;
using ZoomLa.BLL.Content;

public partial class ZoomLa_WebSite_Manages_Worktable : CustomerPageAction
{
    B_Node nodeBll = new B_Node();
    B_Content_ScheTask scheBll = new B_Content_ScheTask();
    public string data1, data2, data3_1, data3_2;
    protected void Page_Load(object sender, EventArgs e)
    {
        B_Admin.CheckIsLogged();
        if (!IsPostBack)
        {
            //内容,商品,会员

            //只显示有数据的第一级父节点
            DataTable condt = nodeBll.SelForShowAll(0);
            condt.DefaultView.RowFilter = "ItemCount>0";
            condt = condt.DefaultView.ToTable();
            condt = condt.DefaultView.ToTable(false, "ItemCount", "NodeName");
            data1 = JsonConvert.SerializeObject(condt);
            //商品
            //DataTable prodt = SqlHelper.JoinQuery("A.*,B.NodeName", "(SELECT COUNT(ID) AS ICount,NodeID FROM ZL_Commodities Group BY NodeID)", "ZL_Node", "A.NodeID=B.NodeID");
            //data2 = JsonConvert.SerializeObject(prodt);
            //商品,数量与销量
            string prosql = "SELECT Pro.*,Cart.SellCount FROM "
                          + " (SELECT A.*,B.NodeName FROM (SELECT COUNT(ID) AS ProCount,Nodeid FROM ZL_Commodities GROUP BY Nodeid) A LEFT JOIN ZL_Node B ON A.Nodeid=B.NodeID) Pro"
                          + " LEFT JOIN"
                          + " (SELECT COUNT(A.ID) AS SellCount,B.Nodeid FROM ZL_CartPro A LEFT JOIN ZL_Commodities B ON A.ProID=B.ID GROUP BY B.Nodeid) Cart"
                          + " ON Pro.Nodeid=Cart.Nodeid";
            DataTable prodt = SqlHelper.ExecuteTable(prosql);
            DataRow dr = prodt.NewRow();
            dr["NodeName"] = "总计";
            dr["ProCount"] = prodt.Compute("SUM(ProCount)", "");
            dr["SellCount"] = prodt.Compute("SUM(SellCount)", "");
            prodt.Rows.Add(dr);
            data2 = JsonConvert.SerializeObject(prodt);
            //内芯
            DataTable userdt1 = SqlHelper.ExecuteTable("SELECT COUNT(UserID) AS count1,(SELECT COUNT(UserID) FROM ZL_User Where ParentUserID>0) AS count2 FROM ZL_User");
            data3_1 = JsonConvert.SerializeObject(userdt1);
            DataTable userdt2 = SqlHelper.JoinQuery("A.*,B.GroupName", "(SELECT COUNT(UserID) AS ICount,GroupID FROM ZL_User Group BY GroupID)", "ZL_Group", "A.GroupID=B.GroupID");
            data3_2 = JsonConvert.SerializeObject(userdt2);
            this.litUserName.Text = B_Admin.GetLogin().AdminName;
            this.litDate.Text = DateTime.Now.ToShortDateString() + " " + Resources.L.农历 + Season.GetLunarCalendar(DateTime.Now) + " " + Season.GetWeekCHA() + " " + Season.ChineseTwentyFourDay(DateTime.Now);
            this.Version.Text = "当前版本：CMS2 X3.6Beta 版，数据引擎：SQL Server 2005及更高版本";
            Sche_RPT.DataSource = new B_Content_ScheLog().Sel(5);
            Sche_RPT.DataBind();
        }
    }
    public string GetExecuteType()
    {
        return scheBll.GetExecuteType(Convert.ToInt32(Eval("ExecuteType")));
    }
    public string GetResult() 
    {
        if (Eval("Result", "").Equals("1")) { return ComRE.Icon_OK; }
        else { return ComRE.Icon_Error; }
    }
}