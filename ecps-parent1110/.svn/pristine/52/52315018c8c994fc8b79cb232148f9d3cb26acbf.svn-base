<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mainMenu.title"/></title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="menu" content="MainMenu"/>
</head>
<body id="main">

        <c:if test="${user!= null }">
<%--         	<fmt:message key="mainMenu.message"/> --%>
			<div class="loc icon"><samp class="t12"></samp>
			尊敬的<b>【${user.fullName}】</b>欢迎您！上次登录时间是
			<fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			，今天是
				<script language="javascript">
				var day="";
				var month="";
				var ampm="";
				var ampmhour="";
				var myweekday="";
				var year="";
				mydate=new Date();
				myweekday=mydate.getDay();
				mymonth=mydate.getMonth()+1;
				myday= mydate.getDate();
				year= mydate.getFullYear();
				if(myweekday == 0)
				weekday=" 星期日 ";
				else if(myweekday == 1)
				weekday=" 星期一 ";
				else if(myweekday == 2)
				weekday=" 星期二 ";
				else if(myweekday == 3)
				weekday=" 星期三 ";
				else if(myweekday == 4)
				weekday=" 星期四 ";
				else if(myweekday == 5)
				weekday=" 星期五 ";
				else if(myweekday == 6)
				weekday=" 星期六 ";
				document.write(year+"年"+mymonth+"月"+myday+"日 "+weekday);
				</script>
				</div>
			<table cellspacing="0" summary="" class="tab">
				<tr><th colspan="2">您的待办理业务如下：</th></tr>
				<ui:permTag src="/ecps/console/order/index.do">
				<tr><td colspan="2"><b>订单管理</b></td></tr>
				<c:forEach items="${orderList}" var="order" varStatus="idx">
				<ui:permTag src="${order.preHref}">
				<c:if test="${idx.index%2==0}">
				<tr>
				</c:if>
				<td>
                    <span class="l">${order.showKey}：<var>
                    <c:if test="${order.showNum !=0}">
                    <a href="${path}${order.showHref}">${order.showNum}笔</a>
                    </c:if>
                    <c:if test="${order.showNum ==0}">
                    0笔
                    </c:if>
                    </var></span>
                </td>
                <c:if test="${idx.index==fn:length(orderList)-1 && fn:length(orderList)%2!=0}">
                    <td>&nbsp;</td>
                </c:if>
				<c:if test="${idx.index%2!=0}">
				</tr>
				</c:if>
				</ui:permTag>
				</c:forEach>
				</ui:permTag>
				<ui:permTag src="/item/listEntity.do">
				<tr><td colspan="2"><b>实体商品管理</b></td></tr>
				<c:forEach items="${itemList}" var="order" varStatus="idx">
                    <ui:permTag src="${order.preHref}">
                    <c:if test="${idx.index%2==0}">
                    <tr>
                    </c:if>
                    <td>
                        <span class="l">${order.showKey}：<var>
                        <c:if test="${order.showNum !=0}">
                        <a href="${base}${order.showHref}">${order.showNum}笔</a>
                        </c:if>
                        <c:if test="${order.showNum ==0}">
                        0笔
                        </c:if>
                        </var></span>
                    </td>
                    <c:if test="${idx.index==fn:length(itemList)-1 && fn:length(itemList)%2!=0}">
                    <td>&nbsp;</td>
                    </c:if>
                    <c:if test="${idx.index%2!=0}">
                    </tr>
                    </c:if>
                    </ui:permTag>
				</c:forEach>
				</ui:permTag>
				<ui:permTag src="/card/listCard.do">
				<tr><td colspan="2"><b>号卡管理</b></td></tr>
				<c:forEach items="${cardList}" var="order" varStatus="idx">
                    <ui:permTag src="${order.preHref}">
                    <c:if test="${idx.index%2==0}">
                    <tr>
                    </c:if>
                    <td>
                        <span class="l">${order.showKey}：<var>
                        <c:if test="${order.showNum !=0}">
                        <a href="${base}${order.showHref}">${order.showNum}笔</a>
                        </c:if>
                        <c:if test="${order.showNum ==0}">
                        0笔
                        </c:if>
                        </var></span>
                    </td>
                    <c:if test="${idx.index==fn:length(cardList)-1 && fn:length(cardList)%2!=0}">
                    <td>&nbsp;</td>
                    </c:if>
                    <c:if test="${idx.index%2!=0}">
                    </tr>
                    </c:if>
                    </ui:permTag>
				</c:forEach>
				</ui:permTag>
				</table>
        </c:if>
        <c:if test="${user == null }">
        	你尚未登录请登录
        </c:if>

</body>