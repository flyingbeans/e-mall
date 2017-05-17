<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付方式_支付管理</title>
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
	
    <div class="loc icon"><samp class="t12"></samp>支付管理 &nbsp;&raquo;&nbsp;支付方式管理&nbsp;&raquo;&nbsp;<span class="gray" title="支付方式列表">支付方式列表</span></div>
	
	<table cellspacing="0" summary="" class="tab" id="myTable">
    	<tr>
    	<th>支付方式</th>
    	<th>操作</th>
    	</tr>
    	<c:forEach items="${pwlist}" var="pw">
    	<tr>
    	<td>${pw.pwName}</td>
    	<td><a href="${path}/payment/editpaymentway.do?pwId=${pw.pwId}">编辑</a></td>
    	</tr>
    	</c:forEach>
    </table>
</div></div> 
</body>