<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="taglibs.jsp"%>
<head>
<meta name="menu" content="SystemSet"/>
</head>
<h2><samp class="t03"></samp>系统配置</h2>
<ul class="ul">
<!--  <li><a href="${path}/contentset/tag/listTag.do"><samp class="t05"></samp>标签管理</a></li>  -->
<!--  <li><a href="${path}/contentset/keyword/listKeyWord.do"><samp class="t05"></samp>关键词管理</a></li>  -->
<li><a href="${base}/contentset/sensitive/listSensitive.do"><samp class="t05"></samp>敏感词管理</a></li>

<li><a href="${base}/log/login/listBackLog.do"><samp class="t05"></samp>后台登陆日志管理</a></li>

<li><a href="${base}/system/site/index.do"><samp class="t05"></samp>全局设置</a></li>

<li><a href="${base}/static/toPublishJsp.do"><samp class="t05"></samp>静态化</a></li>
</ul>
