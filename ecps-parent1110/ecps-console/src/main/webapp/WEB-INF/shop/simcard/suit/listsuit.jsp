<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>号卡套餐管理_号卡管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="simCardSuit" content="simCardSuitName"/>
<script type="text/javascript">
$(document).ready(function() {
    searchText('#searchText','#suitName',40);
    pageInitialize('#form1','#suitName');
    $('#goSearch').click(function(){
        $("#pageNo").val(1);
        goSearch('#form1','#suitName');
    });
});

function importSimcardSuit() {
	tipShow("#importLoadDiv");
	$.ajax({
		type : "POST",
		url : "${path}/simcard/importSimcardSuit.do",
		success : function(responseText) {
			tipHide("#importLoadDiv");
			var dataObj = eval("(" + responseText + ")");
			$("#importResultText").text(dataObj.message);
			if (dataObj.result == "true") {
				$("#importResultTitle").text("导入成功");
			} else {
				$("#importResultTitle").text("导入失败");
			}
			$("#importResultClose").click(function(){
				tipHide("#importResultDiv");
			});
			$("#importResultOk").click(function(){
				location.href = "<c:url value='/ecps/console/simcard/listSimCardSuit.do'/>?saleStatus=1";
			});
			tipShow("#importResultDiv");
		}
	});
}

</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<span class="gray">主套餐管理</span></div>

<form id="form1" name="form1" action="${base}/simcard/listSimCardSuit.do" method="post">
    <div class="sch">
    	<input type="hidden" id="suitName" name="suitName" />
        <p>
        	<fmt:message key="tag.search"/>：
        	<select id="brandName" name="brandName">
		        <option value="" >全部品牌</option>
		       <c:forEach items="${brandNameList }" var="brandName">
		        	 <option value="${brandName }" <c:if test='${lastBrandName == brandName }'>selected</c:if>><c:out value="${brandName }" escapeXml='true'/></option>
		        </c:forEach>
	        </select>
	        <input type="text" id="searchText" name="searchText" value="<c:out value='${suitName}' escapeXml='true'/>" title="请输入套餐名称" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>" />
        </p>
    </div>
	<div class="page_c">
	    <span class="r inb_a">
            <a href="###" onclick="importSimcardSuit()" class="btn80x20" title="导入套餐及关联产品/策划">导入套餐</a>
        </span>
    </div>
	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th>套餐编号</th>
			<th>套餐名称</th>
			<th>套餐品牌</th>
			<th>预存费</th>
			<th>押金费</th>
			<th>SIM卡费</th>
			<th>套餐归属地</th>
			<th>排序</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="suit">
			<tr>
				<td><c:out value='${suit.suitNo}'/></td>
				<td><c:out value='${suit.suitName}' escapeXml='true'/></td>
				<td><c:out value='${suit.brandName}' escapeXml='true'/></td>
				<td><fmt:formatNumber value="${suit.prepaid/100 }" pattern="#0.00"/></td>
				<td><fmt:formatNumber value="${suit.cashPledge/100 }" pattern="#0.00"/></td>
				<td><fmt:formatNumber value="${suit.simcardPrice/100 }" pattern="#0.00"/></td>
				<td><c:out value="${suit.areaName }" escapeXml='true'/></td>
				<td><c:out value='${suit.suitSort}'/></td>
				<td>
					<c:url value="/${system }/simcard/editSimCardSuit.do" var="getSuit">
						<c:param name="suitId" value="${suit.suitId}"/>
					</c:url>
					<c:url value="/${system }/simcard/listSuitItem.do" var="getSuitItemList">
						<c:param name="suitId" value="${suit.suitId }"/>
					</c:url>
					<c:url value="/${system }/simcard/listSuitVas.do" var="getSuitVasList">
						<c:param name="suitId" value="${suit.suitId }"/>
					</c:url>
					<a href="${getSuit}">编辑</a>
					<ui:permTag src="/${system}/simcard/listSuitItem.do">
					<a href="${getSuitItemList}">产品列表</a>
					</ui:permTag>
					<ui:permTag src="/${system}/simcard/listSuitVas.do">
					<a href="${getSuitVasList}">增值策划</a>
					</ui:permTag>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- ============================================================================== -->
    <div class="page_c">
        <span class="l inb_a">
            
        </span>
        <span class="r page">
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
            共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
        </span>
    </div>
</form>
</div></div>
</body>


