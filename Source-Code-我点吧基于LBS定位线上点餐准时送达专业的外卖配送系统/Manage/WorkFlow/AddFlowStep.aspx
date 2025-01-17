﻿<%@ page language="C#" autoeventwireup="true" inherits="Manage_WorkFlow_AddFlowStep, App_Web_4d0aylo2" masterpagefile="~/Manage/I/Default.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>流程设计</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Addstep" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td style="width: 200px;">序号:</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="stepCodeT" Enabled="false" Width="40" Style="text-align: center;" /></td>
            </tr>
            <tr>
                <td>步骤名称:</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" Width="300" ID="stepNameT" />
                    <span style="color: #f00;">*</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="名称不能为空" ControlToValidate="stepNameT" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>步骤简述：</td>
                <td>
                    <asp:TextBox runat="server" ID="remindT" CssClass="form-control text_300"/>
                </td>
            </tr>
            <tr>
                <td>主办人:</td>
                <td>
                    <div style="margin-bottom: 10px;">
                       <%-- <span class="pull-left text-right" style="width: 100px;">部门：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="referGroup_T" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button1" value="选择" class="btn btn-primary"  onclick="SelStruct('referGroup');" />
                            </span>
                        </div>--%>
                        <asp:HiddenField runat="server" ID="referGroup_Hid" />
                    </div>
                    <div class="clearfix"></div>
                        <div id="referuser_list" ></div>
                        <div class="margin_t5"><input type="button" id="refSelBtn" value="选择" class="btn btn-primary" /></div>
                        <asp:HiddenField runat="server" ID="referUser_Hid" />
                </td>
            </tr>
            <tr>
                <td>协办人：<br /><span class="rd_green">(只有查看,无审批权限)</span></td>
                <td>
                    <div style="margin-bottom: 10px;">
                       <%--<span class="pull-left text-right" style="width: 100px;">部门：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="ccGroup_T" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button2" value="选择" class="btn btn-primary" onclick="SelStruct('ccGroup');" />
                            </span>
                        </div>--%>
                        <asp:HiddenField runat="server" ID="ccGroup_Hid" />
                    </div>
                    <div>
                        <div id="ccuser_list"></div>
                        <div class="margin_t5"><input type="button" id="ccSelBtn" value="选择" class="btn btn-primary" /></div>
                        <asp:HiddenField runat="server" ID="ccUser_Hid" />
                    </div>         
                </td>
            </tr>
            <tr>
                <td>会签选项:</td>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control text_md" ID="hqOptionDP">
                        <asp:ListItem Value="0">任意一人即可</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">必须全部审核</asp:ListItem>
                    </asp:DropDownList>
                    <span>提示:选择必须全部审核,则需要所有经办人审核并同意,才能进入下一步骤<font color="red">(会签不支持会员组)</font></span>
                </td>
            </tr>
            <tr>
                <td>转交:</td>
                <td>
                <asp:DropDownList runat="server" CssClass="form-control text_md" ID="qzzjDP">
                    <asp:ListItem Value="1">允许</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                </asp:DropDownList><span>经办人未办理完毕时是否允发起人强制转交</span></td>
            </tr>
            <tr>
                <td>是否允许回退：</td>
                <td>
                <asp:DropDownList runat="server" CssClass="form-control text_md" ID="htDP">
                    <asp:ListItem Value="0">不允许</asp:ListItem>
                    <asp:ListItem Value="1">允许回退上一步骤</asp:ListItem>
                    <asp:ListItem Value="2">允许回退之前步骤</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr runat="server" visible="false">
                <td>转交时,邮件自动通知以下人员：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="emailSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'emailAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button3" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'emailGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailGroupD" />
                    </div>
                </td>
            </tr>
            <tr  runat="server" visible="false">
                <td>转交时,短信通知以下人员：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="smsSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'smsAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button4" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'smsGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsGroupD" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>步骤完成后,选择下一步权限：</td>
                <td>
                    <label><input type="radio" name="next_rad" value="refer" checked="checked" />主办人</label>
                    <label><input type="radio" name="next_rad" value="sender" />发起人</label>
                    <label><input type="radio" name="next_rad" value="all" />主办人和发起人</label>
                </td>
            </tr>
            <%--            <tr>
                <td>公共附件选项：</td>
                <td>
                    <asp:DropDownList runat="server" ID="PublicAttachOptionDP" CssClass="form-control text_md">
                        <asp:ListItem Value="0">不允许附件</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">允许附件</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>--%>
            <%-- <tr>
                <td>字段操作权限：</td>
                <td>
                    <asp:TextBox runat="server" TextMode="MultiLine" ID="CanEditField_T" CssClass="form-control text_300"></asp:TextBox>
                    <span>主办人可修改模型表单字段的值,用,号分隔</span>
                </td>
            </tr>--%>
            <%--            <tr>
                            <td>公文操作权限：</td>
                            <td>
                                <label><input type="checkbox" name="docauth_chk" value="head" />套红</label>
                                <label><input type="checkbox" name="docauth_chk" value="sign" />签章</label>
                                <label><input type="checkbox" name="docauth_chk" value="edit" />允许修改</label>
                                <label><input type="checkbox" name="docauth_chk" value="traceless" />无痕修订</label>
                                <label><input type="checkbox" name="docauth_chk" value="hastrace" />有痕修订</label>
                            </td>
                        </tr>--%>
            <tr>
                <td>操作：</td>
                <td>
                    <asp:Button runat="server" ID="saveBtn" Text="添加" OnClick="saveBtn_Click" CssClass="btn btn-primary" />
                    <input type="button" value="返回" onclick="window.location='<%="AddFlow.aspx?proID="+proID %>    ';" class="btn btn-primary" />
                </td>
            </tr>
        </table>
    </div>
    <div id="div_share" class="panel panel-primary" style="display: none; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span class="close" onclick="hidediv()" title="关闭"></span>
            <h3 class="panel-title">选择会员</h3>
        </div>
        <div class="panel-body">
            <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;" name="main_right" src="/Mis/OA/Mail/SelUser.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <div id="div_group" class="panel panel-primary" style="display: none; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span class="close" onclick="hidediv1()" title="关闭"></span>
            <h3 class="panel-title">选择会员组</h3>
        </div>
        <div class="panel-body">
            <iframe id="Iframe1" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;" name="main_right" src="/Mis/OA/Mail/SelGroup.aspx" frameborder="0"></iframe>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="dataField" />
    <asp:HiddenField runat="server" ID="referUserDatas_Hid" />
    <asp:HiddenField runat="server" ID="ccUserDatas_Hid" />

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script src="/JS/Plugs/PageHelper.js"></script>
    <script src="/JS/Plugs/Angular/ZL_UserList.js"></script>
    <script>
        $(function(){
            var refdatas=$("#referUserDatas_Hid").val()?JSON.parse($("#referUserDatas_Hid").val()):[];
            ZL_UserList.GetSelector('refSelBtn',{//主办人选择用户
                container:'referuser_list',
                data:refdatas,
                onselected:function(userlist){
                    $("#referUser_Hid").val(userlist.GetIDS('UserID'));
                }
            });
            var ccdatas=$("#ccUserDatas_Hid").val()?JSON.parse($("#ccUserDatas_Hid").val()):[];
            ZL_UserList.GetSelector('ccSelBtn',{//协办人选择用户
                container:"ccuser_list",
                data:ccdatas,
                onselected:function(userlist){
                    $("#ccUser_Hid").val(userlist.GetIDS('UserID'));
                }
            });
            ZL_UserList.InitAngular();
        });
        //---------------------------------------------
        function showdiv(div_id, f) {
            var url="/Common/Dialog/SelStructure.aspx?type=AllInfo#"+f;
            comdiag.maxbtn=false;
            ShowComDiag(url,"选择会员");
        }
        function UserFunc(json, select) {
            console.log(select);
            var uname = "", uid = "";
            for (var i = 0; i < json.length; i++) {
                uname += json[i].UserName + ",";
                uid += json[i].UserID + ",";
            }
            if (uid) uid = uid.substring(0, uid.length - 1);
            $("#" + select + "_T").val(uname);
            $("#" + select + "_Hid").val(uid);
            CloseComDiag();
        }
        //组名外加[],用户名则不加，用,隔开
        function seluser(groupJson, userJson) {
            var names = "";
            var ids = "";
            for (var i = 0; i < userJson.length; i++) {
                names += userJson[i].Uname + ",";
                ids += userJson[i].Uid + ",";
            }
            var flag = $("#dataField").val();
            $("#" + flag + "_T").val(names);
            $("#" + flag + "_Hid").val(ids);
            hidediv();
        }
        function SelStruct(id)
        {
            comdiag.maxbtn=false;
            ShowComDiag("/Common/Dialog/SelStruct.aspx?cname="+id,"选择部门");
        }
        function DealResult(list,action,cname)
        {
            var names="";//以[]隔开
            var nids="";
            //为其赋值,其cname只是基本ID前缀,后加_T或_Hid
            for (var i = 0; i < list.length; i++) {
                names +="["+ list[i].nodename + "],";
                nids+=list[i].nodeid+",";
            }
            $("#"+cname+"_T").val(names);
            $("#"+cname+"_Hid").val(nids);
            CloseComDiag();
        }
    </script>
</asp:Content>
