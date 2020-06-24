<%@ page language="C#" autoeventwireup="true" inherits="Common_Upload, App_Web_ceensjtm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<!DOCTYPE HTML>
<html>
<head><title>上传文件</title></head>
<body class="tdbg">
<form id="form1" runat="server" enctype="multipart/form-data">
    <div>
        <ZL:FileUpload ID="File_UP" runat="server" />
        <asp:Button ID="BtnUpload" runat="server" Text="上传" OnClick="BtnUpload_Click" />
        <asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择上传路径" ControlToValidate="File_UP" ForeColor="Red" />
    </div>
</form>
</body>
</html>
