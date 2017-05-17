<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>操作记录</title>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/${system}/res/css/style.css'/>" />
<link rel="stylesheet" type="text/css" media="print" href="<c:url value='/${system}/res/css/print.css'/>" />
</head>
<body>

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
            <td class="nwp"><c:out value="${log.notes }"/></td>
        </tr>
    </c:forEach>
    <tr>
        <td class="alg_r" colspan="4">
        	<c:choose>
        		<c:when test="${tableName=='EB_GROUPON' }">
        			<a href="javascript:void(0);" onclick="top.window.location.href='${path}/groupon/more.do';">查看更多&gt;&gt;</a>
        		</c:when>
        		<c:when test="${tableName=='EB_SECKILL' }">
        			<a href="javascript:void(0);" onclick="top.window.location.href='${path}/secKill/more.do';">查看更多&gt;&gt;</a>
        		</c:when>
        		<c:otherwise>
        			<a href="javascript:void(0);" onclick="top.window.location.href='${path}/consolelog/more.do?entityId=${entityId}&tableName=${tableName }&isCard=${isCard }';">查看更多&gt;&gt;</a>
        		</c:otherwise>
        	</c:choose>        	           
        </td>
    </tr>
</table>
		
</body>
</html>