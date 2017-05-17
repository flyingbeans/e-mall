<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加标签_<fmt:message key="tag.title"/>_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/systemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">
    
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/contentset/tag/listTag.do"/>" title="<fmt:message key="tag.title"/>"><fmt:message key="tag.title"/></a>&nbsp;&raquo;&nbsp;<span class="gray" title="<fmt:message key="tag.addtag"/>"><fmt:message key="tag.addtag"/></span><a href="<c:url value="/contentset/tag/listTag.do"/>" title="返回标签管理" class="inb btn80x20">返回标签管理</a></div>
	<form id="form1" name="form1" action="${base}/contentset/tag/addTag.do" method="post">
	    <div class="edit set">
            <c:url value="/contentset/tag/checkTagName.do" var="check"></c:url>
            <p>
            	<label class="alg_t"><fmt:message key="tag.tagname"/>：</label>
            	<textarea rows="4" cols="21" name="tagName" class="are" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$" tip="<fmt:message key='tag.verify.info'/>"></textarea>
            	<span><c:out value="${tagNameInfo}"/></span>
            </p>
            <p>
            	<label><fmt:message key="tag.tagstatus"/>：</label>
            	<input type="radio" name="status" checked value="1"/><fmt:message key="tag.start"/>&nbsp;&nbsp;
            	<input type="radio" name="status" value="0" /><fmt:message key="tag.stop"/>
            </p>
            <p>
            	<label>&nbsp;</label>
            	<input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="reset" class="hand btn83x23b" value='<fmt:message key="button.cancel"/>' />
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>


