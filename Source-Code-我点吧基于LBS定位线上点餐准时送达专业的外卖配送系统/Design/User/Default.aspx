<%@ page language="C#" autoeventwireup="true" inherits="Design_User_Default, App_Web_at5bm4te" masterpagefile="~/Design/Master/User.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>信息概览</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="siteinfo container">
    <ol class="breadcrumb">
        <li><a href="/User/Default.aspx">会员中心</a></li>
        <li><a href="<%=Request.RawUrl %>">动力模块</a></li>
        <li class="active">信息概览</li>
    </ol>
    <div class="info_head">
        <div class="pull-left">
            <img src="#" runat="server" id="TlpView_img" style="max-width: 200px; max-height: 100px;" />
        </div>
        <div class="pull-left margin_l20">
            <div style="height:30px;line-height:30px;font-size:20px;margin-bottom:30px;">
                <asp:Label runat="server" ID="SiteName_L"></asp:Label>
                <a runat="server" id="domain_a" href="#" class="btn btn-default" style="color:#555;text-decoration:none;" title="点击访问" target="_blank">你尚未申请域名</a>
                <a runat="server" id="sitecfg_a" href="#" class="btn btn-info"><i class="fa fa-cogs"></i> 站点配置</a>
                <div class="btn-group">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><i class="fa fa-list"></i> 切换站点</button>
                    <ul class="dropdown-menu" role="menu">
                        <asp:Repeater runat="server" ID="Site_RPT">
                            <ItemTemplate>
                              <li>
                                  <a href="Default.aspx?ID=<%#Eval("ID") %>"><%#Eval("SiteName") %></a>
                              </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
            <div>
                <a href="Content/List.aspx?SiteID=<%:SiteID %>"  class="btn btn-primary"><i class="fa fa-pencil"></i> 内容管理</a>
                <a href="#" class="btn btn-primary"><i class="fa fa-user-plus"></i> 用户升级</a>
                <asp:LinkButton runat="server" ID="DownSite_Btn" class="btn btn-primary" OnClick="DownSite_Btn_Click" OnClientClick="return downSite();"><i class="fa fa-download"></i> 全站下载</asp:LinkButton>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div>
        <div class="col-lg-8 col-md-8">
            <div class="panel panel-default">
            <div class="panel-heading"><i class="fa fa-newspaper-o"></i> 页面管理</div>
            <div class="panel-body" style="min-height:150px;">
                <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="5" IsHoldState="false"
                    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
                    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="你还没有创建页面">
                    <Columns>
                        <asp:BoundField HeaderText="标题" DataField="Title" />
                        <asp:BoundField HeaderText="路径" DataField="Path" />
                        <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日 hh:mm}" />
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <a class="option_style" href="PageInfo.aspx?ID=<%#Eval("Guid") %>"><i class="fa fa-cog"></i>配置</a>
                                <a class="option_style" href="/Design/?ID=<%#Eval("Guid") %>" target="_blank"><i class="fa fa-paint-brush"></i>设计</a>
                                <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </ZL:ExGridView>
            </div>
            <div class="panel-footer text-right">
                <a href="#">查看全部</a>
            </div>
        </div>
            <div class="panel panel-default">
            <div class="panel-heading"><i class="fa fa-bell"></i> 全局组件</div>
            <div class="panel-body" style="min-height:150px;">
                <table class="table table-bordered table-striped">
                    <tr><td>别名</td><td>创建时间</td><td>操作</td></tr>
                    <asp:Repeater runat="server" ID="Global_RPT" OnItemCommand="Global_RPT_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Title","").TrimStart('/') %></td>
                                <td><%#Eval("CDate","{0:yyyy年MM月dd日 HH:mm}") %></td>
                                <td>
                                    <a class="option_style" href="PageInfo.aspx?ID=<%#Eval("Guid") %>"><i class="fa fa-cog"></i>配置</a>
                                    <a class="option_style" href="/Design/?ID=<%#Eval("Guid") %>" target="_blank"><i class="fa fa-paint-brush"></i>设计</a>
                                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div class="panel-footer text-right"><a href="#">查看全部</a></div>
        </div>
        </div>
        <div class="col-lg-4 col-md-4">
            <div class="panel panel-default" style="width:321px;">
            <div class="panel-heading"><i class="fa fa-th-large"></i> 快捷菜单</div>
            <div class="panel-body padding0">
                <ul class="list-unstyled" id="shortcut_ul">
                    <li onclick="location='/Design/?SiteID=<%:SiteID %>';"><i class="fa fa-paint-brush"></i>修改站点</li>
                    <li onclick="location='Content/List.aspx?SiteID=<%:SiteID %>'"><i class="fa fa-gift"></i>内容管理</li>
                    <li style="border-right: none;" onclick="location='ResList.aspx?SiteID=<%:SiteID %>';"><i class="fa fa-desktop"></i>资源管理</li>
                    <li onclick="location='Node/NodeList.aspx?SiteID=<%:SiteID %>';"><i class="fa fa-list-ol"></i>节点管理</li>
                    <li><i class="fa fa-eye"></i>站点信息</li>
                    <li style="border-right: none;"><i class="fa fa-lightbulb-o"></i>查看帮助</li>
                </ul>
            </div>
            <div class="panel-footer text-right" style="border-top:none;"><a href="#">显示更多</a></div>
        </div>
        </div>
            
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
    function downSite() {
        if (!confirm('确定要下载全站,以进行私有化布署吗?')) { return false; }
        comdiag.ShowMask("正在打包数据,请等待");
        return true;
    }
</script>
</asp:Content>