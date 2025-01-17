﻿<%@ page language="C#" autoeventwireup="true" inherits="manage_Shop_AddbindPro, App_Web_bo03w4hz" enableviewstatemac="false" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>捆绑商品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table id="EGV" class="table table-striped table-bordered table-hover">
        <tr>
            <td align="left">
                <b>产品列表：</b></td>
            <td align="right">
                <asp:TextBox ID="TxtKeyWord" class="form-control text_md" runat="server"></asp:TextBox>
                <asp:Button ID="BtnSearch" runat="server" class="btn btn-primary" Text="查找" OnClick="BtnSearch_Click" />
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                
            </td>
        </tr>
        
    </table>
    <div>
        <b>产品列表：</b>
    </div>
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbgleft">
            <td><strong>ID</strong></td>
            <td></td>
            <td width="10%"><strong>商品图片</strong></td>
            <td><strong>商品名称</strong></td>
            <td><strong>商品数量</strong></td>
            <td><strong>商品零售价</strong> </td>
        </tr>
        <ZL:ExRepeater ID="RPT" runat="server" PageSize="20" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='6'><div class='text-center'>" PageEnd="</div></td></tr>">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("ID") %></td>
                    <td>
                        <input name="idchk" type="checkbox" value="<%#Eval("ID") %>"></td>
                    <td class="td_thumbnails" data-thumbnails="<%#Eval("Thumbnails") %>"><%#getproimg(DataBinder.Eval(Container,"DataItem.Thumbnails","{0}"))%></td>
                    <td class="td_proname" data-proname="<%#Eval("Proname") %>"><%#Eval("Proname") %></td>
                    <td>
                        <input name="pronum<%#Eval("ID") %>" type="text" class="form-control procount" value="1" id="pronum<%#Eval("ID") %>" style="width: 54px;" /></td>
                    <td class="td_linprice" data-linprice="<%#Eval("LinPrice")%>"><%#Eval("LinPrice","{0:c}")%></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>

    <div class="Conent_fix">
        <button type="button" onclick="GetCheckvalue();" class="btn btn-primary">添加捆绑</button>
                <button type="button" onclick="parent.CloseDiag();" class="btn btn-primary">取消添加</button>
    </div>
    <script type="text/javascript">
        //将选中的值生成为Json
        function GetCheckvalue() {
            var chkArr = $("input[name=idchk]:checked");
            var valueAttr = [];
            for (var i = 0; i < chkArr.length; i++) {
                var $trobj = $(chkArr[i]).closest('tr');
                valueAttr.push({ id: $(chkArr[i]).val(), Thumbnails: $trobj.find(".td_thumbnails").attr("data-Thumbnails"), Proname: $trobj.find(".td_proname").attr("data-Proname"), LinPrice: $trobj.find(".td_linprice").attr("data-LinPrice") });
            }
            parent.BindPro(JSON.stringify(valueAttr));
            parent.CloseDiag();
        }
        //    for (i = 0; i < elm.length; i++) {
        //        if (elm[i].type == "checkbox" && elm[i].id != spanChk.id) {
        //            boxlist = boxlist + 1;
        //            if (elm[i].checked == true) {
        //                var tempvalue = "," + elm[i].value + ",";//初始ID
        //                if (hiddenidvalue.indexOf(tempvalue) == -1) {
        //                    listheight = listheight + 1;
        //                    innterhtml = innterhtml + "<TR>" + form1.getElementsByTagName("tr").item(boxlist + 2, 0).innerHTML + "<td align=center onclick=deleteRow('txtTables',this.parentElement.rowIndex,'" + elm[i].value + "')><u style=cursor:pointer>删除</u></td></TR>";
        //                }
        //                else//修改父页中绑定的商品数量
        //                {
        //                    var topinputvalue = document.getElementById("pronum" + elm[i].value).value;
        //                    opener.document.getElementById("pronum" + elm[i].value).value = parseInt(opener.document.getElementById("pronum" + elm[i].value).value) + parseInt(topinputvalue);
        //                }
        //            }
        //        }
        //    }

        //    for (i = 0; i < elm.length; i++) {
        //        if (elm[i].type == "checkbox" && elm[i].id != spanChk.id) {
        //            if (elm[i].checked == true) {
        //                var tempvalue = "," + elm[i].value + ",";//初始ID
        //                //判断是否存在此ID
        //                if (hiddenidvalue.indexOf(tempvalue) == -1) {
        //                    //添加ID到隐藏控件
        //                    listnum++;
        //                    if (listnum == listheight) {
        //                        listbox = listbox + elm[i].value;
        //                    } else {
        //                        listbox = listbox + elm[i].value + ',';
        //                    }
        //                }
        //            }
        //        }
        //    }

        //    if (listbox != "") {
        //        var bindstr = opener.document.getElementById("Hiddenbind").value;
        //        if (bindstr != "") { bindstr = bindstr + ","; }
        //        var tempboxstrs = bindstr + listbox;
        //        var reg = new RegExp(",,", "g")
        //        tempboxstrs = tempboxstrs.replace(reg, ",");
        //        opener.document.getElementById("Hiddenbind").value = tempboxstrs;
        //    }

        //    var topstr = "<table width=100% border=0 cellspacing=1 cellpadding=1 id=txtTables> <tr class=tdbgleft> <td width=5% height=24 align=center><strong>ID</strong></td> <td width=5% height=24 align=center> <span name=CheckBox1><input id=CheckAllCheckBox1 type=checkbox name=CheckAllCheckBox1 onclick=CheckAll(this); /></span></td> <td width=10% height=24 align=center><strong>商品图片</strong></td><td width=35% height=24 align=center><strong>商品名称</strong></td><td width=15% height=24 align=center><strong>商品数量</strong></td><td width=20% height=24 align=center><strong>商品零售价</strong></td><td width=15% height=24 align=center><strong>操作</strong></td></tr>";
        //    if (innterhtml != "") {
        //        if (opener.document.getElementById("Span1").innerHTML == "") {
        //            opener.document.getElementById("Span1").innerHTML = topstr + innterhtml;
        //            opener.document.getElementById("Span1").innerHTML = opener.document.getElementById("Span1").innerHTML + "</TABLE>";
        //        }
        //        else {
        //            var tempstr = opener.document.getElementById("Span1").innerHTML;
        //            var reg = new RegExp("</TBODY>", "g")
        //            tempstr = tempstr.replace(reg, "");
        //            reg = new RegExp("</TABLE>", "g")
        //            tempstr = tempstr.replace(reg, "");
        //            tempstr = tempstr + innterhtml;
        //            opener.document.getElementById("Span1").innerHTML = tempstr + "</TBODY></table>";

        //        }
        //    }
        //    window.close();
        //}
    </script>
</asp:Content>
    
