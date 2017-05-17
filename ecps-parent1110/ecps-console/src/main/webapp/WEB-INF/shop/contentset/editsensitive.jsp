<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑敏感词_敏感词管理_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/systemmenu.jsp" />
</div></div>
<script type="text/javascript">
	function backToList(){
		var backListUrl=$("#sensitiveListUrl").val();
		window.location.href=backListUrl;
	}
</script>

<div class="frameR"><div class="content">
<input type="hidden" id="sensitiveListUrl" name="sensitiveListUrl" value="${base}/contentset/sensitive/listSensitive.do"/>
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/contentset/sensitive/listSensitive.do"/>" title="敏感词管理">敏感词管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="编辑敏感词">编辑敏感词</span><a href="<c:url value="/${system}/contentset/sensitive/listSensitive.do"/>" title="返回敏感词管理" class="inb btn120x20">返回敏感词管理</a></div>
	<form id="form1" name="form1" action="${base}/contentset/sensitive/updateSensitive.do" method="post">
		<div class="edit set">
            <p>
            	<label class="alg_t">敏感词名称：</label>
            	<textarea rows="4" cols="21" name="sensitiveName" class="are" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$" tip="必须是中英文或数字字符，长度1-20"><c:out value='${sensitive.sensitiveName}'/></textarea>
            	<span><c:out value="${sensitiveName}"/></span>
            </p>
            <p>
            	<label>状态：</label>
            	<input type="radio" name="status" value="1" <c:if test='${sensitive.status==1}'>checked</c:if>/>启用&nbsp;&nbsp;
            	<input type="radio" name="status" value="0" <c:if test='${sensitive.status==0}'>checked</c:if>/>停用
            </p>
            <p>
            	<label>&nbsp;</label>
            	<input type="hidden" name="id" value="<c:out value='${sensitive.sensitiveId}'/>"/>
            	<input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="取消" onclick="backToList()"/>
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>