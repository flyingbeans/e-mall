<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$(document).ready(function() {
    	<c:if test="${message!=null }">
			alert('<c:out value="${message }"/>');
		</c:if>
    });
</script>
<head>
    <title>全局设置_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="全局设置">全局设置</span>
    <c:url value="/${system}/system/site/site_edit.do" var="showsiteconfig">
        <c:param name="url" value="system/editsiteconfig"/>
    </c:url>
    <a href="${showsiteconfig}" title="编辑全局设置" class="inb btn80x20">编辑全局设置</a></div>
	<%--
	<div class="edit set">
	<h2 title="基本信息">基本信息</h2>
	<p><label for="sit">站点域名：</label>${site_key.siteBasicDomain}</p>
	<p><label for="path">路径：</label>${site_key.siteBasicPath}</p>
	<p><label for="path_option：</label>>是否相对路径:
	<c:if test='${site_key.siteBasicOption == 1}'> 是</c:if>
	<c:if test='${site_key.siteBasicOption == 0}'> 否</c:if>
	</p>
	<p><label for="pre_address">预发布测试地址：</label>${site_key.siteBasicPreAddress}</p>
	<p><label for="mail_address">系统管理员邮箱：</label>${site_key.siteBasicMailAddress}</p>
	<p><label for="phone">系统管理员座机：</label>${site_key.siteBasicPhone}<span class="inb gray">(例如：区号-座机号-分机号。)</span></p>
	</div>

	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="FTP信息">FTP信息</h2>
		<p><label for="ftp_host">FTP服务器地址：</label>${site_key.siteFtpHost}</p>
		<p><label for="ftp_port">FTP端口：</label>${site_key.siteFtpPort}</p>
	</div>
	<div class="loc">&nbsp;</div>

	<div class="edit set" style="display:none">
		<h2 title="存放路径信息">存放路径信息</h2>
		<p><label for="storage_html">文档HTML保存路径：</label>${site_key.sitePathHtml}</p>
		<p><label for="storage_res">图片/附件保存路径：</label>${site_key.sitePathResource}</p>
	</div>

	<div class="loc" style="display:none">&nbsp;</div>

	--%>
	<div class="edit set">
		<h2 title="SEO设置">SEO设置</h2>
        <ul class="uls">
		<li><label for="title">站点标题：</label>${site_key.siteSeoTitle}<span class="inb gray">&nbsp;&nbsp;(最多60个字符。)</span></li>
		<li><label for="keywords">站点关键字：</label>${site_key.siteSeoKeyword}<span class="inb gray">&nbsp;&nbsp;(最多5个词组，词组之间用空格分隔。)</span></li>
		<li><label for="description" class="alg_t">站点描述：</label><div class="pre">${site_key.siteSeoDescription}<span class="inb gray">&nbsp;&nbsp;(最多160个字符。)</span></div></li>
        </ul>
	</div>
	
	<div class="loc">&nbsp;</div>
	
	<%-- <div class="edit set">
		<h2 title="回收站设置">回收站设置</h2>>
		<p><label for="title">是否开启回收站：</label><c:if test= '$(site_key.siteRecycleMode == 1)'>是</c:if></p>
	</div>
	<div class="loc">&nbsp;</div>
 --%>	

</div></div>
</body>
