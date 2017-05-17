<%@ page language="java" errorPage="/ecps/console/error.jsp"
	pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>

<title>订单详情_待付款单_<fmt:message key="OrderMgmtMenu.title" /></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
<meta name="menu" content="OrderMgmtMenu" />
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function(){
	var obj=null;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
			tObj = $(this);
			
		});
	});
	$(".sub1").click(function(){
		//获得点击按钮的值
		var outcome = $(this).val();
		$("#outcome").val(outcome);
	    tipShow('#addItemNote');
	});
	$("#addItemNoteConfirm").click(function(){
		$("#taskForm").submit();
	})
});
function getBzqd(spid) {
	$.ajax({
		type : "POST",
		async : false,
		url : "${path}/order/packetAjaxList.do?itemNo="+spid,
		success : function(responseText) {
			var dataObj = eval("(" + responseText + ")");
			var txt = dataObj[0].txt;
			$('#spqd').html(txt);
			tipShow('#spqdDiv');
		}
	});
	
}
</script>
</head>
<body id="main">
	<%
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<div class="frameL"><div class="menu icon">
		<jsp:include page="/${system}/common/ordermenu.jsp"/>
	</div></div>
	<form id="taskForm" action="${path }/order/completeTask.do" method="post">
		<input type="hidden" name="orderId" value="${tb.order.orderId }">
		<input type="hidden" name="taskId" value="${tb.task.id }">
		<input type="hidden" name="outcome" id="outcome">
	</form>
	<div class="frameR"><div class="content">
				<div class="loc icon">
						<samp class="t12"></samp>
						当前位置：订单管理&nbsp;&raquo;&nbsp;未付款单&nbsp;&nbsp;<span
							class="gray" title="订单详情"></span>
				
				</div>
				<form id="myForm" action="${path}/order/orderPay/oper.do"
					method="post">
					<input type="hidden" id="orderId" value="${tb.order.orderId }">

					<div class="sch page_c">
						<span class="l">订单号：<b class="red"><var>${tb.order.orderNum}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${tb.order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></var>&nbsp;&nbsp;&nbsp;<b class="f14 blue"> 
							<c:forEach items="${tb.outcomes }" var="outcome">
							<input name="r" type="button" id="completeCall" class="pointer sub1 red" value="${outcome }" />
							</c:forEach>
							 
							
						<input type="hidden" id="why"/>
						</span>
					</div>

	<h2 class="h2_ch"><span id="tabs" class="l">
	<a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
	<a href="javascript:void(0);" ref="#tab_2" title="支付信息" class="nor">支付信息</a>
	<a href="javascript:void(0);" ref="#tab_3" title="操作记录" class="nor">操作记录</a>
	</span>
	<span class="r"><input type="button" class="pointer" onclick="window.open('${base}/order/preview.do?orderId=${ebco.orderId}&type=15','_blank','height=300,width=500,scrollbars=yes,location=no,resizable=yes')" value="打印订单" /><input type="button" class="pointer" onclick="window.history.back(-1);" value="返回列表" /></span>
	</h2>

   <div id="tab_1">
		<!-- 基本信息 -->
		<table cellspacing="0" summary="" class="tab4">
			 <tr>
				<th width="12%">归属地：</th>
				<td width="21%" class="nwp">${tb.order.areaName}</td>
				<th width="12%">购买类型：</th>
				<td width="21%" class="nwp">
					常规
				</td>
				
				<th width="12%">
				</th>
				<td class="nwp">
				</td>
					
			</tr> 
			<tr>
				<th width="12%">下单用户：</th>
				<td width="21%" class="nwp">${tb.order.username}</td>
				<th width="12%">支付方式:</th>
				<td class="nwp">
					<c:if test="${tb.order.payment == 1 }">在线支付</c:if>
					<c:if test="${tb.order.payment == 2 }">货到付款</c:if>
				</td>
						
					
			</tr>
			<c:if test="${tb.order.payable != 0}">
				<tr>
					<th>发票抬头：</th>
					<td class="nwp">
					<c:if test="${tb.order.payable == 1 }">个人</c:if>
					<c:if test="${tb.order.payable == 1 }">单位</c:if>
					
					</td>
					<th>单位名称：</th>
					<td width="21%" class="nwp">${tb.order.company}</td>
					<th width="12%">发票内容：</th>
					<td class="nwp">
						<c:if test="${tb.order.contents == 1 }">个人</c:if>
						<c:if test="${tb.order.contents == 2 }">单位</c:if>
					</td>
				</tr>
			</c:if>
			<tr>
				<th>送货方式：</th>
				<td>
					<c:choose>
						<c:when test="${tb.order.deliveryMethod == 1 }">
							快递
						</c:when>
						<c:when test="${tb.order.deliveryMethod == 2 }">
							营业厅自提
						</c:when>
					</c:choose>
				<th>送货时间：</th>
				<td>
					<c:choose>
						<c:when test="${tb.order.delivery == 1 }">
							只工作日送货(双休日，假日不用送)
						</c:when>
						<c:when test="${tb.order.delivery == 2 }">
							工作日、双休日、假日均可送货
						</c:when>
						<c:otherwise>
							只双休日、假日送货(工作日送货)
						</c:otherwise>
					</c:choose>
				</td>
				<th>送货前电话确认：</th>
				<td>
					<c:choose>
						<c:when test="${tb.order.isConfirm == 1 }">
							是
						</c:when>
						<c:otherwise>
							否
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>收货人：</th>
				<td class="nwp">${tb.order.shipName}</td>
				<th>联系方式：</th>
				<td><var>
					${tb.order.phone }
				</var></td>
				<th>邮编：</th>
				<td><var>${tb.order.zipCode}</var></td>
			</tr>
			<tr>
				<th>收货地址：</th>
				<td class="nwp" colspan="5">
				${tb.order.province}&nbsp;
				${tb.order.city}&nbsp;
				${tb.order.district}&nbsp;
				${tb.order.addr}
				</td>
			</tr>
			<tr>
				<th>用户备注:</th>
				<td class="nwp" colspan="5">${tb.order.notes}</td>
			</tr>
		</table>
		
	<!-- 根据分类显示详情 -->
		<%-- 裸机/团购裸机 /秒杀裸机--%>
			<table cellspacing="0" summary="" class="tab3">
				<tr>
					<th width="12%">商品编号</th>
					<th width="12%">商品名称</th>
					<th width="15%">规格</th>
					<th width="15%">包装清单</th>
					<th width="15%">单价</th>
					<th>数量</th>
					<th>串号</th>
				</tr>
				<c:forEach items="${tb.order.detailList}" var="orderDetail">
				<tr>
					<td>${orderDetail.itemNo}</td>
					<td class="nwp">${orderDetail.itemName}</td>
					<td>${orderDetail.skuSpec}</td>
					<td><a href="javascript:void(0);" onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>
					<td>${orderDetail.skuPrice}</td>
					<td>${orderDetail.quantity}个</td>
					<td>${orderDetail.seriescode}</td>
				</tr>
				</c:forEach>
			</table>
		<%-- 号卡 --%>
		
	
	<!-- 金额合计 -->
		<div class="page_c">
			<span class="r">商品金额合计：${tb.order.orderSum }元&nbsp;&nbsp;&nbsp;
					 运费：0.00元 &nbsp;&nbsp;&nbsp; 应付金额： <b class="f16 red">${tb.order.orderSum }元</b>
			</span>
		</div>
							
	</div>

<div id="tab_2" style="display: none">
	<table cellspacing="0" summary="" class="tab3">
		<tr><th width="12%">支付流水号：</th><td>${epr.payRecordNum}</td></tr>
		<tr><th width="12%">支付方式：</th><td>
			<c:if test="${tb.order.payment == 1 }">在线支付</c:if>
			<c:if test="${tb.order.payment == 2 }">货到付款</c:if>
		</td></tr>
		<tr><th width="12%">支付平台：</th><td>${epr.poName}</td></tr>
		<tr><th width="12%">支付金额：</th><td><fmt:formatNumber value="${ebco.ebtb.order.orderSum/100}" pattern="#0.00"/>元</td></tr>
		<tr><th width="12%">支付状态：</th><td>
		
		<c:if test="${tb.order.isPaid == 0 }">未付</c:if>
			<c:if test="${tb.order.isPaid == 1 }">已付</c:if>
		</td></tr>
		<tr><th width="12%">付款时间：</th><td><var><fmt:formatDate value="${order.payTime}" pattern="yyyy-MM-dd HH:mm:ss" /></var></td></tr>
		<tr><th width="12%">到账时间：</th><td><var><fmt:formatDate value="${order.depositTime}" pattern="yyyy-MM-dd" /></var></td></tr>
	</table>
</div>		

					
<div id="tab_3" style="display: none">
	<%-- <table cellspacing="0" summary="" class="tab">
		<tr> 
		<th width="12%">操作类型</th> 
		<th width="12%">操作时间</th> 
		<th width="15%">操作人</th> 
		<th>操作备注</th> 
		</tr> 
		<c:forEach items="${ebJbpmLog}" var="e"> 
		<tr> 
		<td>${e.oper}</td> 
		<td><fmt:formatDate value="${e.operTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> 
		<td class="nwp">${e.operUser}</td> 
		<td class="nwp"><c:out value="${e.note}"/></td>
		</tr> 
		</c:forEach> 
	</table>  --%>
</div>
				</form>
				
</div></div>
</body>

