﻿<%@ page language="C#" autoeventwireup="true" inherits="Plat_Blog_MsgListBody, App_Web_yg2lcizk" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<start>
    <div id="msglist" class="msglist"> 
    <span class="alert alert-alert" id="Empty_Span" runat="server" visible="false">你当前不属于任何组,无法查看信息</span>
  <asp:Repeater runat="server" ID="MsgRepeater" OnItemDataBound="MsgRepeater_ItemDataBound" EnableViewState="false">
	<ItemTemplate>
	  <div class="msgitem" id="msgitem-<%#Eval("ID") %>">
		<div class="plat_left_div" style="position:absolute;">
            <div class="pull-left"><img class="imgface_mid uinfo" src="<%#Eval("UserFace") %>" onerror="this.src='/Images/userface/noface.gif';" data-uid="<%#Eval("CUser") %>" /></div>
		</div>
		<div class="msg_content_div plat_content_div">
		    <div class="content_head"><a href="/Plat/Blog/?uids=<%#Eval("CUser") %>" title="<%#GetUName() %>的工作流"><%#GetUName() %></a> <%#GetColled() %></div>
		    <div id="normal" runat="server" visible="false">
			    <div class="msg_content_article_div"><%#GetContent()%></div>
			    <%#GetAttach() %> <%#GetForward() %> </div>
		    <div id="vote" runat="server" visible="false">
			    <div class="paddbottom5"><strong><%#Eval("Title") %></strong></div>
			    <div class="vote_user_div" id="vote_user_div" runat="server">
			      <ul class="vote_list_ul">
				    <%#GetVoteLI() %>
			      </ul>
			      <div>
				    <input type="button" value="投票" onclick="PostUserVote(<%#Eval("ID") %>);" class="btn btn-primary btn-sm"/>
				    <input type="button" value="查看结果" onclick="ShowMsgDiv('<%#Eval("ID") %>','.vote_user_div','.vote_result_div');" class="btn btn-primary btn-sm"/>
			      </div>
			    </div>
			    <div class="vote_result_div" id="vote_result_div" runat="server"><!--结果页-->
			      <asp:Repeater runat="server" EnableViewState="false" ID="VoteResultRep">
				    <ItemTemplate>
				      <div><%#Eval("opName") %></div>
				      <div class="progress vote_progress">
					    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuemin="0" aria-valuemax="100" <%#"style='width:"+Eval("Percent")+"%;'" %>></div>
				      </div>
				      <label class="vote_person_num"><%#Eval("count")+"人" %></label>
				    </ItemTemplate>
			      </asp:Repeater>
			      <div class="clearfix"></div>
			      <div id="msg_op_btn_div" runat="server">
				    <input value="返回投票" class="btn btn-primary btn-sm" onclick="ShowMsgDiv(<%#Eval("ID")%>,'.vote_result_div','.vote_user_div');" />
			      </div>
			    </div>
			    <div class="paddin5"><strong><%#GetVoteBottom() %></strong></div>
			    <div class="paddbottom5"><%#Eval("MsgContent") %></div>
		      </div>
            <div id="longarticle" runat="server" visible="false">
                  <div class="subtitle grayremind"><%#Eval("Title") %><div class="clearfix"></div><input type="button" value="浏览全文" class="btn btn-xs btn-primary" onclick="ShowLong(<%#Eval("ID")%>);" /></div>
              </div>
		  <a href="Item.aspx?id=<%#Eval("ID") %>" class="grayremind" title="浏览信息详情"><%#Convert.ToDateTime(Eval("CDate","{0:yyy年MM月dd日 HH:mm}")) %></a>
          <span class="grayremind" title="哪些人可见"><%#GetWhoCanSee()%></span>
		  <div class="reply_op_div"> <%#GetReplyOP() %> <span class="glyphicon glyphicon-comment" title="回复" onclick="DisReplyOP(<%#Eval("ID") %>,0,'<%#GetUName() %>');"></span> </div>
		  <div class="likeids_div" >
			<ul class="likeids_div_ul" style='<%#IsShowLike()%>'>
			  <li style="width:auto;"> <a href="javascript:;" onclick="PostLike(<%#Eval("ID") %>)" class="likeids_div_a"><span class="glyphicon glyphicon-thumbs-up"></span><span class='likenum_span'>(<%#GetLikeNum() %>)</span></a> </li>
			      <%#ShowLikeUser() %>
			</ul>
		  </div>
		  <div id='reply_<%#Eval("ID") %>'>
			<asp:Literal runat="server" ID="ReplyList_L" EnableViewState="false"></asp:Literal>
		  </div>
		  <div id="reply_div_<%#Eval("ID") %>" class="reply_item">
			<input type="hidden" id="Reply_Rid_Hid_<%#Eval("ID") %>" value="0" />
			<textarea id="MsgContent_<%#Eval("ID") %>" class="form-control atwho reply_text" style="height:40px;" placeholder="说一句吧..."></textarea>
			<input type="button" value="回复" onclick="AddReply(<%#Eval("ID") %>);" class="btn btn-primary btn-sm replybtn" />
			<div class="clearfix"></div>
		  </div>
		</div>
		<div class="clearfix"></div>
	  </div>
	</ItemTemplate>
  </asp:Repeater>
  <asp:Literal runat="server" ID="MsgPage" EnableViewState="false"></asp:Literal>
</div>
</start>