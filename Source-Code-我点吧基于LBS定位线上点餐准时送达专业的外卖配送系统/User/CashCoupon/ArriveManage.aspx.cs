using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.Model;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Data;
using ZoomLa.SQLDAL;

public partial class User_CashCoupon_ArriveManage : Page
{
    B_Arrive barrive = new B_Arrive();
    B_User buser = new B_User();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    #region 分页
    private void Bind()
    {
        DataTable dt = SqlHelper.ExecuteTable(CommandType.Text, "select * from ZL_Arrive where UserID=" + buser.GetLogin().UserID, null);
        //List<M_Arrive> arrive = barrive.GetArriveByUserid(buser.GetLogin().UserID);
        Manufacturerslist.DataSource = dt;
        Manufacturerslist.DataBind();
    }
    #endregion
    public string GetUseTime(string usetime)
    {
        if (usetime == DateTime.Now.ToString())
        {
            return "----";
        }
        else
        {
            string[] a = usetime.Split(' ');
            string[] b = a[0].Split('/');
            string temp = "";
            for (int i = 0; i < b.Length; i++)
            {
                temp += b[i] + "-";
            }
            return temp.Substring(0, temp.Length - 1);
        }
    }
    public string GetState(string state)
    {
        string result = "";
        switch (DataConvert.CLng(state))
        {
            case 0:
                result = "未激活";
                break;
            case 1:
                result = "已激活";
                break;
            case 10:
                result = "已使用";
                break;
            default:
                break;
        }
        return result;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string items = Request.Form["Item"];
        if (items.IndexOf(",") > -1)
        {
            string[] deeds = items.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
            for (int s = 0; s < deeds.Length; s++)
            {
                int dsd = DataConverter.CLng(deeds[s]);
                barrive.GetDelete(dsd);
            }
        }
        else
        {
            int ids = DataConverter.CLng(items);
            barrive.GetDelete(ids);

        }
        Response.Write("<script>alert('批量删除成功！');location.href='ArriveManage.aspx';</script>");
    }

    //命令
    protected void Manufacturerslist_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            int id = DataConverter.CLng(e.CommandArgument);
            bool res = barrive.GetDelete(id);
            if (res)
            {
                Response.Write("<script>alert('删除成功!')</script>");
                Bind();
            }
            else
            {
                Response.Write("<script>alert('删除失败!')</script>");
            }
        }
    }

    //行绑定
    protected void Manufacturerslist_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            HiddenField hfId = e.Item.FindControl("hfId") as HiddenField;
            HiddenField hfpwd = e.Item.FindControl("hfpwd") as HiddenField;
            LinkButton btn = e.Item.FindControl("del") as LinkButton;

            M_Arrive arrive = barrive.GetArriveById(DataConverter.CLng(hfId.Value));
            //if (arrive != null && arrive.Id > 0)
            //{
            //    btn.Enabled = false;
            //}
        }
    }

    //文本改变
    protected void txtPage_TextChanged(object sender, EventArgs e)
    {
        ViewState["page"] = "1";
        Bind();
    }

    //分页
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Bind();
    }

    
}
