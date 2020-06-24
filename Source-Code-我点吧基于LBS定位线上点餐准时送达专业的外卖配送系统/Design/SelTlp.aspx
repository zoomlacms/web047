<%@ page language="C#" autoeventwireup="true" inherits="Design_SelTlp, App_Web_qdaqjjqh" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <a href="NewSite.aspx?TlpID=1">选择模板</a>
    <asp:Button runat="server" ID="Create_Btn" Text="创建" OnClick="Create_Btn_Click" />
</asp:Content>