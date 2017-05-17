<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title><fmt:message key='menu.leftItem.recycleMgmt'/>_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script language="javascript" type="text/javascript">

    function singleRestore(itemId) {
    	tipShow('#confirmDiv');
        objItemId = itemId;
/*         var restoreUrl = $("#restoreAction").val();
        var form = document.getElementById("form1");
        form.action = restoreUrl + "?itemId=" + itemId;
        form.submit(); */
    }

    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
    }

    $(document).ready(function(){
        pageInitialize('#form1');
        $("input[id='confirmDivOk']").click(function(){
			var restoreUrl = $("#restoreAction").val();
	        var form = document.getElementById("form1");
	        form.action = restoreUrl + "?itemId=" + objItemId;
	        form.submit();
		})
    });

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<span class="gray"><fmt:message key='menu.leftItem.recycleMgmt'/></span></div>

    <input type="hidden" id="restoreAction" name="restoreAction" value="${base }/item/restoreItem.do" />
    <form id="form1" name="form1" action="" method="post">

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="<fmt:message key="tag.selected.allORcancel"/>" /></th>
            <th><fmt:message key='menu.rightItem.itemNo'/></th>
			<th class="wp"><fmt:message key='menu.rightItem.itemName'/></th>
            <th>审核状态</th>
			<th><fmt:message key='menu.rightItem.cat'/></th>
			<%-- <th><fmt:message key='menu.rightItem.price'/></th> --%>
			<th>商城价</th>
			<th>上下架</th>
			<th><fmt:message key='menu.rightItem.feature1'/></th>
			<th><fmt:message key='menu.rightItem.feature2'/></th>
			<th><fmt:message key='menu.rightItem.feature3'/></th>
			<th><fmt:message key='tag.column.operation'/></th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="item">
			<c:set var="fetItem" value="${item.featuredItem}"/> 
			<tr>
				<td><input type="checkbox" name="ids" value="${item.itemId}"/></td>
				<td><c:out value='${item.itemNo}'/></td>
                <td class="nwp"><c:out value='${item.itemName}'/></td>
                <td>
                    <c:choose>
						<c:when test='${item.auditStatus==0}'>
							<span class="gray"><c:out value='未审核'/></span>
					   	</c:when>
					  	<c:when test='${item.auditStatus==1}'>
							<span class="green"><c:out value='已审核'/></span>
					   	</c:when>
					   	<c:when test='${item.auditStatus==2}'>
							<span class="orange"><c:out value='审核不通过'/></span>
					   	</c:when>
					</c:choose>
                </td>
				<td><c:out value='${item.catName}'/></td>
				<td>
				<var><fmt:formatNumber type="number" value="${item.skuPriceMin/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>元起
				</td>
				
				<td >
                   <%--  <c:if test='${item.showStatus==0}'><span class="is" title="上架"></span></c:if>
                    <c:if test='${item.showStatus==1}'><span class="not" title="下架"></span></c:if> --%>                 
                    <c:choose>
						<c:when test="${item.showStatus==0}">
						<a href="javascript:void(0);" group="${item.itemId },1"><span class="is" title="上架"></span></a>
						</c:when>
					  	<c:otherwise>
					  		<c:choose>
						  		<c:when test="${item.auditStatus==1}">
						  			<a href="javascript:void(0);" group="${item.itemId },0"><span class="not" title="下架"></span></a>
						  		</c:when>
						  		<c:otherwise>
						  			<a href="javascript:void(0);"><span class="not" title="下架"></span></a>
						  		</c:otherwise>
					  		</c:choose>
					  	</c:otherwise>
					</c:choose>
                    
				</td>
				<td>
                   <c:choose>
						<c:when test="${item.isNew==1}">
							<span class="is" title="开启"></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not" title="关闭"></span>
					   	</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${item.isGood==1}">
							<span class="is" title="开启"></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not" title="关闭"></span>
					   	</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${item.isHot==1}">
							<span class="is" title="开启"></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not" title="关闭"></span>
					   	</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:url value="" var="deleteItemById">
						<c:param name="id" value="${item.itemId}"/>
					</c:url>
					<a href="javascript:void(0);" onclick="singleRestore('${item.itemId}')">还原</a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="11" align="right">
                <fmt:message key='tag.select'/>：<a href="#" title="<fmt:message key='tag.selected.all'/>" onclick="checkAllIds();"><fmt:message key='tag.selected.all'/></a> 
                <samp>-</samp> <a href="#" title="<fmt:message key='tag.selected.cancel'/>" onclick="uncheckAllIds();"><fmt:message key='tag.selected.cancel'/></a>
				</td>
			</tr>
		</tbody>
	</table>

    <div class="page_c">
        <span class="r page">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
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
