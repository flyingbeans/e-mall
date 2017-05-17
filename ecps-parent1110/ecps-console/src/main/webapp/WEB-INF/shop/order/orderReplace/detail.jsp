<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>订单详情_换货单_<fmt:message key="OrderMgmtMenu.title" /></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
<meta name="menu" content="OrderMgmtMenu" />
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function(){
	var obj = null;
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
		obj=$(this);
		$("#errorInfoAdd").html("<label>&nbsp;</label>");
	    $("#itemNote").val("");
	    tipHide("#errorInfoAdd");
	    var d=$("#addItemNote h2").attr("title","系统提示").html("系统提示");
		tipShow('#addItemNote');
	});
	$("input[id='addItemNoteConfirm']").click(function(){
		if(obj==null){
			return;
		}
		var a=$("#myForm");
		var itemNote=$("#itemNote").val();
		if(itemNote.length>200){
			tipShow("#errorInfoAdd");
			$("#errorInfoAdd").html("<label>&nbsp;</label>操作备注不能大于200个字符");
			return;
		}
		a.append('<input type="hidden" name="note"  value="'+itemNote+'"/>');
		a.append('<input type="hidden" name="r"  value="'+obj.val()+'"/>');
		a.submit();
        tipHide('#addItemNote');
	});
});
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

	<div class="frameR"><div class="content">

				<div class="loc icon">
					<c:if test="${oprType == '1'}">
						<samp class="t12"></samp>
						<fmt:message key='menu.current.loc' />：<fmt:message
							key='OrderMgmtMenu.title' />&nbsp;&raquo;&nbsp;订单总览&nbsp;&nbsp;<span
							class="gray" title="订单详情"></span>
					</c:if>
					<c:if test="${oprType == '2'}">
						<samp class="t12"></samp>
						<fmt:message key='menu.current.loc' />：<fmt:message
							key='OrderMgmtMenu.title' />&nbsp;&raquo;&nbsp;有效订单&nbsp;&nbsp;<span
							class="gray" title="订单详情"></span>
					</c:if>
					<c:if test="${oprType==null}">
						<samp class="t12"></samp>
						<fmt:message key='menu.current.loc' />：<fmt:message
							key='OrderMgmtMenu.title' />&nbsp;&raquo;&nbsp;换货单&nbsp;&nbsp;<span
							class="gray" title="订单详情"></span>
					</c:if>
				</div>
				<form id="myForm" action="${path}/order/orderReplace/oper.do" method="post">
					<input type="hidden" name="taskId" value="${taskId}" /> <input
						type="hidden" name="userId" value="${userId}" /> <input
						type="hidden" name="oprType" value="${oprType}" /> <input
						type="hidden" name="orderNum" value="${ebco.ebOrder.orderNum}" />

	<div class="sch page_c">
		<span class="l">订单号：<b class="red"><var>${ebco.ebOrder.orderNum}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${ebco.ebOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></var>&nbsp;&nbsp;&nbsp;<b class="f14 blue"><ui:orderModule var="${ebco.ebOrder.orderState}" type="7" /></b>&nbsp;&nbsp;&nbsp;
		<c:if test="${ebco.ebOrder.orderState == 18 && oprType !=1}">
		<ui:permTag src="/ecps/console/order/orderReplace/oper.do">
		<input name="r" class="hand btn83x23 sub1" type="button" value="同意" />
		<input name="r" class="hand btn83x23 sub1" type="button" value="拒绝" />
		</ui:permTag>
		</c:if>
		</span>
	</div>

	<h2 class="h2_ch">
	<span id="tabs" class="l">
	<a href="javascript:void(0);" ref="#tab_1" title="申请信息" class="here">申请信息</a>
	<c:if test="${ebco.ebOrder.orderState != 18}">
	<a href="javascript:void(0);" ref="#tab_2" title="操作记录" class="nor">操作记录</a></c:if>
	</span>
	<span class="r"><input type="button" class="hand btn80x20" onclick="window.print();" value="打印订单" /><input type="button" class="hand btn80x20" onclick="window.history.back(-1);" value="返回列表" /></span>
	</h2>

    <div id="tab_1">
		<!-- 基本信息 -->
		<table cellspacing="0" summary="" class="tab4">
			<tr>
				<th width="12%">归属地：</th>
				<td width="21%" class="nwp">${ebco.ebOrder.areaName}</td>
				<th width="12%">购买类型：</th>
				<td width="21%" class="nwp">
					<c:choose>
						<c:when test="${ebco.ebOrder.orderType == 4}">团购</c:when>
						<c:otherwise>常规</c:otherwise>
					</c:choose>
				</td>
				<c:choose>
					<c:when test="${ebco.ebOrder.orderType == 2 && ebco.ebOrder.orderSource == 2}">
						<th width="12%">订单来源</th>
						<td class="nwp"><c:out value="套卡"></c:out></td>
					</c:when>
					<c:when test="${ebco.ebOrder.orderSource == 1}">
						<th width="12%">订单来源</th>
						<td class="nwp"><c:out value="待客下单"></c:out></td>
					</c:when>
					<c:otherwise>
						<th width="12%">
						</th>
						<td class="nwp">
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th width="12%">下单用户：</th>
				<td width="21%" class="nwp">${ebco.ebOrder.userName}</td>
				<th width="12%">支付方式:</th>
				<c:choose>
					<c:when test="${ebco.ebOrder.orderSource == 1}">
						<td class="nwp"><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
						<th width="12%">待客下单人</th>
						<td class="nwp"><c:out value="${ebco.ebOrder.orderExt5 }"></c:out></td>
					</c:when>
					<c:otherwise>
						<td class="nwp" colspan="3"><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<c:if test="${ebco.ebOrder.payable != 0}">
				<tr>
					<th>发票抬头：</th>
					<td class="nwp"><ui:orderState var="${ebco.ebOrder.payable}" type="5" /></td>
					<th>单位名称：</th>
					<td width="21%" class="nwp">${ebco.ebOrder.company}</td>
					<th width="12%">发票内容：</th>
					<td class="nwp"><ui:orderState var="${ebco.ebOrder.contents}" type="6" /></td>
				</tr>
			</c:if>
			<tr>
				<th>送货方式：</th>
				<td>
					<c:choose>
						<c:when test="${ebco.ebOrder.deliveryMethod == 2}">到厅自提</c:when>
						<c:otherwise>快递</c:otherwise>
					</c:choose>
				<th>送货时间：</th>
				<td>
					<c:choose>
						<c:when test="${ebco.ebOrder.deliveryMethod == 2}"></c:when>
						<c:otherwise><ui:orderState var="${ebco.ebOrder.delivery}" type="7" /></c:otherwise>
					</c:choose>
				</td>
				<th>送货前电话确认：</th>
				<td><ui:orderState var="${ebco.ebOrder.isConfirm}"type="8" /></td>
			</tr>
			<tr>
				<th>收货人：</th>
				<td class="nwp">${ebco.ebOrder.shipName}</td>
				<th>联系方式：</th>
				<td><var>
					<c:choose>
						<c:when test="${not empty ebco.ebOrder.phone && not empty ebco.ebOrder.fixedPhone}">
							${ebco.ebOrder.phone}&nbsp;/&nbsp;${ebco.ebOrder.fixedPhone}
						</c:when>
						<c:when test="${not empty ebco.ebOrder.phone}">
							${ebco.ebOrder.phone}
						</c:when>
						<c:when test="${not empty ebco.ebOrder.fixedPhone}">
							${ebco.ebOrder.fixedPhone}
						</c:when>
					</c:choose>
				</var></td>
				<th>邮编：</th>
				<td>
				<c:if test="${ebco.ebOrder.deliveryMethod != 2}"><var>${ebco.ebOrder.zipCode}</var></c:if></td>
			</tr>
			<tr>
				<th>收货地址：</th>
				<td class="nwp" colspan="5">
				<c:if test="${ebco.ebOrder.province != ' '}">${ebco.ebOrder.province}&nbsp;</c:if>
				<c:if test="${ebco.ebOrder.city != ' '}">${ebco.ebOrder.city}&nbsp;</c:if>
				<c:if test="${ebco.ebOrder.district != ' '}">${ebco.ebOrder.district}&nbsp;</c:if>
				<c:out value="${ebco.ebOrder.addr}"></c:out>
				</td>
			</tr>
			<tr>
				<th>用户备注:</th>
				<td class="nwp" colspan="5">${ebco.ebOrder.notes}</td>
			</tr>
		</table>
			
	<!-- 根据分类显示详情 -->
	<c:choose>
		<%-- 裸机/团购裸机 --%>
		<c:when test="${ebco.ebOrder.orderType == 1 || ebco.ebOrder.orderType == 4}">
			<table cellspacing="0" summary="" class="tab3">
				<tr>
					<th width="12%">商品编号</th>
					<th width="12%">商品名称</th>
					<th width="15%">包装清单</th>
					<th width="15%">单价</th>
					<th>数量</th>
					<th>串号</th>
				</tr>
				<c:forEach items="${ebco.ebOrderItemDetail}" var="e">
				<tr>
					<td>${e.itemNo}</td>
					<td class="nwp">${e.itemName}</td>
					<td><a href="javascript:void(0);" onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>
					<td><fmt:formatNumber value="${e.price/100}" pattern="#0.00"/>元</td>
					<td>${e.quantity}个</td>
					<td>${e.seriescode}</td>
				</tr>
				</c:forEach>
			</table>
		</c:when>
		<%-- 号卡 --%>
		<c:when test="${ebco.ebOrder.orderType == 2}">
			<table cellspacing="0" summary="" class="tab3">
				<tr>
					<th width="12%">号码</th>
					<th width="12%">品牌</th>
					<th>基本套餐</th>
					<th>业务包</th>
					<th>办理人姓名</th>
					<th>证件类型</th>
					<th>证件号码</th>
				</tr>
				<c:forEach items="${ebco.ebOrderDetail}" var="e">
					<c:if test="${e.ebSimIdcard!=null}">
						<tr>
							<td><c:out value="${e.itemName}"></c:out></td>
							<td><c:out value="${e.skuSpec}"></c:out></td>
							<td class="nwp"><c:out value="${e.offerGroupName}"></c:out></td>
							<td><c:out value="${e.offerName}"></c:out></td>
							<td><c:out value="${e.ebSimIdcard.subscriberName}"></c:out></td>
							<td>
								<c:choose>
									<c:when test="${e.ebSimIdcard.idcardType==1}">身份证</c:when>
									<c:when test="${e.ebSimIdcard.idcardType==2}">军官证</c:when>
									<c:otherwise>未知</c:otherwise>
								</c:choose>
							</td>
							<td><c:out value="${e.ebSimIdcard.idNum}"></c:out></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</c:when>
		<%-- 营销案 --%>
		<c:when test="${ebco.ebOrder.orderType == 3}">
			<table cellspacing="0" summary="" class="tab3">
				<tr>
					<th width="12%">档次编号</th>
					<th width="12%">商品编号</th>
					<th width="15%">商品名称</th>
					<th width="12%">包装清单</th>
					<th>活动名称</th>
					<th>购机价</th>
					<th>实付价</th>
					<th>数量</th>
					<th>串号</th>
				</tr>
				<c:forEach items="${ebco.ebOrderOfferDetail}" var="e">
				<c:if test="${e.orderDetailType==3}">
				<tr>
				 <td>${e.offerNo}</td>
				 <td>${e.itemNo}</td>
				 <td class="nwp">${e.itemName}</td>
			     <td><a href="javascript:void(0);" onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>	 
				 <td class="nwp">${e.offerGroupName}${e.shortName}${e.shortName2}</td>
				 <td class="nwp"><fmt:formatNumber value="${e.purchasePrice/100}" pattern="#0.00" />元</td>
			   	 <td class="nwp"><fmt:formatNumber value="${e.paymentPrice/100}" pattern="#0.00" />元</td>
				 <td>1个</td>
				 <td>${e.seriescode}</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
			
			<h2 class="h2" title="业务信息">业务信息</h2>
			<table cellspacing="0" summary="" class="tab3">
				<tr>
					<th width="12%">业务协议期</th>
					<th width="12%">月承诺话费</th>
					<th width="15%">预存/赠送话费</th>
					<th width="12%">返还期</th>
					<th>月返还话费</th>
					<th>首月返还话费</th>
					<th>月末返还话费</th>
					<th>备注</th>
					<th>套餐名称</th>
				</tr>
				
				<c:forEach items="${ebco.ebOrderOfferDetail}" var="e">
				<c:if test="${e.orderDetailType==3}">
				<tr>
				 <td><c:out value="${e.offerTerm}"/>个月</td>
				 <td><fmt:formatNumber value="${e.commitMonthly/100}" pattern="#0.00"/>元</td>
				 <td class="nwp"><fmt:formatNumber value="${e.prepaid/100}" pattern="#0.00"/>元</td>
			     <td><c:if test="${e.period==0}">立即返还</c:if><c:if test="${e.period!=0}">${e.period}个月</c:if></td>	 
				 <td class="nwp"><fmt:formatNumber value="${e.refundMonthly/100}" pattern="#0.00"/>元</td>
				 <td class="nwp"><fmt:formatNumber value="${e.refund1stMonth/100}" pattern="#0.00"/>元</td>
				 <td class="nwp"><fmt:formatNumber value="${e.refundLastMonth/100}" pattern="#0.00"/>元</td>
				 <td class="nwp">${e.ebOffer.notes}</td>
				 <td class="nwp">${e.offerName}</td>
				</tr>
				</c:if>
				</c:forEach>
			</table>
		</c:when>
	</c:choose>
	
	<!-- 金额合计 -->
		<div class="page_c">
			<span class="r">商品金额合计：<fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元&nbsp;&nbsp;&nbsp;
					 运费：0.00元 &nbsp;&nbsp;&nbsp; 应付金额： <var class="f16 red"><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元</var>
			</span>
		</div>
							
	</div>
	<c:if test="${ebco.ebOrder.orderState != 18 }">
	
	<div id="tab_2" class="edit set" style="display: none">
	<table cellspacing="0" summary="" class="tab">
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
		<td class="nwp">${e.note}</td>
		</tr> 
		</c:forEach> 
	</table> 
</div></c:if>

	</div>

</form>

</div></div>
</body>

