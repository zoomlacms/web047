﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_Content_Video_VideoList, App_Web_q1h2chc5" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>视频列表</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_s">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="预览图">
                <ItemTemplate>
                   <img src="<%#Eval("Thumbnail") %>"  onerror="this.src='/Images/nopic.gif'" class="img_50"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="视频名称">
                <ItemTemplate>
                    <a href="VideoInfo.aspx?id=<%#Eval("ID") %>"><%#Eval("VName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="VPath" HeaderText="视频地址" />
            <asp:TemplateField HeaderText="视频长度">
                <ItemTemplate>
                    <%#Eval("VTime","{0:HH:mm:ss}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
            <asp:BoundField DataField="Desc" HeaderText="备注" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a class="option_style" href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                    <a class="option_style" href="VideoManage.aspx?id=<%#Eval("ID") %>"><i class="fa fa-magic" title="管理">管理</i></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>

    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var diag = new ZL_Dialog();
        function ShowUpFile() {
            diag.title = "添加视频";
            diag.url = "/Plugins/WebUploader/webup.aspx?json={ashx:\"action=UPVideo\"}&chunk=1";
            diag.maxbtn = false;
            diag.reload = true;
            diag.ShowModal();
        }
        function AddAttach(file, ret, json) {
            window.location = location;
        }
        var videodiag = new ZL_Dialog();
        function VideoSet() {
            videodiag.title = "视频设置";
            videodiag.url = "VideoConfig.aspx";
            videodiag.maxbtn = false;
            videodiag.reload = true;
            videodiag.ShowModal();
        }
        function CloseVideo() {
            videodiag.CloseModal();
        }
    </script>
</asp:Content>
