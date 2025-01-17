﻿<%@ page title="" language="C#" masterpagefile="~/User/Default.master" autoeventwireup="true" inherits="User_Cloud_CloudManage, App_Web_ltcllvzy" clientidmode="Static" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>网络云盘</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
<div id="pageflag" data-nav="cloud" data-ban="cloud"></div>
<div class="container margin_t5">
<ol class="breadcrumb">
<li><a title="会员中心" href="/User/Default.aspx">会员中心</a></li>
<li class="active">网络云盘</li>
</ol>
</div>
<div class="container u_cnt">   
<span runat="server" id="OpenCloud" visible="false"><i class="fa fa-warning"></i>您还没有云盘，请先
<asp:LinkButton ID="Open" runat="server" OnClick="OpenCloud_Click" ForeColor="Red">开通云盘</asp:LinkButton>
</span>
<div class="cloudmanage">
    <div id="Cloud" runat="server" visible="false">
        <div class="url_title" style="border:1px solid #ddd;background-color:#f7f7f7;border-radius:4px;padding:8px;">
            <span id="navv" runat="server"></span>
            <asp:HiddenField ID="HdnPath" runat="server" />
        </div>
        <div class="clearfix"></div>
        <div class="us_seta btn_green" id="us_seta" style="text-align: left;margin-top:5px;" runat="server">
            <asp:Button ID="Back_Btn" runat="server" CssClass="btn btn-primary" Text="返回" OnClick="Back_Btn_Click" />
            <input type="button" class="btn btn-primary" name="demoCode04-3" value="上传"
                onclick="ShowFileDiag()" />
            <input id="newFile" type="button" class="btn btn-primary" value="新建文件夹"
                onclick="ShowDirDiag()" />
        </div> 
        <table class="table">
                <thead>
                    <tr>
                 <td style="width:60%;">名称</td>
	            <td style="width:20%;">大小</td>
	            <td style="width:20%;">创建时间</td></tr>
                </thead>
        <asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
            <ItemTemplate>
                <tr style="height: 24px" class="tdbg" onmouseover="$(this).find('.hoverDiv').show();" onmouseout="$(this).find('.hoverDiv').hide();">
                    <td align="left">
                        <div style="position:relative;bottom:-10px;display:inline-block;"><%# GetUrl()%></div>
                        <%#GetLink(Eval("FileType").ToString(),Eval("FileName").ToString()) %>
                        <span class="hoverDiv" style="display:none;">
		                 <%#GetOP() %>
                            <asp:LinkButton ID="LbtnDelList" CommandName='DelFile' CommandArgument='<%# Eval("Guid")%>'
                            OnClientClick="if(!this.disabled) return confirm('确定要删除吗？');" runat="server"><span class='glyphicon glyphicon-trash' title='删除'></span></asp:LinkButton>
                        </span>
			        </td>
                    </td>
                    <td><%# GetSize(Eval("FileSize").ToString())%></td>
                    <td><%# Eval("CDate")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table> 
  <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
    </div>
    <div style="display:none;" id="NewDir_div">
        <asp:TextBox ID="DirName_T" CssClass="form-control text_300" runat="server"></asp:TextBox>
        <asp:Button ID="CreateDiv" runat="server" CssClass="btn btn-primary" OnClick="CreateDiv_Click" Text="确定" />
    </div>
    <div style="display:none;" id="File_div">
        <input type="file" id="files" />
    </div>
    </div>
    <div class="user_menu_sub"> 
<ul class="list-inline text-center">
<li><a href="/Mis/ke/DailyPlan.aspx"><i class="glyphicon glyphicon-calendar" style="background:#990000"></i><span>日程安排</span></a></li>
<li><a href="MySubscription.aspx"><i class="fa fa-rss" style="background:#28b779"></i><span>订阅管理</span></a></li>
<li><a href="Info/Listprofit.aspx"><i class="glyphicon glyphicon-usd" style="background:#a43ae3"></i><span>财务管理</span></a></li>
<li><a href="/Space/SpaceManage.aspx"><i class="fa fa-users" style="background:#f874a4"></i><span>个人聚合</span></a></li>
<li><a href="CashCoupon/ArriveManage.aspx"><i class="fa fa-file-text" style="background:#004b9b"></i><span class="span_xs">抵用券</span></a></li>
<li><a href="Info/DredgeVip.aspx"><i class="glyphicon glyphicon-credit-card" style="background:#CC3366"></i><span class="span_xs">VIP卡</span></a></li>
<li><a href="PrintServer/ImageList.aspx"><i class="fa fa-paint-brush" style="background:#27a9e3"></i><span>FLEX涂鸦</span></a></li>
<li><a href="PrintServer/Project/ProjectList.aspx"><i class="glyphicon glyphicon-th-large" style="background:#990000"></i><span>项目管理</span></a></li>
<li><a href="Survey/SurveyAll.aspx"><i class="glyphicon glyphicon-list-alt" style="background:#999"></i><span>问卷投票</span></a></li>
<li><a href="/Try/Default.aspx" target="_blank"><i class="glyphicon glyphicon-headphones" style="background:#6699CC"></i><span>在线试戴</span></a></li> 
<li><a href="/Plugins/Domain/Domname.aspx?Page=7" target="_blank"><i class="glyphicon glyphicon-globe" style="background:#852b99"></i><span>IDC管理</span></a></li> 
<li><a href="/Mis/" target="_blank"><i class="glyphicon glyphicon-tags" style="background:#1FA67A"></i><span class="span_xs">MIS管理系统</span></a></li> 
<li><a href="UserFunc/Watermark/" target="_blank"><i class="glyphicon glyphicon-barcode" style="background:#22afc2"></i><span class="span_xs">授权证书生成</span></a></li>    
</ul> 
</div>  
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
    .cloud_dirdiag{width:450px;}
    .cloudmanage .hoverDiv a{display:inline-block; margin-left:10px;}
</style>
<link href="/Plugins/Uploadify/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Plugins/Uploadify/jquery.uploadify.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        var DirDiag=new ZL_Dialog();
        function ShowDirDiag(){
            DirDiag.content="NewDir_div";
            DirDiag.title="新建目录";
            DirDiag.width = "cloud_dirdiag";
            DirDiag.ShowModal();
        }
        var FileDiag=new ZL_Dialog();
        function ShowFileDiag(){
            FileDiag.title="文件上传";
            FileDiag.content="File_div";
            FileDiag.width="dirdiag";
            FileDiag.ShowModal();
            $("#files").uploadify({
                //按钮宽高
                width: 120,
                height: 35,
                auto: true,
                swf: '/Plugins/Uploadify/uploadify.swf',
                uploader: '/Plugins/Uploadify/UploadFileHandler.ashx',
                buttonText: "上传附件",
                buttonCursor: 'hand',
                fileTypeExts: "*.*",
                fileTypeDesc: "请选择文件",
                fileSizeLimit: "50000KB",
                formData: { "action": "Cloud_Doc", "value": "<%:CurrentDir%>","Type":"<%=Request["Type"] %>" },
                queueSizeLimit: 3,
                removeTimeout: 2,
                multi: true,
                onUploadStart: function (file) { },
                onUploadSuccess: function (file, data, response) {//json,result,tru||false
                },
                onQueueComplete: function (queueData) { location = location; },
                onUploadError: function (file) { }
            });
        }
        $().ready(function(){
        });
        var prediag = new ZL_Dialog();
        function prefile(guid) {
            prediag.title = "预览文件";
            prediag.url = "/PreView.aspx?CloudFile=" + guid;
            prediag.maxbtn = false;
            prediag.ShowModal();
            $('.modal').css('top', '100px');
            $('.modal-body').css('height', '600px');
        }
    </script>
</asp:Content>