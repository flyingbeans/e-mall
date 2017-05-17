<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付状态查询_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">

function emptyOrderNum(){
	if($("#orderNum").val()=="请输入订单号"){
		$("#orderNum").val("");
		$("#orderNum").attr("class","text20 medium");
	}
}
function checkOrderNum(){
	if($("#orderNum").val()==""){
		$("#orderNum").val("请输入订单号");
		$("#orderNum").attr("class","text20 medium gray");
	}
}

function emptyBegin(){
	$("#begin").val("");
	$("#begin").attr("class","text20 date");
}

function checkOrderNumber(ordernum){
	var regs = /^[0-9a-zA-Z]+$/;
	if(!regs.test(ordernum)){
		return false;
	}else{
		return true;
	}
}

$(function(){
	$("#orderNum").click(function(){
		emptyOrderNum();
	});
	$("#orderNum").blur(function(){
		checkOrderNum();
	});
	$("#begin").click(function(){
		emptyBegin();
	});
});

function submitForm() {
	if($("#orderNum").val()=="请输入订单号"){
		$("#orderNum").val("");
	}
	if($("#begin").val() == "请选择日期"){
		$("#begin").val("");
	}
	if(!checkOrderNumber($("#orderNum").val())){
		alert("订单号只能包含数字和字母!");
		$("#orderNum").val("");
		checkOrderNum();
		return false;
	}
	if($("#orderNum").val()==""||$("#begin").val()==""||$("#poId").val()==""){
		$("#searchTip").show("slow");
		return false;
	}
	document.getElementById("form1").submit();
}

function exportPaymentStatus(){
	var form = document.getElementById("form1");
	form.action="${base}/payment/exportPaymentStatus.do";
	form.submit();
	form.action="${base}/payment/listPaymentStatus.do?queryed=yes";
}

</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<span class="gray">支付状态查询</span>
	    </div>
	    
		<form id="form1" name="form1" action="${base}/payment/listPaymentStatus.do" method="post">
			<div class="sch">
				<p>
					<%-- <fmt:message key="tag.search"/>： --%>
					订单号：
					<c:choose>
	        			<c:when test="${empty orderNum}">
	        				<input type="text" id="orderNum" name="orderNum" class="text20 medium gray" value="请输入订单号"/>
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" class="text" id="orderNum" name="orderNum" class="text20 medium gray" value="${orderNum}"/>
	        			</c:otherwise>
	        		</c:choose>
	        		订单生成日期：
	        		<c:choose>
	        			<c:when test="${empty orderTime}">
	        				<input type="text" id="begin" name="orderTime"class="text20 date gray" value="请选择日期"   onfocus="WdatePicker()" readonly="readonly"/>
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" id="begin" name="orderTime"class="text20 date gray" value="${orderTime}"   onfocus="WdatePicker()" readonly="readonly"/>
	        			</c:otherwise>
	        		</c:choose>
					支付机构：<select id="poId" name="poId">
						<option value="">请选择支付机构</option>
						<c:forEach items="${paymentOrgList}" var="paymentOrg">
							<option value="${paymentOrg.poId}" <c:if test="${paymentOrg.poId==poId}">selected="selected"</c:if> ><c:out value="${paymentOrg.poName}"></c:out></option>
						</c:forEach>
					</select>
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
					<span id="searchTip" class="red" style="display:none">请补齐查询条件！</span>
				</p>
			</div>
	  		<c:if test="${empty paymentStatusList && not empty param.orderNum}">
		  		<table cellspacing="0" summary="" class="tab">
		  			<thead>
						<th>无查询结果！</th>
					</thead>
		  		</table>
	  		</c:if>
			<c:if test="${not empty paymentStatusList}">
		    	<div class="page_c">
			        <span class="l">
			        </span>
			        <span class="r inb_a">
			            <input type="button"  class="btn80x20" value="导出查询结果" onclick="exportPaymentStatus()" />
			        </span>
		  		</div>
				<table cellspacing="0" summary="" class="tab">
					<thead>
						<th>订单号</th>
						<th>订单日期</th>
						<!-- 
					    	<th>支付流水号</th>
						-->
						<th>支付日期</th>
						<th>支付机构</th>
			            <th>支付工具标识</th>
			            <th>付款币种</th>
						<th>付款金额</th>
						<th>支付状态</th>
			            <th>清算日期</th>
					</thead>
					<tbody>
						<c:forEach items="${paymentStatusList}" var="paystatus">
						<tr>
							<td><c:out value="${paystatus.orderNum}"></c:out></td>
							<td><fmt:formatDate value="${paystatus.orderTime}" pattern="yyyy-MM-dd"/></td>
							<!-- 
								<td><c:out value="${paystatus.payRecordNum }"></c:out></td>
							-->
							<td><fmt:formatDate value="${paystatus.payTime }" pattern="yyyy-MM-dd"/></td>
							<td><c:out value="${paystatus.poName }"></c:out></td>
							<td>
							<c:choose>
								<c:when test="${paystatus.olbankName!=''}"><c:out value="${paystatus.olbankName }" /></c:when>
								<c:otherwise>--</c:otherwise>
							</c:choose>
							</td>
							<td><c:out value="RMB" /></td>
							<%-- <td><c:out value="${paystatus.tradeAmount }"/></td> --%>
							<td><fmt:formatNumber value="${paystatus.tradeAmount/100}" pattern="#0.00"/></td>
							<td>
								<c:if test="${paystatus.poId==3}">
								<c:choose>
									<c:when test="${paystatus.isPaid=='SUCCESS'}">付款成功</c:when>
									<c:when test="${paystatus.isPaid=='FAILED'}">付款失败</c:when>
									
									<c:when test="${paystatus.isPaid=='WAIT_BUYER_PAY'}">交易创建，等待买家付款</c:when>
									<c:when test="${paystatus.isPaid=='TRADE_SUCCESS'}">交易成功，不能再次进行交易</c:when>
									<c:when test="${paystatus.isPaid=='TRADE_CLOSED'}">交易关闭</c:when>
									<c:when test="${paystatus.isPaid=='TRADE_CANCEL'}">交易撤销</c:when>
									<c:when test="${paystatus.isPaid=='TRADE_FAIL'}">交易失败</c:when>
									<c:when test="${paystatus.isPaid=='REFUND_SUCCESS'}">退费成功</c:when>
									<c:when test="${paystatus.isPaid=='REFUND_CLOSE'}">退费关闭</c:when>
									<c:when test="${paystatus.isPaid=='REFUND_PROCESS'}">退费处理中</c:when>
									<c:when test="${paystatus.isPaid=='REFUND_FAIL'}">退费失败</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
								</c:if>
								<c:if test="${paystatus.poId==4}">
									<c:choose>
										<c:when test="${paystatus.isPaid=='true'}">付款成功</c:when>
										<c:when test="${paystatus.isPaid=='false'}">付款失败</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</c:if>
								
								<c:if test="${paystatus.poId==5}">
									<c:choose>
										<c:when test="${paystatus.isPaid=='WAIT_BUYER_PAY'}">等待买家付款</c:when>
										<c:when test="${paystatus.isPaid=='WAIT_SELLER_SEND_GOODS'}">买家已付款，等待卖家发货</c:when>
										<c:when test="${paystatus.isPaid=='WAIT_BUYER_CONFIRM_GOODS'}">卖家已发货，等待买家确认</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_FINISHED'}">交易成功结束</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_CLOSED'}">交易中途关闭（已结束，未成功完成）</c:when>
										<c:when test="${paystatus.isPaid=='WAIT_SYS_CONFIRM_PAY'}">支付宝确认买家银行汇款中，暂勿发货</c:when>
										<c:when test="${paystatus.isPaid=='WAIT_SYS_PAY_SELLER'}">买家确认收货，等待支付宝打款给卖家</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_REFUSE'}">立即支付交易拒绝</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_REFUSE_DEALING'}">立即支付交易拒绝中</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_CANCEL'}">立即支付交易取消</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_PENDING'}">等待卖家收款</c:when>
										<c:when test="${paystatus.isPaid=='TRADE_SUCCESS'}">支付成功</c:when>
										<c:when test="${paystatus.isPaid=='BUYER_PRE_AUTH'}">买家已付款（语音支付）</c:when>
										<c:when test="${paystatus.isPaid=='COD_WAIT_SELLER_SEND_GOODS'}">等待卖家发货（货到付款）</c:when>
										<c:when test="${paystatus.isPaid=='COD_WAIT_BUYER_PAY'}">等待买家签收付款（货到付款）</c:when>
										<c:when test="${paystatus.isPaid=='COD_WAIT_SYS_PAY_SELLER'}">签收成功等待系统打款给卖家（货到付款）</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</c:if>
							</td>
							<td>
							
							<c:choose>
								<c:when test="${paystatus.settleDate!=null}"><fmt:formatDate value="${paystatus.settleDate }" pattern="yyyy-MM-dd" /></c:when>
								<c:otherwise>--</c:otherwise>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</form>
</div></div>
	
</body>
