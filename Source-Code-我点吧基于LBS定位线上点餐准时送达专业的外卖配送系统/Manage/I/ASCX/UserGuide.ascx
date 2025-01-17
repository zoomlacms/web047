﻿<%@ control language="C#" autoeventwireup="true" inherits="Manage_I_ASCX_UserGuide, App_Web_qenfswzg" %>
<div class="tvNavDiv">
<div class="m_left_ul left_ul_visible">  
<div class="menu_tit"><span class="fa fa-chevron-down"></span><%=Resources.L.会员管理%></div>
<div class="input-group">
<input type="text" ID="keyWord" class="form-control ascx_key" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"User/UserManage.aspx?keyWord=" %>',this);" placeholder="<%=Resources.L.请输入用户名%>" />
<span class="input-group-btn">
<button class="btn btn-default" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"User/UserManage.aspx?keyWord=" %>','keyWord');"><span class="glyphicon glyphicon-search"></span></button>
<asp:Button runat="server" ID="search_Btn" Style="display: none;"/>
</span>
</div> 
<ul class="m_left_ulin">
    <li><a onclick="ShowMain('','User/UserManage.aspx')"><%=Resources.L.会员管理%></a></li>
    <li><a onclick="ShowMain('','User/GroupManage.aspx')"><%=Resources.L.会员组别%></a></li>
    <li><a onclick="ShowMain('','User/Addon/RegularList.aspx')">充值赠送</a></li>
    <li><a onclick="ShowMain('','User/PointGroup.aspx')"><%=Resources.L.积分等级%></a></li>
    <li><a onclick="ShowMain('','User/CapitalLog.aspx')"><%=Resources.L.财务流水%></a></li>
    <li><a onclick="ShowMain('','User/SystemUserModel.aspx')"><%=Resources.L.注册字段%></a></li>
    <li><a onclick="ShowMain('','Polymeric/ClassManage.aspx')"><%=Resources.L.聚合分类%></a></li>
<%--    <li><a onclick="ShowMain('','Polymeric/ConfigSet.aspx')"><%=Resources.L.聚合配置%></a></li>--%>
    <li><a onclick="ShowMain('','User/UserDay.aspx')"><%=Resources.L.手机节日%></a></li>
    <li><a onclick="ShowMain('','User/UserDayManage.aspx')"><%=Resources.L.用户节日%></a></li>
    <li><a onclick="ShowMain('','Config/UserConfig.aspx')"><%=Resources.L.会员参数%></a></li>
    <li><a onclick="ShowMain('','APP/Suppliers.aspx')"><%=Resources.L.社会化登录%></a></li>
</ul> 
</div> 
</div>