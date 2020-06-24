<%@ page language="C#" autoeventwireup="true" inherits="Design_PreView, App_Web_ghjwr325" enableviewstate="false" masterpagefile="~/Common/Master/Empty.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <asp:Literal runat="server" ID="Meta_L" EnableViewState="false"></asp:Literal>
    <title><asp:Literal runat="server" ID="Title_L" EnableViewState="false"></asp:Literal></title>
    <link href="/Design/res/css/comp.css" rel="stylesheet" />
    <script src="/Design/JS/Plugs/covervid.js"></script>
    <asp:Literal runat="server" ID="Resource_L" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div ng-app="app">
        <div id="editorBody" ng-controller="appCtrl">
            <div id="midBody" class="container" style="position: relative; padding: 0px;"></div>
            <div id="mainBody"></div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/Design/JS/sea.js"></script>
    <script src="/JS/Modal/EventBase.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script>
        var sitecfg=<%=sitecfg%>;
        var scope;
        seajs.use(["page"], function (page) {

            page.guid = "<%:pageMod.guid%>";
            page.token="<%:Session.SessionID%>";
            page.bgconfig =<%=bgconfig%>;
            page.compData = <%=pageMod.comp%>;
            page.comp_global=<%=comp_global%>
            page.extendData=<%=extendData%>;

            page.instance = $(document);
            page.init();
            for (var i = 0; i < page.compList.length; i++) {
                scope.addDom(page.compList[i]);
            }
        });
        var app = angular.module("app", [], function ($compileProvider) { })
            .controller("appCtrl", function ($scope, $compile) {
                scope = $scope;
                $scope.list = {};
                $scope.addDom = function (compObj) {
                    if ($scope.list[compObj.id]) {  return; }
                    $scope.list[compObj.id] = compObj;
                    var html = $(compObj.AnalyToHtml());
                    html.attr("style",compObj.config.style);
                    compObj.SetInstance($compile(angular.element(html))($scope),document);
                    //-----确定加入哪一个body中
                    var bodyid = "midBody";
                    if (compObj.config.bodyid && compObj.config.bodyid != "") { bodyid = compObj.config.bodyid; }
                    //-----
                    angular.element(document.getElementById(bodyid)).append(compObj.instance);
                }
            })
            .filter("html", ["$sce", function ($sce) {
                return function (text) { return $sce.trustAsHtml(text); }
            }]);
        //-----事件监测
        eventBase.add("editor_update",function(param){
            scope.$digest();
        });
    </script>
</asp:Content>
