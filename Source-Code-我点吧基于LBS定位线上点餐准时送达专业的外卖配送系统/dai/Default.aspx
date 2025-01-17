<%@ page language="C#" autoeventwireup="true" inherits="untitled_Default, App_Web_gugks1lf" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>眼镜在线试载_基于IOS与HTML5</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="user_mimenu">
        <div class="navbar navbar-fixed-top" role="navigation">
            <button type="button" class="btn btn-default" id="mimenu_btn">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="user_mimenu_left" style="width: 0px;">
                <ul class="list-unstyled" style="display: none;">
                    <li><a href="/" target="_blank">首页</a></li>
                    <li><a href="/Home" target="_blank">能力</a></li>
                    <li><a href="/Index" target="_blank">社区</a></li>
                    <li><a href="/Ask" target="_blank">问答</a></li>
                    <li><a href="/Guest" target="_blank">留言</a></li>
                    <li><a href="/Baike" target="_blank">百科</a></li>
                    <li><a href="/Office" target="_blank">OA</a></li>
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
    <div id="box">
        <div id="overlay">
            <div id="load">
                数据转入中...<span>0%</span>
                <p></p>
            </div>
        </div>
        <ul class="nav nav-tabs" id="nav_dai" role="tablist">
            <li role="presentation" class="active"><a href="#main_tab" aria-controls="main_tab"><span class="glyphicon glyphicon-user"></span>模特试镜</a></li>
            <li role="presentation"><a href="/dai/ReBack.aspx"><span class="glyphicon glyphicon-camera"></span>拍照试戴</a></li>
            <li role="presentation"><a href="/Class_2/Default.aspx" target="_blank"><span class="glyphicon glyphicon-shopping-cart"></span>在线商城</a></li>
        </ul>
        <div class="dai_border">
            <div id="left">
                <div class="modelBox">

                    <%--<div class="tabs">
        <ul>
          <li class="current ico-1">模特试镜</li>
          <li class="ico-2"><a href="ReBack.aspx">拍照试戴</a></li>
          <li class="ico-3"><a href="/Class_2/Default.aspx" target="_blank">在线商城</a></li>
        </ul>
      </div>--%>
                    <div class="modelList">
                        <div class="faceType">
                            <ul class="normal">
                                <li><a href="javascript:;" data-type="*">全 部</a></li>
                                <li><a href="javascript:;" data-type="0,2">椭圆脸</a></li>
                                <li><a href="javascript:;" data-type="1,3">圆形脸</a></li>
                                <li><a href="javascript:;" data-type="4,6">长形脸</a></li>
                                <li><a href="javascript:;" data-type="5,9">方形脸</a></li>
                                <li><a href="javascript:;" data-type="7,11">瓜子脸</a></li>
                                <li><a href="javascript:;" data-type="8,10">心型脸</a></li>
                            </ul>
                            <div class="active_type">
                                <ul>
                                    <li>全 部</li>
                                    <li>椭圆脸</li>
                                    <li>圆形脸</li>
                                    <li>长形脸</li>
                                    <li>方形脸</li>
                                    <li>瓜子脸</li>
                                    <li>心型脸</li>
                                </ul>
                            </div>
                        </div>
                        <div class="content">
                            <ul>
                                <li>
                                    <img src="res/20120608man_1.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_2.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_3.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_4.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_5.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_6.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_7.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_8.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_9.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_10.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_11.jpg" /></li>
                                <li>
                                    <img src="res/20120608man_12.jpg" /></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <ul id="tools">
                    <li class="open">收缩</li>
                    <li class="camera">拍照</li>
                    <li class="gauge">瞳距</li>
                    <li class="reset">重选</li>
                </ul>
                <div class="mask"></div>
            </div>
            <div id="right">
                <div class="search">
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">品牌</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">佐腾樱花</a></li>
                            <li><a href="javascript:;">毕加索</a></li>
                            <li><a href="javascript:;">沙漠之鹰</a></li>
                            <li><a href="javascript:;">蝙蝠侠</a></li>
                        </ul>
                    </div>
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">款式</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">男款</a></li>
                            <li><a href="javascript:;">女款</a></li>
                            <li><a href="javascript:;">通过款</a></li>
                        </ul>
                    </div>
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">脸型</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">椭圆脸</a></li>
                            <li><a href="javascript:;">长形脸</a></li>
                            <li><a href="javascript:;">方形脸</a></li>
                            <li><a href="javascript:;">瓜子脸</a></li>
                            <li><a href="javascript:;">心型脸</a></li>
                        </ul>
                    </div>
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">型号</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">40-49(小码)</a></li>
                            <li><a href="javascript:;">50-53(中码)</a></li>
                            <li><a href="javascript:;">54-57(大码)</a></li>
                        </ul>
                    </div>
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">框形</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">全框</a></li>
                            <li><a href="javascript:;">半框</a></li>
                            <li><a href="javascript:;">无框</a></li>
                            <li><a href="javascript:;">眉框</a></li>
                        </ul>
                    </div>
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">材质</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">金属合金</a></li>
                            <li><a href="javascript:;">板材镜架</a></li>
                            <li><a href="javascript:;">铁架系列</a></li>
                            <li><a href="javascript:;">钛架系列</a></li>
                            <li><a href="javascript:;">记忆镜架</a></li>
                        </ul>
                    </div>
                    <div class="selectWrap">
                        <a class="select" href="javascript:;">价格</a>
                        <ul>
                            <li class="current"><a href="javascript:;">全部</a></li>
                            <li><a href="javascript:;">50以下</a></li>
                            <li><a href="javascript:;">50-100</a></li>
                            <li><a href="javascript:;">100-150</a></li>
                            <li><a href="javascript:;">150-200</a></li>
                            <li><a href="javascript:;">200-300</a></li>
                            <li><a href="javascript:;">300以上</a></li>
                        </ul>
                    </div>
                    <a href="javascript:;" class="btn">点击搜索</a>
                </div>
                <div class="glassList">
                    <ul>
                        <li>
                            <img src="res/20120608glass_1.jpg">
                            <h5>佐腾樱花_ZTYH-001</h5>
                            豹纹色</li>
                        <li>
                            <img src="res/20120608glass_2.jpg">
                            <h5>佐腾樱花_ZTYH-010</h5>
                            蓝色</li>
                        <li>
                            <img src="res/20120608glass_3.jpg">
                            <h5>毕加索_55-2062 C6</h5>
                            绅士黑</li>
                        <li>
                            <img src="res/20120608glass_4.jpg">
                            <h5>毕加索_55-2001 C6</h5>
                            绅士黑</li>
                        <li>
                            <img src="res/20120608glass_5.jpg">
                            <h5>毕加索_55-2068 C11</h5>
                            荧光红</li>
                        <li>
                            <img src="res/20120608glass_6.jpg">
                            <h5>毕加索_55-2051 C11</h5>
                            荧光红</li>
                        <li>
                            <img src="res/20120608glass_7.jpg">
                            <h5>沙漠之鹰_R5152 C16</h5>
                            绅士黑</li>
                        <li>
                            <img src="res/20120608glass_8.jpg">
                            <h5>沙漠之鹰_R5152 CCG</h5>
                            绅士银</li>
                        <li>
                            <img src="res/20120608glass_9.jpg">
                            <h5>沙漠之鹰_R5137 C16</h5>
                            绅士黑</li>
                        <li>
                            <img src="res/20120608glass_10.jpg">
                            <h5>蝙蝠侠_BM95002 C9D</h5>
                            绅士黑</li>
                        <li>
                            <img src="res/20120608glass_11.jpg">
                            <h5>蝙蝠侠_BM97004 B6</h5>
                            绅士银</li>
                        <li>
                            <img src="res/20120608glass_12.jpg">
                            <h5>蝙蝠侠_BM97004 B1</h5>
                            透明黑</li>
                    </ul>
                </div>
                <div class="mask"></div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <link href="/App_Themes/User.css" rel="stylesheet" />
    <style>
        body, div, ul, li, h5, p {
            margin: 0;
            padding: 0;
        }

        body {
            color: #666;
            padding-top: 10px;
            font: 12px/1.5 Arial;
        }

        a:link, a:visited, a:active {
            outline: none;
            text-decoration: none;
        }

        li {
            list-style: none;
        }

        #box {
            position: relative;
            width: 1140px;
            overflow: hidden;
            margin: 30px auto;
        }

            #box .dai_border {
                border: 1px solid #ddd;
                float: left;
                width: 100%;
                border-top: none;
            }

        #nav_dai li {
            font-size: 14px;
        }

        #left, #right {
            position: relative;
            float: left;
        }

        #right {
            width: 580px;
        }

        #left {
            width: 500px;
        }

            #left .tabs {
                position: relative;
                height: 30px;
                z-index: 1;
            }

                #left .tabs ul {
                    position: absolute;
                }

                #left .tabs li {
                    float: left;
                    line-height: 29px;
                    margin-right: 10px;
                    font-weight: 700;
                    cursor: pointer;
                    padding: 0 10px 0 30px;
                    background-color: #EFEFEF;
                    border: 1px solid #D4D4D4;
                    border-radius: 5px 5px 0 0;
                    background-repeat: no-repeat;
                    background-image: url(res/20120608img_14.gif);
                }

                    #left .tabs li.current {
                        color: #267301;
                        cursor: text;
                        line-height: 30px;
                        background-color: #FFF;
                        border-bottom-width: 0;
                    }

                    #left .tabs li.ico-1 {
                        background-position: 10px 7px;
                    }

                    #left .tabs li.ico-2 {
                        background-position: 10px -32px;
                    }

                    #left .tabs li.ico-3 {
                        background-position: 10px -72px;
                    }

            #left .modelList {
                position: relative;
                padding: 10px;
                height: 474px;
                border: none;
            }

            #left .faceType {
                position: relative;
                height: 32px;
                line-height: 22px;
            }

                #left .faceType ul {
                    float: left;
                    height: 32px;
                }

                    #left .faceType ul li {
                        float: left;
                        width: 50px;
                        height: 32px;
                        display: inline;
                        margin-left: 10px;
                        text-align: center;
                    }

                        #left .faceType ul li a:hover {
                            float: left;
                            width: 100%;
                            color: #76946E;
                            background: #E1FFD9;
                        }

                #left .faceType .active_type {
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 50px;
                    height: 32px;
                    line-height: inherit;
                    margin-left: 10px;
                    overflow: hidden;
                    background: url(res//20120608img_15.gif) no-repeat;
                }

                    #left .faceType .active_type ul {
                        position: absolute;
                        left: 0;
                        width: 420px;
                    }

                        #left .faceType .active_type ul li {
                            color: #FFF;
                            cursor: text;
                            font-weight: 700;
                            margin: 0 10px 0 0;
                        }

            #left .content {
            }

                #left .content ul {
                    overflow: hidden;
                    zoom: 1;
                    margin-left: -15px;
                    padding-top: 15px;
                }

                    #left .content ul li {
                        float: left;
                        width: 80px;
                        height: 100px;
                        display: inline;
                        cursor: pointer;
                        overflow: hidden;
                        vertical-align: top;
                        margin: 0 0 25px 25px;
                        border: 1px solid #E9E9E9;
                    }

                        #left .content ul li:hover {
                            border-color: #BAEA99;
                            box-shadow: 0px 0px 15px #91E85F;
                            -moz-box-shadow: 0px 0px 15px #91E85F;
                            -webkit-box-shadow: 0px 0px 15px #91E85F;
                        }

                        #left .content ul li.hidden {
                            cursor: default;
                        }

                            #left .content ul li.hidden:hover {
                                border-color: #E9E9E9;
                                box-shadow: none;
                                -moz-box-shadow: none;
                                -webkit-box-shadow: none;
                            }

            #left .mask {
                position: absolute;
                top: 0;
                left: 0;
                width: 450px;
                height: 474px;
                background: #FFF;
                opacity: 0;
                z-index: -1;
                filter: alpha(opacity=0);
            }

            #left .photo {
                position: absolute;
                top: 263px;
                left: 226px;
                width: 0;
                height: 0;
                z-index: 2;
                border: 1px solid #E5E5DE;
                box-shadow: 0px 0px 5px #CCC;
                -moz-box-shadow: 0px 0px 5px #CCC;
                -webkit-box-shadow: 0px 0px 5px #CCC;
            }

            #left .glass {
                position: absolute;
                top: 150px;
                left: 80px;
                cursor: move;
                overflow: hidden;
                z-index: 3;
            }

                #left .glass img {
                    float: left;
                }

        #tools {
            position: absolute;
            top: -30px;
            left: -55px;
            width: 35px;
            height: 173px;
            overflow: hidden;
            background: #FFF;
            border: 1px solid #999;
            border-radius: 5px;
            box-shadow: 0px 0px 5px #666;
            -moz-box-shadow: 0px 0px 5px #666;
            -webkit-box-shadow: 0px 0px 5px #666;
            z-index: 4;
        }

            #tools li {
                color: #666;
                cursor: pointer;
                text-align: center;
                margin-bottom: 10px;
                background: url(res//20120608img_14.gif) no-repeat;
            }

                #tools li.open {
                    padding-top: 12px;
                    background-position: 11px -115px;
                }

                #tools li.close {
                    padding-top: 12px;
                    background-position: 11px -155px;
                    font-size: 12px;
                    float: none;
                }

                #tools li.camera {
                    color: #CCC;
                    cursor: default;
                    padding-top: 17px;
                    background-position: 7px -200px;
                }

                #tools li.gauge {
                    color: #CCC;
                    cursor: default;
                    padding-top: 15px;
                    background-position: 7px -240px;
                }

                #tools li.reset {
                    color: #F60;
                    padding-top: 22px;
                    background-position: 7px -280px;
                }

        #right {
            margin-left: 10px;
        }

            #right .mask {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: #FFF;
                opacity: 0.7;
                filter: alpha(opacity=70);
                z-index: 1;
            }

            #right .search {
                position: relative;
                height: 80px;
                background: #FBFBFB;
                border-radius: 8px;
                border: 1px solid #D4D4D4;
                box-shadow: 2px 2px 8px #BBB;
                -moz-box-shadow: 2px 2px 5px #BBB;
                -webkit-box-shadow: 2px 2px 8px #BBB;
            }

                #right .search .selectWrap {
                    position: relative;
                    display: inline;
                    float: left;
                    width: 100px;
                    height: 22px;
                    margin: 12px 0 0 9px;
                }

                #right .search .select, #right .search .btn {
                    display: block;
                    color: #333;
                    width: 100px;
                    height: 22px;
                    overflow: hidden;
                    background: url(res/20120608img_16.png) no-repeat;
                }

                #right .search .select {
                    width: 100px;
                    line-height: 21px;
                    line-height: 24px\9;
                    padding-left: 10px;
                }

                    #right .search .select:hover {
                        background-position: 0 -22px;
                    }

                #right .search .btn {
                    float: left;
                    text-indent: -9999px;
                    margin: 12px 0 0 9px;
                    background-position: 0 -44px;
                }

                    #right .search .btn:hover {
                        background-position: 0 -66px;
                    }

                #right .search .selectWrap ul {
                    position: absolute;
                    width: 98px;
                    display: none;
                    overflow: hidden;
                    border: 1px solid #B7BABC;
                }

                    #right .search .selectWrap ul li {
                        margin-top: -1px;
                        background: #FFF;
                        border-top: 1px solid #B7BABC;
                    }

                        #right .search .selectWrap ul li a {
                            display: block;
                            color: #333;
                            height: 24px;
                            line-height: 24px;
                            padding-left: 10px;
                        }

                        #right .search .selectWrap ul li.current a {
                            background: #9AD8FF;
                        }

                        #right .search .selectWrap ul li a:hover {
                            background: #DAF1FF;
                        }

            #right .glassList {
                overflow: hidden;
                zoom: 1;
                width: 580px;
                height: 340px;
                background: url(res//20120608img_17.gif) 50% 24px no-repeat;
            }

                #right .glassList ul {
                    float: left;
                    background: #FFF;
                }

                #right .glassList li {
                    float: left;
                    width: 145px;
                    height: 95px;
                    cursor: pointer;
                    margin-top: 15px;
                    text-align: center;
                    border-bottom: 1px dashed #CCC;
                }

                    #right .glassList li img {
                        display: block;
                        margin: 0 auto 6px;
                    }

                    #right .glassList li:hover img, #right .glassList li.current img {
                        border-radius: 5px;
                        width: 128px;
                        height: 43px;
                        border: 1px solid #8CEE93;
                        box-shadow: 1px 1px 15px #23DE30;
                        -moz-box-shadow: 1px 1px 15px #23DE30;
                        -webkit-box-shadow: 1px 1px 15px #23DE30;
                    }

                    #right .glassList li.current img {
                        border: 1px solid #FF7A7A;
                        box-shadow: 1px 1px 15px #F00;
                        -moz-box-shadow: 1px 1px 15px #F00;
                        -webkit-box-shadow: 1px 1px 15px #F00;
                    }

                    #right .glassList li h5 {
                        color: green;
                        font-size: 12px;
                        font-weight: 400;
                    }

        #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 1140px;
            height: 546px;
            z-index: 1000000;
            background: #B7B7B7;
            opacity: 1;
            filter: alpha(opacity=100);
        }

        #load {
            position: absolute;
            top: 200px;
            left: 50%;
            color: #fff;
            width: 320px;
            height: 40px;
            padding: 0 2px;
            text-align: center;
            margin-left: -162px;
            background: url(res/20120608img_18.png) 0 bottom no-repeat;
        }

            #load p {
                position: absolute;
                left: 2px;
                bottom: 2px;
                height: 16px;
                overflow: hidden;
                background: url(res/20120608img_19.gif);
            }

        .user_mimenu .icon-bar {
            border-bottom: 1px solid #999 !important;
        }
    </style>
    <script src="src/eye.js"></script>
    <script>
        //图片预加载
        ; (function () {
            var oLayer = fgm.$("overlay");
            oLoad = fgm.$("load"),
            oSpan = fgm.$$("span", oLoad)[0],
            oP = fgm.$$("p", oLoad)[0],
            aData = [],
            iImgcount = 0,
            iLoaded = 0,
            aImg = [].concat("20120608img_15.gif", "20120608img_14.gif", "20120608img_16.png", "20120608img_17.gif");
            for (i = 1; i <= 12; i++) aImg = aImg.concat("20120608man_" + i + ".jpg", "20120608man_big_" + i + ".jpg", "20120608glass_" + i + ".jpg", "20120608glass_" + i + ".png");
            for (i = 0, iImgCount = aImg.length; i < iImgCount; i++) {
                (function (i) {
                    var oImg = new Image();
                    oImg.onload = function () {
                        oSpan.innerHTML = oP.style.width = Math.ceil(++iLoaded / iImgCount * 100) + "%";
                        this.onload = null;
                        var aTmp = document.createElement("img");
                        aTmp.src = this.src;
                        aData[i] = aTmp;
                        if (aData[i] && aData.length == iImgCount) {
                            fgm.animate(oLayer, { opacity: 0 }, {
                                callback: function () {
                                    fgm.css(this, { display: "none" })
                                }
                            });
                            complete()
                        }
                    }
                    oImg.src = "res/" + aImg[i];
                })(i);
            }
        })();
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
    </script>
</asp:Content>
