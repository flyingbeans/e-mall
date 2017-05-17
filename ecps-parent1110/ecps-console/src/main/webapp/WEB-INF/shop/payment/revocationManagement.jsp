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
	function emptyOrderNum2(){
		if($("#orderNumText2").val()=="请输入订单号"){
			$("#orderNumText2").val("");
			$("#orderNumText2").attr("class","text20 medium");
		}
	}
	function checkOrderNum2(){
		if($("#orderNumText2").val()==""){
			$("#orderNumText2").val("请输入订单号");
			$("#orderNumText2").attr("class","text20 medium gray");
		}
	}
	function emptymemoArea(){
		if($("#memoArea").val()=="请输入200个字符内的备注"){
			$("#memoArea").val("");
			$("#memoArea").attr("class","text20 medium");
		}
	}
	function checkmemoArea(){
		if($("#memoArea").val()==""){
			$("#memoArea").val("请输入200个字符内的备注");
			$("#memoArea").attr("class","text20 medium gray");
		}
	}
	function emptyBegin(){
		$("#beginText").val("");
		$("#beginText").attr("class","text20 date");
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
	function exportPayRecord(){
		var form = document.getElementById("form1");
		form.action = "${base}/payment/exportPayRecord.do";
		form.submit();
		form.action = "${base}/payment/listPayRecord.do";
	}
	$(function(){
		pageInitialize('#form1');
		$("#orderNumText2").click(function(){
			emptyOrderNum2();
		});
		$("#orderNumText2").blur(function(){
			checkOrderNum2();
		});
		$("#orderNumText").click(function(){
			emptyOrderNum();
		});
		$("#orderNumText").blur(function(){
			checkOrderNum();
		});
		$("#memoArea").click(function(){
			emptymemoArea();
		});
		$("#memo").blur(function(){
			checkMemo();
		});
		$("#tipDivClose").click(function(){
			window.location.href="${base}/payment/revocationManagement.do";
			});
		$("#tipDivOk").click(function(){
			window.location.href="${base}/payment/revocationManagement.do";
		}); 
		
		$("#orderNumText2,#memoArea").keypress(function(event){
			if (event.keyCode == '13') {
				event.preventDefault();
				submitForm2();
			}
		});
		
		<c:if test="${empty param.start}">
			$("#beginText").click(function(){
				emptyBegin();
			});
		</c:if>
	});
	
	function checkRevocatedOrder(orderNumForRevocate,poId){
		var status;
		$.ajax({
			type:"POST",
			async:false,
			url:"${base}/payment/revocationCheckAjax.do",
			data:("orderNum="+orderNumForRevocate+"&poId="+poId),
			success:function(responseText,statusText){
				var obj=eval("("+responseText+")");
				if(obj._status == "true"){
					status = true;
				}else{
					tipShow("#tipDiv");
					$("#tipText").text(obj._mes);
					status = false;
				}
			}
		});
		return status;
	}
	
	function submitForm2(){
		if($("#orderNumText2").val()!="请输入订单号"){
			$("#orderNumForRevocate").val($("#orderNumText2").val());
		}else{
			$("#orderNumForRevocate").val("");
		}
		if($("#memoArea").val()!="请输入200个字符内的备注"){
			$("#memo").val(encodeURI($("#memoArea").val()));
		}else{
			$("#memo").val("");
		}
		if($("#memo").val().length>200){
			alert("撤销说明不能大于200个字符");
			return false;
		}
		if($("#orderNumForRevocate").val()!=""&&!checkOrderNumber($("#orderNumForRevocate").val())){
			alert("订单号只能包含数字和字母!");
			$("#orderNumText2").val("");
			checkOrderNum2();
			return false;
		}
		if($("#memo").val()==""||$("#orderNumForRevocate").val()==""||$("#poSelect").val()==""){
			alert("请补齐撤销条件");
			return false;
		}
		//ajax校验订单在电商侧的状态
		if(!checkRevocatedOrder($("#orderNumForRevocate").val(),$("#poSelect").val())){
			return false;
		}
		//进行撤销
		var orderNumForRevocate=$("#orderNumForRevocate").val()
		var poId=$("#poSelect").val();
		var memo=$("#memo").val();
		tipShow("#refundLoadDiv");
		$.ajax({
			type:"POST",
			async:false,
			url:"${base}/payment/doRevocation.do",
			data:("orderNumForRevocate="+orderNumForRevocate+"&poId="+poId+"&memo="+memo),
			success:function(responseText,statusText){
				tipHide("#refundLoadDiv");
				tipShow("#tipDiv");
				var obj=eval("("+responseText+")");
				if(obj._status == "true"){
					$("#tipDivH2").text("成功提示");
					$("#tipText").text(obj._mes); 
				}else if(obj._status="aliRefundSuccess"){
					$("#tipDivH2").text("成功提示");
					$("#tipText").text(obj._mes);
				}else{
					$("#tipDivH2").text("失败提示");
					$("#tipText").text(obj._mes); 
				}
			}
		});
		
		
	}
	
	function submitForm() {
		if($("#orderNumText").val()!="请输入订单号"){
			$("#orderNumForSearch").val($("#orderNumText").val());
		}else{
			$("#orderNumForSearch").val("");
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
		if($("#orderNumForSearch").val()!=""&&!checkOrderNumber($("#orderNumForSearch").val())){
			alert("订单号只能包含数字和字母!");
			$("#orderNumText").val("");
			checkOrderNum();
			return false;
		}
		//if($("#orderNum").val()==""||$("#begin").val()==""||$("#end").val()==""||$("#poSelect").val()==""){
			//$("#searchTip").show("slow");
			//return false;
		//}else{
			document.getElementById("form1").submit();
		//}
	}

</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<span class="gray">撤销管理</span>
	    </div>
	    
	    <form id="form2" name="form2" action="${base}/payment/doRevocation.do" method="post">
	    	<div class="sch" style="background-color:#FFF0B3;border:1px solid #FF9900;">
	    		<div style="float:left;height: 60px; " >
	    		&nbsp;&nbsp;<label class="alg_t"><samp style="color:#ff0000">*</samp>订单号：</label>
	    		<c:choose>
	    			<c:when test="${empty param.orderNumForRevocate }">
	    				<input type="text" id="orderNumText2" class="text20 medium gray" value="请输入订单号"/>
	    			</c:when>
	    			<c:otherwise>
	    				<input type="text" id="orderNumText2" class="text20 medium " value="${param.orderNumForRevocate }"/>
	    			</c:otherwise>
	    		</c:choose>
	    		<input type="hidden" id="orderNumForRevocate" name="orderNumForRevocate" value="<c:out value='${param.orderNumForRevocate}'/>" />
	    		<br><br>
	    		&nbsp;&nbsp;<samp style="color:#ff0000">*</samp>支付机构：
	    		<select id="poSelect" name="poId">
					<option value="">请选择支付机构</option>
					<c:forEach items="${paymentOrgList}" var="paymentOrg">
							<option value="${paymentOrg.poId}" <c:if test="${paymentOrg.poId==param.poId}">selected="selected"</c:if>><c:out value="${paymentOrg.poName}"></c:out></option>
					</c:forEach>
				</select>
				</div>
				<div style="float:left;height: 60px;" >
				<label class="alg_t"><samp style="color:#ff0000">*</samp>撤销说明：</label>
	    		<c:choose>
	    			<c:when test="${empty param.memo}">
	    				<textarea id="memoArea" name="memoArea" class="are text20 medium gray" rows="3" cols="100"  style="width: 400px; height: 50px;resize:none;">请输入200个字符内的备注</textarea>
	    			</c:when>
	    			<c:otherwise>
	    				<textarea id="memoArea" name="memoArea" rows="3" cols="100"  style="width: 400px; height: 50px;resize:none;"><c:out value="${param.memo}"></c:out></textarea>
	    			</c:otherwise>
	    		</c:choose>
	    		<input type="hidden" id="memo" name="memo" value="<c:out value='${param.memo}'/>" />
	    		</div>
	    		<div style="float:left;height: 60px;" >
	    		<input type="button" onclick="submitForm2()" class="hand btn60x20" value="撤销"/>
	    		</div>
	    	</div>
	    </form>
	    
		<form id="form1" name="form1" action="${base}/payment/revocationManagement.do" method="post">
			<div class="sch">
				<p>
					订单号：
					<c:choose>
	        			<c:when test="${empty param.orderNumForSearch}">
	        				<input type="text" id="orderNumText" class="text20 medium gray" value="请输入订单号"/>
	        			</c:when>
	        			<c:otherwise>
	        				<input type="text" id="orderNumText" class="text20 medium" value="${param.orderNumForSearch}"/>
	        			</c:otherwise>
	        		</c:choose>
	        		<input type="hidden" id="orderNumForSearch" name="orderNumForSearch" value="<c:out value='${param.orderNumForSearch}'></c:out>"/>
					发起日期：
					<c:choose>
						<c:when test="${empty param.start}">
							<input type="text" id="beginText" onfocus="WdatePicker()" class="text20 date gray" value="请选择起始日期" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<input type="text" id="beginText" onfocus="WdatePicker()" class="text20 date" value="${param.start}" readonly="readonly"/>
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="begin" name="start" value="<c:out value='${param.start}'></c:out>"/>
					操作结果：<select id="opSelect" name="opSelect">
						<option value="">请选择操作结果</option>
						<option value="2" <c:if test="${param.opSelect==2 }">selected="selected"</c:if>>撤销成功</option>
						<option value="5" <c:if test="${param.opSelect==5 }">selected="selected"</c:if>>撤销失败</option>
					</select>
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
				</p>
			</div>
			<table cellspacing="0" summary="" class="tab">
				<thead>
				    <th>发起日期</th>
					<th>订单号</th>
					<th>退款流水号</th>
					<th>支付机构</th>
					<th>发起人</th>
		            <th>金额(元)</th>
		            <th>操作结果</th>
					<th>撤销说明</th>
				</thead>
				<tbody>
					<c:forEach items="${pagination.list}" var="payRecord">
						<tr>
							<td><fmt:formatDate value="${payRecord.tradeCreatedate}"pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${payRecord.orderNum}"></c:out></td>
							<td><c:out value="${payRecord.payRecordNum}"></c:out></td>
							<td><c:out value="${payRecord.poName}"></c:out></td>
							<td><c:out value="${payRecord.oparetorName}"></c:out></td>
							<td><fmt:formatNumber value="${payRecord.tradeAmount/100}" pattern="#0.00" /></td>
							<td>
							<c:choose>
									<c:when test="${payRecord.tradeStatus==2}">撤销成功</c:when>
									<c:when test="${payRecord.tradeStatus==5}">撤销失败</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
							</td>
							<td class="nwp"><c:out value="${payRecord.memo}"></c:out></td>
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