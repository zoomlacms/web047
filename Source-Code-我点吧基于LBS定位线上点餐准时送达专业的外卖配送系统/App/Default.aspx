﻿<%@ page language="C#" autoeventwireup="true" inherits="App_Default, App_Web_ek0h5n4l" masterpagefile="~/Common/Master/Commenu.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>指定链接</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="panel panel-default">
        <div class="panel-heading">
            <div id="stepbar" style="padding-left: 140px; margin-bottom: 10px;">
                <ul class="step_bar">
                    <li class="step g_step1"><i class="fa fa-desktop active"></i><a class="g_a_step1" href="javascript:;">设定参数</a></li>
                    <li class="green_line"></li>
                    <li class="step g_step2"><a class="g_a_step2" href="javascript:;"><i class="fa fa-paint-brush"></i>定制效果</a></li>
                    <li class="green_line"></li>
                    <li class="step step3"><a class="a_step3" href="javascript:;"><i class="fa fa-android"></i>生成APP</a></li>
                    <li>
                        <a href="APPList.aspx" class="btn btn-info" style="margin-top:8px;" >我的APP</a>
                    </li>
                </ul>
                <div style="clear: both;"></div>
            </div>
        </div>
        <div class="panel-body" style="padding:0px;">
            <div data-step="1" class="stepitem active step1">
                <div runat="server" id="apkmode0_div" visible="false">
                    <div class="remindDiv"><i class="fa fa-link"></i> 输入网站地址,封装为APP：</div>
                    <div class="input-group" style="width: 500px;margin-bottom:10px;">
                        <asp:TextBox runat="server" ID="Url_T" CssClass="form-control" placeholder="请输入你的手机网站地址"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button runat="server" ID="SetUrl_Btn" CssClass="btn btn-danger" Text="创建APP" OnClick="SetUrl_Btn_Click" OnClientClick="return SetUrl();" />
                        </span>
                    </div>
                </div>
                <div runat="server" id="apkmode1_div" visible="false">
                    <div class="remindDiv"><i class="fa fa-cloud-upload"></i>上传Html压缩包,生成APP：</div>
                    <div class="input-group" style="width: 500px;">
                        <input type="text" class="form-control" id="Zip_T" onclick="$('#Zip_F').click();"  placeholder="请选择zip文件" />
                        <ZL:FileUpload  runat="server" ID="Zip_F" style="display:none;" accept="application/zip"/>
                        <%--<asp:FileUpload runat="server" ID="Zip_F" style="display:none;" accept="application/zip"/>--%>
                        <span class="input-group-btn">
                            <a href="/APP/AppTlp/TlpList.aspx" class="btn btn-info"><i class="fa fa-cloud-download"></i>下载模板</a>
                            <asp:Button runat="server" ID="SetAPP_Btn" CssClass="btn btn-danger" Text="创建APP" OnClick="SetAPP_Btn_Click" OnClientClick="return SetAPP();"/>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="alert alert-danger" runat="server" id="remind_sp">
        如需在服务器布署APP生成功能,请先布署好Android与PhoneGap环境,你也可以使用<a href="http://app.zoomla.cn/APP/AddAPP.aspx" target="_blank">[线上版本]</a>生成APP
    </div>
<div class="alert alert-info remind" runat="server" id="auth_sp"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <link href="/App_Themes/V3.css" rel="stylesheet" />
    <style type="text/css">
        .remindDiv{font-size:16px;color:#fff;margin-bottom:10px;}
        .font14 {font-size:14px;font-weight:normal;}
        .img50 {width:50px;height:50px;display:none;}
        .green_line {background:url(/App_Themes/Admin/Mobile/green_line.png) no-repeat 0 23px;width:44px;height:24px;}
        .mobile {background: url(/App_Themes/User/bg_mobile.png) no-repeat; width: 327px; height: 674px; padding-left: 25px; padding-top: 120px;}

        .step1 {background: url(/App_Themes/Admin/Mobile/banner_11.png) no-repeat; width: 100%; height: 420px; padding-top: 220px; padding-left: 650px;}
        .stepitem {display:none;}
        .stepitem.active {display:block;}
        .remind div {margin-bottom:3px;}
    </style>
    <script src="/JS/ZL_Regex.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
    <script>
        $(function () {
            $("#Url_T").keydown(function () {
                if (event.keyCode == 13) {
                    $("#SetUrl_Btn").click();
                    return false;
                }
            });
            $("#Zip_T").keydown(function () {
                if (event.keyCode == 13) {
                    $("#SetAPP_Btn").click();
                    return false;
                }
            });
            //------上传Html包
            $("#Zip_F").change(function () {
                var val = $(this).val().toLowerCase();
                if (val == "") return;
                var ext = GetExName(val);
                if (ext != "zip" && ext != "rar") { $(this).val(""); alert("只能上传rar或zip压缩包"); return false; }
                $("#Zip_T").val(val);
            });
        })
        function SetUrl() {
            var url = $("#Url_T").val().toLowerCase();
            if (url != "" && url.indexOf("://") < 0) {
                url = "http://" + url;
            }
            if (!ZL_Regex.isUrl(url)) {
                alert("不是有效的Url格式"); return false;
            }
            return true;
        }
        //html压缩包
        function SetAPP()
        {
            var val = $("#Zip_F").val();
            if (ZL_Regex.isEmpty(val)) { alert("必须指定压缩文件"); return false; }
            return true;
        }
    </script>
</asp:Content>