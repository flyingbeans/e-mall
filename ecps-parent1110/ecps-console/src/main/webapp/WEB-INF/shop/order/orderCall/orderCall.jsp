<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>外呼单_<fmt:message key="OrderMgmtMenu.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="OrderMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/order.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function(){	
	var orderState=$("#orderState").val();
	if(orderState==""){
		$("#label6").attr("class","here");
	}else if(orderState=="1,21,30,31"){
		$("#label3").attr("class","here");
	}else if(orderState=="2,3,4,5,6,7,8,9,18,12,13,19,20,14,22,23,24,25,32,35,37,38,39,40,41,42,43,44,45,46,47"){
		$("#label4").attr("class","here");
	}else{
		$("#label5").attr("class","here");
	}
});
function exportOrder(s){
    var form = document.getElementById("form1");
    form.action="${path}/order/orderExport.do?s="+s+"&type=2"+"&type2=2";
    subVerify4Title($("#orderNo"));
    subVerify4Title($("#phone"));
    subVerify4Title($("#shipName"));
    subVerify4Title($("#userName"));
    form.submit();
    form.action="${path}/order/orderCall.do";
}
</script>
<jsp:include page="/ecps/console/common/jscript.jsp"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
	<jsp:include page="/${system}/common/ordermenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
    <div class="loc icon"><samp class="t12"></samp>当前位置：订单管理&nbsp;&raquo;&nbsp;<span class="gray" title="外呼单">外呼单</span></div>
    
    <h2 class="h2_ch">
      <span id="tabs" class="l">
        <a id="label6" href="${path}/order/orderCall.do"   title="全部" class="nor">全部</a>
        <a id="label3" href="${path}/order/orderCall.do?orderState=1,21,30,31"   title="等待外呼" class="nor">等待外呼</a>  
        <a id="label4" href="${path}/order/orderCall.do?orderState=2,3,4,5,6,7,8,9,18,12,13,19,20,14,22,23,24,25,32,35,37,38,39,40,41,42,43,44,45,46,47"   title="审核通过" class="nor">审核通过</a>
        <a id="label5" href="${path}/order/orderCall.do?orderState=15,26,33,34,10,11"  title="外呼作废" class="nor">外呼作废</a>
      </span>
      <span class="r inb_a">
            <input id="button1" type="button" class="hand btn120x20" onclick="exportOrder(1)" value="导出当前页订单"/>&nbsp;&nbsp;<input id="button2" type="button" class="hand btn120x20" onclick="exportOrder(2)" value="导出全部订单"/>
        </span>
    </h2>
   <form action="${path}/order/orderPay.do" id="form1" name="form1" method="post">
    

   <table cellspacing="0" summary="" class="tab" id="myTable">
    <tr>
    <th>订单号</th>
    <th>收货人</th>
    <th>联系电话</th>
    <th>支付金额</th>
    <th>支付方式</th>
    <th>支付状态</th>
    <th>下单时间</th>
    <th>操作时间</th>
    <th>订单状态</th>
    <th>操作</th>
    </tr>
    
    <c:forEach items="${tbList }" var="tb">
	    <tr>
	    <td><a href="${path }/shop/order/orderPay/detail.jsp?orderId=3123">${tb.order.orderNum }</a></td>
	    <td>${tb.order.shipName }</td>
	    <td>${tb.order.phone }</td>
	    <td>${tb.order.orderSum }</td>
	    <td>在线支付</td>
	    <td>
	    	<c:if test="${tb.order.isPaid == 1 }">已付款</c:if>
	    	<c:if test="${tb.order.isPaid == 0 }">未付款</c:if>
	    </td>
	    <td class="nwp">
	    	<fmt:formatDate value="${tb.order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
	   </td>
	    <td class="nwp"><fmt:formatDate value="${tb.order.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    <td class="nwp">
	    	未付款单
	    </td>
	    <td><a href="${path }/order/selectPaidOrderDetail.do?orderId=${tb.order.orderId}&taskId=${tb.task.id}">查看</a></td>
	    </tr>
    </c:forEach>
    
    
    
    

    </table>
    </form>

</div></div>
</body>

