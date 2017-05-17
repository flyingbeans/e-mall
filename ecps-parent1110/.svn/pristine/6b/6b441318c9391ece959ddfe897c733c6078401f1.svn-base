<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
<title>备货单_<fmt:message key="OrderMgmtMenu.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="OrderMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/order.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function(){	
	var orderState=$("#orderState").val();
	switch(orderState){
	 case "2,4,5,6,7,8,21,18,10,11,12,13,19,20,14,22,23,24,25":$("#label1").attr("class","here");break;
	 case "2":$("#label3").attr("class","here");break; 
	 case "4":$("#label2").attr("class","here");break;
	 case "5":$("#label4").attr("class","here");break;
	 case "6,7,8,21,18,10,11,12,13,19,20,14,22,23,24,25":$("#label5").attr("class","here");break;
	 
// 	 case "1,26,19" :$("#label6").attr("class","here");break;
	}

});
function exportOrder(s){
    var form = document.getElementById("form1");
    form.action="${path}/order/orderExport.do?s="+s+"&type=2&type2=12";
    subVerify4Title($("#orderNo"));
    subVerify4Title($("#phone"));
    subVerify4Title($("#shipName"));
    subVerify4Title($("#userName"));
    form.submit();
    form.action="${path}/order/orderStock.do";
}
// $(function(){
// 	  var a1=$("#orderState1").val();
// 	  var a2=$("#payment1").val();
// 	  var a3=$("#isPaid1").val();
// 	  var a5=$("#selTime1").val();
// 	  if(a5 !=""){
// 		  $("#selTime").val(a5);
// 	  }
// 	  if(a1 !=""){
// 		  $("#orderState").val(a1);
// 	  }
// 	  if(a2 !=""){
// 		  $("#payment").val(a2);
// 	  }
// 	  if(a3 !=""){
// 		  $("#isPaid").val(a3);
// 	  }
// 	  var a=$("#selTime").val();
// 		if(a==1){
// 			$("#selTimeTo").show();
// 		}
// 	  $(window).keydown(function(event){
// 		  if(event.keyCode==13) {
// 			  $(".sub1").click();
// 		  }
// 		}); 
// 	});
</script>
<jsp:include page="/ecps/console/common/jscript.jsp"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/ordermenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key="OrderMgmtMenu.title"/>&nbsp;&raquo;&nbsp;<span class="gray" title="备货中单">备货单</span></div>
     <h2 class="h2_ch">
      <span id="tabs" class="l">
        <a id="label1" href="${path}/order/orderStock.do?orderState=2,4,5,6,7,8,21,18,10,11,12,13,19,20,14,22,23,24,25"   title="全部" class="nor">全部</a>
        <%--
        <ui:permTag src="/ecps/console/order/orderStock.do?orderState=2">
         --%>
        <a id="label3" href="${path}/order/orderStock.do?orderState=2"   title="备货中" class="nor">待备货</a>
        <%--
        </ui:permTag>
         --%>
       
       <%-- <ui:permTag src="/ecps/console/order/orderStock.do?orderState=4">
       --%>
        <a id="label2" href="${path}/order/orderStock.do?orderState=4"   title="待打包" class="nor">待打包</a>  
        <%-- </ui:permTag>--%>
        <%-- <ui:permTag src="/ecps/console/order/orderStock.do?orderState=5">--%>
        <a id="label4" href="${path}/order/orderStock.do?orderState=5"   title="待物流取货" class="nor">待物流取货</a>  
		 <%--</ui:permTag>--%>
		  <a id="label5" href="${path}/order/orderStock.do?orderState=6,7,8,21,18,10,11,12,13,19,20,14,22,23,24,25"   title="取货完成" class="nor">取货完成</a>
      </span>
      <span class="r inb_a">
            <input id="button1" type="button" class="hand btn120x20" onclick="exportOrder(1)" value="导出当前页订单"/>&nbsp;&nbsp;<input id="button2" type="button" class="hand btn120x20" onclick="exportOrder(2)" value="导出全部订单"/>
        </span>
    </h2>
    <form action="${path}/order/orderStock.do" id="form1" name="form1" method="post">
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
    <td><a href="${path}/order/orderStock/detail.do?orderId=${p.orderId}&taskId=${p.taskId}">${p.orderNum}</a></td>
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
    <td class="nwp"><fmt:formatDate value="${p.orderTime}" pattern="yyyy-MM-dd"/><br /><fmt:formatDate value="${p.orderTime}" pattern="HH:mm:ss"/></td>
    <td class="nwp"><fmt:formatDate value="${p.updateTime}" pattern="yyyy-MM-dd"/><br /><fmt:formatDate value="${p.updateTime}" pattern="HH:mm:ss"/></td>
    <td class="nwp"><ui:orderModule var="${p.orderState}" type="12"/></td>
    <td><a href="${path}/order/orderStock/detail.do?orderId=${p.orderId}&taskId=${p.taskId}">查看</a></td>
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

