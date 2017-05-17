<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>查看_订单支付总览_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/payment/listOrderPayment.do"/>">订单支付总览</a>&nbsp;&raquo;&nbsp;<span class="gray">订单支付详情</span>
	    <a href="<c:url value="/${system }/payment/listOrderPayment.do"/>" title="返回列表" class="inb btn80x20">返回列表</a>
	    </div>
	    
	    <div class="sch page_c">
	    <span class=l>订单号：<span class=red><var><c:out value="${order.orderNum}"></c:out></var></span>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${order.orderTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var></span>
	    </div>
	    
	    <h2 class="h2_ch"><span id="tabs" class="l">
	    	<a id="label" href="###" title="全部" class="nor">全部</a>
	    </span></h2>
	    
	    <c:choose>
	    	<c:when test="${not empty payRecordList}">
				<table cellspacing="0" summary="" class="tab">
					<thead>
					    <th>交易流水号</th>
						<th>交易日期</th>
						<th>支付机构</th>
			            <th>支付工具标识</th>
			            <th>交易币种</th>
						<th>交易金额</th>
						<th>业务类型</th>
						<th>交易状态</th>
						<th>操作人</th>
						<th>备注</th>
					</thead>
					<tbody>
						<c:forEach items="${payRecordList}" var="payRecord">
							<tr>
								<td><c:out value="${payRecord.payRecordNum}"></c:out></td>
								<td><fmt:formatDate value="${payRecord.tradeCreatedate}"pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${payRecord.poName}"></c:out></td>
								<td><c:out value="${payRecord.olbankName}"></c:out></td>
								<td><c:out value="RMB"></c:out></td>
								<td><fmt:formatNumber value="${payRecord.tradeAmount/100 }" pattern="#0.00" /></td>
								<td>
									<c:choose>
										<c:when test="${payRecord.buziType==1}">支付</c:when>
										<c:when test="${payRecord.buziType==2}">冲正</c:when>
										<c:when test="${payRecord.buziType==3}">撤销</c:when>
										<c:when test="${payRecord.buziType==4}">退款</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${payRecord.tradeStatus==1}">交易创建</c:when>
										<c:when test="${payRecord.tradeStatus==2}">交易成功</c:when>
										<c:when test="${payRecord.tradeStatus==3}">交易关闭</c:when>
										<c:when test="${payRecord.tradeStatus==4}">交易撤销</c:when>
										<c:when test="${payRecord.tradeStatus==5}">交易失败</c:when>
										<c:when test="${payRecord.tradeStatus==99}">系统未响应</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${payRecord.buziType==1}">
											<c:out value="${payRecord.userName}"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="${payRecord.oparetorName}"></c:out>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="nwp"><c:out value="${payRecord.memo}"></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	    	</c:when>
			<c:otherwise>
		  		<table cellspacing="0" summary="" class="tab">
		  			<thead>
						<th>暂无支付结果！</th>
					</thead>
		  		</table>
			</c:otherwise>
	    </c:choose>
</div></div>
</body>