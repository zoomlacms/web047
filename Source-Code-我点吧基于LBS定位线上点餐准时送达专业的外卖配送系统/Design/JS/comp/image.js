define(function (require, exports, module) {
    var _self = function () { }, _base = require("base"), $ = require('jquery');
    var dc = require("dc");
    _base.utils.inherits(_self, _base.Control);
    _self.prototype.wrapper = '<div ng-model="list.@id" id="@id" class="onlydrag" style="{{list.@id.config.style}}">{html}</div>';
    _self.prototype.htmlTlp += '<img class="onlyresize imgcomp" id="@id" style="@imgstyle" ng-src="{{list.@id.dataMod.src}}"/>';
    _self.prototype.Init = function (model, extend) {
        var ref = this;
        switch (model.config.compid) {
            case "logo":
                dc.site.sel(function (mod) { ref.dataMod.src = mod.result.Logo; });
                break;
            default:
                break;
        }
        ref._init(model, extend);
    }
    _self.prototype.PreSave = function () {
        this._presave();
        this.config.imgstyle = this.instance.find(".imgcomp").attr("style");
        return { "dataMod": this.dataMod, "config": this.config };
    }
    module.exports = function () { return _self; }
});