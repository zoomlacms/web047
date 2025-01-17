﻿<%@ page language="C#" autoeventwireup="true" masterpagefile="~/Manage/I/Default.master" inherits="Manage_Content_SetSpecOrder, App_Web_0zdn4u33" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>专题排序</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered table-hover">
    <tr>
        <td class="td_s"><strong>ID</strong></td>
        <td><strong>专题名</strong></td>
        <td><strong>专题标识</strong></td>
        <td><strong>专题描述</strong></td>
        <td class="td_m"><strong>手动排序</strong></td>
        <td><strong>排序</strong></td>
    </tr>
    <asp:Repeater ID="RPT" runat="server" OnItemCommand="RPT_ItemCommand">
        <ItemTemplate>
            <tr>
                <td><%#Eval("SpecID") %></td>
                <td><%#Eval("SpecName") %></td>
                <td><%#Eval("SpecDir") %></td>
                <td><%#Eval("SpecDesc") %></td>
                <td>
                    <input type="text" class="l_input" style="width:40px; text-align:center" name="OrderField<%#Eval("SpecID")%>" id="OrderField<%#Eval("SpecID")%>" value="<%#Eval("OrderID") %>" />
                    <input type="hidden" name="SpecIDValue" id="SpecIDValue" value="<%#Eval("SpecID")%>" />
                </td>
                <td>
                    <asp:LinkButton runat="server" CommandName="UpMove" CommandArgument='<%# Eval("SpecID") %>'>上移</asp:LinkButton>
                    |
					<asp:LinkButton runat="server" CommandName="DownMove" CommandArgument='<%# Eval("SpecID") %>'>下移</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
<asp:Button ID="Save_Btn" runat="server" Text="批量更新排序" CssClass="btn btn-primary" OnClick="Save_Btn_Click" />
</asp:Content>

