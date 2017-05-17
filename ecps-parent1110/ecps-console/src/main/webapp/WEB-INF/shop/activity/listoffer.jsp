<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title><c:forEach items="${listgroup }" var="group"><c:if test='${group.offerGroupId==offer.offerGroupId }'><c:out value="${group.offerGroupName }"/>的</c:if></c:forEach>营销案档次_<c:forEach items="${listgroup }" var="group"><c:if test='${group.offerGroupId==offer.offerGroupId }'>营销案管理</c:if></c:forEach>_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript">
	function singleDel(url){
		tipShow('#confirmDiv');
        $("input[id='confirmDivOk']").click(function(){
			$("#form1").attr("action",url);
	       	$("#form1").submit();
		})
/* 	    if(confirm("确定删除记录")){
	    	$("#form1").attr("action",url);
	       	$("#form1").submit();
	    } */
	}
	function batchDel(){
	    if(!isChecked()){
	        alert("请选择记录");
	        return;
	    }
	    tipShow('#confirmDiv');
        $("input[id='confirmDivOk']").click(function(){
			$("#form1").attr("action","${base}/activity/delOffers.do");
	       	$("#form1").submit();
		})
/* 	    if(confirm("确定删除这些记录")){
	    	$("#form1").attr("action","${base}/activity/delOffers.do");
	       	$("#form1").submit();
	    } */
	}

    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
        goSearch('#form1','#offerName');
    }

    $(function(){
        searchText('#searchText','#offerName',40);
        pageInitialize('#form1','#offerName');
        $('#goSearch').click(function(){
            $("#pageNo").val(1);
            goSearch('#form1','#offerName');
        });
    });

	$(document).ready(function(){
		$("#all").click(function(){
	     	if($("#all").attr("checked")){
	        	$("input[name='ids']").attr("checked", true);
	        }else{
	        	$("input[name='ids']").attr("checked", false);
	        }
	    });
		$("#checkall").click(function(){
			$("input[name='ids']").attr("checked", true);
			$("#all").attr("checked",true)
		});
		$("#cancelall").click(function(value){
			$("input[name='ids']").attr("checked", false);
			$("#all").attr("checked",false)
		});

		<c:if test="${message!=null }">
			alert('<c:out value="${message }"/>');
		</c:if>
	});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<c:forEach items="${listgroup }" var="group"><c:if test='${group.offerGroupId==offer.offerGroupId}'><a href="<c:url value="/${system}/activity/listOfferGroup.do"/>">营销案管理</a>&nbsp;&raquo;&nbsp;</c:if></c:forEach><span class="gray"><c:forEach items="${listgroup }" var="group"><c:if test='${group.offerGroupId==offer.offerGroupId}'><c:out value="${group.offerGroupName }"/>的</c:if></c:forEach>营销案档次</span>
    </div>

    <form id="form1" name="form1" action="${base}/activity/listoffer.do" method="post">
	<div class="sch">
        <p><input type="hidden" id="offerName" name="offerName" />
            <fmt:message key="tag.search"/>：
        	<select id="offerGroupId" name="offerGroupId" class="select">
        		<option value="0">全部营销案</option>
            	<c:forEach items="${listgroup }" var="group">
            	<option value="${group.offerGroupId }"<c:if test='${group.offerGroupId==offer.offerGroupId }'> selected</c:if>><c:out value="${group.offerGroupName }"/></option>
            	</c:forEach>
            </select><input type="text" id="searchText" name="searchText" value="${offer.offerName }" title="请输入营销案档次编号或简称" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>

    <div class="page_c">
        <span class="l">
            <input type="button" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" onclick="batchDel();"/>
        </span>
        <span class="r inb_a">
            <c:forEach items="${listgroup }" var="group">
                 <c:if test='${group.offerGroupId==offer.offerGroupId}'>
                        <c:url value="/ecps/console/activity/forwardAddactivity.do" var="addDC">
                            <c:param name="offerGroupId" value="${offer.offerGroupId}"/>
                            <c:param name="offerType" value="${offer.offerGroup.offerType}"/>
                        </c:url>
                        <a href="${addDC}" class="btn80x20">添加档次</a>
                 </c:if>
            </c:forEach>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="全选/取消" /></th>
			<th>编号</th>
			<th>简称</th>
			<th>套餐名称</th>
			<th class="wp">所属营销案</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="offer">
			<tr>
				<td><input type="checkbox" name="ids" value="${offer.offerId}"/></td>
				<td><c:out value="${offer.offerNo }"/></td>
				<td><c:out value="${offer.offerGroup.shortName }"/><c:out value='${offer.shortName}'/></td>
				<td><c:out value="${offer.offerName}"/></td>
				<td class="nwp"><c:out value="${offer.offerGroup.offerGroupName }"/></td>
				<td>
					<c:url value="/ecps/console/activity/delOffer.do" var="delOffer">
						<c:param name="offerId" value="${offer.offerId}"/>	
					</c:url>
					<c:url value="/ecps/console/activity/getOffer.do?opt=offer" var="getOffer">
						<c:param name="offerId" value="${offer.offerId}"/>
						<c:param name="offerType" value="${offer.offerGroup.offerType}"/>
					</c:url>
					<a href="${getOffer }"><fmt:message key="tag.update"/></a>
                    <a href="javascript:void(0);" onclick="singleDel('${delOffer}')"><fmt:message key="tag.delete"/></a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
                	选择： <a id="checkall" href="javascript:void(0);" >全选</a> <samp>-</samp>
                		  <a id="cancelall" href="javascript:void(0);" >取消</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="page_c">
        <span class="l inb_a">
            <input type="button" value='<fmt:message key="tag.delete"/>' class="hand btn60x20" onclick="batchDel()"/>
        </span>
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
