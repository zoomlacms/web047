define(function (require, exports, module) {
    //var tlp = '<div id="@id" ng-model="list.@id.dataMod" class="@css" style="@style"><div class="layout"></div></div>';
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    _base.utils.inherits(_self, _base.Control);
    _self.prototype.Init = function (model, extend) {
        var ref = this;
        ref.htmlTlp = "<a href='/List'>" + model.dataMod.html + "</a>";
        ref._init(model, extend);
    }
    _self.prototype.Init_After = function () {
        var ref = this;
        eventBase.add(ref.id + "_render", function (params) {
            $(ref.instance).html("<a href='/List'>" + ref.dataMod.html + "</a>");
        });
    }
    module.exports = function () { return _self; }
});