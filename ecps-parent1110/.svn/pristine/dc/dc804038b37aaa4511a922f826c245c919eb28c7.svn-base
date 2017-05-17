<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
<title>有效订单_<fmt:message key="OrderMgmtMenu.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="OrderMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/order.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script language="javascript" type="text/javascript">
function exportOrder(s){
    var form = document.getElementById("form1");
    form.action="${path}/order/orderExport.do?s="+s+"&type=1&type2=14";
    subVerify4Title($("#orderNo"));
    subVerify4Title($("#phone"));
    subVerify4Title($("#shipName"));
    subVerify4Title($("#userName"));
    form.submit();
    form.action="${path}/order/orderValid.do";
}
</script>
<jsp:include page="/ecps/console/common/jscript.jsp"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/ordermenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key="OrderMgmtMenu.title"/>&nbsp;&raquo;&nbsp;<span class="gray" title="有效订单">有效订单</span></div>
    
    <div class="page_c">
    	<span class="l">
    	<c:choose>
		<c:when test="${orderState=='2,3,4,5,6,7,32,35,42'}">
		订单状态：<b class="orange">全部</b>&nbsp;
		</c:when>
		<c:otherwise>
		订单状态：<a href="${path}/order/orderValid.do" title="全部">全部</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
			<c:choose>
		<c:when test="${orderState=='2'}">
		<b class="orange" title="待备货">待备货</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=2" title="待备货">待备货</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${orderState=='3'}">
		<b class="orange" title="CRM">CRM待办理</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=3" title="CRM">CRM待办理</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
			<c:choose>
		<c:when test="${orderState=='4'}">
		<b class="orange" title="待打包">待打包</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=4" title="待打包">待打包</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
				<c:choose>
		<c:when test="${orderState=='5'}">
		<b class="orange" title="待物流取货">待物流取货</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=5" title="待物流取货">待物流取货</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
			<c:choose>
		<c:when test="${orderState=='6,32'}">
		<b class="orange" title="配送中">配送中</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=6,32" title="配送中">配送中</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${orderState=='35'}">
		<b class="orange" title="待自提">待自提</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=35" title="待自提">待自提</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
<%-- 		<c:choose> --%>
<%-- 		<c:when test="${orderState=='13'}"> --%>
<!-- 		<b class="orange" title="待退库">待退库</b>&nbsp; -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 		<a href="${path}/order/orderValid.do?orderState=13" title="待退库">待退库</a>&nbsp; --%>
<%-- 		</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
<%-- 				<c:choose> --%>
<%-- 		<c:when test="${orderState=='19'}"> --%>
<!-- 		<b class="orange" title="已退库">已退库</b>&nbsp; -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 		<a href="${path}/order/orderValid.do?orderState=19" title="已退库">已退库</a>&nbsp; --%>
<%-- 		</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
		<c:choose>
		<c:when test="${orderState=='7,42'}">
		<b class="orange" title="已收货">已收货</b>&nbsp;
		</c:when>
		<c:otherwise>
		<a href="${path}/order/orderValid.do?orderState=7,42" title="已收货">已收货</a>&nbsp;
		</c:otherwise>
		</c:choose>
		
<%-- 		<c:choose> --%>
<%-- 		<c:when test="${orderState=='8'}"> --%>
<!-- 		<b class="orange" title="交易成功">交易成功</b>&nbsp; -->
<%-- 		</c:when> --%>
<%-- 		<c:otherwise> --%>
<%-- 		<a href="${path}/order/orderValid.do?orderState=8" title="交易成功">交易成功</a>&nbsp; --%>
<%-- 		</c:otherwise> --%>
<%-- 		</c:choose> --%>
		
		
    	</span>
    	<span class="r inb_a">
            <input id="button1" type="button" class="hand btn120x20" onclick="exportOrder(1)" value="导出当前页订单"/>&nbsp;&nbsp;<input id="button2" type="button" class="hand btn120x20" onclick="exportOrder(2)" value="导出全部订单"/>
        </span>
    </div>
    
    <form action="${path}/order/orderValid.do" id="form1" name="form1" method="post">
    
    	<div class="sch"><p>查询：<jsp:include page="/ecps/console/common/search.jsp"/></div>

<table cellspacing="0" summary="" class="tab" id="myTable">
    <tr>
    <th>归属地</th>
    <th>订单号</th>
    <th>收货人</th>
    <th>联系电话</th>
    <th>支付金额</th>
    <th>支付方式</th>
    <th>支付状态</th>
    <th>下单用户</th>
    <th>下单时间</th>
    <th>操作时间</th>
    <th>订单状态</th>
    <th>操作</th>
    </tr>
    <c:forEach items="${pagination.list}" var="p">
    <tr>
    <td>${p.areaName}</td>
    <td><a href="${path}/order/orderValid/detail.do?orderId=${p.orderId}&taskId=${p.taskId}">${p.orderNum}</a></td>
    <td>${p.shipName}</td>
    <td>
    	<c:choose>
			<c:when test="${not empty p.phone && not empty p.fixedPhone}">
				${p.phone}&nbsp;/&nbsp;${p.fixedPhone}
			</c:when>
			<c:when test="${not empty p.phone}">
				${p.phone}
			</c:when>
			<c:when test="${not empty p.fixedPhone}">
				${p.fixedPhone}
			</c:when>
		</c:choose>
	</td>
    <td><fmt:formatNumber value="${p.orderSum/100}" pattern="#0.00"/></td>
    <td><ui:orderState var="${p.payment}" type="2"/></td>
    <td><ui:orderState var="${p.isPaid}" type="3"/></td>
    <td class="nwp">${p.ptlUser.username}</td>
    <td class="nwp"><c:if test='${p.isRed==1}'>  <var class="red"><fmt:formatDate value="${p.orderTime}" pattern="yyyy-MM-dd"/><br/><fmt:formatDate value="${p.orderTime}" pattern="HH:mm:ss"/></var></c:if>
    <c:if test='${p.isRed==0}'> <fmt:formatDate value="${p.orderTime}" pattern="yyyy-MM-dd"/><br /><fmt:formatDate value="${p.orderTime}" pattern="HH:mm:ss"/></c:if></td>
    <td class="nwp"><fmt:formatDate value="${p.updateTime}" pattern="yyyy-MM-dd"/><br /><fmt:formatDate value="${p.updateTime}" pattern="HH:mm:ss"/></td>
    <td class="nwp"><ui:orderModule var="${p.orderState}" type="14"/></td>
    <td><a href="${path}/order/orderValid/detail.do?orderId=${p.orderId}&taskId=${p.taskId}">查看</a></td>
    </tr>
    </c:forEach>
    </table>
    <div class="page_c">
        <span class="r page inb_a">
            共 <var class="red">${pagination.totalCount}</var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="javascript: gotoPage('${pagination.prePage}');" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="#" onclick="gotoPage('${pagination.nextPage}');" title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="text" id="number1" name="number1" class="txts" size="3" />
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>
    </form>

</div></div>
</body>

