<%@ page language="C#" autoeventwireup="true" inherits="Tools_Post, App_Web_cmvke0fw" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server"></form>

    <form name="form5" method="post" action="/PubAction.aspx">
        <input type="hidden" name="PubID" id="PubID" value="5">
        <input type="hidden" name="PubContentid" id="PubContentid" value="{PubContentid/}">
        <div class="form-group">
            <label for="PubTitle">评论标题：</label>
            <input type="text" class="form-control" id="PubTitle" name="PubTitle">
        </div>
        <div class="form-group">
            <label for="PubContent">评论内容：</label>
            <textarea class="form-control" name="PubContent" cols="50" rows="10" id="PubContent"></textarea>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn btn-default">提交</button>
            <button type="reset" class="btn btn-default">重置</button>
        </div>
    </form>
</body>
</html>
