<%@ page language="C#" title="发送信息" autoeventwireup="true" inherits="User.MessageSend, App_Web_pm0re3oi" enableviewstatemac="false" masterpagefile="~/Manage/I/Default.master" validaterequest="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>发送信息</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
   
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="tdleft td_l" style="height: 28px; "><strong>收件人：</strong></td>
            <td>
                <table id="TblAddMessage" width="100%" visible="true" runat="server">
                    <tr>
                        <td style="height: 22px;width:90px">
                            <asp:RadioButton ID="RadIncept1" runat="server" GroupName="InceptGroup"  Checked="true" Text="所有会员" /></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButton ID="RadIncept3" runat="server" Text="指定用户名" GroupName="InceptGroup" />
                        </td>
                        <td>
                            <div class="input-group" style="width: 290px;">
                                <asp:TextBox CssClass="form-control text_290" ID="TxtInceptUser" runat="server" />
                                <span class="input-group-btn">
                                    <button type="button" onclick="ShowSelUser(1)" class="btn btn-primary">选择用户</button>
                                </span>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="tdleft td_l" style="height: 28px; "><strong>抄送人：</strong></td>
            <td>
                <div class="input-group" style="width: 380px;">
                    <asp:TextBox CssClass="form-control text_300" ID="ccUserT" runat="server" />
                    <span class="input-group-btn">
                        <button type="button" onclick="ShowSelUser(2)" class="btn btn-primary">选择用户</button>
                    </span>
                </div>                
            </td>            
        </tr>
        <tr>
            <td class="tdleft" style="height: 28px; "><strong>短消息主题：</strong></td>
            <td>
                <asp:TextBox class="form-control" Style="width:380px" ID="TxtTitle" runat="server" > </asp:TextBox>
                <span style="color:red;">*</span>
                <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="短消息主题不能为空" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdleft" style="height: 23px; "><strong>短消息内容：</strong></td>
            <td>
                <asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" Width="700px"  Height="300px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdleft" style="height: 23px; "><strong>已上传文件：</strong><asp:HiddenField runat="server" ID="hasFileData" />
            </td>
            <td id="hasFileTD" runat="server"></td>
        </tr>
        <tr>
            <td class="tdleft" style="height: 23px; "><strong>附件：</strong></td>
            <td>
                <input type="button" id="upfile_btn" class="btn btn-primary" value="选择文件" />
                <div style="margin-top: 10px;" id="uploader" class="uploader">
                    <ul class="filelist"></ul>
                </div>
                <asp:HiddenField runat="server" ID="Attach_Hid" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 50px;" align="center">
                <asp:HiddenField ID="HdnMessageID" runat="server" />
                <asp:Button ID="Button1" runat="server" Text="发送" OnClick="BtnSend_Click" OnClientClick="return SendConfirm();" class="btn btn-primary" />
                <asp:Button ID="Button2" runat="server" Text="存草稿" OnClick="Button2_Click" class="btn btn-primary" />
                <!--<asp:Button ID="Button3" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-primary" />-->
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/Plugins/Ueditor/ueditor.config.js"  charset="utf-8"></script>
<script src="/Plugins/Ueditor/ueditor.all.js" charset="utf-8"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<%=Call.GetUEditor("EditorContent",2) %>
<script>
    $(function () {
        $("#upfile_btn").click(ZL_Webup.ShowFileUP);
    })
    function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
    function ShowSelUser(n) {
        var url = "";
        if (n == 1)
            url = "/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo#ReferUser";
        else
            url = "/Mis/OA/Mail/SelGroup.aspx?Type=AllInfo#CCUser";
        comdiag.maxbtn = false;
        ShowComDiag(url, "选择用户");
    }
    function UserFunc(json, select) {
        var uname = "";
        var uid = "";
        for (var i = 0; i < json.length; i++) {
            uname += json[i].UserName + ",";
            uid += json[i].UserID + ",";
        }
        if (uid) uid = uid.substring(0, uid.length - 1);
        if (select == "ReferUser") {
            $("#TxtInceptUser").val(uname);
        }
        if (select == "CCUser") {
            $("#ccUserT").val(uname);
        }
        CloseComDiag();
    }
    function SendConfirm() {
        rece = $("#TxtInceptUser").val().trim();
        if (rece == "") { alert('未选定收件人!'); return false; }
        title = $("#TxtTitle").val().trim();
        if (title == "") { alert('邮件标题不能为空!'); return false; }
        if (confirm('确定要发送该邮件吗')) {
            disBtn(this, 3000); return true;
        } else {
            return false;
        }
    }
    </script>
</asp:Content>
