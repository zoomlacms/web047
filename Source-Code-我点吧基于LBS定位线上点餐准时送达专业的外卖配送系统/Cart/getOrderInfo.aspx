<%@ Page Language="C#" AutoEventWireup="true" CodeFile="getOrderInfo.aspx.cs" Inherits="test_getOrderInfo" MasterPageFile="~/Cart/order.master" EnableViewStateMac="true" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <title>订单结算</title>
    <style>
        .padding_L0{padding-left:0px;}
        .invoice_item_rad{font-size:14px;}
        .alert-warning{margin:0;padding:10px;font-size:12px;}
		.addresssul .active { background:none;}
		.media { margin-top:0; margin-bottom:5px; padding:10px; border-top:1px solid #ddd; border-bottom:1px solid #ddd; background:#fff;}
		.media-left img { width:80px; height:80px; border:1px solid #ddd;}
		.extend_ul { padding-left:10px; padding-right:10px;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="head_div hidden-xs">
        <a href="/"><img src="<%=Call.LogoUrl %>" class="margin_l5" /></a>
        <img class="head_r_img pull-right" src="/App_Themes/User/step2.png" />
    </div>
    <div class="gray_border">
        <div class="bordered address_div">
        	<span class="address_head">填写并核对订单信息</span>
	        <a runat="server" id="ReUrl_A1" visible="false" title="返回购物车" class="pull-right padding_r10">返回修改购物车</a>
	        <a runat="server" id="ReUrl_A2" visible="false" class="pull-right padding_r10">返回修改信息</a>
        </div>
        <div class="bordered" runat="server" id="Address_Div" style="background:#fff;">
            <p><i class="fa fa-pencil-square-o strong"> 收货人信息</i></p>
            <ul class="addresssul indent">
                <asp:Repeater runat="server" ID="AddressRPT">
                    <ItemTemplate>
                        <li id="addli_<%#Eval("ID") %>">
                            <label class="normalw"><input type="radio" name="address_rad" value="<%#Eval("ID") %>" /><%#GetAddress() %></label>
                            <span>
                                <%#GetIsDef() %>
                                <a href="javascript:;" onclick="EditAddress(<%#Eval("ID") %>);">修改</a>
                                <a href="javascript:;" onclick="DelAddress(<%#Eval("ID") %>);">删除</a>
                            </span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div runat="server" id="EmptyDiv" class="r_red" visible="false">你没有收货地址,请先填写收货地址</div>
            <input type="button" value="添加新地址" class="btn btn-primary btn-xs" onclick="AddAddress();"/>
        </div>
        <div class="bordered" style="background:#fff;" hidden>
            <p><i class="fa fa-th strong"> 发票信息</i></p>
            <div class="indent">
                <label>
                    <input type="radio" name="invoice_rad" value="0" onclick="$('#invoice_div').hide();" checked="checked"/>不开发票</label>
                    <label><input type="radio" name="invoice_rad" value="1" onclick="$('#invoice_div').show();" />需要发票</label><br />
                <div id="invoice_div">
                    <ul class="addresssul indent padding_L0">
                        <asp:Repeater ID="Invoice_RPT" runat="server">
                            <ItemTemplate>
                                <li>
                                    <label class="normalw"><input class="invoice_item_rad" name="invoice_item_rad" type="radio" value='<%#Eval("Detail") %>' data-head="<%#Eval("Head") %>" /><%#Eval("Head") %></label>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate> 
                                 <li><label class="normalw"><input class="invoice_item_rad" name="invoice_item_rad" type="radio" value='' data-head=""/>使用新发票</label></li>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                    <div>
                        <asp:TextBox runat="server" ID="InvoTitle_T" CssClass="form-control text_400 margin_t5" MaxLength="50" placeholder="发票抬头（个人或公司名称）"/> 
                        <asp:TextBox runat="server" ID="Invoice_T" TextMode="MultiLine" class="form-control invoice_t" MaxLength="180" placeholder="在此输入发票开具科目明细
" />
                    </div>
                </div>
            </div>
        </div>
        <div class="bordered" style=" padding:0;">
            <div class="">
                <asp:Repeater runat="server" ID="Store_RPT" OnItemDataBound="Store_RPT_ItemDataBound" EnableViewState="false">
                <ItemTemplate>
                <div style="padding-left:10px; padding-right:10px;"><label style="margin-bottom:0; line-height:30px;"><%#Eval("StoreName") %></label></div>                         
                <asp:Repeater runat="server" ID="ProRPT" EnableViewState="false">
                <ItemTemplate>
                <div class="media">
                <div class="media-left"><a href="<%#GetShopUrl() %>"><img class="media-object" src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="this.src='/Images/nopic.gif';" alt="<%#Eval("ProName") %>" /></a></div>
                <div class="media-body media-middle">
                <h4 class="media-heading"><a href="<%#GetShopUrl() %>"><%#Eval("ProName") %></a></h4>
                <p class="grayremind" hidden><%#GetAddition() %></p>
                <span style="color:#999; margin-right:5px;">x <%#Eval("Pronum") %></span>
                <span style="color:#c00; font-size:1.4em;">
                <i id="payPriceId" class="fa fa-rmb"><%#Eval("AllMoney","{0:F2}") %></i>
                <%#GetAllMoney_Json() %>
                </span>
                <div class="r_red" hidden><%#GetDisCount()%></div>
                <div hidden><%#GetStockStatus() %></div>
                </div>
                </div>
                </ItemTemplate>
                </asp:Repeater>
                <div hidden>
                <span>配送方式:</span>
                <asp:Literal runat="server" ID="FareType_L" EnableViewState="false"></asp:Literal>                           
                </div>
                </ItemTemplate>
                </asp:Repeater>
                <div class="total_count_div" style="padding-left:10px; padding-right:10px;" hidden>
                    <div>
                    	<span><span runat="server" id="itemnum_span" class="r_red_x">1</span>件商品,总商品金额：</span><i class="fa fa-rmb" runat="server" id="totalmoney_span1">0.00</i>
                        <span>余额:<span id="totalPurse_sp"></span></span>
                        <span>银币:<span id="totalSicon_sp"></span></span>
                        <span>积分:<span id="totalPoint_sp"></span></span>
                    </div>
                    <div><span>优惠卷：</span><i class="fa fa-rmb" id="arrive_money_sp">0.00</i></div>
                    <div><span>积分折扣：</span><i class="fa fa-rmb" id="point_money_sp">0.00</i></div>
                    <div><span>运费：</span><i class="fa fa-rmb" id="fare_span">0.00</i></div>
                    <div class="pay_moneyAll"><span>应付总额：</span><i class="fa fa-rmb" runat="server" id="totalmoney_span2">0.00</i></div>
                </div>
                <ul class="extend_ul">
                    <li runat="server" visible="false" id="userli">
                         <p><a href="javascript:;" onclick="$('#userlist_div').toggle();" title="显示顾客详情"><i class="fa fa-users"> 顾客与联系人列表</i></a></p>
                        <div id="userlist_div" class="extenddiv" style="display:block;">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="td_m">姓名</td><td>证件号</td><td>手机</td>
                                </tr>
                                <asp:Repeater runat="server" ID="UserRPT" EnableViewState="false">
                                    <ItemTemplate><tr><td><%#Eval("Name") %></td><td><%#Eval("CertCode") %></td><td><%#Eval("Mobile") %></td></tr></ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </li>
                    <li hidden>
                        <div><a href="javascript:;" onclick="$('#arrive_div').toggle();"><i class="fa fa-plus-circle"> 使用优惠券抵消部分总额</i></a></div>
                        <div id="arrive_div" class="extenddiv">
                            <asp:TextBox runat="server" ID="Arrive_T" class="form-control control-md" placeholder="优惠券号"/>
                            <asp:TextBox runat="server" ID="Arrive_Pwd" class="form-control control-md" placeholder="密码"/>
                            <input type="button" value="使用" class="btn btn-primary" onclick="ArriveCheck();" />
                            <span class="r_red_x" id="arrive_sp"></span>
                        </div>
                    </li>
                    <li id="point_li" hidden>
                        <div><a href="javascript:;" onclick="$('.point_div').toggle();"><i class="fa fa-plus-circle"> 使用积分抵扣</i></a></div>
                        <div id="point_body" runat="server" visible="false" class="extenddiv point_div">
                            共<asp:Label ID="Point_L" runat="server"></asp:Label>个积分,本次可用<span id="usepoint_span" class="r_red"></span>个积分,<asp:TextBox runat="server" ID="Point_T" Text="0" onkeyup="checkMyPoint(this);" CssClass="form-control text_150 num"/>
                        </div>
                        <div id="point_tips" runat="server" visible="false" class="alert alert-warning point_div extenddiv" role="alert">
                            <i class="glyphicon glyphicon-exclamation-sign"></i> 积分抵扣已关闭!
                        </div>
                    </li>
                    <li hidden>
                       <div><a href="javascript:;" onclick="$('#oremind_div').toggle();"><i class="fa fa-plus-circle"> 添加订单备注</i></a></div>
                        <div id="oremind_div" class="extenddiv">
                            <p>提示：请勿填写有关支付、收货、发票方面的信息</p>
                            <asp:TextBox runat="server" ID="ORemind_T" CssClass="form-control max" MaxLength="100" placeholder="限100个字" />
                        </div>
                   </li>
                </ul>
            </div>
        </div>
        <div class="total_div">
            <span class="total">应付总额：<i runat="server" id="totalmoney_i" class="fa fa-rmb">0.00</i></span><asp:Button runat="server" CssClass="btn btn-danger" ID="AddOrder_Btn" Text="提交订单" OnClientClick="disBtn(this,5000);" OnClick="AddOrder_Btn_Click" />
        </div>
    </div>
    <asp:HiddenField ID="PointRate_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.extend_ul li{margin-bottom:5px;}
.total_count_div .fa-rmb {min-width:70px;}
</style>
<script type="text/javascript">
    $(function () {
        //地址
        if ($(".addresssul li").length > 0) {
            $(".addresssul li").click(function () {
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
            });
            $(".addresssul li:first").click(); $(":radio[name=address_rad]")[0].checked = true;
        }
        //付款方式
        $(".methodul li").click(function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            $(this).find(":radio")[0].checked = true;
        })
        $(".methodul li:first").click();
        //发票
        $(".invoice_item_rad").click(function () {
            $("#InvoTitle_T").val($(this).data("head"));
            $("#Invoice_T").val($(this).val());
        });
        $(".invoice_item_rad:first").click();
        //运费
        $(".fare_select").change(function () {
            UpdateTotalPrice();
        });
        UpdateTotalPrice();
        IsDisBtn();
        ZL_Regex.B_Num(".num")
    })
    var diag = new ZL_Dialog();
    diag.width = "minwidth";
    diag.maxbtn = false;
    function AddAddress() {
        diag.title = "添加新地址";
        diag.url = "address.aspx";
        diag.ShowModal();
    }
    function EditAddress(id) {
        diag.title = "修改地址";
        diag.url = "address.aspx?id=" + id;
        diag.ShowModal();
    }
    function DelAddress(myid) {
        if (confirm("确定要删除吗")) {
            $("#addli_" + myid).remove();
            $.post("ordercom.ashx", { action: "deladdress", id: myid }, function () {
            });
        }
    }
    function SelInvo(dp) {
        if ($(dp).val() != "") {
            $("#InvoTitle_T").val($(dp).find(":selected").text());
            $("#Invoice_T").val($(dp).val());
        }
    }
    function ArriveCheck() {
        var model = { action: "arrive", code: $("#Arrive_T").val(), pwd: $("#Arrive_Pwd").val(), money: $("#totalmoney_span1").text() };
        if (model.code == "" || model.pwd == "") {
            alert("优惠券号和密码不能为空"); return false;
        }
        $.post("ordercom.ashx", model, function (data) {
            var model = JSON.parse(data);
            if (model && model.amount > 0) {
                $("#arrive_sp").text(model.remind);
                $("#arrive_money_sp").text("-" + parseFloat(model.amount).toFixed(2));
            }
            else {
                if (model.remind)
                    $("#arrive_sp").text(model.remind);
                else $("#arrive_sp").text("优惠券无效");
                $("#arrive_money_sp").text("-0.00");
            }
            UpdateTotalPrice();
        });
    }
    //价格统计
    function UpdateTotalPrice() {
        var total = parseFloat($("#totalmoney_span1").text());
        var arrive = parseFloat($("#arrive_money_sp").text());
        var point = parseFloat($("#point_money_sp").text());
        var fare = 0;
        //根据所选,计算运费
        $(".fare_select").each(function () {
            fare += parseFloat($(this).find("option:selected").data("price"));
        });
        total = (total + arrive + fare - point);
        total = total > 0 ? total : 0;
        $("#fare_span").text(fare.toFixed(2));
        $("#totalmoney_span2").text(total.toFixed(2));
        $("#totalmoney_i").text(total.toFixed(2));
        $("#totalPurse_sp").text(GetSumByFilter(".purse_sp"));
        $("#totalSicon_sp").text(GetSumByFilter(".sicon_sp"));
        $("#totalPoint_sp").text(GetSumByFilter(".point_sp"));
    } 
    //计算可用积分抵扣
    function SumByPoint(usepoint) {
        var point = parseFloat($("#Point_L").text());
        if (usepoint > point) { usepoint = point; };
        $("#usepoint_span").text(usepoint);
        ZL_Regex.B_Value("#Point_T", {
            min: 0, max: usepoint, overmin: null, overmax:null
        });
    }
    function GetSumByFilter(filter)
    {
        var total = 0.00;
        $(filter).each(function () {
            var price = parseFloat($(this).text());
            if (price) total += price;
        });
        return total.toFixed(2);
    }
    //是否禁用按钮
    function IsDisBtn() {
        var flag = false;
        if ($("#Address_Div").length > 0 && $(".addresssul li").length < 1) { flag = true; }
        if ($(".stockout").length > 0) { flag = true; }
        if (flag)
        { disBtn(document.getElementById("AddOrder_Btn")); }
    }
    function Refresh() { diag.CloseModal(); location = location; }
    function checkMyPoint(obj) {
        if (isNaN(parseFloat($(obj).val()))) { $(obj).val("0"); }
        var val = parseFloat($(obj).val());
        var usepoint = parseFloat($("#usepoint_span").text());//可用积分
        if (usepoint <= val) { val = usepoint; $(obj).val(usepoint); };
        var pointrate = parseFloat($("#PointRate_Hid").val());
        $("#point_money_sp").text((val * pointrate).toFixed(2));
        UpdateTotalPrice();
    }
</script>
</asp:Content>