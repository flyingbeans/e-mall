<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>打印单</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="OrderMgmtMenu"/>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/ecps/console/res/css/style.css'/>" />
<link rel="stylesheet" type="text/css" media="print" href="<c:url value='/ecps/console/res/css/print.css'/>" />
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.js'/>"></script>
<script language="javascript" type="text/javascript">
// window.onbeforeprint=beforePrint;
// window.onafterprint=afterPrint;
function beforePrint()
{
hd.style.display='none';
}

function afterPrint()
{
hd.style.display='';
}
</script>
<style>h2{text-align:left}</style>
</head>
<body id="main" style="background:#f1f1f1 none">
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
%>


<div class="content" style="width:100%;padding-bottom:10px;text-align:center">

<form id="myForm"  method="post">
    <input type="hidden" name="taskId" value="${taskId}"/>
    <input type="hidden" name="userId" value="${userId}"/>
    <input type="hidden" name="orderNum" value="${ebco.ebOrder.orderNum}"/>
    <input type="hidden" name="oprType" value="${oprType}"/>


  <div class="sch page_c">
    	<span class="l">
    	订单号：<b class="red"><var>${ebco.ebOrder.orderNum}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${ebco.ebOrder.orderTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var>&nbsp;&nbsp;&nbsp;
    	<b class="f14 blue">
    	<c:if test="${type!=7&&type!=13}"><ui:orderModule var="${ebco.ebOrder.orderState}" type="${type}"/></c:if>
    	<c:if test="${type==7}">已收货</c:if>
    	<c:if test="${type==13}"><ui:orderState var="${ebco.ebOrder.orderState}" type="1"/></c:if>
    	</b>
    	<c:if test="${ebco.ebOrder.distriId != null}">
	  		<c:forEach items="${ebUsers}" var="e">
			 <c:if test="${e.distriId==ebco.ebOrder.distriId}">${e.distriName}&nbsp;&nbsp;&nbsp;</c:if>
			</c:forEach>
	  	</c:if>
    	&nbsp;&nbsp;&nbsp;<c:if test="${ebco.ebOrder.deliveryNo != null}">物流编号:<c:out value="${ebco.ebOrder.deliveryNo}"/></c:if>
    	 </span><span class="r">
<span id="hd">
<input type="button"  class="pointer" onclick="window.print();" value="打印"/></span>
</span>  
	</div>



<h2 class="h2" title="基本信息">基本信息</h2>
		<table cellspacing="0" summary="" class="tab4">
			<tr>
				<th width="12%">归属地：</th>
				<td width="21%" class="nwp">${ebco.ebOrder.areaName}</td>
				<th width="12%">购买类型：</th>
				<td width="21%" class="nwp">
					<c:choose>
						<c:when test="${ebco.ebOrder.orderType == 4}">团购</c:when>
						<c:when test="${ebco.ebOrder.orderType == 5}">秒杀</c:when>
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
				<td width="21%" class="nwp">${ebco.ebOrder.ptlUser.username}</td>
				<th width="12%">支付方式:</th>
				<td class="nwp" colspan="3"><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
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
		<c:when test="${ebco.ebOrder.orderType == 1 || ebco.ebOrder.orderType == 4 || ebco.ebOrder.orderType == 5}">
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
							<td><c:out value="${e.offerGroupName}"></c:out></td>
							<td class="nwp"><c:out value="${e.offerName}"></c:out></td>
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
					 运费：0.00元 &nbsp;&nbsp;&nbsp; 金额： <b class="f16 red"><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元</b>
			</span>
		</div>
	<h2 class="h2" title="支付信息">支付信息</h2>						

	<table cellspacing="0" summary="" class="tab3">
		<tr><th width="12%">支付流水号：</th><td>${epr.payRecordNum}</td></tr>
		<tr><th width="12%">支付方式：</th><td><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td></tr>
		<tr><th width="12%">支付平台：</th><td>${epr.poName}</td></tr>
		<tr><th width="12%">支付金额：</th><td><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元</td></tr>
		<tr><th width="12%">支付状态：</th><td><ui:orderState var="${ebco.ebOrder.isPaid}" type="3" /></td></tr>
		<tr><th width="12%">付款时间：</th><td><var><fmt:formatDate value="${ebco.ebOrder.payTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var></td></tr>
		<tr><th width="12%">到账时间：</th><td><var><fmt:formatDate value="${ebco.ebOrder.depositTime}"pattern="yyyy-MM-dd" /></var></td></tr>
	</table>
	
	<h2 class="h2" title="操作记录">操作记录</h2>
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
		<td class="nwp"><c:out value="${e.note}"/></td>
		</tr> 
		</c:forEach> 
	</table> 
	<div class="sch page_c">
		<span class="r">
		<span id="hd">
		<input type="button"  class="pointer" onclick="window.print();" value="打印"/></span>
		</span>
		</span>
	</div>  
</form>
</div>
</body>
