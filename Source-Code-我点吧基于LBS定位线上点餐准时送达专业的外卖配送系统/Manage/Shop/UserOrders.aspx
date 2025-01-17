﻿<%@ page language="C#" autoeventwireup="true" inherits="Zoomla.Website.manage.Shop.UserOrders, App_Web_1ucmg2hm" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>会员订单排名</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" 
         IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" 
         EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无记录！">
        <Columns>
            <asp:TemplateField HeaderText="用户ID">
                <ItemTemplate>
       <%#Eval("UserID")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户名">
                <ItemTemplate>
             <%#Eval("Username") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="注册时间">
                <ItemTemplate>
              <%#Eval("RegTime")%>
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="电子信箱">
                <ItemTemplate>
              <%#Eval("Email")%>
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="最后登录IP">
                <ItemTemplate>
                 <%#Eval("LastLoginIP")%>
                </ItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="订单数量">
                <ItemTemplate>
                  <%#Getordernum(Eval("Username","{0}"))%>
                </ItemTemplate>
                </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>