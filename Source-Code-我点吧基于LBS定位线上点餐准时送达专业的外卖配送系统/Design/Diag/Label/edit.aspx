<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_Label_edit, App_Web_x0cacbz2" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head"><title>修改标签</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        $(function () {
            location = "LabelCall.aspx?<%=Request.QueryString%>";
        })
    </script>
</asp:Content>