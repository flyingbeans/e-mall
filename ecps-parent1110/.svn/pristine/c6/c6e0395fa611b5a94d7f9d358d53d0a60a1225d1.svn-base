<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付机构列表_支付机构管理_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
	function listPayOlbank(poId){
		
	}
	function editPaymentOrg(poId){
		
	}
</script>
</head>
<body id="main">
	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<a href="<c:url value='/${system}/payment/listPaymentOrg.do'/>">支付机构管理</a>&nbsp;&raquo;&nbsp;<span class="gray">支付机构列表</span>
	    </div>
	    <div class="page_c">
	        <span class="l">
	        </span>
	        <span class="r inb_a">
	            <a href="${base}/payment/addPaymentOrg.do" class="btn80x20" title="新增支付机构">新增支付机构</a>
	        </span>
   		</div>
		<form id="form1" name="form1" action="" method="post">
			<table cellspacing="0" summary="" class="tab">
				<thead>
				    <th>机构名称</th>
					<th>商户账号ID</th>
					<th>状态</th>
					<th>支持网银支付</th>
					<th class="wp">支付说明</th>
		            <th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${paymentOrgList}" var="paymentOrg">
						<tr>
							<td><c:out value="${paymentOrg.poName}" /></td>
							<td><c:out value="${paymentOrg.accountCode}" /></td>
							<c:choose>
								<c:when test="${paymentOrg.isShow==1}">
									<td>启用</td>
								</c:when>
								<c:otherwise>
									<td>待选</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${paymentOrg.isOlbank==1}">
									<td><span class="is"></span></td>
								</c:when>
								<c:otherwise>
									<td><span class="not"></span></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<%-- 描述类型为文本 --%>
								<c:when test="${paymentOrg.poDescType==1}">
									<td class="nwp"><c:out value="${paymentOrg.poDesc}" default="---"></c:out></td>
								</c:when>
								<%-- 描述类型为链接 --%>
								<c:when test="${paymentOrg.poDescType==2}">
									<td class="nwp"><c:out value="${paymentOrg.poDesc}" default="---"></c:out></td>
								</c:when>
								<%-- 其他直接输出横线 --%>
								<c:otherwise>
									<td class="nwp">---</td>
								</c:otherwise>
							</c:choose>
							<td>
							<c:choose>
								<c:when test="${paymentOrg.isOlbank==1}">
									<a href="${base}/payment/listPayOlbank.do?poId=${paymentOrg.poId}">网银列表</a>
								</c:when>
								<c:otherwise>
									<a href="###" class="gray">网银列表</a>
								</c:otherwise>
							</c:choose>
							&nbsp;<a href="${base}/payment/editPaymentOrg.do?poId=${paymentOrg.poId}">编辑</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
</div></div>
</body>