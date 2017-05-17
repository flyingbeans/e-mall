<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>号卡套餐管理_号卡管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="simCardSuit" content="simCardSuitName"/>
<script type="text/javascript">
$(document).ready(function() {
	searchText('#suitName','#labelName',40);
	searchText('#suitItemName','#labelName',40);
	pageInitialize('#form1');
    $('#goSearch').click(function(){
        $("#pageNo").val(1);
    });
    $("#form1").submit(function(){
    	var s1 = $("#suitName");
    	if(s1.val() == s1.attr("title") || $.trim(s1.val()) == ''){
    		s1.val(null);
    	}
    	var s2 = $("#suitItemName");
    	if(s2.val() == s2.attr("title") || $.trim(s2.val()) == ''){
    		s2.val(null);
    	}
    });
});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<span class="gray">主套餐产品管理</span></div>

<form id="form1" name="form1" action="${base}/simcard/listSuitItem.do" method="post">
    <div class="sch">
        <p>
        	<fmt:message key="tag.search"/>：
        	<select id="brandName" name="brandName">
		        <option value="" >全部品牌</option>
		       <c:forEach items="${brandNameList }" var="brandName">
		        	 <option value="${brandName }" <c:if test='${lastBrandName == brandName }'>selected</c:if>><c:out value="${brandName }"/></option>
		        </c:forEach>
	        </select>
	        <input type="text" id="suitName" name="suitName" value="<c:out value='${suitName}' escapeXml='true'/>" title="请输入套餐名称" class="text20 medium gray" />
	        <input type="text" id="suitItemName" name="suitItemName" value="<c:out value='${suitItemName}' escapeXml='true'/>" title="请输入套餐产品名称" class="text20 medium gray" />
	        <input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>" />
        </p>
    </div>
	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th>产品编号</th>
			<th>产品名称</th>
			<th>产品类型</th>
			<th>所属主套餐</th>
			<th>排序</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="suitItem">
			<tr>
				<td><c:out value='${suitItem.suitItemId}'/></td>
				<td><c:out value='${suitItem.suitItemName}' escapeXml='true'/></td>
				<td>
					<c:if test="${suitItem.suitItemType == 0 }">必选</c:if>
					<c:if test="${suitItem.suitItemType == 1 }">可选(默认选中)</c:if>
					<c:if test="${suitItem.suitItemType == 2 }">可选(默认不选)</c:if>
				</td>
				<td>
					<c:forEach items='${suitItem.suitNames }' end='2' var='suitName' varStatus='p'>
						<c:if test='${p.count > 1 }'>|</c:if>
						<c:out value='${suitName }'  escapeXml='true'/>
					</c:forEach>
					<c:if test="${fn:length(suitItem.suitNames)>3}">
						等<c:out value="${fn:length(suitItem.suitNames)}"></c:out>个
					</c:if>
				</td>
				<td><c:out value='${suitItem.suitItemSort }'/></td>
				<td>
					<a href="${base}/simcard/editSuitItem.do?suitItemId=${suitItem.suitItemId}&suitId=${suitId}">编辑</a>
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
    
    
    