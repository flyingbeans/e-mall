<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>实体商品管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
        goSearch('#form111','#userSearch');
    }
    $(document).ready(function(){
        searchText('#searchText','#userSearch',40);
        pageInitialize('#form111','#userSearch');
        $('#goSearch').click(function(){
            $("#pageNo").val(1);
            goSearch('#form111','#userSearch');
        });
    });
    $(document).ready(function(){
    	$("#exportData").click(function(){
    		$("#form111").ajaxSubmit({ 
    	    	beforeSubmit:  validateData,  	 
           	 	success:  showResponse,
           	 	url:"${path}/contentMaintain/appendItemToSlot.do"
       		});
    		return false;
    	});
    	function validateData(formData, jqForm, options){
    		var size=$("input[name='ids']:checked").length;
    		if(size==0){
    			alert("请选择要添加的商品");
    			return false;
    		}
    		return true;
    	}
    	function showResponse(responseText, statusText){
        	var obj=eval("("+responseText+")");
    		alert(obj[0].message);
    		if(obj[0].result=="true"){
    			document.location.href="${base}/contentMaintain/ItemList.do?slotId=${slot.slotId }";
    		}
    	}
    });
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/contentMaintainMenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<div class="loc icon"><samp class="t12"></samp>
<fmt:message key='menu.current.loc'/>：内容维护&nbsp;&raquo;&nbsp;查看商品&nbsp;&raquo;&nbsp;<span class="gray">添加商品：${slot.areaName }${slot.slotName }</span>
</div>
<div class="page_c">
	<span class="r inb_a"> 
		<a href="${base}/contentMaintain/ItemList.do?slotId=${slotId}" class="btn80x20" title="返回商品列表">返回商品列表</a>
	</span>
</div>
<form id="form111" name="form111" action="${base}/contentMaintain/exportListEntity.do" method="post">
    <div class="sch">
        <input type="hidden" id="userSearch" name="userSearch" />
        <p>
	        <fmt:message key="tag.search"/>：
	        <ui:select name="catID" list="catList" rootId="0" defaulttext="所有分类" defaultvalue="" currentValue="${catID}"/>
	        <select id="brandId" name="brandId" value="${brandId}">
	            <option value="">全部品牌</option>
	            <c:forEach items='${brandList}' var="brand">
	            <option value="${brand.brandId}"<c:if test='${brandId==brand.brandId}'> selected </c:if>>${brand.brandName}</option>
	            </c:forEach>
	        </select>
	        <input type="text" id="searchText" name="searchText" value="${userSearch}" title="请输入商品编号或商品名称" class="text20 medium gray" />
	       <input type="checkbox" name="isNew" value="1" <c:if test="${isNew == 1}">checked</c:if>/>新品&nbsp;
	       <input type="checkbox" name="isGood" value="1" <c:if test="${isGood == 1}">checked</c:if>/>精品&nbsp;
	       <input type="checkbox" name="isHot" value="1" <c:if test="${isHot == 1}">checked</c:if>/>热销&nbsp;
	       <%-- <input type="checkbox" name="isDiscount" value="1" <c:if test="${isDiscount == 1}">checked</c:if>/>特价&nbsp;&nbsp;&nbsp;&nbsp; --%>
	       <input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search" />" />
	    </p>
    </div>
    <div class="page_c">
    	<span class="r inb_a"><a href="javascript:void(0);" id="exportData" class="btn80x20">导入数据</a></span>
    </div>
	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
			<th><input type="checkbox" id="all" onclick="checkAll(this, 'ids')" name="all"/></th>
			<th><a href="javascript:orderBy('item.item_no',${nextOrderByStatus})" class="icon"><fmt:message key='menu.rightItem.itemNo'/><samp class="inb t14"></samp></a></th>
            <th><a href="javascript:orderBy('item.item_name',${nextOrderByStatus})" class="icon"><fmt:message key='menu.rightItem.itemName'/><samp class="inb t14"></samp></a></th>
			<th>促销语</th>
			<th><a href="javascript:orderBy('price_min',${nextOrderByStatus})" class="icon">商城价格<samp class="inb t14"></samp></a></th>
			<th>新品</th>
			<th>精品</th>
			<th>热销</th>
			<!-- <th>特价</th> -->
            <th><a href="javascript:orderBy('sku.stock_inventory',${nextOrderByStatus})" class="icon"><fmt:message key='menu.rightItem.stock'/><samp class="inb t14"></samp></a></th>
			<th>状态</th>
			<th><a href="javascript:orderBy('item.on_sale_time',${nextOrderByStatus})" class="icon">上架时间<samp class="inb t14"></samp></a></th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="item">
			<tr>
				<td><input type="checkbox" name="ids" value="${item.itemId}"/></td>
				<td><c:out value='${item.itemNo}'/></td>
                <td class="nwp"><c:out value='${item.itemName}' escapeXml="false" /></td>
                <td class="nwp">${item.promotion }</td>
				<td><var><fmt:formatNumber type="number" value="${item.skuPriceMin/100}" pattern="#.##" minFractionDigits="2"/></var>元起</td>
				<td>
					<c:choose>
						<c:when test="${item.isNew == 1}">
							<span class="is" ></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not"></span>
					   	</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${item.isGood == 1}">
							<span class="is" ></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not" ></span>
					   	</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${item.isHot == 1}">
							<span class="is" ></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not" ></span>
					   	</c:otherwise>
					</c:choose>
				</td>
				<%-- <td>
					<c:choose>
						<c:when test="${item.isDiscount == 1}">
							<span class="is" ></span>
					   	</c:when>
					  	<c:otherwise>
					  		<span class="not" ></span>
					   	</c:otherwise>
					</c:choose>
				</td> --%>
                <td>${item.stock}</td>
                <td>
			 			<c:choose>
						<c:when test="${item.showStatus==0}">
						<span class="green"><c:out value="已上架"/></span>
						</c:when>
						<c:otherwise>
						<span class="red"><c:out value="下架"/></span>
						</c:otherwise>
					 </c:choose>
                </td>
                <td><fmt:formatDate value="${item.onSaleTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="11" align="right">
                <fmt:message key='tag.select'/>：<a href="javascript:void(0);" title="<fmt:message key='tag.selected.all'/>" onclick="checkAllIds();"><fmt:message key='tag.selected.all'/></a>
                <samp>-</samp> <a href="javascript:void(0);" title="<fmt:message key='tag.selected.cancel'/>" onclick="uncheckAllIds();"><fmt:message key='tag.selected.cancel'/></a>
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
    <input type="hidden" name="slotId" value="${slot.slotId }">
</form>
</div></div>
 </body>