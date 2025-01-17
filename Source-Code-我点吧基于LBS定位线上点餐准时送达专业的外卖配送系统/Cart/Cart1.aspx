﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart1.aspx.cs" Inherits="test_Cart1" EnableViewStateMac="false" MasterPageFile="~/Cart/order1.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>购物车</title> 
<style type="text/css">
.head_div {padding:10px 0 10px;}
.width360 {width:360px;}
#EGV tr { background:#fff;}
#EGV .media-left img { width:80px; height:80px; border:1px solid #ddd;}
#EGV .media-heading { font-size:1.1em;}

</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="head_div hidden-xs">
    <a href="/"><img src="<%=Call.LogoUrl %>" class="margin_l5" /></a>
    <div class="input-group pull-right skey_div text_300">
        <input type="text" id="skey_t" placeholder="商品搜索" class="form-control skey_t" data-enter="0"/>
        <span class="input-group-btn">
            <input type="button" value="搜索" class="btn btn-default" onclick="skey();" data-enter="1"/>
        </span>
    </div>
    <div class="clearfix"></div>
</div>
<table id="EGV" class="table">
<asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound">
<ItemTemplate>
<tbody style="border:none;">
<tr>
<td colspan="7" class="storename">
<label><input type="radio" class="store_chk" name="store_chk" value="<%#Eval("ID") %>" /><%#Eval("StoreName") %></label>
</td>
</tr>
<asp:Repeater runat="server" ID="ProRPT" OnItemCommand="ProRPT_ItemCommand">
<ItemTemplate>
<tr data-id="<%#Eval("ID") %>">
<td colspan="7">
    <div class="media">
        <div class="media-left media-middle"><input type="checkbox" name="prochk" value="<%#Eval("ID") %>" disabled /></div>
        <div class="media-left"><a href="<%#GetShopUrl() %>"><img class="media-object" src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="this.src='/Images/nopic.gif';" alt="<%#Eval("ProName") %>" /></a></div>
        <div class="media-body media-middle">
            <h4 class="media-heading"><a href="<%#GetShopUrl() %>"><%#Eval("ProName") %></a></h4>
            <div class="cart_list_cp">
                <span id="trprice_<%#Eval("ID") %>" class="trprice pull-left" style="line-height:30px; margin-right:5px;"><%#GetPrice() %></span>
                <span class="pull-left" hidden><%#GetMyPrice() %></span>
                <div class="pull-left pronum_td" style="margin-right:5px;">
                    <div class="input-group input-group-sm">
                        <span class="input-group-addon minus"><span class="glyphicon glyphicon-minus"></span></span>
                        <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" disabled />
                        <span class="input-group-addon add"><span class="glyphicon glyphicon-plus"></span></span>
                    </div>
                </div>
                <div class="r_green text-center hidden"><%#Eval("Pronum") %></div>
                <div hidden><%#GetStockStatus()%></div>
                <asp:LinkButton CssClass="btn btn-danger btn-sm" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确定要删除吗?');">删除</asp:LinkButton>
            </div>
        </div>
    </div>
</td>

</tr>
</ItemTemplate>
</asp:Repeater>
</tbody>
</ItemTemplate>
</asp:Repeater>
<tr>
<td colspan="7">
<div hidden>
<label hidden><input type="checkbox" checked="checked" onclick="ChkAll(this);" />全选</label>
<asp:Button runat="server" ID="BatDel" Text="批量删除" CssClass="btn btn-primary btn-xs margin_l5" OnClick="BatDel_Click" OnClientClick="return confirm('确定要删除吗');" />
</div>
<div>
<span>已选择<span class="trprice" id="pronum_span"></span>件商品,总价:<span runat="server" id="totalmoney" class="totalmoney">0.00</span></span>
<span>余额:<span id="totalPurse_sp"></span></span>
<span hidden>银币:<span id="totalSicon_sp"></span></span>
<span hidden>积分:<span id="totalPoint_sp"></span></span>
<input type="button" id="NextStep" value="去结算" class="btn btn bg-primary" onclick="GetNextStep();" />
<asp:Button runat="server" ID="RealNext_Btn" OnClick="NextStep_Click" Style="display: none;" />
</div>
</td></tr>
</table>
<div id="remind_max" style="padding: 20px; display: none;">
    <div>
        <span class="glyphicon glyphicon-warning-sign" style="font-size: 48px; color: #ffd800;"></span>
        <span style="font-size: 18px; font-weight: bold; margin-left: 10px;">商品数量不能大于200</span>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/B_User.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/Control.js"></script>
<script>
    var buser = new B_User();
    var diag = new ZL_Dialog();
    $(function () {
        ZL_Regex.B_Num(".pronum_text");
        ZL_Regex.B_Value(".pronum_text", {
            min: 1, max: 200, overmin: function () { }, overmax: function () {
                ShowRemind();
            }
        });
		$("#EGV tbody:first-child input[type=radio]").attr("checked","checked");
		$("#EGV tbody:first-child input[type=checkbox]").each(function(index, element) {
            this.checked = true;
			$(this).removeAttr("disabled");
        });
        $(".add").click(function () {
            ChangePronum(this, "+");
        });
        $(".minus").click(function () {
            ChangePronum(this, "-");
        });
        $(".pronum_text").change(function () {
            var id = $(this).closest("tr").data("id");
            SetNum(id, $(this).val());
            UpdatePrice(id);
        });
        $("input[name=prochk]").click(function () {
            UpdateTotalPrice();
            UpdateItemNum();
        });
        $(".store_chk").click(function () {
            ChkByStore(this);
            UpdateItemNum();
            UpdateTotalPrice();
        });
        UpdateItemNum();
        UpdateTotalPrice();
        Control.EnableEnter();
        buser.IsLogged(function () { });
    })
    //更改购买数量
    function ChangePronum(obj, action) {
        var id = $(obj).closest("tr").data("id");
        var $td = $(obj).closest("td");
        var text = $td.find(".pronum_text")[0];
        var v = parseInt(text.value);
        if (!v || v == "" || v < 1) v = 1;
        switch (action) {
            case "-":
                if (v > 1)--v;
                text.value = v;
                break;
            case "+":
                text.value = ++v;
                break;
        }
        UpdatePrice(id);
        SetNum(id, v);
    }
    //更新价格(需更为后台获取)
    function UpdatePrice(id) {
        var pronum = $("#pronum_" + id).val();
        var price = $("#price_" + id).text();
        var obj = $("#trprice_" + id);
        obj.text((price * pronum).toFixed(2));
        UpdateTotalPrice();
    }
    //更新总金额
    function UpdateTotalPrice() {
        var $chkarr = $("[name=prochk]:checked");
        var money = 0.00, purse = 0.00, sicon = 0.00, point = 0.00;
        for (var i = 0; i < $chkarr.length; i++) {
            var id = $chkarr[i].value;
            var num = $("#pronum_" + id).val();
            var pursePrice = parseFloat($("#price_purse_" + id).text());
            var siconPrice = parseFloat($("#price_sicon_" + id).text());
            var pointPrice = parseFloat($("#price_point_" + id).text());
            if (pursePrice)
                purse += pursePrice * num;
            if (siconPrice)
                sicon += siconPrice * num;
            if (pointPrice)
                point += pointPrice * num;
            money += parseFloat($("#trprice_" + id).text());
        }
        $("#totalmoney").text(money.toFixed(2));
        $("#totalPurse_sp").text(purse.toFixed(2));
        $("#totalSicon_sp").text(sicon.toFixed(2));
        $("#totalPoint_sp").text(point.toFixed(2));
    }
    //--商品数量相关
    function ChkAll(obj) {
        $("#EGV :checkbox").each(function () { this.checked = obj.checked; });
        UpdateItemNum();
    }
    //全选本店商品
    function ChkByStore(obj) {
		$(obj).closest("tbody").siblings("tbody").find(":checkbox[name=prochk]").each(function () {
            this.checked = false;
			$(this).attr("disabled","disabled");
        });
        $(obj).closest("tbody").find(":checkbox[name=prochk]").each(function () {
            this.checked = obj.checked;
			$(this).removeAttr("disabled");
        });
    }
    //更新数量,确定是否禁用按钮
    function UpdateItemNum() {
        var num = $("[name=prochk]:checked").length;
        $("#pronum_span").text(num);
        document.getElementById("NextStep").disabled = (num < 1) ? "disabled" : "";
    }
    //------AJAX
    //更改购买数据
    function SetNum(id, num) {
        num = parseInt(num);
        if (isNaN(num)) return;
        if (num < 1) { num = 1; }
        $.post("/Cart/OrderCOM.ashx?action=setnum&mid=" + id + "&pronum=" + num, {}, function (data) {
			console.log(data)
            if (data == "1") {
            }
            else { }
        });
    }
    function GetNextStep() {
        disBtn($("#NextStep")[0], 2000);
        buser.IsLogged(function (data, flag) {
            if (flag) {
                $("#RealNext_Btn").click();
            }
            else {
                diag.width = "minwidth";
                diag.title = "用户登录";
                diag.url = "/login_Ajax.aspx";
                diag.maxbtn = false;
                diag.backdrop = true;
                diag.ShowModal();
            }
        });
    }
    function LoginSuccess() {
        diag.CloseModal();
        $("#RealNext_Btn").click();
    }
    function AutoHeight() { diag.AutoHeight(); }
    //------
    function skey()
    {
        var key = $("#skey_t").val();
        window.open("/Search/SearchList.aspx?node=0&keyword="+key);
    }
</script>
<script>
    var reminddiv;
    $(function () {
        reminddiv = $("#remind_max");
        reminddiv.remove();
        reminddiv.show();
    })
    function ShowRemind() {
        var diag = new ZL_Dialog();
        diag.width = "minwidth";
        diag.maxbtn = false;
        diag.backdrop = false;
        diag.title = "提示";
        diag.body = reminddiv[0].outerHTML;
        diag.ShowModal();
    }
</script>
</asp:Content>