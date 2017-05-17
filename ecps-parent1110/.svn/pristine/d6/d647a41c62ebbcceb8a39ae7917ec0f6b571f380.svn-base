<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>号卡品牌管理_号卡管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="simCardBrand" content="simCardBrandName"/>
<script type="text/javascript">
$(document).ready(function() {
    searchText('#searchText','#brandName',40);
    pageInitialize('#form1','#brandName');
    $('#goSearch').click(function(){
        $("#pageNo").val(1);
        goSearch('#form1','#brandName');
    });
});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<span class="gray">品牌管理</span></div>

<form id="form1" name="form1" action="${base}/simcard/listSimCardBrand.do" method="post">
    <div class="sch">
    	<input type="hidden" id="brandName" name="brandName" />
        <p>
        	<fmt:message key="tag.search"/>：
	        <input type="text" id="searchText" name="searchText" value="<c:out value='${brandName}' escapeXml='true'/>" title="请输入号卡品牌名称" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>" />
        </p>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th>品牌编号</th>
			<th>品牌名称</th>
			<th>品牌描述</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="brand">
			<tr>
				<td><c:out value='${brand.brandNo}'/></td>
				<td><c:out value='${brand.brandName}'/></td>
				<td class="nwp"><c:out value='${brand.brandDesc}' escapeXml="true"/></td>
				<td>
					<c:url value="/${system }/simcard/editSimCardBrand.do" var="getBrand">
						<c:param name="brandId" value="${brand.brandId}"/>
					</c:url>
					<a href="${getBrand}">编辑</a>
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


