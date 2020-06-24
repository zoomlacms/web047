<%@ page language="C#" autoeventwireup="true" inherits="Manage_Copyright_Authorized, App_Web_kf50gi52" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>我的授权</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="background: #ddd; padding: 4px; margin-bottom: 2px; border-radius: 4px; line-height: 35px; padding-left: 15px;">
        <div style="display: inline-block;">
            <asp:DropDownList ID="souchtable" CssClass="form-control" Width="120" runat="server">
                <asp:ListItem Value="6" Text="全部授权"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="display: inline-block; width: 230px;">
            <div class="input-group" style="position: relative; margin-bottom: -12px;">
                <asp:TextBox ID="souchkey" placeholder="请输入作品名称" runat="server" CssClass="form-control text_md" />
                <span class="input-group-btn">
                    <asp:Button ID="souchok" runat="server" Text="搜索" class="btn btn-primary" />
                </span>
            </div>
        </div>
    </div>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="<%$Resources:L,当前没有信息 %>"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="作品名称" DataField="WorksName" />
            <asp:BoundField HeaderText="使用人" DataField="UserName" />
            <asp:BoundField HeaderText="授权方式" DataField="AuthMode" />
            <asp:BoundField HeaderText="授权价格" DataField="AuthPrice" />
            <asp:BoundField HeaderText="授权详情" DataField="AuthInfo" />
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>
        #souchkey {
            border-radius: 0;
            border-color: #ccc;
        }

        #souchok {
            border-color: #999;
            border-radius: 0;
            background: #999;
            color: #fff;
        }
    </style>
</asp:Content>
