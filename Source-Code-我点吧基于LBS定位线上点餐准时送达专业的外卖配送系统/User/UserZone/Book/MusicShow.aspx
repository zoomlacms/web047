﻿<%@ page language="C#" autoeventwireup="true" inherits="MusicShow, App_Web_2jppfslv" title="音乐" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="WebUserControlCollect.ascx" TagName="WebUserControlCollect" TagPrefix="uc2" %>
<%@ Register Src="WebUserControlComment.ascx" TagName="WebUserControlComment" TagPrefix="uc1" %>
<%@ Register Src="../WebUserControlTop.ascx" TagName="WebUserControlTop" TagPrefix="uc3" %>
<!DOCTYPE HTML>
<html>
<head>
<title>会员中心 >> 浏览音乐</title>
<link href="../../../App_Themes/UserThem/user_user.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
<div class="us_topinfo">
<a title="会员中心" href='<%=ResolveUrl("~/User/Default.aspx") %>' target="_parent"> 会员中心</a>音乐
</div>
  <uc3:WebUserControlTop ID="WebUserControlTop1" runat="server"></uc3:WebUserControlTop>
  <table width="100%">
    <tr>
      <td align="center"><div class="catebar"> 音 乐</div>
        <div class="contant1">
          <div class="GoodsInfoWarp">
            <div class="info">
              <table width="100%" align="center">
                <tbody>
                  <tr>
                    <td width="327" align="middle" valign="top" style="padding-right: 70px"><table>
                        <tbody>
                          <tr>
                            <td class="ph" valign="top" align="middle"><asp:Image ID="Image1" runat="server" Height="188px" Width="250px" /></td>
                          </tr>
                          <tr>
                            <td height="20" align="center" valign="middle" class="paybutton"> 加入我的收藏</td>
                          </tr>
                        </tbody>
                      </table></td>
                    <td width="300" valign="top"><h5>
                        <asp:Label ID="Label1" runat="server" Text="Label" Width="272px"></asp:Label>
                      </h5>
                      <table class="subinfo" border="0" cellspacing="0" cellpadding="0" >
                        <tbody>
                          <tr>
                            <th width="139" align="right"> 演唱者：</th>
                            <td width="361" colspan="3"><asp:Label ID="Label3" runat="server" Text="Label" Width="107px"></asp:Label></td>
                          </tr>
                          <tr>
                            <th align="right"> 词：</th>
                            <td class="memberprice" colspan="3"><asp:Label ID="Label4" runat="server" Text="Label" Width="107px"></asp:Label></td>
                          </tr>
                          <tr>
                            <th align="right"> 曲：</th>
                            <td colspan="3"><asp:Label ID="Label5" runat="server" Text="Label" Width="107px"></asp:Label></td>
                          </tr>
                          <tr>
                            <th align="right"> 出版者：</th>
                            <td colspan="3"><asp:Label ID="Label7" runat="server" Text="Label" Width="107px"></asp:Label></td>
                          </tr>
                          <tr>
                            <th align="right"> 发行时间：</th>
                            <td colspan="3"><asp:Label ID="Label8" runat="server" Text="Label" Width="107px"></asp:Label></td>
                          </tr>
                        </tbody>
                      </table>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="15%" height="30">&nbsp;</td>
                          <td width="85%"><uc2:WebUserControlCollect ID="WebUserControlCollect1" runat="server" /></td>
                        </tr>
                      </table></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="clear"> </div>
          <h4> 详细介绍：</h4>
          <div class="GoodsDetailsWarp">
            <p style="text-align: left; line-height: 15pt; margin: 0cm 0cm 0pt; background: white;  mso-pagination: widow-orphan" class="MsoNormal" align="left">
              <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
              <span class="MsoNormal" style="text-align: left; line-height: 15pt; margin: 0cm 0cm 0pt;
                                    background: white; mso-pagination: widow-orphan"></span> </p>
          </div>
          <h4> 在线评论：</h4>
          <div class="GoodsDetailsWarp">
            <p style="text-align: left; line-height: 15pt; margin: 0cm 0cm 0pt; background: white; mso-pagination: widow-orphan" class="MsoNormal" align="left">
              <uc1:WebUserControlComment ID="WebUserControlComment1" runat="server" />
              <span class="MsoNormal" style="text-align: left; line-height: 15pt; margin: 0cm 0cm 0pt;  background: white; mso-pagination: widow-orphan"></span> </p>
          </div>
        </div></td>
    </tr>
  </table>
</form>
</body>
</html>