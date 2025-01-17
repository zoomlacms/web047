﻿<%@ page language="C#" autoeventwireup="true" inherits="App_NoAuth, App_Web_ek0h5n4l" masterpagefile="~/Common/Master/Commenu.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>APP授权</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <div class="container" style="margin-top:80px;">
        <ul class="list-unstyled" id="optionul">
        <li>
        <div class="user_menu" style="background: rgb(153, 153, 255);" title="点击授权">
            <a target="_blank" href="http://www.zoomla.cn/APP/AuthApply.aspx">
                <i class="glyphicon glyphicon-copyright-mark"></i>
                <br />获取授权<br /><span class="font16">获取授权,本地布署生成APP</span></a>
        </div></li>
        <li><div class="user_menu" style="background: rgb(102, 153, 51);" title="点击访问">
            <a target="_blank" href="http://App.zoomla.cn/APP/Default.aspx">
                <i class="fa fa-tasks"></i>
                <br />免费生成<br /><span class="font16">访问微逐浪,在线免费生成APP</span></a>
        </div></li>
        <li><div class="user_menu" style="background:rgb(39, 169, 227);" title="点击下载">
            <a target="_blank" href="http://www.zoomla.cn/APP/APPManual.docx">
                <i class="glyphicon glyphicon-list-alt"></i>
                <br />部署手册<br /><span class="font16">获取本地布署和使用手册</span></a>
        </div></li>
    </ul>
 </div>
 <div class="alert alert-danger">站点未授权,无法本地生成APP,你可以申请授权或在线生成APP,如果你已有授权码,<a href="<%=CustomerPageAction.customPath2+"Config/SiteOption.aspx?Tab=2" %>">点此配置</a></div>
 <div class="alert alert-info remind" runat="server" id="auth_sp"></div>
    <style type="text/css">
       * {font-family:'Microsoft YaHei';}
       #optionul li{width:33%;float:left;}
       .user_menu{ margin:auto; margin-bottom:10px; width:220px; height:220px; border-radius:10px; background:rgba(23,126,1,1);}
       .user_menu a { display: block; padding-top:20px; height: 220px; text-align: center; color: #fff; font-size: 20px; margin-bottom: 10px; border-radius:10px; box-shadow:0 0 3px 1px rgba(0,0,0,0.3);}
       .user_menu a i{ font-size:6em;}
       .font16 {font-size:16px;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>