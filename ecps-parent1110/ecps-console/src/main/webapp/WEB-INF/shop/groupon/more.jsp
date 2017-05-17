<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<title>团购预告列表</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="SimCardMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/uploads.js'/>"></script>
</head>
<body id="main">
	<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/promotionmenu.jsp"/>
	</div></div>
	<div class="frameR"><div class="content">
	<div class="loc icon"><samp class="t12"></samp>促销活动 - 团购预告列表 - 操作记录</div>
	
	<table cellspacing="0" class="tab">
        <tr>
            <th width="12%">操作类型</th>
            <th width="12%">操作时间</th>
            <th width="15%">操作人</th>
            <th>操作备注</th>
        </tr>
        <c:forEach items='${logs}' var="log" varStatus="count">
            <tr>
            <td>${log.opType }</td>
            <td><fmt:formatDate value="${log.opTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
            <td class="nwp">${log.username }</td>
            <td class="nwp">${log.notes }</td>
            </tr>
        </c:forEach>
    </table>
    
	</div></div>
</body>