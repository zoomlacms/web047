<%@ page language="C#" autoeventwireup="true" inherits="Design_Admin_AddTlp, App_Web_kith3kjs" masterpagefile="~/Design/Master/User.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb">
    <li><a href="/Design/Admin/">动力管理</a></li>
    <li><a href="TlpList.aspx">模板列表</a></li>
    <li class="active">模板管理</li>
</ol>
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab0" data-toggle="tab">基本参数</a></li>
    <li><a href="#tab1" data-toggle="tab">页面列表</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab0">
<table class="table table-bordered table-striped">
<tr><td class="td_m">模板名</td><td><asp:TextBox runat="server" ID="TlpName_T" CssClass="form-control text_300"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="TlpName_T" ForeColor="Red" ErrorMessage="模板名不能为空" />
                             </td></tr>
<tr><td>价格</td><td><asp:TextBox runat="server" ID="Price_T" CssClass="form-control text_300"></asp:TextBox></td></tr>
<tr><td>预览图</td><td><ZL:SFileUp runat="server" ID="PreView_UP" FType="Img" /><asp:Image runat="server" ID="PreView_Img" Visible="false" CssClass="tlpimg" /></td></tr>
<tr><td>备注</td><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" CssClass="form-control m715-50" style="height:50px;"></asp:TextBox></td></tr>
<tr>
    <td></td>
    <td>
        <asp:Button runat="server" ID="Save_Btn" CssClass="btn btn-primary" OnClick="Save_Btn_Click" Text="确定" />
        <a href="TlpList.aspx" class="btn btn-default">返回</a>
    </td>
</tr>
</table>
</div>
<div class="tab-pane" id="tab1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="5" IsHoldState="false"
                OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
                CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="你还没有创建页面">
                <Columns>
                    <asp:BoundField HeaderText="标题" DataField="Title" />
                    <asp:BoundField HeaderText="路径" DataField="Path" />
                    <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日 hh:mm}" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a class="option_style" href="/Design/?ID=<%#Eval("Guid") %>&Source=tlp" target="_blank"><i class="fa fa-paint-brush"></i>设计</a>
                            <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
</div>
</div>
<div class="alert alert-info">
    一套模板应该具备,首页|列表页|内容页|全局组件页四个UI
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>
