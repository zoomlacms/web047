﻿<%@ page language="C#" autoeventwireup="true" inherits="Guest_Baike_Diag_AddRef, App_Web_jmua5ufr" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>参考资料</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped" style="margin-bottom:30px;">
        <tr><td style="width:120px;" class="text-right"><strong>参考资料类型</strong></td>
            <td>
                <select id="type_dp">
                    <option value="网络资源">网络资源</option>
                    <option value="著作">著作</option>
                    <option value="其他资源">其他资源</option>
                </select></td>
        </tr>
        <tr><td class="text-right"><span class="r_red">*</span>文章名：</td>
            <td><input type="text" id="name_t" class="form-control" /></td>
        </tr>
        <tr><td class="text-right"><span class="r_red">*</span>URL：</td><td><input type="text" id="url_t" class="form-control" placeholder="http://" /></td></tr>
        <tr><td class="text-right"><span class="r_red">*</span>网站名：</td>
            <td><input type="text" id="siteName_t" class="form-control" /></td>
        </tr>
        <tr><td class="text-right">引用日期：</td><td><input type="text" id="cdate_t" class="form-control" value="<%=DateTime.Now.ToString("yyyy-MM-dd") %>" /></td></tr>
    </table>
    <div class="text-center">
        <input type="button" value="确定" class="btn btn-primary" onclick="add();" />
        <input type="button" value="取消" class="btn btn-default" onclick="parent.CloseComDiag();" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <style type="text/css">
        .r_red {color:#ff0000;margin-right:3px;}
    </style>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        var id = "<%:Request.QueryString["id"]%>";
        $(function () {
            if (!ZL_Regex.isEmpty(id)) {
                var model = parent.refence.get(id);
                $("#type_dp").val(model.type);
                $("#name_t").val(model.name);
                $("#url_t").val(model.url);
                $("#siteName_t").val(model.siteName);
                $("#cdate_t").val(model.cdate);
            }
        })
        function add() {
            var model = {};
            model.id = GetRanPass(6);
            model.type = $("#type_dp").val();
            model.name = $("#name_t").val();
            model.url = $("#url_t").val();
            model.siteName = $("#siteName_t").val();
            model.cdate = $("#cdate_t").val();
            if (ZL_Regex.isEmpty(model.name)) { alert("文章名不能为空"); return false; }
            if (!ZL_Regex.isUrl(model.url)) { alert("URL格式不正确"); return false; }
            if (ZL_Regex.isEmpty(model.siteName)) { alert("网站名不能为空"); return false; }
            if (ZL_Regex.isEmpty(id)) {
                parent.refence.add(model);
            }
            else {
                model.id = id;
                parent.refence.update(model);
            }
            parent.CloseComDiag();
        }
    </script>
</asp:Content>
