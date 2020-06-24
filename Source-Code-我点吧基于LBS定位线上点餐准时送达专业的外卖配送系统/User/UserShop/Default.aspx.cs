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
using ZoomLa.Model;
using ZoomLa.Components;
using ZoomLa.SQLDAL;

public partial class User_UserShop_Default : System.Web.UI.Page
{
    B_User buser = new B_User();
    B_ModelField mfbll = new B_ModelField();
    B_Content conBll = new B_Content();
    B_Model bmll = new B_Model();
    B_StoreStyleTable sstbll = new B_StoreStyleTable();
    private int gid
    {
        get
        {
            if (ViewState["gid"] != null)
                return int.Parse(ViewState["gid"].ToString());
            else
                return 0;
        }
        set
        {
            ViewState["gid"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
            GetInit();
        }
    }
    //初始化
    private void GetInit()
    {
        M_UserInfo mu = buser.GetLogin();
        M_CommonData storeMod = conBll.SelMyStore(mu.UserName);
        if (storeMod == null)
        {
            Response.Redirect("StoreApply.aspx");//申请店铺
        }
        if (storeMod != null)
        {
            StoreUrl_L.Text = "<a href='/Store/StoreIndex.aspx?id=" + storeMod.GeneralID + "' target='_blank'> [浏览店铺]</a>";
        }
        gid = storeMod.GeneralID;
        if (storeMod.Status != 99)
        {
            Response.Redirect("StoreEdit.aspx");
        }
        else
        {
            DataTable st = Sql.Sel(storeMod.TableName, "ID=" + storeMod.ItemID, "");
            if (st.Rows.Count != 0)
            {
                Nametxt.Text = st.Rows[0]["StoreName"].ToString();
            }
            else
            {
                Nametxt.Text = "";
            }
            DataTable modeinfo = mfbll.SelectTableName("ZL_Model", "TableName='" + storeMod.TableName + "'");
            if (modeinfo.Rows.Count > 0)
            {
                DataTable cmdinfo = conBll.GetContent(gid);
                if (cmdinfo.Rows.Count > 0)
                {
                    Label3.Text = cmdinfo.Rows[0]["StoreCredit"].ToString();
                    Label4.Text = GetState(cmdinfo.Rows[0]["StoreCommendState"].ToString());
                    M_ModelInfo mi = bmll.GetModelById(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()));
                    Label1.Text = mi.ModelName;
                    DataTable slist = sstbll.GetStyleByModel(int.Parse(cmdinfo.Rows[0]["StoreModelID"].ToString()), 1);
                    HiddenField1.Value = cmdinfo.Rows[0]["StoreModelID"].ToString();
                    SSTDownList.DataSource = slist;
                    SSTDownList.DataTextField = "StyleName";
                    SSTDownList.DataValueField = "ID";
                    SSTDownList.DataBind();
                    SSTDownList.SelectedValue = cmdinfo.Rows[0]["StoreStyleID"].ToString();
                    M_StoreStyleTable sst = sstbll.GetStyleByID(int.Parse(cmdinfo.Rows[0]["StoreStyleID"].ToString()));
                    Image1.ImageUrl = function.GetImgUrl(sst.StylePic);
                    if (cmdinfo.Rows.Count > 0)
                    {
                        ModelHtml.Text = mfbll.InputallHtml(DataConvert.CLng(cmdinfo.Rows[0]["StoreModelID"]), 0, new ModelConfig()
                        {
                            ValueDT = cmdinfo
                        });
                    }
                    else
                    {
                        ModelHtml.Text = mfbll.InputallHtml(DataConvert.CLng(cmdinfo.Rows[0]["StoreModelID"]), 0, new ModelConfig()
                        {
                            Source = ModelConfig.SType.UserBase
                        });
                    }
                }
            }
            else
            {
                conBll.DelContent(gid);
                Response.Redirect("Default.aspx");
                Label3.Text = "不可用";
                Label4.Text = "不可用";
                Label1.Text = "不可用";
                SSTDownList.Items.Add(new ListItem("无", ""));
                Image1.Visible = false;
            }
        }
    }
    private string GetState(string state)
    {
        switch (state)
        {
            case "0": return "普通"; 
            case "1": return "推荐"; 
            case "2": return "关闭"; 
            default: return ""; 
        }
    }
    protected void EBtnSubmit_Click(object sender, EventArgs e)
    {
        DataTable dt = mfbll.GetModelFieldList(int.Parse(HiddenField1.Value));
        Call commonCall = new Call();
        DataTable table = commonCall.GetDTFromPage(dt, Page, ViewState);
        DataRow rs4 = table.NewRow();
        rs4[0] = "StoreName";
        rs4[1] = "TextType";
        rs4[2] = Nametxt.Text;
        table.Rows.Add(rs4);
        DataRow rs5 = table.NewRow();
        rs5[0] = "StoreStyleID";
        rs5[1] = "int";
        rs5[2] = DataConverter.CLng(SSTDownList.Text);
        table.Rows.Add(rs5);
        M_StoreStyleTable sst = sstbll.GetStyleByID(int.Parse(SSTDownList.Text));
        M_CommonData CData = conBll.GetCommonData(gid);
        CData.Template = sst.StyleUrl;
        CData.Title = Nametxt.Text;
        conBll.UpdateContent(table, CData);
        function.WriteSuccessMsg("提交成功");
    }
    protected void SSTDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        M_StoreStyleTable sst = sstbll.GetStyleByID(int.Parse(SSTDownList.Text));
        Image1.ImageUrl = "/UploadFiles/" + sst.StylePic;
    }
}
