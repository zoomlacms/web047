﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_ProductCashManage, App_Web_1ucmg2hm" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
     <title>VIP卡管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
      <tr align="center">
        <td width="10%" class="title"><asp:CheckBox ID="Checkall" onclick="javascript:CheckAll(this);" runat="server" /></td>
        <td width="10%" class="title">ID</td>
        <td width="10%" class="title">银行</td>
        <td width="30%" class="title">帐号</td>
       <td width="10%" class="title">申请金额</td>
       
         <td width="10%" class="title">状态</td>
        
        <td width="30%" class="title"> 操作</td>
      </tr>
        <asp:Repeater ID="gvCard" runat="server">       
        <ItemTemplate>
      <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
        <td height="22" align="center"><input name="Item" type="checkbox" value='<%# Eval("Y_ID")%>'/></td>
        <td height="22" align="center"><%# Eval("Y_ID")%></td>
         <td height="22" align="center"><%# Eval("Bank")%></td>
       <td height="22" align="center"><%# Eval("Account")%></td>
         <td height="22" align="center"><%#showMoney(Eval("money").ToString())%></td>
        <td height="22" align="center"><%#shoyState(Eval("yState").ToString())%></td>
        <td height="22" align="center"><%#showuse(Eval("Y_ID").ToString()) %>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="CashManage.aspx?menu=del&id=<%#Eval("Y_ID") %>" OnClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"><i class="fa fa-trash-o" title="删除"></i>删除</a></td>
      </tr>
        </ItemTemplate>
        </asp:Repeater>
        <tr class="tdbg">
        <td height="22" colspan="7" align="center" class="tdbgleft">
        共
        <asp:Label ID="Allnum" runat="server" Text=""></asp:Label>
        个商品
        <asp:Label ID="Toppage" runat="server" Text="" />
        <asp:Label ID="Nextpage" runat="server" Text="" />
        <asp:Label ID="Downpage" runat="server" Text="" />
        <asp:Label ID="Endpage" runat="server" Text="" />
        页次：<asp:Label ID="Nowpage" runat="server" Text="" />/<asp:Label ID="PageSize" runat="server"
            Text="" />页
        <asp:Label ID="pagess" runat="server" Text="" />个商品/页 转到第<asp:DropDownList ID="DropDownList1"
            runat="server" AutoPostBack="True">
        </asp:DropDownList>
        页
              </td>
      </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script type="text/javascript">
            function CheckAll(spanChk)//CheckBox全选
            {
                var oItem = spanChk.children;
                var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
                xState = theBox.checked;
                elm = theBox.form.elements;
                for (i = 0; i < elm.length; i++)
                    if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                        if (elm[i].checked != xState)
                            elm[i].click();
                    }
            }
    </script>
</asp:Content>