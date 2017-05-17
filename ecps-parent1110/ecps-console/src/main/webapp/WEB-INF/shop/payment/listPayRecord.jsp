<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付单管理_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">

	function emptyOrderNum(){
		if($("#orderNumText").val()=="请输入订单号"){
			$("#orderNumText").val("");
			$("#orderNumText").attr("class","text20 medium");
		}
	}
	function checkOrderNum(){
		if($("#orderNumText").val()==""){
			$("#orderNumText").val("请输入订单号");
			$("#orderNumText").attr("class","text20 medium gray");
		}
	}
	function emptyBegin(){
		$("#beginText").val("");
		$("#beginText").attr("class","text20 date");
	}
	function emptyEnd(){
		$("#endText").val("");
		$("#endText").attr("class","text20 date");
	}
	
	function compareDate(sod,eod){
		sod = sod.replace(/\-/gi,"/");
		eod = eod.replace(/\-/gi,"/");
		if(Date.parse(sod)>Date.parse(eod)){
			return false;
		}else{
			return true;
		}
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
		pageInitialize('#form1');
		$("#orderNumText").click(function(){
			emptyOrderNum();
		});
		$("#orderNumText").blur(function(){
			checkOrderNum();
		});
		<c:if test="${empty param.start}">
			$("#beginText").click(function(){
				emptyBegin();
			});
		</c:if>
		<c:if test="${empty param.end}">
			$("#endText").click(function(){
				emptyEnd();
			});
		</c:if>
	});
	function submitForm() {
		if($("#orderNumText").val()!="请输入订单号"){
			$("#orderNum").val($("#orderNumText").val());
		}else{
			$("#orderNum").val("");
		}
		if($("#beginText").val()!="请选择起始日期"){
			$("#begin").val($("#beginText").val());
		}else{
			$("#begin").val("");
		}
		if($("#endText").val()!="请选择结束日期"){
			$("#end").val($("#endText").val());
		}else{
			$("#end").val("");
		}
		if($("#orderNum").val()!=""&&!checkOrderNumber($("#orderNum").val())){
			alert("订单号只能包含数字和字母!");
			$("#orderNumText").val("");
			checkOrderNum();
			return false;
		}
		if($("#begin").val()!=""&&$("#end").val()!=""&&!compareDate($("#begin").val(),$("#end").val())){
			alert("起始日期不能大于结束日期");
			$("#beginText").val("请选择起始日期");
			$("#endText").val("请选择结束日期");
			return false;
		}
		//if($("#orderNum").val()==""||$("#begin").val()==""||$("#end").val()==""||$("#poSelect").val()==""){
		//	$("#searchTip").show("slow");
		//	return false;
		//}else{
			document.getElementById("form1").submit();
		//}
	}
	function exportPayRecord(){
		var form = document.getElementById("form1");
		form.action = "${base}/payment/exportPayRecord.do";
		form.submit();
		form.action = "${base}/payment/listPayRecord.do";
	}

</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<span class="gray">支付单管理</span>
	    </div>
	    
		<form id="form1" name="form1" action="${base}/payment/listPayRecord.do" method="post">
			<div class="sch">
				<p>
					订单号：
					<c:choose>
	        			<c:when test="${empty param.orderNum}">
	        				<input type="text" id="orderNumText" class="text20 medium gray" value="请输入订单号"/>
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" id="orderNumText" class="text20 medium" value="${param.orderNum}"/>
	        			</c:otherwise>
	        		</c:choose>
	        		<input type="hidden" id="orderNum" name="orderNum" value="<c:out value='${param.orderNum}'></c:out>"/>
					订单生成时间段：
					<c:choose>
						<c:when test="${empty param.start}">
							<input type="text" id="beginText" onfocus="WdatePicker()" class="text20 date gray" value="请选择起始日期" readonly="readonly"/>-
						</c:when>
						<c:otherwise>
							<input type="text" id="beginText" onfocus="WdatePicker()" class="text20 date" value="${param.start}" readonly="readonly"/>-
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="begin" name="start" value="<c:out value="${param.start}"></c:out>"/>
					<c:choose>
						<c:when test="${empty param.end}">
							<input type="text" id="endText" onfocus="WdatePicker()" class="text20 date gray" value="请选择结束日期" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<input type="text" id="endText" onfocus="WdatePicker()" class="text20 date" value="${param.end}" readonly="readonly"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="end" name="end" value="<c:out value="${param.end}"></c:out>"/>
					支付机构：<select id="poSelect" name="poId">
						<option value="">请选择支付机构</option>
						<c:forEach items="${paymentOrgList}" var="paymentOrg">
							<option value="${paymentOrg.poId}" <c:if test="${paymentOrg.poId==param.poId}">selected="selected"</c:if>><c:out value="${paymentOrg.poName}"></c:out></option>
						</c:forEach>
					</select>
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
					<span id="searchTip" class="red" style="display:none">请补齐查询条件！</span>
				</p>
			</div>
	    	<div class="page_c">
		        <span class="l">
		        </span>
		        <span class="r inb_a">
		            <input type="button"  class="btn80x20" value="导出查询结果" onclick="exportPayRecord()" />
		        </span>
	  		</div>
			<table cellspacing="0" summary="" class="tab">
				<thead>
				    <th>支付流水号</th>
					<th>支付单日期</th>
					<th>订单号</th>
					<th>订单日期</th>
					<th>支付机构</th>
		            <th>支付工具标识</th>
		            <th>付款币种</th>
					<th>付款金额</th>
					<th>付款方</th>
					<th>支付单状态</th>
		            <th>订单支付状态</th>
				</thead>
				<tbody>
					<c:forEach items="${pagination.list}" var="payRecord">
						<tr>
							<td><c:out value="${payRecord.payRecordNum}"></c:out></td>
							<td><fmt:formatDate value="${payRecord.tradeCreatedate}"pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${payRecord.orderNum}"></c:out></td>
							<td><fmt:formatDate value="${payRecord.orderTime}"pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${payRecord.poName}"></c:out></td>
							<td><c:out value="${payRecord.olbankName}"></c:out></td>
							<td><c:out value="RMB"></c:out></td>
							<td><fmt:formatNumber value="${payRecord.tradeAmount/100 }" pattern="#0.00" /></td>
							<td><c:out value="${payRecord.userName}"></c:out></td>
							<td>
								<c:choose>
									<c:when test="${payRecord.tradeStatus==1}">支付创建</c:when>
									<c:when test="${payRecord.tradeStatus==2}">支付成功</c:when>
									<c:when test="${payRecord.tradeStatus==3}">支付关闭</c:when>
									<c:when test="${payRecord.tradeStatus==4}">支付撤销</c:when>
									<c:when test="${payRecord.tradeStatus==5}">支付失败</c:when>
									<c:when test="${payRecord.tradeStatus==99}">系统未响应</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${payRecord.isPaid==0}">待付款</c:when>
									<c:when test="${payRecord.isPaid==1}">付款成功</c:when>
									<c:when test="${payRecord.isPaid==2}">待退款</c:when>
									<c:when test="${payRecord.isPaid==3}">退款成功</c:when>
									<c:when test="${payRecord.isPaid==4}">退款失败</c:when>
									<c:when test="${payRecord.isPaid==5}">撤销成功</c:when>
									<c:when test="${payRecord.isPaid==6}">撤销失败</c:when>
									<c:when test="${payRecord.isPaid==7}">关闭</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page_c">
		        <span class="r page">
		            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
		            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
		            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
		            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
		            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
		            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
		            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
		            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
					共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
		        </span>
		    </div>
		</form>
</div></div>
</body>