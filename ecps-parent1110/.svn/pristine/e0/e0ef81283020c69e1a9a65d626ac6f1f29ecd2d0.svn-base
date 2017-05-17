<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>成功提交订单</title>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/ecps/console/res/css/style.css'/>" />
<script type="text/javascript">
	function closeWin() {
		this.window.opener = null;
		window.close();
	}
</script>
</head>
<body>
<%-- <c:choose>
     <c:when test='${orderNumPass=="undefined"||orderNumPass==""}'> --%>
		      
    <p class="Msg">您的订单已生成，请等待送货人员上门送货！</p>&nbsp;&nbsp;
    <table cellspacing="0" summary="" class="tab3">
        <tr>
            <th>您的订单号</th>
            <td><var class="red"><b>${ordernum}</b></var></td>
            <th>应付现金</th>
            <td>
            	<var class="red">
            		<b>
            			<fmt:formatNumber value="${totalMoney/100}" pattern="#0.00"/>
            		</b>
            	</var> 元
            </td>
            <th>支付方式</th>
            <td>货到付款</td>
        </tr>
        <tr>
            <th>配送方式</th>
            <td>快递</td>
            <th>送货时间</th>
            <td>
                <c:if test="${delivery==1}">只工作日送货（双休日，节假日不送）</c:if>
                <c:if test="${delivery==2}">工作日，双休日，假日均可送货</c:if>
                <c:if test="${delivery==3}">只双休日，假日送货</c:if>
            </td>
            <th></th>
            <td></td>
        </tr>
    </table>
    <br />
    <div align="center">
    	<input id="closeBtn" name="closeBtn" type="button" onclick="closeWin()" value="点击关闭" />
    </div>      	     
  <%--  </c:when>
    
    <c:otherwise>
     <c:redirect url="/ecps/console/order/orderInValid/valetOrderOper.do?encodeType=1&r=${rPass}&orderNum=${orderNumPass}&note=${notePass}&taskId=${taskIdPass}"/>
	</c:otherwise>
</c:choose>     --%>
</body>