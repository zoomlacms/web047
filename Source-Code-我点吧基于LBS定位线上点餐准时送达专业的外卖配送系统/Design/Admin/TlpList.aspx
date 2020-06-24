<%@ page language="C#" autoeventwireup="true" inherits="Design_Admin_TlpList, App_Web_kith3kjs" masterpagefile="~/Design/Master/User.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
    <li><a href="<%=Request.RawUrl %>">动力模块</a></li>
    <li><a href="/Design/Admin/">动力管理</a></li>
    <li class="active">模板列表 <a href="AddTlp.aspx">[新建模板]</a></li>
</ol>
<ul class="list-unstyled" id="tlp_ul">
<asp:Repeater runat="server" ID="RPT" OnItemCommand="RPT_ItemCommand">
<ItemTemplate>
<li>
    <img class="tlpimg" src="<%#Eval("PreviewImg") %>" onerror="this.src='/Images/nopic.gif';" />
    <div>
       <span class="r_gray">价格:<%#GetPrice() %></span>
        <div class="pull-right">
            <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');" CssClass="btn btn-xs btn-danger"><i class="fa fa-trash-o"></i> 删除</asp:LinkButton>
            <a href="/Design/Preview.aspx?TlpID=<%#Eval("ID") %>" class="btn btn-xs btn-info" target="_blank"><i class="fa fa-search"></i> 浏览</a>
            <a href="AddTlp.aspx?ID=<%#Eval("ID") %>" class="btn btn-xs btn-info"><i class="fa fa-pencil"></i> 修改</a>
        </div>
    </div>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>