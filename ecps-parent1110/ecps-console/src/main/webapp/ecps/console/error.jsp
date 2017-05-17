<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/taglibs.jsp"%>
<head>
    <title>系统错误</title>
    <meta name="heading" content="<fmt:message key='404.title'/>"/>
   	<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/ecps/console/res/css/style.css'/>" />
</head>
<body>
<div class="bx2 errorPage">
    <dl class="oth">
    <dt class="failMsg Msg">抱歉，您请求的页面现在无法打开！</dt>
    <dd>您可以：<p>1、检查刚才的输入；<br>2、稍后再试&nbsp;或&nbsp;联系客服电话&nbsp;<var>10086</var>；<br>3、返回&nbsp;<c:url value="/ecps/console/main.do" var="mainURL" /><a href="${mainURL}" title="主菜单">主菜单</a>。</p></dd>
    </dl>
</div>
</body>
