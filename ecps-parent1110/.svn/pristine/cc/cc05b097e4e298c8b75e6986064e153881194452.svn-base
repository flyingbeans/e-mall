<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="/WEB-INF/html.tld" prefix="ui" %>
<head>
<title><fmt:message key="tag.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/ordermenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<div class="loc icon">
    <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='OrderMgmtMenu.title'/>&nbsp;&raquo;&nbsp;订单总览&nbsp;&raquo;&nbsp;<span class="gray" title="订单详情">订单详情</span>
</div>

    <div class="sch page_c">
        <span class="l">
            <b class="f14 orange">订单状态：
            <c:if test="${var == 1}">
            <ui:orderState var="${ebco.ebOrder.orderState}" type="${type}"/>
            </c:if>
            <c:if test="${var == 2}">
            <ui:orderModule var="${ebco.ebOrder.orderState}" type="${type}"/>
            </c:if>
            </b>
        </span>
        <span class="r"><input type="button" class="hand btn80x20" onclick="window.print();" value="打印订单"/><input type="button" class="hand btn80x20" onclick="window.history.back(-1);" value="返回列表"/></span>
    </div>

   	<h2 class="h2" title="基本信息">基本信息</h2>
					<table cellspacing="0" summary="" class="tab3">
						<tr>
							<th width="12%">订单号</th>
							<th width="12%">下单账户</th>
							<th width="15%">下单时间</th>
							<th>支付方式</th>
							<c:if test="${ebco.ebOrder.payment == 3}">
								<th>营业厅</th>
							</c:if>
							<th>支付金额</th>
							<th>用户备注</th>
						</tr>
						<tr>
							<td><var>${ebco.ebOrder.orderNum}</var></td>
							<td class="nwp">${ebco.ebOrder.userName}</td>
							<td><var>
									<fmt:formatDate value="${ebco.ebOrder.orderTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</var></td>
							<td><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
							<c:if test="${ebco.ebOrder.payment == 3}">
								<td class="nwp"><c:if
										test="${ebco.ebOrder.selfCollectSite == '1'}">
            王府井营业厅  时间：8:30-18:30(周一-周五)  地址：北京东城区王府井大街138号
            </c:if> <c:if test="${ebco.ebOrder.selfCollectSite == '2'}">
            西直门营业厅  时间：8:30-18:30(周一-周五)  地址：北京西城区西直门XX号 
            </c:if> <c:if test="${ebco.ebOrder.selfCollectSite == '3'}">
            东直门营业厅  时间：8:30-18:30(周一-周五)  地址：北京东城区东直门XX号 
            </c:if></td>
							</c:if>
							<td><var><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/></var></td>
							<td class="nwp">${ebco.ebOrder.notes}&nbsp;</td>
						</tr>
					</table>

					<h2 class="h2" title="收货信息">收货信息</h2>
					<table cellspacing="0" summary="" class="tab3">
						<tr>
							<th width="12%">收货人</th>
							<th width="12%">联系电话</th>
							<th width="15%">邮政编码</th>
							<th>送货地址</th>
						</tr>
						<tr>
							<td>${ebco.ebOrder.shipName}</td>
							<td><var>${ebco.ebOrder.phone}</var></td>
							<c:if test="${ebco.ebOrder.payment == 3}">
								<td><var></var></td>
							</c:if>
							<c:if test="${ebco.ebOrder.payment != 3}">
								<td><var>${ebco.ebOrder.zipCode}</var></td>
							</c:if>
							<c:if test="${ebco.ebOrder.payment == 3}">
								<td class="nwp"><c:if
										test="${ebco.ebOrder.selfCollectSite == '1'}">
            王府井营业厅  时间：8:30-18:30(周一-周五)  地址：北京东城区王府井大街138号
            </c:if> <c:if test="${ebco.ebOrder.selfCollectSite == '2'}">
            西直门营业厅  时间：8:30-18:30(周一-周五)  地址：北京西城区西直门XX号 
            </c:if> <c:if test="${ebco.ebOrder.selfCollectSite == '3'}">
            东直门营业厅  时间：8:30-18:30(周一-周五)  地址：北京东城区东直门XX号 
            </c:if></td>
							</c:if>
							<c:if test="${ebco.ebOrder.payment != 3}">
								<td class="nwp"><c:if
										test="${ebco.ebOrder.province != ' '}">${ebco.ebOrder.province}&nbsp;</c:if>
									<c:if test="${ebco.ebOrder.city != ' '}">${ebco.ebOrder.city}&nbsp;</c:if>
									<c:if test="${ebco.ebOrder.district != ' '}">${ebco.ebOrder.district}&nbsp;</c:if>${ebco.ebOrder.addr}</td>
							</c:if>
						</tr>
					</table>




					<c:if test="${fn:length(ebco.ebOrderItemDetail)!=0}">
						<h2 class="h2" title="商品信息">商品信息</h2>
						<table cellspacing="0" summary="" class="tab3">
							<tr>
								<th width="12%">商品编号</th>
								<th width="12%">商品名称</th>
								<th width="15%">单价</th>
								<th>数量</th>
							</tr>
							<tr>
								<c:forEach items="${ebco.ebOrderItemDetail}" var="e">
									<td>${e.itemNo}</td>
									<td class="nwp">${e.itemName}</td>
									<td><fmt:formatNumber value="${e.price/100}" pattern="#0.00"/>元</td>
									<td>${e.quantity}个</td>
							</tr>
							</c:forEach>
							<tr>
								<td colspan="4"><span class="r">商品金额：<fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元
										+ 运费：0.00元 = <b class="f14">应付总额：</b> <var class="f16 red"><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元</var>
								</span></td>
							</tr>
							</c:if>
						</table>





					


							<h2 class="h2" title="发票信息">发票信息</h2>
							<table cellspacing="0" summary="" class="tab3">
								<tr>
									<th width="12%">发票类型</th>
									<th width="12%">发票内容</th>
									<th>发票抬头</th>
								</tr>
								<tr>
									<td><ui:orderState var="${ebco.ebOrder.payable}" type="5" /></td>
									<td><ui:orderState var="${ebco.ebOrder.contents}" type="6" /></td>
									<td class="nwp">${ebco.ebOrder.company}</td>
								</tr>
							</table>

							<h2 class="h2" title="配送方式">配送方式</h2>
							<table cellspacing="0" summary="" class="tab3">
								<tr>
									<th width="12%">送货方式</th>
									<th width="12%">送货前电话确认</th>
									<th>送货时间</th>
								</tr>
								<tr>
									<%-- <td>${cItem.deliveryMethod}</td> --%>
									<td><c:if test="${ebco.ebOrder.payment == 1}">
    		快递
    	</c:if> <c:if test="${ebco.ebOrder.payment == 2}">
    		快递
    	</c:if> <c:if test="${ebco.ebOrder.payment == 3}">
    		自提
    	</c:if> <%-- <c:if test="${cItem.payment == 4}">
    		邮局汇款
    	</c:if> --%></td>
									<td><ui:orderState var="${ebco.ebOrder.isConfirm}"
											type="8" /></td>
									<td class="nwp"><ui:orderState
											var="${ebco.ebOrder.delivery}" type="7" /></td>
								</tr>
							</table>

	<div class="sch page_c">
        <span class="l">
            <b class="f14 orange">订单状态：
            <c:if test="${var == 1}">
            <ui:orderState var="${ebco.ebOrder.orderState}" type="${type}"/>
            </c:if>
            <c:if test="${var == 2}">
            <ui:orderModule var="${ebco.ebOrder.orderState}" type="${type}"/>
            </c:if>
            </b>
        </span>
        <span class="r"><input type="button" class="hand btn80x20" onclick="window.print();" value="打印订单"/><input type="button" class="hand btn80x20" onclick="window.history.back(-1);" value="返回列表"/></span>
    </div>

</div></div>
</body>

