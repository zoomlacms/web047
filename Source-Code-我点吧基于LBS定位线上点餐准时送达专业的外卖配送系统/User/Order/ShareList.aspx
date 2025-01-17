﻿<%@ page language="C#" autoeventwireup="true" inherits="User_Order_ShareList, App_Web_se0hkl3l" masterpagefile="~/Common/Common.master" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>评价列表</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
<div class="container-fluid margin_t10" style="margin-bottom:120px;">
	 <div id="nodata_div" class="alert alert-info" runat="server" visible="false">该商品暂无评论数据</div>
	 <div id="comments" runat="server">
		<div class="comments-header">
			<span class="sphead column1">评价心得</span>
			<span class="sphead column2">顾客满意度</span>
			<span class="sphead column3">购买信息</span>
			<span class="sphead column4">评论者</span>
		</div>
		<asp:Repeater runat="server" ID="RPT" EnableViewState="false" OnItemDataBound="MsgRepeater_ItemDataBound">
			<ItemTemplate>
				<div class="comments-item" data-id="<%#Eval("ID") %>">
					<table class="com-item-main clearfix">
						<tbody>
							<tr>
								<td class="com-i-column column1">
									<div class="p-comment">
										<span class="item-desc"><%#Eval("MsgContent") %></span>
										<b class="time"><%#Eval("CDate","{0:yyyy-MM-dd HH:mm}") %></b>
									</div>
									<div class="p-imgs"><%#GetImgs() %></div>
									<div class="p-tabs">
							   <%-- <em data-tid="8285256" class="item">外观漂亮<b class="num"></b></em>--%>
									</div>
									<div class="tie_list">
										<div id='view_div_<%#Eval("ID") %>' class="view_div" style="display: none;">
											<div class="font12">
												<span><span class="glyphicon glyphicon-upload"></span><a href="javascript:;" onclick="Collapse(<%#Eval("ID") %>);">收起</a><span class="sperspan">|</span></span>
												<span><i class="fa fa-mail-reply"></i><a href="javascript:;" onclick="RoteImg('view_img_<%#Eval("ID") %>','left');">左转</a><span class="sperspan">|</span></span>
												<span><i class="fa fa-mail-forward"></i><a href="javascript:;" onclick="RoteImg('view_img_<%#Eval("ID") %>','right');">右转</a><span class="sperspan">|</span></span>
												<span><i class="fa fa-arrows-alt"></i><a href="javascript:;" class="disabled">查看大图</a></span>
												<button type="button" id='view_btn_<%#Eval("ID") %>' onclick="Collapse()" style="display:none;"></button>
											</div>
											<div class="view_imgdiv"><div class="view_preimg"></div><div class="view_nextimg"></div><span>
												<img id='view_img_<%#Eval("ID") %>' data-angle="0" src="#" onclick="Collapse();" /></span></div>
									   </div>
									</div>
								</td>
								<td class="com-i-column column2">
									<%#GetStar() %>
								</td>
								<td class="com-i-column column3">
									<div class="type-item">
									   <%-- <span class="label">颜色：</span><span class="text">钻石白天蝎座</span>--%>
									</div>
								</td>
								<td class="com-i-column column5">
									<div class="user-item"><img src="<%#Eval("UserFace") %>" onerror="this.src='/Images/userface/noface.gif'" class="img80" /></div>
									<div class="user-item">
										<span class='user-name'><%#GetUserName() %></span>
										<span class='user_group'><%#GetGroupName() %></span>
									</div>
									<div class="user-item"><span class="buy-time">2015-09-21 11:34 购买</span></div>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="comment-operate">
						<span class="reply-trigger linkgray" data-info='{"id":"<%#Eval("ID") %>","uname":"<%#GetUserName() %>","rid":"<%#Eval("ID") %>"}'>回复</span>  
						<a class="btn btn-primary btn-xs" id="Edit_A" runat="server" visible="false">修改</a>                  
						<button class="btn btn-primary btn-xs del-trigger" type="button" id="Del_Btn" runat="server" visible="false">删除</button>
					<%--    <span class="nice J-nice" title="0">赞</span>--%>
					</div>
					<div class="comment-replylist" id="replylist_<%#Eval("ID") %>">
						<asp:Literal runat="server" ID="ReplyList_L" EnableViewState="false"></asp:Literal>
					</div>
					 <div class="reply-operate" id='reply_operate_<%#Eval("ID") %>'>
							<div><input type="text" class="form-control" id='reply_msg_<%#Eval("ID") %>' /></div>
							<div style="margin-top:5px;"><input type="button" class="btn btn-primary" value="回复" onclick="ReplyTo()" /></div>
					 </div>
				</div>
			</ItemTemplate>
		</asp:Repeater>
	</div>
	 <asp:Literal runat="server" ID="MsgPage_L" EnableViewState="false"></asp:Literal>
</div>
<style type="text/css">
.img50 {width:50px;height:50px;}
.img80 {width:80px;height:80px;}
.staricon{font-size:1.2em; color:#ccc; cursor:pointer;}
.staricon.fa-star {color:#FBA507;}
.comments-header {border:1px solid #ddd;padding:0 20px;background:#f7f7f7;
					height:30px;line-height:30px;}
.sphead {text-align:center;font-weight:700;display:inline-block;}
.column1 {width:550px;}
.column2 {width:120px;text-align:left;}
.column3 {width:180px;}
.column4 {width:130px;text-align:left;}
/*回复主列表 上右下左*/
.com-item-main {width:100%;}
.comments-item {padding:10px 20px 10px 20px;margin-top:-1px;border:1px solid #ddd;font-size:12px;color:#666;}
.comments-item .time {color:#999;font-weight:400;display:inline-block;}
.comments-item .user-item {padding-bottom:3px;}
.comments-item .user_group {color:#088000;margin-left:10px;}
.comments-item .p-imgs {margin-top:5px;}
.comments-item .imgsp {padding:3px;margin-right:3px; display:inline-block;border:1px solid #ddd;cursor:pointer;}
.comments-item .imgsp:hover {border:1px solid #31708f;}
.comments-item .comment-operate {padding-top:2px;}
.comments-item .linkgray{cursor:pointer;color:#999;}
.comments-item .reply-operate {display:none;margin-top:5px;text-align:right;background:#f7f7f7;padding:10px 10px 15px;border:1px solid #ddd;}
/*回复列表*/
.comment-reply-item {border-top:1px dotted #ccc;padding:10px 0 10px 15px; }
</style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Script" Runat="Server">
<script src="/JS/ZL_Regex.js"></script>
<script src="/js/jquery.rotate.min.js"></script>
<script>
	$(function () {
		//绑定触发回复
		$(".reply-trigger").click(function () {
			var msgmod = $(this).data("info");
			$(".reply-operate").hide();
			$("#reply_operate_" + msgmod.id).show();
			$("#reply_msg_" + msgmod.id).attr("placeholder", "回复  " + msgmod.uname + " :");
			replyconf.curmod = msgmod;
		});
		//点击浏览大图
		$(".imgsp").click(function () {
			ShowImgView(this);
		});
		//如果翻页,返回锚点
		var cpage = "<%:CPage%>";
		if (cpage > 1 && parent.commentAnchor) {
			//function commentAnchor() { $("html,body").animate({ scrollTop: $("#iframe_comm").offset().top-100 }, 300); }
			parent.commentAnchor();
		}
		//绑定删除操作
		$(".del-trigger").click(function () {
			if (confirm("是否删除该评论?")) {
				var id = $(this).data("id");
				var self = $(this);
				$.post("", { action: "del", id: id }, function (data) {
					if (data == 1) {
						window.location = location;
					}
				});
			}
		});
	})
	var replyconf = { psize: "<%:replyPsize%>", curmod: null };
	//提交回复
	function ReplyTo()//回复的主信息id,被回复信息id
	{
		var id = replyconf.curmod.id;
		var rid = replyconf.curmod.rid;
		var msg = $("#reply_msg_" + id).val();
		//-----------
		if (ZL_Regex.isEmpty(msg)) { alert("回复内容不能为空"); return false; }
		$("#reply_msg_" + id).val("");
		$.post("", { action: "reply", "msg": msg, "id": id, "rid": rid,proid:'<%=Request.QueryString["ProID"] %>' }, function (data) {
			if (data == 1) { LoadReply(id, replyconf.psize, 1); }
		});
	}
	function HideReply() {
		$(".reply-trigger").hide();
	}
	function LoadReply(pid, psize, cpage) {
		$("#replylist_" + pid).load("/User/Order/ShareReply.aspx?code=" + Math.random() + "&pid=" + pid + "&psize=" + psize + "&page=" + cpage + " start", {}, function () {
			if (parent.IfrAutoHeight) { parent.IfrAutoHeight(); }
		});
	   
	}
	//-----图片处理
	var curPreImg;//当前预览图
	function Collapse(id) {
		DisPreView(event.srcElement);
	}
	//隐藏预览视图
	function DisPreView(obj) {
		$obj = $(obj).parent().parent().parent();
		$obj.hide().siblings(".subtitle").find("img").show();
		$obj.find(".view_preimg").unbind('click');
		$obj.find(".view_nextimg").unbind('click');
	}
	function ShowImgView(obj) {
		clearCurPreImg();
		curPreImg = event.srcElement;
		//var pobj = $(event.srcElement).closest(".subtitle");
		//var id = pobj.attr("data-id");
		//pobj.find("img").hide();
		var $img = $(obj).find("img");
		var id = $(obj).closest(".comments-item").data("id");
		$("#view_img_" + id).attr("src", $img.attr("src"));
		$("#view_div_" + id).show();
		$("#view_div_" + id).find(".view_preimg").click(function () { eachImg(id, 0) });
		$("#view_div_" + id).find(".view_nextimg").click(function () { eachImg(id, 1); });
		checkNextImg(id);
	}
	//清空当前预览视图
	function clearCurPreImg() {
		if (!curPreImg) return;
		var pobj = $(curPreImg).closest(".subtitle");
		var id = pobj.attr("data-id");
		DisPreView($("#view_img_" + id));
	}
	//检查是否还有下一张(上一张)图片
	function checkNextImg(id) {
		var $li = $(curPreImg).parent();
		if (!$li.next()[0])
			$("#view_div_" + id).find(".view_nextimg").hide();
		else
			$("#view_div_" + id).find(".view_nextimg").show();
		if (!$li.prev()[0])
			$("#view_div_" + id).find(".view_preimg").hide();
		else
			$("#view_div_" + id).find(".view_preimg").show();
	}
	function RoteImg(id, direct) {
		var angle = 0;
		if (direct == "left")
			angle = $('#' + id).data("angle") - 90;
		else
			angle = $('#' + id).data("angle") + 90;
		$('#' + id).data("angle", angle);
		$('#' + id).rotate(angle);
	}
	//--------------------------
</script>
</asp:Content>