<%@ page language="C#" autoeventwireup="true" inherits="Common_Dialog_UserBody, App_Web_cmtouysg" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Repeater ID="User_RPT" runat="server">
    <ItemTemplate>
        <div class="userlist_item" data-uid="<%#Eval("UserID") %>">
            <div class="item_face pull-left"><img src="<%#GetHeadIcon() %>" onerror="this.src='/images/userface/noface.gif'"/></div>
            <div class="pull-left item_name"><%#Eval("HoneyName") %></div>
            <div class="pull-right item_add">添加</div>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="UserPlat_RPT" runat="server">
    <ItemTemplate>
        <div class="userlist_item" data-uid="<%#Eval("UserID") %>">
            <div class="item_face pull-left"><img src="<%#Eval("UserFace") %>" onerror="this.src='/images/userface/noface.gif'"/></div>
            <div class="pull-left item_name"><%#Eval("TrueName") %></div>
            <div class="pull-right item_add">添加</div>
        </div>
    </ItemTemplate>
</asp:Repeater>
