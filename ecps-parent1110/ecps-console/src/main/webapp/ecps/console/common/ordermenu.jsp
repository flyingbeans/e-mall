<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="taglibs.jsp"%>

<h2 title="订单管理"><samp class="t03"></samp>订单管理</h2>
<ul class="ul">

<li><a href="${path}/order/listNoPayOrder.do?isCall=0&assignee=noPaidOrderer"><samp class="t05"></samp>待付款单</a></li>
<li><a href="${path}/order/listPaidOrder.do?assignee=paidOrderer"><samp class="t05"></samp>已付款单</a></li>
<li><a href="${path}/order/orderStock.do?orderState=2"><samp class="t05"></samp>备货单</a></li>
<li><a href="${path}/order/orderCrm.do?orderState=3"><samp class="t05"></samp>CRM单</a></li>
<li><a href="${path}/order/orderDelivery1.do?orderState=6,32"><samp class="t05"></samp>配送单</a></li>
<li><a href="${path}/order/orderSelf.do?orderState=35&deliveryMethod=2"><samp class="t05"></samp>自提单</a></li>
<li><a href="${path}/order/orderSucess.do?orderState=7,42"><samp class="t05"></samp>已收货单</a></li>
<li><a href="${path}/order/orderRstock.do?orderState=13,36,37,43"><samp class="t05"></samp>退库单</a></li>
<li><a href="${path}/order/orderReturn.do?orderState=15,26,38,39,40,41"><samp class="t05"></samp>退款单</a></li>
<li><a href="${path}/order/orderAbnormal.do?orderState=12&first=first"><samp class="t05"></samp>异常单</a></li>
<li><a href="${path}/order/orderInValid.do?orderState=15,26,33,34,10,11"><samp class="t05"></samp>作废单</a></li>
</ul>