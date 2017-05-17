<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>代客下单管理</title>
<meta name="heading" content="<fmt:message key='SubscribeMgmtMenu.heading'/>"/>
<meta name="menu" content="relpaceGuestSubmitOrder"/>
<script type="text/javascript" src="<c:url value='/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/order.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<jsp:include page="/ecps/console/common/jscript.jsp"/>
<script language="javascript" type="text/javascript">
var orderNum="";
var taskId="";
function cancel(num,id){
	orderNum = num;
	taskId = id;
	$("#confirmText").html("是否申请取消订单?");
	tipShow('#confirmDiv');
}
$(function(){
	function showTip(txt){
		$('#tipText').html(txt);
		tipShow('#tipDiv');
	}
	$("#confirmDivOk").bind("click",function(){
		$.ajax({
			type : "post" ,
			contentType: "application/x-www-form-urlencoded; charset=utf-8", 
			url : '${path}/order/valetOrderCancel.do?orderNum='+orderNum+'&taskId='+taskId ,
			dataType : 'json',
			complete:function(data){
		    	var aa = eval("("+data.responseText+")"); 
				if(aa[0].result == "1"){
					alert(aa[0].msg);
					window.location.reload();
				} else {
					showTip(aa[0].msg);
				}
			}
		});
	});
});
</script>
</head>

<body id="main">

<div class="frameL"><div class="box"><div class="menu icon">
	<jsp:include page="/${system}/common/valetordermenu.jsp"/>
</div></div></div>

<div class="frameR"><div class="box"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：代客下单管理&nbsp;&raquo;&nbsp;<span class="gray" title="">查询修改订单</span></div>

    <form action="${path}/order/listGuestOrder.do" id="form1" name="form1" method="post">
		
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
    <td><a href="${path}/order/orderSummary/detail.do?orderId=${p.orderId}&taskId=${p.taskId}">${p.orderNum}</a></td>
    <td class="nwp">${p.shipName}</td>
    <td>${p.phone}</td>
    <td><fmt:formatNumber value="${p.orderSum/100}" pattern="#0.00"/></td>
    <td><ui:orderState var="${p.payment}" type="2"/></td>
    <td><ui:orderState var="${p.isPaid}" type="3"/></td>
    <td class="nwp">${p.userName}</td>
   <td class="nwp"><c:if test='${p.isRed==1}'>  <var class="red"><fmt:formatDate value="${p.orderTime}" pattern="yyyy-MM-dd"/><br/><fmt:formatDate value="${p.orderTime}" pattern="HH:mm:ss"/></var></c:if>
    <c:if test='${p.isRed==0}'> <fmt:formatDate value="${p.orderTime}" pattern="yyyy-MM-dd"/><br /><fmt:formatDate value="${p.orderTime}" pattern="HH:mm:ss"/></c:if></td>
    <td class="nwp"><fmt:formatDate value="${p.updateTime}" pattern="yyyy-MM-dd"/><br/><fmt:formatDate value="${p.updateTime}" pattern="HH:mm:ss"/></td>
   <%-- <c:if test='${d==1}'> <td class="nwp"><ui:orderModule var="${p.orderState}" type="8"/></td></c:if>
   <c:if test='${d==2}'> <td class="nwp"><ui:orderModule var="${p.orderState}" type="6"/></td></c:if>
   <c:if test='${d!=1&&d!=2}'> <td class="nwp"><ui:orderState var="${p.orderState}" type="1"/></td></c:if> --%>
   <td class="nwp"><ui:orderState var="${p.orderState}" type="1"/></td>
    <td><a href="${path}/order/orderSummary/detail.do?orderId=${p.orderId}&taskId=${p.taskId}&flag=1">查看</a>
    <c:choose>
    	<c:when test="${p.orderState<6}">
    		<a href="${path}/order/orderSummary/editOrder.do?orderId=${p.orderId}&taskId=${p.taskId}">修改</a>
    	</c:when>
    	<c:otherwise>
    		<a href="javascript:function(){return false;}" class="gray">修改</a>
    	</c:otherwise>
    </c:choose>
    <c:choose>
    	<c:when test="${p.orderState == 0 || p.orderState == 1 || p.orderState == 30}">
    		<a href="javascript:cancel('${p.orderNum}','${p.taskId}')">申请取消</a>
    	</c:when>
    	<c:otherwise>
    		<a href="javascript:void(0)" class="gray">申请取消</a>
    	</c:otherwise>
    </c:choose>
    </td>
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
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="#" onclick="gotoPage('${pagination.nextPage}')"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"  />
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>
    </form>

</div></div></div>

</body>
