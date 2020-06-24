<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="ZoomLa.WebSite.User.Content.MyComment, App_Web_v2chwyce" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>我的评论</title>
<script src="/JS/Controls/Emotion.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="content" data-ban="cnt"></div>
<div class="container margin_t5">
    <ol class="breadcrumb">
        <li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
        <li class="active">我的评论 </li>
    </ol>
</div>
<div class="container">
    <ZL:ExGridView runat="server" ID="EGV" DataKeyNames="CommentID" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="无相关信息!!"
        OnPageIndexChanging="EGV_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_s">
                <ItemTemplate>
                    <input type="checkbox" value="<%#Eval("CommentID") %>" name="idchk" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CommentID" HeaderText="ID" ItemStyle-CssClass="td_s">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="所属内容" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <a href="/Item/<%# Eval("GeneralID")+".aspx"%>" target="_blank"><%# GetTitle(Eval("GeneralID", "{0}"))%></a>
                </ItemTemplate>
            </asp:TemplateField>
<%--            <asp:BoundField DataField="Title" HeaderText="评论标题">
                <HeaderStyle Width="24%" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>--%>
            <asp:TemplateField HeaderText="评论内容">
                <ItemTemplate>
                    <script>
                        document.write(emotion.strToEmotion("<%#Eval("Contents","").Replace("\"","")%>"));
                    </script>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发表日期" HeaderStyle-CssClass="td_l">
                <ItemTemplate>
                    <%# Eval("CommentTime", "{0:yyyy-MM-dd}")%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
<asp:Button runat="server" ID="Bat_Del" CssClass="btn btn-primary" OnClick="Bat_Del_Click" OnClientClick="return confirm('确定要删除评论吗');"  Text="批量删除"/>
</div>
</asp:Content>
