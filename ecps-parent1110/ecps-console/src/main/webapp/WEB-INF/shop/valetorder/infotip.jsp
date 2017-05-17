<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>提示信息</title>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/ecps/console/res/css/style.css'/>" />
<script type="text/javascript">
	function closeWin() {
		this.window.opener = null;
		window.close();
	}
</script>
</head>
<body>

<div class="bx2" style="width:20%;margin:60px auto;background-color:#f2f2f2;border:1px solid #ccc">
    <dl class="oth">
    <dt class="failMsg Msg">${message}</dt>
    <dd>您可以：<p><input id="closeBtn" class="hand btn80x20" name="closeBtn" type="button" onclick="closeWin()" value="点击关闭" /></p></dd>
    </dl>
</div>
    	  
</body>
</html>