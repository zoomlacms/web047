<%@ page language="C#" autoeventwireup="true" inherits="Manage_Copyright_Royalty, App_Web_kf50gi52" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>版权收益</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group text-right">
                    <label>可提取<span><b>0.00 </b>元</span></label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group text-left">  
                    <button type="button" class="btn btn-red" id="withdrawCashBtn">提现</button>
                </div>
            </div>
        </div>
        <ul class="text-center">
            <li class="col-md-4"><span>总收入(元)<b>0 </b></span></li>
            <li class="col-md-4"><span>实际收入(元)<b>0.00 </b></span></li>
            <li class="col-md-4"><span>待结算(元)<b>0 </b></span></li>
        </ul>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
