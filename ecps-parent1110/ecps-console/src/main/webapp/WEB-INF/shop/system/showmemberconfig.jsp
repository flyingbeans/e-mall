<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>会员设置_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="会员设置">会员设置</span>
    <c:url value="/system/member/member_edit.do" var="showmemberconfig">
        <c:param name="url" value="system/editmemberconfig"/>
    </c:url>
    <a href="${showmemberconfig}" title="编辑会员设置" class="inb btn80x20">编辑会员设置</a></div>

	<div class="edit set">
	<h2 title="基本设置">基本设置</h2>
	<!--  
	<p><label for="member_switch">是否开启会员功能：</label>
	<c:if test='${member_key.memberOption==1}'>是</c:if>
	<c:if test='${member_key.memberOption==0}'>否</c:if>
	</p>
	<p><label for="member_register_switch">是否开启会员注册：</label>
	<c:if test='${member_key.memberRegisterOption==1}'>是</c:if>
	<c:if test='${member_key.memberRegisterOption==0}'>否</c:if>
	</p>
	<p><label for="member_register_name_min">注册用户名长度：</label>${member_key.memberRegisterNameMin}～${member_key.memberRegisterNameMax}个字符</p>
	<p><label for="member_register_password_min">注册密码长度：</label>${member_key.memberRegisterPasswordMin}～${member_key.memberRegisterPasswordMax}个字符</p>
	-->
	<p><label for="memberRegisterReserveName">用户名保留字：</label>${member_key.memberRegisterReserveName}<span class="inb gray">&nbsp;&nbsp;(可以使用 * 作为通配符，如: *admin*。)</span></p>
	</div>

	<div class="loc">&nbsp;</div>

</div></div>
</body>