﻿<%@ page language="C#" autoeventwireup="true" validaterequest="false" masterpagefile="~/Common/Common.master" inherits="User_Exam_QuestOption, App_Web_f1tmousp" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>试题选项配置</title>
<script src="/Plugins/Ueditor/ueditor.config.js" charset="utf-8"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js" charset="utf-8"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<style>
*{font-size:14px;}
.question_option .quescon {padding:5px;border:1px solid #ddd;height:150px;margin-top:5px;overflow:auto;}
.question_option .optag_div{text-align:center; height:100px; line-height:100px; background-color:#ccc;}
.question_option .option_div{border:1px dashed #ddd; padding:5px; float:left; width:80%; height:100px;}
.question_option .opts_title{display:inline-block;margin-right:10px;}
.question_option .active_option{border:1px solid #337ab7;}
#answer_ue_div {width:500px;display:none;position:absolute;top:150px;right:30%; border:1px solid #ddd;box-shadow:0 4px 20px 1px rgba(0,0,0,0.2);background:#ffffff;}
.footfix_div{padding:5px; position:fixed; bottom:0px; background-color:rgba(255, 255, 255, 0.60); width:100%;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="question_option container">
<div class="panel panel-primary">
<div class="panel-heading">
<h3 class="panel-title">试题选项配置</h3>
</div>
<div class="panel-body">
<div class="margin_t10">题目内容:</div>
<div class="quescon"><span id="QuestCon_L"></span> </div>
<div class="margin_t5">试题填空配置:  </div>
<div ng-app="app" class="panel panel-default margin_t5">
	<div ng-controller="appController" class="panel-body">
		<div ng-repeat="item in list">
			<div class="margin_t10 panel panel-info question_body" data-id="{{item.id}}">
				<div class="panel-heading">
					<div class="opts_title">
						<span>填空<input type="text" class="form-control text_xs text-center" value="{{item.id}}" /> 选项:</span>
						<select class="form-control text_xs question_sel" ng-model="item.num" name="options_{{$index}}">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					<div class="opts_title">
						<span>试题标题:</span>
						<input type="text" class="form-control text_md question_title" value="{{item.title}}" />
					</div>
					<div class="opts_title">
						<span>试题分数:</span>
						<input type="text" class="form-control text_xs question_score" value="{{item.score}}" />
					</div>
				</div>
				<div class="panel-body">
					<div ng-repeat="child in item.opts">
						<div class="margin_t5 option_body">
							<div class="optag_div pull-left td_s">{{child.op}}</div>
							<div class="option_div" ng-bind-html="child.val|to_trusted" data-index="{{$index}}">
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>

</div>
</div>
</div>
<div class="footfix_div text-center">
 <button type="button" class="btn btn-primary" onclick="CheckData()">保存</button>
	<a href="javascript:;" onclick="CloseDiag()" class="btn btn-primary">关闭</a>
</div>
<div id="answer_ue_div">
<textarea id="editor" style="height: 120px;"></textarea>
<div style="text-align: center; padding: 5px;">
<input type="button" value="确定" class="btn btn-primary" onclick="LoadContent();" />
<input type="button" value="关闭" class="btn btn-default" onclick="CloseEditer();" />
</div>
</div>
<asp:HiddenField ID="DataCount_Hid" runat="server" />
<asp:HiddenField ID="SaveData_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/Plugins/Ueditor/kityformula-plugin/addKityFormulaDialog.js"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/getKfContent.js"></script>
<script src="/Plugins/Ueditor/kityformula-plugin/defaultFilterFix.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
	var ue = {}, $curoption;//当前选中的选项
	var page = { scope: null };
	var questdata = [];//模型数据
	var model = { id: 1, type: "", title: "", score: 5, opts: [{ op: "A", val: "" }] };
	//加载agnular
	var app = angular.module("app", []).controller("appController", function ($scope, $compile) {
		page.scope = $scope;
		$scope.list = [];
		if ($("#SaveData_Hid").val() != "") { $scope.list = JSON.parse($("#SaveData_Hid").val()); }
		$scope.addElement = function (model) {
			$scope.$apply(function ($compile) {
				$scope.list = model;
			});
		}
	});
	//取消html转义
	app.filter(
		'to_trusted', ['$sce', function ($sce) {
			return function (text) {
				return $sce.trustAsHtml(text);
			}
		}]
	);
	//更新html视图
	function UpdateView() {
		page.scope.addElement(questdata);
	}
   // var curwindotop = 0;//记录窗口滚动位置
	//var settopinter;//固定滚动条
	$(function () {
		InitData($("#DataCount_Hid").val());
		InitEdit();
		InitChange();
		$(window).scroll(function () {
			var scrollTop = $(this).scrollTop();//已滚动多少
			var nowTop = $("#answer_ue_div").css("top");
			$("#answer_ue_div").css("top", scrollTop + 150);
		});
	});
	var opstr = "A,B,C,D,E,F,G,H,I,J".split(',');
	//加载初始数据
	function InitData() {
		var content = parent.GetContent();
		//计算试题内容有多少填空
		var conarr = content.split("（）");
		var relcon = "";
		for (var i = 0; i < conarr.length; i++) {
			relcon += conarr[i];
			if (i + 1 < conarr.length) { relcon += "（" + (i+1) + "）";}
		}
		$("#QuestCon_L").html(relcon);

		for (var i = 0; i < conarr.length - 1; i++) {
			if (page.scope.list[i]) {//如果有数据
				var curlist = page.scope.list[i];
				if (curlist.title == "") { curlist.title = "第" + (i + 1) + "个填空"; }
				questdata.push({ id: i+1,num:curlist.num, title: curlist.title, score: curlist.score, opts: curlist.opts });
				continue;
			}
			var childopts =[];
			for (var j = 0; j < 4; j++) {//题目选项(默认4个)
				childopts.push({op:opstr[j],val:""})
			}
			questdata.push({ id: i+1,num:4, title:"第"+(i+1)+"个填空", score: 5, opts: childopts});
		}
		UpdateView();
	}

	//初始化编辑器事件
	function InitEdit() {
		ue = UE.getEditor('editor', {
			toolbars: [[
				'bold', 'italic', 'underline', '|', 'fontsize', '|', 'kityformula','insertimage'
			]],
			elementPathEnabled: false, wordCount: false
		});
	   
		$(".option_div").unbind('click');
		$(".option_div").click(function () {
			$curoption = { id: $(this).closest('.question_body').data('id'), index: $(this).data('index') };
			$("#answer_ue_div").show();
			ue.setContent($(this).html().trim());
			$(".option_div").removeClass('active_option');
			$(this).addClass('active_option');//选中效果
			//curwindotop = $(window).scrollTop();//记录当前滚动值
			//settopinter = setInterval(function () { $(window).scrollTop(curwindotop); }, 10);//固定滚动条
		});
	}
	//加载修改事件
	function InitChange() {
		//选择试题选项事件
		$(".question_sel").change(function () {
			var id = $(this).closest('.question_body').data('id');
			var curData = questdata.GetByID(id);
			curData.opts = [];//清空选项
			for (var i = 0; i < $(this).val() ; i++) {
				curData.opts.push({ op: opstr[i], val: "" });
			}
			curData.num = curData.opts.length;//记录选项数
			UpdateView();
			InitEdit();
		});

		$(".question_title").keyup(function () {//标题修改事件
			var curData = GetCurData($(this));
			curData.title = $(this).val();
		});
		$(".question_score").keyup(function () {//试卷分数修改时间
			if (!ZL_Regex.isNum($(this).val())) { $(this).val(''); return; }
			var curData = GetCurData($(this));
			curData.score = $(this).val();
		})
	}
	//根据当前标签获得当前选中数据
	function GetCurData(obj) {
		var id = obj.closest('.question_body').data('id');
		return questdata.GetByID(id);
	}
	function LoadContent() {
		var curdata = questdata.GetByID($curoption.id);
		curdata.opts[$curoption.index].val = ue.getContent();
		UpdateView();
	}

	function CheckData() {
		parent.GetQuesType(JSON.stringify(questdata));
	}
	function CloseEditer() {
		//clearInterval(settopinter);
		$('#answer_ue_div').hide();
	}
	function CloseDiag() {
		parent.CloseComDiag();
	}
</script>
</asp:Content>