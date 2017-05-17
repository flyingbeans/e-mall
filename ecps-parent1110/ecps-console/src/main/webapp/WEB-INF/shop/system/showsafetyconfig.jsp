<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>性能及安全设置_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="性能及安全设置">性能及安全设置</span>
    <c:url value="/system/safety/safety_edit.do" var="showsafetyconfig">
        <c:param name="url" value="system/editsafetyconfig"/>
    </c:url>
    <a href="${showsafetyconfig}" title="编辑性能及安全设置" class="inb btn120x20">编辑性能及安全设置</a></div>
	<%--  
	<div class="edit set">
		<h2 title="搜索设置">搜索设置</h2>
		<p><label>最大返回搜索结果数：</label><var>${safety_key.safetyMaxResult}</var><span class="inb gray">&nbsp;&nbsp;(请输入0-200之间的数字。)</span></p>
		<p><label>搜索关键字长度：</label><var>${safety_key.safetySearchMin}</var>&nbsp;～&nbsp;<var>${safety_key.safetySearchMax}</var>个字符之间</p>
	</div>

	<div class="loc">&nbsp;</div>
  	--%>
	<div class="edit set">
		<h2 title="后台设置">后台设置</h2>
		<p><label>后台登陆超时时间限制：</label><var>${safety_key.safetySessionTime}</var>&nbsp;分钟<span class="inb gray">&nbsp;&nbsp;(超时将强制退出，必须重新登录。)</span></p>
		<%--  
		<p><label>记录登陆日志：</label>
	   	<c:if test='${safety_key.safetyLoginLog==1}'>是</c:if> 	
	   	<c:if test='${safety_key.safetyLoginLog==0}'>否</c:if> 
		</p>
		<p><label>记录操作日志：</label>
	   	<c:if test='${safety_key.safetyOperateLog == 1}'> 是</c:if> 	
	    <c:if test='${safety_key.safetyOperateLog == 0}'> 否</c:if> 	
		</p>
		  --%>
	</div>
 	<%--  
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="备份信息">备份信息</h2>
		<p><label>数据备份路径：</label>${safety_key.safetyBackupPath}</p>
	</div>
	
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="其他信息">其他信息</h2>
		<p><label>静态页后缀：</label>${safety_key.safetyStaticPageSuffix}</p>
		<p><label>动态页后缀：</label>${safety_key.safetyDynamicPageSuffix}</p>
	</div>
	--%>
	<div class="loc">&nbsp;</div>

</div></div>
</body>
