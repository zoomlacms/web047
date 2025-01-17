﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_User_PointGroup, App_Web_pm0re3oi" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.用户积分等级 %></title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div id="cont" runat="server">
      <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" AutoGenerateColumns="False" PageSize="10"
        class="table table-striped table-bordered table-hover" OnRowCommand="EGV_RowCommand" EmptyDataText="<%$Resources:L, 暂无积分等级%>" OnPageIndexChanging="EGV_PageIndexChanging">
          <Columns>
              <asp:TemplateField HeaderText="<%$Resources:L, 图标%>">
                  <ItemTemplate>
                        <%#GetPointIcon() %>
                  </ItemTemplate>
                  <ItemStyle CssClass="td_s" />
              </asp:TemplateField>
              <asp:BoundField DataField="GroupName" HeaderText="<%$Resources:L, 积分等级%>" />
              <asp:BoundField DataField="PointVal" HeaderText="<%$Resources:L, 所需积分%>" />
              <asp:BoundField DataField="Remark" HeaderText="<%$Resources:L, 备注%>" />
              <asp:TemplateField HeaderText="<%$Resources:L, 操作%>">
                  <ItemTemplate>
                      <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Upd" CommandArgument='<%#Eval("ID") %>' CssClass="option_style"><i class="fa fa-pencil" title="<%=Resources.L.修改 %>"></i></asp:LinkButton>
              <asp:LinkButton ID="del" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确认删除？')" CssClass="option_style"><i class="fa fa-trash-o" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
      </ZL:ExGridView>
    
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>.allchk_l{display:none;}</style>
    <script language="javascript" type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        function getinfo(id) {
		location.href = "AddPointGroup.aspx?id=" + id;
	}
    </script>
  <%--  <script>
        var a = "<%#Eval("ImgUrl")%>";
        if (a == '') {
            document.write("<img src='/Images/userface/noface.gif' width='20' height='20'>");
        }
        else {
            document.write("<img src='<%#Eval("ImgUrl")%>' name='urlImg' width='20' height='20'/>");
        }
    </script>--%>
</asp:Content>
