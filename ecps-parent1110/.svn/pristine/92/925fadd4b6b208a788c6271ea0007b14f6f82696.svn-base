<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑标签_<fmt:message key="tag.title"/>_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/systemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/contentset/tag/listTag.do"/>" title="<fmt:message key="tag.title"/>"><fmt:message key="tag.title"/></a>&nbsp;&raquo;&nbsp;<span class="gray" title="<fmt:message key="tag.edittag"/>"><fmt:message key="tag.edittag"/></span><a href="<c:url value="/contentset/tag/listTag.do"/>" title="返回标签管理" class="inb btn80x20">返回标签管理</a></div>
	<form id="form1" name="form1" action="${base}/contentset/tag/updateTag.do" method="post">
        <div class="edit set">
            <c:url value="/contentset/tag/checkTagName.do" var="check">
                <c:param name="id" value="${tag.tagId}"/>
            </c:url>
            <p>
            	<label class="alg_t">
            	<fmt:message key="tag.tagname"/>：</label>
            	<textarea rows="4" cols="21" name="tagName" class="are" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$" tip="<fmt:message key='tag.verify.info'/>"><c:out value='${tag.tagName}'/></textarea>
            	<span><c:out value="${tagNameInfo}"/></span>
            </p>
            <p>
            	<label><fmt:message key="tag.tagstatus"/>：</label>
            	<input type="radio" name="status" value="1" <c:if test='${tag.status==1}'>checked</c:if>/><fmt:message key="tag.start"/>&nbsp;&nbsp;
            	<input type="radio" name="status" value="0" <c:if test='${tag.status==0}'>checked</c:if>/><fmt:message key="tag.stop"/></p>
            <p>
            	<label>&nbsp;</label>
            	<input type="hidden" name="id" value="<c:out value='${tag.tagId}'/>"/>
            	<input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="reset" class="hand btn83x23b" value='<fmt:message key="button.cancel"/>' />
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>
