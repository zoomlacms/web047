<%@ page language="C#" autoeventwireup="true" inherits="Design_User_Node_NodeList, App_Web_znbjbvne" masterpagefile="~/Design/Master/User.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="/Design/res/css/user.css" rel="stylesheet" />
    <title>栏目列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container siteinfo">
    <ol class="breadcrumb">
        <li><a href="/User/Default.aspx">会员中心</a></li>
        <li><a href="/Design/User/">动力模块</a></li>
        <li class="active">栏目列表 [<a href="AddNode.aspx?SiteID=<%:SiteID %>">添加栏目</a>]</li>
    </ol>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True">
    <Columns>
        <asp:TemplateField HeaderText="栏目名称">
            <ItemTemplate>
                <a href="AddNode.aspx?NodeID=<%#Eval("NodeID") %>"><%#Eval("NodeName") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" />
        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                <a class="option_style" href="AddNode.aspx?NodeID=<%#Eval("NodeID") %>"><i class="fa fa-pencil" title="修改"></i></a>
                <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("NodeID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>