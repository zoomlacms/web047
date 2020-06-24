define(function (require, exports, module) {
    var $ = require("jquery");
    var ZLArray = require("array");
    var APIResult = require("APIResult");
    var page = {
        instance: null,//指向页面实例
        guid: "",
        //mode: "new",//new,edit,preview(disuse)
        bgconfig: { type: "", url: "", post: "" },
        compList: [],//组件实体,作为最终保存对象,初始化时对其完成赋值(main)
        compData: [],//组件数据(仅用于初始化时解析)
        comp_global: [],//全局组件,不保存(或单独保存???)
        labelArr: "",
        extendData: [],//现用于存标签模块的数据
        token:"",
        init: function () {
            var ref = this;
            ref.SetBackGround();
            ZLArray.MyArr = ref.extendData;
            //解析组件,支持传字符串或模型
            var parseComp = function (comp) {
                try {
                    if (typeof (comp) == "string") { comp = JSON.parse(comp); }
                    //如果该组件为标签,则特殊处理(找到对应的解析后的html)
                    if (comp.config.type == "label") {
                        var labelMod = ZLArray.GetByID(data.dataMod.guid, "guid");
                        if (labelMod) { data.htmlTlp = labelMod.htmlTlp; }
                    }
                    //构造组件
                    var compObj = ref.GetCompObj(comp);
                    return compObj;
                } catch (ex) { console.log("parseComp error,原因:" + ex.message, comp); }
            }
            //处理页面组件
            for (var i = 0; i < ref.compData.length; i++) {
                var comp = ref.compData[i];
                ref.compList.push(parseComp(comp));
            }
            //处理全局组件
            for (var i = 0; i < ref.comp_global.length; i++) {
                var model = ref.comp_global[i];
                var compData = JSON.parse(model.comp);
                //将全局页的组件解析
                for (var j = 0; j < compData.length; j++) {
                    var comp = JSON.parse(compData[j]);
                    //保存时将其移除并额外处理
                    comp.config._conf = { type: "global", path: model.path };
                    ref.compList.push(parseComp(comp));
                }
            }
        },
        SetBackGround: function (bgmodel) {
            if (!bgmodel) { bgmodel = page.bgconfig; }
            if (!bgmodel || !bgmodel.url || bgmodel.url == "") { return; }
            page.instance.find("#page_bkdiv").remove(); //移除旧背景
            var $div = $('<div id="page_bkdiv"></div>');
            switch (bgmodel.type)
            {
                case "minimg":
                    {
                        $div.attr("style", 'position:fixed;top:0px;height:100%;width:100%;background-image:url(' + bgmodel.url + ');background-size:auto;background-repeat:repeat;z-index:-1;');
                    }
                    break;
                case "image":
                    {
                        $div.attr("style", 'background:url(' + bgmodel.url + ');background-position: center;left:0;top:0;right:0;bottom:0; position: fixed; background-repeat:no-repeat;background-size:cover;z-index:-1;');
                    }
                    break;
                case "video":
                    {
                        $div.attr("style", "position:fixed;top:0;left:0;z-index:-1;background-color:#fff;");
                        var html = '<video class="covervid-video" autoplay loop poster="' + bgmodel.post + '">';
                        html += '<source src="' + bgmodel.url + '" type="video/mp4">';
                        $div.append(html);
                    }
                    break;
                default:
                    alert("背景类型错误"); return;
                    break;
            }
            page.bgconfig = bgmodel;
            page.instance.find("#mainBody").append($div);
        },
        GetCompObj: function (model,callback) {
            //依靠其中参数,类型,初始化为对应的对象并返回
            var compObj = null;
            //必须用静态字符串,需要解决方案
            switch (model.config.type) {
                case "div":
                    compObj = new (new require("div")())();
                    break;
                case "text":
                    compObj = new (new require("text")())();
                    break;
                case "image":
                    compObj = new (new require("image")())();
                    break;
                case "ueditor":
                    compObj = new (new require("ueditor")())();
                    break;
                case "button":
                    compObj = new (new require("button")())();
                    break;
                case "list":
                    compObj = new (new require("list")())();
                    break;
                case "content":
                    compObj = new (new require("content")())();
                    break;
                case "menu":
                    compObj = new (new require("menu")())();
                    break;
                case "gallery":
                    compObj = new (new require("gallery")())();
                    break;
                case "gallery_group":
                    compObj = new (new require("gallery_group")())();
                    break;
                case "gallery_slide":
                    compObj = new (new require("gallery_slide")())();
                    break;
                case "galleryGrid":
                    compObj = new (new require("galleryGrid")());
                    break;
                case "label":
                    compObj = new (new require("label")())();
                    break;
                case "video":
                    compObj = new (new require("video")())();
                    break;
                case "music":
                    compObj = new (new require("music")())();
                    break;
                case "social":
                    compObj = new (new require("social")())();
                    break;
                case "map":
                    compObj = new (new require("map")())();
                    break;
                case "progress":
                    compObj = new (new require("progress")())();
                    break;
                case "a001":
                    compObj = new (new require("a001")())();
                    break;
                case "gallery_photo":
                    compObj = new (new require("gallery_photo")())();
                    break;
                    //---------------手机模块
                //case "mb_basic_cube":
                //    compObj = new (new require("mb_basic_cube")())();
                //    break;
                //case "mb_basic_twocolumn":
                //    compObj = new (new require("mb_basic_twocolumn")())();
                //    break;
                //case "mb_basic_imgloop":
                //    compObj = new (new require("mb_basic_imgloop")())();
                //    break;
                default:
                    alert(model.config.type + "未命中");
                    break;
            }
            compObj.Init(model);//{dataMod:{},config:{}}
            return compObj;
        },
        PreSave: function (callback) {
            var ref = this;
            //Converting circular structure to JSON,有递归互引
            //处理:PreSave后返回json即可
            var compArr = [];
            for (var i = 0; i < page.compList.length; i++) {
                var comp = page.compList[i];
                if (comp.config._conf && comp.config._conf.type == "global") { continue; }
                var data = page.compList[i].PreSave(page);
                compArr.push(angular.toJson(data));
            }
            //改为for var 拷贝
            var pageData = { title: page.title, bgconfig: page.bgconfig };
            //$.ajax({
            //    type:"POST",
            //    url: "/WebAPI/Design/Save",
            //    data: { guid: page.guid, "labelArr": page.labelArr, "page": JSON.stringify(pageData), "comp": JSON.stringify(compArr) },
            //    headers: { "token": ref.token },
            //    success: function (data) { callback(data); }
            //})
            //为避免递归循环,浅拷贝
            var saveMod = { guid: page.guid, "labelArr": page.labelArr, "page": JSON.stringify(pageData), "comp": JSON.stringify(compArr) };
            $.post("/Design/design.ashx?action=save", { "model": JSON.stringify(saveMod) }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) { callback(model.result); }
                else { console.log("保存报错:" + model.retmsg); }
            });
        }
    };
    module.exports = page;
});