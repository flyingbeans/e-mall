<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>订单支付总览_支付管理</title>
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
	function compareDate(sod,eod){
		sod = sod.replace(/\-/gi,"/");
		eod = eod.replace(/\-/gi,"/");
		if(Date.parse(sod)>Date.parse(eod)){
			return false;
		}else{
			return true;
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
	function seekTag() {
		var isPaid = $("#isPaid").val();
		$("#label"+isPaid).attr("class","here");
	}
	function checkOrderNumber(orderNum){
		var regs = /^[0-9a-zA-Z]+$/;
		if(regs.test(orderNum)){
			return true;
		}else{
			return false;
		}
	}
	
	$(function(){
		seekTag();
		pageInitialize('#form1');
		$("#showButton").attr("class","alg_c");
		$("#tipDivClose").click(function(){
			window.location.href="${base}/payment/listOrderPayment.do?orderNum=${param.orderNum}&start=${param.start}&end=${param.end}&isPaid=${param.isPaid}";
		});
		$("#tipDivOk").click(function(){
			window.location.href="${base}/payment/listOrderPayment.do?orderNum=${param.orderNum}&start=${param.start}&end=${param.end}&isPaid=${param.isPaid}";
		});
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
	
	function submitForm(){
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
		//if($("#orderNum").val()==""||$("#begin").val()==""||$("#end").val()==""){
		//	$("#searchTip").show("slow");
		//}else{
			document.getElementById("form1").submit();
		//}
	}
	function reverse(orderNum) {
		tipShow("#payRecordMemoDiv");
		$("#payRecordMemoOk").click(function(){
			var memo = $("#payRecordMemo").val();
			if(memo.length>200){
				$("#payRecordMemoDivErr").html("<label>&nbsp;</label>备注应少于200个字符");
				$("#payRecordMemoDivErr").show("slow");
				return;
			}
			tipHide("#payRecordMemoDiv");
			tipShow("#refundLoadDiv");
			$.ajax({
				url:"reverse.do",
				method:"post",
				data:{
					orderNum:orderNum,
					memo:encodeURI(memo)
				},
				dataType:"text",
				success:function(data){
					tipHide("#refundLoadDiv");
					tipShow("#tipDiv");
					if(data=="success"){
						$("#tipDivH2").text("成功提示");
						$("#tipText").text("冲正成功！");
					}else{
						$("#tipDivH2").text("失败提示");
						$("#tipText").text("冲正失败！");
					}
				}
			});
		});
		$("#payRecordMemoClose").click(function(){
			tipHide("#payRecordMemoDiv");
		});
	}
	function refund(orderNum) {
		tipShow("#payRecordMemoDiv");
		$("#payRecordMemoOk").click(function(){
			var memo = $("#payRecordMemo").val();
			if(memo==null || $.trim(memo)==""){
				$("#payRecordMemoDivErr").html("<label>&nbsp;</label>*备注不能为空！");
				$("#payRecordMemoDivErr").show("slow");
				return;
			}
			if(memo.length>200){
				$("#payRecordMemoDivErr").html("<label>&nbsp;</label>*备注应少于200个字符！");
				$("#payRecordMemoDivErr").show("slow");
				return;
			}
			tipHide("#payRecordMemoDiv");
			tipShow("#refundLoadDiv");
			$.ajax({
				url:"refund.do",
				method:"post",
				data:{
					orderNum:orderNum,
					memo:encodeURI(memo)
				},
				dataType:"text",
				success:function(data){
					tipHide("#refundLoadDiv");
					tipShow("#tipDiv");
					/* if(data=="success"){
						$("#tipDivH2").text("成功提示");
						$("#tipText").text("退款成功！");
					}else{
						$("#tipDivH2").text("失败提示");
						$("#tipText").text("退款失败！");
					} */
					var obj=eval("("+data+")");
					if(obj._status=="success"){
						$("#tipDivH2").text("成功提示");
						$("#tipText").text("退款成功！");
					}else if(obj._status="aliRefundSuccess"){
						$("#tipDivH2").text("成功提示");
						$("#tipText").text(obj._mes);
					}else{
						$("#tipDivH2").text("失败提示");
						$("#tipText").text(obj._mes);
					}
				}
			});
		});
		$("#payRecordMemoClose").click(function(){
			tipHide("#payRecordMemoDiv");
		});
	}
	function revocation(orderNum) {
		tipShow("#payRecordMemoDiv");
		$("#payRecordMemoOk").click(function(){
			var memo = $("#payRecordMemo").val();
			if(memo.length>200){
				$("#payRecordMemoDivErr").html("<label>&nbsp;</label>备注应少于200个字符");
				$("#payRecordMemoDivErr").show("slow");
				return;
			}
			tipHide("#payRecordMemoDiv");
			tipShow("#refundLoadDiv");
			$.ajax({
				url:"revocation.do",
				method:"post",
				data:{
					orderNum:orderNum,
					memo:encodeURI(memo)
				},
				dataType:"text",
				success:function(data){
					tipHide("#refundLoadDiv");
					tipShow("#tipDiv");
					if(data=="success"){
						$("#tipDivH2").text("成功提示");
						$("#tipText").text("撤销成功！");
					}else{
						$("#tipDivH2").text("失败提示");
						$("#tipText").text("撤销失败！");
					}
				}
			});
		});
		$("#payRecordMemoClose").click(function(){
			tipHide("#payRecordMemoDiv");
		});
	}
	
	function exportOrderPayment(){
		var form = document.getElementById("form1");
		form.action = "${base}/payment/exportOrderPayment.do";
		form.submit();
		form.action = "${base}/payment/listOrderPayment.do";
	}
	
	function changeStatus(orderNum){
		tipShow("#refundLoadDiv");
		$.ajax({
			url:"changeStatus.do",
			method:"post",
			data:{
				orderNum:orderNum
			},
			dataType:"text",
			success:function(data){
				tipHide("#refundLoadDiv");
				tipShow("#tipDiv");
				if(data=="success"){
					$("#tipDivH2").text("成功提示");
					$("#tipText").text("手动更改状态成功！");
				}else{
					$("#tipDivH2").text("失败提示");
					$("#tipText").text("手动更改状态失败！");
				}
			}
		});
	}

</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content" style="overflow:auto">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<span class="gray">订单支付总览</span>
	    </div>
	    
	    <h2 class="h2_ch"><span id="tabs" class="l">
	        <a id="label" href="${base}/payment/listOrderPayment.do" title="全部" class="nor">全部</a>
	        <a id="label0" href="${base}/payment/listOrderPayment.do?isPaid=0" title="待付款" class="nor">待付款</a>  
	        <a id="label1" href="${base}/payment/listOrderPayment.do?isPaid=1" title="付款成功" class="nor">付款成功</a>
	        <a id="label7" href="${base}/payment/listOrderPayment.do?isPaid=7" title="关闭" class="nor">关闭</a>
	        <%--
	        <a id="label5" href="${base}/payment/listOrderPayment.do?isPaid=5" title="撤销成功" class="nor">撤销成功</a>  
	        <a id="label6" href="${base}/payment/listOrderPayment.do?isPaid=6" title="撤销失败" class="nor">撤销失败</a>
	        --%>
	        <a id="label2" href="${base}/payment/listOrderPayment.do?isPaid=2" title="待退款" class="nor">待退款</a>
	        <a id="label3" href="${base}/payment/listOrderPayment.do?isPaid=3" title="退款成功" class="nor">退款成功</a>
	        <a id="label4" href="${base}/payment/listOrderPayment.do?isPaid=4" title="退款失败" class="nor">退款失败</a>  
	    </span></h2>
	    
		<form id="form1" name="form1" action="${base}/payment/listOrderPayment.do" method="post">
			<input type="hidden" id="isPaid" name="isPaid" value="<c:out value='${param.isPaid}'></c:out>" />
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
					<!-- 
						支付机构：<select id="poSelect" name="poId">
							<option value="">请选择支付机构</option>
							<c:forEach items="${paymentOrgList}" var="paymentOrg">
								<option value="${paymentOrg.poId}" <c:if test="${paymentOrg.poId==param.poId}">selected="selected"</c:if>><c:out value="${paymentOrg.poName}"></c:out></option>
							</c:forEach>
						</select>
					-->
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
					<span id="searchTip" class="red" style="display:none">请补齐查询条件！</span>
				</p>
			</div>
	    	<div class="page_c">
		        <span class="l">
		        </span>
		        <span class="r inb_a">
		           <input type="button"  class="btn80x20" value="导出查询结果" onclick="exportOrderPayment()" />
		        </span>
	  		</div>
			<table cellspacing="0" summary="" class="tab">
				<thead>
				    <th>订单号</th>
					<th>订单日期</th>
					<th>支付日期</th>
					<%--
					<th>支付机构</th>
		            <th>支付工具标识</th>
					--%>
		            <th>付款币种</th>
					<th>付款金额</th>
					<th>付款方</th>
					<th>退款日期</th>
		            <th>退款币种</th>
		            <th>退款金额</th>
					<th>退款方</th>
					<th>订单支付状态</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${pagination.list}" var="orderPayment">
						<tr>
							<td><c:out value="${orderPayment.orderNum}" default="---"></c:out></td>
							<td><fmt:formatDate value="${orderPayment.orderTime}"pattern="yyyy-MM-dd" /></td>
							<td>
							<c:choose>
								<c:when test="${not empty orderPayment.payTime}">
									<fmt:formatDate value="${orderPayment.payTime}"pattern="yyyy-MM-dd" /></td>
								</c:when>
								<c:otherwise>
									---
								</c:otherwise>
							</c:choose>
							<%--
							<td class="nwp"><c:out value="${orderPayment.poName}" default="---"></c:out></td>
							<td class="nwp"><c:out value="${orderPayment.olbankName}" default="---"></c:out></td>
							--%>
							<td>
								<c:choose>
									<c:when test="${not empty orderPayment.paidAmount}">
										<c:out value="RMB"></c:out>
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<%--
									<c:choose>
										<c:when test="${orderPayment.buziType==4||orderPayment.buziType==null}">
											<fmt:formatNumber value="${orderPayment.orderSum/100}" pattern="#0.00" />
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${orderPayment.tradeAmount/100}" pattern="#0.00" />
										</c:otherwise>
									</c:choose>		
								--%>
								<c:choose>
									<c:when test="${not empty orderPayment.paidAmount}">
										<fmt:formatNumber value="${orderPayment.paidAmount/100}" pattern="#0.00" />
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td class="nwp"><c:out value="${orderPayment.userName}"></c:out></td>
							<td>
								<c:choose>
									<c:when test="${not empty orderPayment.refundDate}">
										<fmt:formatDate value="${orderPayment.refundDate}" pattern="yyyy-MM-dd" />
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${not empty orderPayment.refundAmount}">
										<c:out value="RMB"></c:out>
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${not empty orderPayment.refundAmount}">
										<fmt:formatNumber value="${orderPayment.refundAmount/100}" pattern="#0.00" />
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${not empty orderPayment.refundAmount}">
										<c:out value="${orderPayment.userName}"></c:out>
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td class="nwp">
								<c:choose>
									<c:when test="${orderPayment.isPaid==0}">待付款</c:when>
									<c:when test="${orderPayment.isPaid==1}">付款成功</c:when>
									<c:when test="${orderPayment.isPaid==2}">待退款</c:when>
									<c:when test="${orderPayment.isPaid==3}">退款成功</c:when>
									<c:when test="${orderPayment.isPaid==4}">退款失败</c:when>
									<%--
									<c:when test="${orderPayment.isPaid==5}">撤销成功</c:when>
									<c:when test="${orderPayment.isPaid==6}">撤销失败</c:when>
									--%>
									<c:when test="${orderPayment.isPaid==7}">关闭</c:when>
									<c:otherwise>---</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<%-- <c:when test="${orderPayment.isPaid==0}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a>&nbsp;&nbsp;<a href="###" onclick="reverse('<c:out value='${orderPayment.orderNum}'></c:out>')">冲正</a></c:when> --%>
									<c:when test="${orderPayment.isPaid==0}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a></c:when>  
									<c:when test="${orderPayment.isPaid==1}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a></c:when>
									<c:when test="${orderPayment.isPaid==2}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a><ui:permTag src="/ecps/console/payment/refund.do">&nbsp;&nbsp;<a href="###" onclick="refund('<c:out value='${orderPayment.orderNum}'></c:out>')">退款</a></ui:permTag></c:when>
									<c:when test="${orderPayment.isPaid==3}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a></c:when>
									<c:when test="${orderPayment.isPaid==4}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a><ui:permTag src="/ecps/console/payment/refund.do">&nbsp;&nbsp;<a href="###" onclick="refund('<c:out value='${orderPayment.orderNum}'></c:out>')">再次退款</a></ui:permTag>&nbsp;&nbsp;<a href="###" onclick="changeStatus('<c:out value='${orderPayment.orderNum}'></c:out>')">更改状态</a></c:when>
									<%--
									<c:when test="${orderPayment.isPaid==5}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a></c:when>
									<c:when test="${orderPayment.isPaid==6}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a>&nbsp;&nbsp;<a href="###" onclick="revocation('<c:out value='${orderPayment.orderNum}'></c:out>')">再次撤销</a></c:when>
									--%>
									<c:when test="${orderPayment.isPaid==7}"><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a></c:when>
									<c:otherwise><a href="${base}/payment/listOrderPayRecordDetail.do?orderId=${orderPayment.orderId}">查看</a></c:otherwise>
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