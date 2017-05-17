<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>基本参数</title>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/ecps/console/res/css/style.css'/>" />
</head>
<body style='overflow:auto;overflow-x:hidden;'>
	<table cellspacing="0" class="tab" style="margin-left:5px;margin-bottom:20px;">
		<tr>
			<th colspan="2" style="font-weight: bold;">基本参数</th>
		</tr>
		<c:forEach items="${ebPVs }" var="ebPV">
        	<c:forEach items="${flist }" var="f" varStatus="status">
		        <c:if test="${ebPV.featureId == f.featureId}">
						 				<tr>
						<td width="40%">${f.featureName}</td>
						<td>${ebPV.paraValue }</td>
					</tr>
				</c:if>
	        </c:forEach>
	    </c:forEach>
	</table>
</body>

