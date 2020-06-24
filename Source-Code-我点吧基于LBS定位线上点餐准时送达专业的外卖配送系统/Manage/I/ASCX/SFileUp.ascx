<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_SingelFileUp, App_Web_qenfswzg" clientidmode="Static" %>
<div class="input-group" style="width:350px;">
<asp:TextBox runat="server" ID="FVPath_T" CssClass="form-control" style="width:300px;"></asp:TextBox>
<span class="input-group-btn">
    <a href="javascript:;" class="btn btn-info" onclick="$('#FileUp_File').click()"><i class="fa fa-folder-open-o"></i> 选择文件</a>
</span>
</div>
<img src="#" id="prefile_img" style="width:50px; height:50px; display:none;" />
<ZL:FileUpload ID="FileUp_File"  runat="server" style="display:none;" />
<script>
$(function () {
    var ftype = "<%=FType.ToString()%>";//允许上传的文件类型
    var fname = "<%=FileUrl %>";
    var isWebImg = function (fname) {
        if (!fname || fname == "") { return false; }
        fname = fname.toLowerCase();
        if (fname.indexOf("data:image/") > -1)//base64
        {
            return true;
        }
        else if (fname.indexOf(".") > 0) {
            var start = fname.lastIndexOf(".");
            var ext = fname.substring((start + 1), fname.length);//jpg|png|gif
            return (ext == "jpg" || ext == "png" || ext == "gif")
        }
        else { return false; }
    }
    var ShowImg = function (ftype, fname) {
        if (ftype && ftype != "") {
            if (isWebImg(fname)) { $("#prefile_img").show(); $("#prefile_img").attr('src', fname); }
        }
    }
    ShowImg(ftype, fname);
    $("#FVPath_T").val(fname);
    $("#FileUp_File").change(function (e) {
        var filename = $(this).val();
        $("#FVPath_T").val($(this).val());
        var file = e.target.files[0];
        var reader = new FileReader();
        reader.onload = function (e) { ShowImg(ftype, e.target.result); }
        reader.readAsDataURL(file);
    });
});
</script>
