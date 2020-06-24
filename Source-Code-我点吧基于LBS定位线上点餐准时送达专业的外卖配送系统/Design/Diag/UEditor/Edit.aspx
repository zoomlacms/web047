<%@ page language="C#" autoeventwireup="true" inherits="Design_Diag_UEditor_Edit, App_Web_q4332sw5" masterpagefile="~/Design/Master/Edit.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>图文组件</title>
<script src="/Plugins/Ueditor/design.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <textarea id="content_t" style="width:100%;height:300px;"></textarea>
    <div class="text-center margint5">
        <input type="button" class="btn btn-primary" value="保存修改" onclick="save();" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
    $(function () {
        $("#content_t").val(editor.model.dataMod.html);
        UE.getEditor("content_t", {<%=ZoomLa.BLL.BLLCommon.ueditorDesign%> });
    })
    function save() {
        editor.model.dataMod.html = UE.getEditor("content_t").getContent();
        FireEvent("render");
        CloseSelf();
    }
</script>
</asp:Content>
