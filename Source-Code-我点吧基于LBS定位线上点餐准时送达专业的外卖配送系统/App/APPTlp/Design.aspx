﻿<%@ page language="C#" autoeventwireup="true" inherits="test_design, App_Web_ero3tqw3" validaterequest="false" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link href="/JS/Design/design.css" rel="stylesheet" />
<style>
        .row{margin:initial;}
        body{background-color:#ddd;font-family:"微软雅黑";}
        a{color:inherit;}
        .dialog{width:1100px;}
        .label{font-weight:normal;padding:initial;text-align:left; line-height:initial}
        .title.acitve i:after{content:'\E612'!important;}
        .moblie{width:327px;height:674px;margin:80px 30px;padding-left:25px;padding-top:120px;background:url(/App_Themes/User/bg_mobile.png) no-repeat;}
        .step_bar {list-style-type:none;margin:0;list-style:none;}
        .step_bar .fa {font-size:25px;padding-right:5px;}
        .step_bar .fa.active {color:green;}
        .step_bar li {float:left;}
        .step_bar .step {width:90px;padding-top:10px;}
        .green_line {background:url(/App_Themes/Admin/Mobile/green_line.png) no-repeat 0 23px;width:44px;height:24px;}
        .mobile {background: url(/App_Themes/User/bg_mobile.png) no-repeat; width: 327px; height: 674px; padding-left: 25px; padding-top: 120px;}

        .step1 {background: url(/App_Themes/Admin/Mobile/banner_11.png) no-repeat; width: 100%; height: 420px; padding-top: 180px; padding-left: 650px;}
        .stepitem {display:none;}
        .stepitem.active {display:block;}
        .remind div {margin-bottom:3px;}

        .helpdiv{margin-top:80px;margin-left:350px; color:#333; background-color:#ddd;}
        .helpdiv h1{font-size:40px;}
        .helpdiv ul{margin-top:15px;}
        .helpdiv ul li{font-size:16px;margin-bottom:20px;}
        .helpdiv .title_help{font-weight:600;color:#999;}
        .helpdiv .preicon:after {font-family: icon;font-style: normal;font-weight: 400;font-size: 26px;vertical-align: -18%;content: "\E604";}
        .helpdiv .presave:after{font-family: icon;font-style: normal;font-weight: 400;font-size: 26px;vertical-align: -18%;content: "\E605";}
    </style>
<title></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
            <div class="hidden">
            <asp:Button runat="server" ID="Save_Btn" OnClick="Save_Btn_Click" Style="display: none;" />
            <asp:HiddenField runat="server" ID="Head_Hid" />
            <asp:HiddenField runat="server" ID="AllHtml_Hid" />
            <input type="hidden" id="vpath_hid" />
        </div>
        <div>
            <div class="user_mimenu user_home_mimenu">
            <div class="navbar navbar-fixed-top" role="navigation">
            <button type="button" class="btn btn-default" id="mimenu_btn">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <div class="user_mimenu_left">
            <ul class="list-unstyled">
            <li> <a href="/" target="_blank">首页</a></li>
            <li> <a href="/Home" target="_blank">能力</a></li>
            <li> <a href="/Index" target="_blank">社区</a></li>
            <li> <a href="/Ask" target="_blank">问答</a></li>
            <li> <a href="/Guest" target="_blank">留言</a></li>
            <li> <a href="/Baike" target="_blank">百科</a></li>
            <li> <a href="/Office" target="_blank">OA</a></li>
            </ul>
            </div>
            <div class="navbar-header">
            <button class="navbar-toggle in" type="button" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">移动下拉</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            </div>
            </div> 
            </div>
            <div class="user_mimenu_right">
            <ul class="list-inline pull-right">
                <li><a href="http://app.zoomla.cn/" target="_blank"><i class="fa fa-book"></i> 线上版本</a></li>
                <li><a href="/User/"><i class="fa fa-user"></i> 会员中心</a></li>
                <li><a href="/User/Logout.aspx"><i class="glyphicon glyphicon-off"></i> 退出</a></li>
                </ul>
            </div>
            <div class="panel panel-default">
               <div class="panel-heading">
                   <div id="stepbar" style="padding-left: 140px; margin-bottom: 10px;">
                        <ul class="step_bar">
                            <li class="step g_step1"><a class="g_a_step1" href="javascript:;"><i class="fa fa-desktop"></i>指定链接</a></li>
                            <li class="green_line"></li>
                            <li class="step g_step2"><a class="g_a_step2" href="javascript:;"><i class="fa fa-paint-brush active"></i>定制效果</a></li>
                            <li class="green_line"></li>
                            <li class="step step3"><a class="a_step3" href="javascript:;"><i class="fa fa-android"></i>生成APP</a></li>
                            <li>
                                <a href="/App/APPList.aspx" class="btn btn-primary" style="margin-top: 8px;">我的APP</a>
                                <a href="/App/AppTlp/MyTlpList.aspx" class="btn btn-primary" style="margin-top: 8px;">我的模板</a>
                            </li>
                        </ul>
                        <div style="clear: both;"></div>
                    </div>
               </div>
                <div class="panel-body" style="padding:0px; background-color:#ddd;">
                    <div class="col-md-6">
                        <div class="alert helpdiv">
                            <h1>使用帮助</h1>
                            <ul>
                                <li><span class="title_help">编辑标签:</span> 在右边的"手机页面"中右键点击您想要编辑的区域后单击编辑菜单,即可在所选区域里进行编辑内容操作;另外您还可在最右边的属性栏中编辑所选区域的样式属性</li>
                                <li><span class="title_help">预览内容:</span>点击左边工具栏的<span class="preicon"></span>图标即可预览编辑后的内容</li>
                                <li><span class="title_help">保持内容:</span>点击左边工具栏的<span class="presave"></span>图标即可保存当前所编辑的模板</li>
                            </ul>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="moblie">
                        <iframe id="tlp_ifr" src="TlpShow.aspx?VPath=<%:VPath %>&Action=1" style="border: none; width: 275px; height: 463px;"></iframe>
                        </div>
                    </div>
                    
                </div>
            </div>

            
        </div>
        <div id="sidebar-dock" class="spinner-able">
            <div class="top">
                <a class="button icon-home" href="TemplateManage.aspx" title="模板管理" onclick="return confirm('确定要返回吗模板管理吗');"></a>
                <a class="button icon-page large" title="模板" onclick="ShowDiag('TemplateList.aspx?OpenerText=vpath_hid','模板库');"></a>
                <a class="button icon-color disable" title="皮肤"></a>
                <a class="button icon-add higilight large disable" title="添加"></a>
                <a class="button icon-preview" title="预览" href="TlpShow.aspx?PreView=1&VPath=<%=VPath %>" target="_blank"></a>
                <a class="button icon-save" title="保存" onclick="SetTlpName();"></a></div>
          <%-- <div class="bottom"><span class="group group-history"><a class="button icon-undo disable"></a><a class="button icon-redo disable"></a></span><a class="button icon-help large"></a>--%>
             <div></div>
        </div>
        <div id="sidebar-panel" class="spinner-able">
            <div class="tabs"><span class="tab active"><i></i>设置</span></div>
            <div class="breadcrumbs shadow-top"><a><i data-hint="点击选中 页面 组件|bottom">页面</i></a></div>
            <div class="tabviews">
                <div class="tabview setting active">
                    <div class="panel-view body ui-scroller" data-panel-type="body" data-panel-name="body" style="left: -239px; display: none;">
                        <div class="ui-scroller-inner" style="right: -17px; padding-right: 0px;">
                            <div class="ui-scroller-body">
                                <div class="section">
                                    <h3 class="title shadow-top"><i></i>页面设置</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell" style="width: 40px;"><span class="label">宽度</span></td>
                                                <td class="cell">
                                                    <div class="diy-control size has-unit"><span class="unit"></span>
                                                        <input type="text"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row background-color">
                                                <td class="cell"><span class="label">背景色</span></td>
                                                <td class="cell">
                                                    <div class="diy-control color">
                                                        <input type="text"><span class="preview blank"><i></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell"><span class="label">背景图</span></td>
                                                <td class="cell">
                                                    <div class="diy-control image">
                                                        <div class="preview"></div>
                                                        <div class="actions"><a class="edit" data-action="edit">编辑</a><a class="select" data-action="select">选择</a><a class="delete" data-action="delete">清除</a></div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <a class="panel-navigator shadow-top" data-panel-target-name="style" data-panel-direction="forward"><span>区块设置</span><i class="icon icon-arrow-right"></i></a></div>
                        </div>
                        <div class="ui-scroller-bar"></div>
                    </div>
                    <div class="panel-view common-style ui-scroller" data-panel-type="common" data-panel-name="style" style="left: 0px; display: block;">
                        <div class="ui-scroller-inner" style="right: -17px; padding-right: 0px;">
                           <%-- <div class="ui-scroller-body"><a class="panel-navigator shadow-top" data-panel-direction="backward"><span>区块设置</span><i class="icon icon-arrow-left" data-hint="返回"></i></a><div class="styles">--%>
                                <div class="section position">
                                    <h3 class="title acitve shadow-top"><i></i>位置和大小</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell" colspan="2">
                                                    <div class="diy-control offset"><!--margin-disabled-->
                                                        <div class="box">
                                                            <span class="handle top" data-direct="top"><i></i></span>
                                                            <span class="handle right" data-direct="right"><i></i></span>
                                                            <span class="handle bottom" data-direct="bottom"><b>外边</b><i></i></span>
                                                            <span class="handle left" data-direct="left"><i></i></span>
                                                            <span class="label margin top">auto</span>
                                                            <span class="label margin right">auto</span>
                                                            <span class="label margin bottom">auto</span>
                                                            <span class="label margin left">auto</span>
                                                            <div class="padding">
                                                                <span class="handle top" data-direct="top"><i></i></span>
                                                                <span class="handle right" data-direct="right"><i></i></span>
                                                                <span class="handle bottom" data-direct="bottom"><b>内边</b><i></i></span>
                                                                <span class="handle left" data-direct="left"><i></i></span>
                                                                <span class="label padding top disable-select">空</span>
                                                                <span class="label padding right disable-select">空</span>
                                                                <span class="label padding bottom disable-select">空</span>
                                                                <span class="label padding left disable-select">空</span>
                                                            </div>
                                                        </div>
                                                        <div class="control"><a class="action center active" style="display: none;"><i data-hint="居中"></i></a><a class="action reset"><i data-hint="清除"></i></a></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="row width-height">
                                                <td class="cell"><span class="label" style="width: 34px;">宽度</span><div class="diy-control size has-unit" style="width: 68px;"><span class="unit"></span>
                                                    <input type="text" id="width_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                                <td class="cell"><span class="label" style="width: 34px;">高度</span><div class="diy-control size has-unit" style="width: 68px;"><span class="unit"></span>
                                                    <input type="text" id="height_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section background">
                                    <h3 class="title shadow-top"><i></i>背景</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell">
                                                    <div class="diy-control background">
                                                        <div class="row color"><span class="label">颜色</span><div class="diy-control color">
                                                            <input type="text" id="bkcolor_t"><span class="preview blank"><i></i></span></div>
                                                        </div>
                                                        <div class="row image"><span class="label">图片</span><div class="diy-control image">
                                                            <div id="bkimg" class="preview"></div>
                                                            <div class="actions"><a class="edit" data-action="edit">编辑</a><a class="select" data-action="select" onclick="SelImg('bkimg');">选择</a><a onclick="CleanBGImg()" data-action="delete">清除</a></div>
                                                        </div>
                                                        </div>
                                                        <div class="row position"><span class="label block">定位</span><div class="preset"><a class="left-top" data-pos="left top"><i></i></a><a class="top" data-pos="top"><i></i></a><a class="right-top" data-pos="right top"><i></i></a><a class="left" data-pos="left"><i></i></a><a class="center" data-pos="center"><i></i></a><a class="right" data-pos="right"><i></i></a><a class="left-bottom" data-pos="left bottom"><i></i></a><a class="bottom" data-pos="bottom"><i></i></a><a class="right-bottom" data-pos="right bottom"><i></i></a></div>
                                                            <div class="offset">
                                                                <div class="row position-x"><span class="label"><a></a>横向</span><div class="diy-control size has-unit"><span class="unit"></span>
                                                                    <input type="text"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                                </div>
                                                                <div class="row position-y"><span class="label"><a></a>纵向</span><div class="diy-control size has-unit"><span class="unit"></span>
                                                                    <input type="text"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row repeat-fixed"><span class="label">重复</span><div id="background_repeat" class="diy-control options uncheck"><span data-bind="background-repeat" data-param="repeat" class="option disable-select background-repeat"><i data-hint="平铺"></i></span><span data-bind="    background-repeat" data-param="repeat-x" class="option disable-select background-repeat-x"><i data-hint="横向平铺"></i></span><span data-bind="    background-repeat" data-param="repeat-y" class="option disable-select background-repeat-y"><i data-hint="纵向平铺"></i></span><span data-bind="    background-repeat" data-param="no-repeat" class="option disable-select background-no-repeat"><i data-hint="不平铺"></i></span></div>
                                                            <span class="label">固定</span><div class="diy-control options uncheck"><span class="option disable-select background-attachment-fixed"><i data-hint="开启"></i></span><span class="option disable-select background-attachment-scroll"><i data-hint="关闭"></i></span></div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section border">
                                    <h3 class="title shadow-top"><i></i>边框</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell">
                                                    <div class="diy-control border">
                                                        <div class="sides"><span class="side top" data-side="top"><i data-hint="上边框"></i></span><span class="side right" data-side="right"><i data-hint="右边框"></i></span><span class="side bottom" data-side="bottom"><i data-hint="下边框"></i></span><span class="side left" data-side="left"><i data-hint="左边框"></i></span><span class="all active" data-side="all" style="line-height:25px;">ALL</span></div>
                                                        <div class="control">
                                                            <div class="row style"><span class="label">样式</span><div class="diy-control options uncheck"><span data-bind="border" data-param="solid" class="option disable-select border-style-solid"><i data-hint="实线"></i></span><span data-bind="    border" data-param="dashed" class="option disable-select border-style-dashed"><i data-hint="虚线"></i></span><span data-bind="    border" data-param="dotted" class="option disable-select border-style-dotted"><i data-hint="点线"></i></span><span data-bind="    border" data-param="none" class="option disable-select border-style-none"><i data-hint="无"></i></span></div>
                                                            </div>
                                                            <div class="row width"><span class="label">线宽</span><div class="diy-control size has-unit"><span class="unit"></span>
                                                                <input type="text" id="border_width_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                            </div>
                                                            <div class="row color"><span class="label">颜色</span><div class="diy-control color">
                                                                <input type="text" id="border_color_t"><span class="preview blank"><i></i></span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section text">
                                    <h3 class="title shadow-top"><i></i>文字</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row font-family">
                                                <td class="cell" colspan="2"><span class="label">字体</span>
                                                    <select class="diy-control select" id="font_family_dp" style="height: 23px; width: 180px;">
                                                        <option>请选择字体</option>
                                                        <option>Arial, Helvetica, 微软雅黑</option>
                                                        <option>Arial, Helvetica, 黑体</option>
                                                        <option>Comic Sans MS, 微软雅黑</option>
                                                        <option>Comic Sans MS, 黑体</option>
                                                        <option>Impact, 微软雅黑</option>
                                                        <option>Impact, 黑体</option>
                                                        <option>Lucida Sans Unicode, 微软雅黑</option>
                                                        <option>Lucida Sans Unicode, 黑体</option>
                                                        <option>Trebuchet MS, 微软雅黑</option>
                                                        <option>Trebuchet MS, 黑体</option>
                                                        <option>Verdana, 微软雅黑</option>
                                                        <option>Verdana, 黑体</option>
                                                        <option>Georgia, 微软雅黑</option>
                                                        <option>Georgia, 黑体</option>
                                                        <option>Palatino Linotype, 微软雅黑</option>
                                                        <option>Palatino Linotype, 黑体</option>
                                                        <option>Times New Roman, 微软雅黑</option>
                                                        <option>Times New Roman, 黑体</option>
                                                        <option>Courier New, 微软雅黑</option>
                                                        <option>Courier New, 黑体</option>
                                                        <option>Lucida Console, 微软雅黑</option>
                                                        <option>Lucida Console, 黑体</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr class="row color-size">
                                                <td class="cell"><span class="label">颜色</span><div class="diy-control color" style="width: 80px;">
                                                    <input id="color_t" type="text"><span class="preview"><i style="background-color: rgb(51, 51, 51);"></i></span></div>
                                                </td>
                                                <td class="cell"><span class="label">大小</span><div class="diy-control size has-unit" style="width: 55px;"><span class="unit"></span>
                                                    <input type="text" id="font_size_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row text-align-line-height">
                                                <td class="cell options"><span class="label">对齐</span><div id="text_align_div" class="diy-control options uncheck text-align" style="width: 80px;"><span data-bind="text" data-param="left" class="option disable-select text-align-left"><i data-hint="左对齐"></i></span><span data-bind="    text" data-param="center" class="option disable-select text-align-center"><i data-hint="居中对齐"></i></span><span data-bind="    text" data-param="right" class="option disable-select text-align-right"><i data-hint="右对齐"></i></span></div>
                                                </td>
                                                <td class="cell"><span class="label">行高</span><div class="diy-control size has-unit" style="width: 55px;"><span class="unit"></span>
                                                    <input type="text" id="line_height_t"><span class="handle"><i title="左右拖动来改变大小"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row font-weight">
                                                <td class="cell" colspan="2"><span class="label">厚度</span><div class="diy-control select" tabindex="0" hidefocus="true" style="width: 167px;"><i></i><span class="label disable-select">请选择</span></div>
                                                </td>
                                            </tr>
                                            <tr class="row decoration-style">
                                                <td class="cell options"><span class="label">修饰</span><div id="text_decoration_div" class="diy-control options text-decoration" style="width: 80px;"><span data-bind="text-decoration" data-param="none" class="option disable-select text-decoration-none"><i data-hint="无"></i></span><span data-bind="    text-decoration" data-param="underline" class="option disable-select text-decoration-underline"><i data-hint="下划线"></i></span><span data-bind="    text-decoration" data-param="line-through" class="option disable-select text-decoration-line-through"><i data-hint="删除线"></i></span></div>
                                                </td>
                                                <td class="cell options"><span class="label">样式</span><div id="font_style_div" class="diy-control options uncheck font-style" style="width: 55px;"><span data-bind="font-style" data-param="normal" class="option disable-select font-style-normal"><i data-hint="正常"></i></span><span data-bind="    font-style" data-param="italic" class="option disable-select font-style-italic"><i data-hint="斜体"></i></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="section link">
                                    <h3 class="title shadow-top"><i></i>链接</h3>
                                    <table class="content shadow-top">
                                        <tbody>
                                            <tr class="row">
                                                <td class="cell"><span class="label" style="width: 55px;">链接颜色</span><div class="diy-control color" style="width: 162px;">
                                                    <input type="text" id="a_color_t"><span class="preview"><i style="background-color: rgb(0, 116, 255);"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell options"><span class="label" style="width: 55px;">链接修饰</span><div id="a_decoration_div" class="diy-control options text-decoration" style="width: 162px;"><span data-bind="a-decoration" data-param="none" class="option disable-select text-decoration-none active"><i data-hint="无"></i></span><span data-bind="    a-decoration" data-param="underline" class="option disable-select text-decoration-underline"><i data-hint="下划线"></i></span><span data-bind="    a-decoration" data-param="line-through" class="option disable-select text-decoration-line-through"><i data-hint="删除线"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell"><span class="label" style="width: 55px;">悬停颜色</span><div class="diy-control color" style="width: 162px;">
                                                    <input type="text"><span class="preview"><i style="background-color: rgb(0, 89, 176);"></i></span></div>
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="cell options"><span class="label" style="width: 55px;">悬停修饰</span><div id="a_decoration_hover" class="diy-control options text-decoration" style="width: 162px;"><span class="option disable-select text-decoration-none"><i data-hint="无"></i></span><span class="option disable-select text-decoration-underline active"><i data-hint="下划线"></i></span><span class="option disable-select text-decoration-line-through"><i data-hint="删除线"></i></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="ui-scroller-bar visible" style="height: 264.025278058645px; top: 0px;"></div>
                    </div>
                </div>
        <div class="overlay">
                <div class="block" style="display: none;"><i class="icon-link"></i>
                    <p>改变该引用区块会影响到<br>
                        <b>所有使用该区块的区域</b></p>
                    <p class="line"></p>
                    <p><b>双击</b>引用区块来编辑</p>
                </div>
            </div>
        <div style="display:none;" id="tlpname_div"> 
            <div class="text-center">
                <asp:TextBox ID="TlpName_T" placeholder="模板名称" CssClass="form-control" runat="server" />
            </div>
            <div class="text-center" style="margin-top: 10px;">
                <input type="button" class="btn btn-primary" style="margin-left: 10px;" onclick="return SaveHtml();" value="保存">
                <button class="btn btn-primary" onclick="CloseDialog()" type="button">取消</button>
            </div>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
        <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        var config={tlpdir:"<%=ZoomLa.Components.SiteConfig.SiteOption.TemplateDir%>"};
        function SaveHtml() {
            if(ZL_Regex.isEmpty($("#TlpName_T").val())){alert("模板名称不能为空");return false;}
            var obj = $("#tlp_ifr")[0].contentWindow;
            obj.BeginSave();
            var allhtml = $("#tlp_ifr").contents().find("body")[0].outerHTML;
            $("#AllHtml_Hid").val(allhtml);
            $("#Save_Btn").click();
        }
        $(function(){
            $("#mimenu_btn").click(function (e) {
                if ($(".user_mimenu_left").width() > 0) {
                    $(".user_mimenu_left ul").fadeOut(100);
                    $(".user_mimenu_left").animate({ width: 0 }, 200);
                }
                else {
                    $(".user_mimenu_left").animate({ width: 150 }, 300);
                    $(".user_mimenu_left ul").fadeIn();
                }
            });
        })
    </script>
    <script src="/JS/Design/Main.js"></script>
</asp:Content>