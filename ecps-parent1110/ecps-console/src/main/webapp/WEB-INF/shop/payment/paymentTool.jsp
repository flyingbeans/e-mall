<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付工具_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/paymentmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
	
    <div class="loc icon"><samp class="t12"></samp>支付管理&nbsp;&raquo;&nbsp;支付工具管理&nbsp;&raquo;&nbsp;<span class="gray" title="支付方式列表">支付工具列表</span></div>
	
	<h2 class="h2">前台显示效果:</h2>
	<div>
		<table cellspacing="0" summary="" class="tab4">
			<thead>
			<tr>
			<th colspan="4">支持以下银行或在线机构在线支付：</th>
			</tr>
			</thead>
			<c:forEach items="${bList}" var="bank" varStatus="stauts">
			<c:if test="${stauts.count%4 == 1}">
			<tr>
			</c:if>
			<td width="25%">
			<%-- 
				<input type="button" id="${bank.olbankId}" value="${bank.olbankName}" />
				<img width="151" height="42" src="<c:out value='${bank.olbankLogo}'/>"/>
			--%>
				<img width="151" height="42" src="<c:if test='${bank.olbankLogo==""}'>${path }/res/imgs/deflaut.jpg</c:if> 
			    <c:if test='${bank.olbankLogo!=""}'>${rsImgUrlInternal}${bank.olbankLogo}</c:if>"
                    onerror="this.src='${path}/res/imgs/deflaut.jpg'"/>
				<p class="red"><c:out value="${bank.olbankDesc}" default="&nbsp;" escapeXml="false"></c:out></p>
			</td>
			<c:if test="${stauts.count%4 == 0}">
			</tr>
			</c:if>
			<c:if test="${stauts.count == fn:length(bList) && stauts.count<fn:length(bList)%4*4}">
				<c:forEach begin="1" end="${4-fn:length(bList)%4}">
					<td width="25%"></td>
				</c:forEach>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<table cellspacing="0" summary="" class="tab4">
			<thead>
			<tr>
			<th colspan="4">支持以下平台：</th>
			</tr>
			</thead>
			<c:forEach items="${oList}" var="org" varStatus="stauts">
			<c:if test="${stauts.count%4 == 1}">
			<tr>
			</c:if>
			<td>
			<%-- 
				<img width="151" height="42" src="<c:out value='${org.poLogo}'/>"/>
				<input type="button" id="${org.poId}" value="${org.poName}" />
			--%>
			 <img width="151" height="42" src="<c:if test='${org.poLogo==""}'>${path }/res/imgs/deflaut.jpg</c:if> 
			 <c:if test='${org.poLogo!=""}'>${rsImgUrlInternal}${org.poLogo}</c:if>"
                    onerror="this.src='${path}/res/imgs/deflaut.jpg'"/>
             <c:choose>
             	<c:when test="${org.poDescType==2 }">
             		<a href="${org.poDescUrl }" title="${org.poDesc}" target="_blank"><p class="red"><c:out value="${org.poDesc}" default="&nbsp;" escapeXml="false"></c:out></p></a:>
             	</c:when>
             	<c:otherwise>
             		<p class="red"><c:out value="${org.poDesc}" default="&nbsp;" escapeXml="false"></c:out></p>
             	</c:otherwise>
             </c:choose>
			</td>
            <c:if test="${stauts.count%4 == 0}">
			</tr>
			</c:if>
			<c:if test="${stauts.count == fn:length(oList) && stauts.count<fn:length(oList)%4*4}">
				<c:forEach begin="1" end="${4-fn:length(oList)%4}">
					<td width="25%"></td>
				</c:forEach>
				</tr>
			</c:if>
			</c:forEach>
			
		</table>
		<p class="alg_c mt"><input type="button" class="hand btn83x23b" value="编辑" onclick="javascript:location.href='${path}/payment/editpaymenttool.do'"></p>
	</div>
</div></div> 
</body>