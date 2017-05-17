<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>实体商品管理_商品审核</title>
<meta name="heading" content="商品审核"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">

$(function(){
	//上架状态
	var auditStatus = $("#auditStatus").val();
	if(auditStatus == '0'){
		$("#label1").attr("class","here");
	} else if(auditStatus == '1'){
		$("#label3").attr("class","here");
	} else if(auditStatus == '2'){
		$("#label2").attr("class","here");
	} else {
		$("#label4").attr("class","here");
	}
	 /* <span class="r page">
     <input type="hidden" id="pageNo" name="pageNo" />
     <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount" />
     <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo" />
     <input type="hidden" value="${page.totalPage}" id="totalPage" name="totalPage" />
             共<var id="pagePiece" class="orange">${page.totalCount}</var>条<var id="pageTotal">${page.pageNo}/${page.totalPage}</var>
     <a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a>
     <a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a>
 </span> */
	//分页:获取页码和总页数
	var pageNo = parseInt($("#currentPageNo").val());
	var totalPage = parseInt($("#totalPage").val());
	
	if(pageNo == 1 && pageNo == totalPage){
		$("#previous").hide();
		$("#next").hide();
	}else if(pageNo == 1 && pageNo < totalPage){
		$("#previous").hide();
		$("#next").show();
	}else if(pageNo > 1 && pageNo < totalPage){
		$("#previous").show();
		$("#next").show();
	}else if(pageNo > 1 && pageNo == totalPage){
		$("#previous").show();
		$("#next").hide();
	}

	$("#next").click(function(){
		pageNo++;
		$("#pageNo").val(pageNo);
		$("#form1").submit();
	});
	$("#previous").click(function(){
		pageNo--;
		$("#pageNo").val(pageNo);
		$("#form1").submit();
	});
	$("#firstPage").click(function(){
		
		$("#pageNo").val(1);
		$("#form1").submit();
	});
	$("#lastPage").click(function(){
		
		$("#pageNo").val(totalPage);
		$("#form1").submit();
	});
	$("#selectPage").change(function(){
		var page = $(this).val();
		$("#pageNo").val(page);
		$("#form1").submit();
	});
	
	$("#selectPage").val(pageNo);
	
	$("#addItemNoteConfirm").click(function(){
		var notes = $("#itemNote").val();
		$("#notes").val(notes);
		$("#auditItemForm").submit();
	});
});

function isPass(itemId, auditStatus){
	$("#addItemNoteH2").html("商品审核");
	$("#itemNote").val("");
	tipShow("#addItemNote");
	$("#itemId").val(itemId);
	$("#myAuditStatus").val(auditStatus);
}

</script>
</head>
<body id="main">
<form action="${path}/item/auditItem.do" method="post" id="auditItemForm">
	<input type="hidden" name="itemId" id="itemId" value="">
	<input type="hidden" name="auditStatus" id="myAuditStatus" value="">
	<input type="hidden" name="notes" id="notes" value="">
</form>
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"><</samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray" title="商品审核">商品审核</span></div>

    <h2 class="h2_ch"><span id="tabs" class="l">
        <a id="label4" href="${path}/item/listAudit.do"   title="全部实体商品" class="nor">全部</a>
        <a id="label1" href="${path}/item/listAudit.do?auditStatus=0&showStatus=1" title="待审核实体商品" class="nor">待审核</a>
        <a id="label2" href="${path}/item/listAudit.do?auditStatus=2&showStatus=1"  title="审核不通过实体商品" class="nor">审核不通过</a>
        <a id="label3" href="${path}/item/listAudit.do?auditStatus=1&showStatus=1"   title="已审核实体商品" class="nor">已审核</a>
    </span></h2>

<form id="form1" name="form1" action="${path}/item/listAudit.do" method="post">
	<input type="hidden" id="auditStatus" value="${qc.auditStatus }">
    <div class="sch">
        <p>搜索：
        <ui:select name="catID" list="catList" rootId="0" defaulttext="所有分类" defaultvalue="" currentValue="${catID}"/>
        <select id="brandId" name="brandId" value="">
            <option value="">全部品牌</option>
            <c:forEach items="${bList }" var="brand">
            	<option <c:if test="${qc.brandId == brand.brandId }">selected</c:if> value="${brand.brandId }">${brand.brandName }</option>
            </c:forEach>
        </select>
        <select id="auditStatus" name="auditStatus" >
        	<option value="" selected>全部审核状态</option>
        	<option value="0" <c:if test="${qc.auditStatus == 0 }">selected</c:if>>待审核</option>
        	<option value="1" <c:if test="${qc.auditStatus == 1 }">selected</c:if>>通过</option>
        	<option value="2" <c:if test="${qc.auditStatus == 2 }">selected</c:if>>不通过</option>
        </select>
        <input type="text" id="searchText" value="${qc.itemName }" name="itemName" title="请输入商品名称" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="查询" />
    </p></div>

    <div class="page_c">
        <span class="l">
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
		<tr>
			<th>商品编号</th>
            <th class="wp">商品名称</th>
            <th>图片</th>
			<th>新品</th>
			<th>推荐</th>
			<th>特价</th>
            <th>上下架</th>
            <th>审核状态</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list }" var="item">
		<tr>
			<tr>
				<td>${item.itemNo }</td>
                <td >${item.itemName }</td>
                <td><img alt="" src="" width="50" height="50"></td>
				
				<td>
					<c:if test="${item.isNew == 1 }"><span class="is" ></span></c:if>
					<c:if test="${item.isNew == 0 }"><span class="not" ></span></c:if>
				</td>
				<td>
					<c:if test="${item.isGood == 1 }"><span class="is" ></span></c:if>
					<c:if test="${item.isGood == 0 }"><span class="not" ></span></c:if>
					
				</td>
				<td>
					<c:if test="${item.isHot == 1 }"><span class="is" ></span></c:if>
					<c:if test="${item.isHot == 0 }"><span class="not" ></span></c:if>
					
				</td>
                <td>
                	<c:if test="${item.showStatus == 0 }"><span class="is" ></span></c:if>
					<c:if test="${item.showStatus == 1 }"><span class="not" ></span></c:if>
					
                </td>
                <td>
                	
					<c:if test="${item.auditStatus == 0 }">待审核</c:if>
					<c:if test="${item.auditStatus == 1 }">通过</c:if>
					<c:if test="${item.auditStatus == 2 }">不通过</c:if>
					
                </td>
              
			<td>
				<a href="/ecps-console/shop/item/viewItem.jsp" title="查看">查看</a>
				<c:if test="${item.auditStatus == 2 }">
					<a href="/ecps-console/ecps/console/item/editItem.do?type=1&itemId=2384">编辑</a>
				</c:if>
				<c:if test="${item.auditStatus == 0 }">
					<a href="javascript:void(0);" onclick="isPass(${item.itemId}, 1)">通过</a>
					<a href="javascript:void(0);" onclick="isPass(${item.itemId}, 2)">不通过</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
			</tbody>
			<tr>
				<td colspan="13" align="right">
                选择：<a href="javascript:void(0);" title="全选" onclick="checkAllIds();">全选</a>
                <samp>-</samp> <a href="javascript:void(0);" title="取消" onclick="uncheckAllIds();">取消</a>
				</td>
			</tr>
	</table>
    
	<div class="page_c">
        <span class="l inb_a">
        </span>
        <span class="r page">
            <input type="hidden" id="pageNo" name="pageNo" />
            <input type="hidden" value="${page.totalCount}" id="totalCount" name="totalCount" />
            <input type="hidden" value="${page.pageNo}" id="currentPageNo" name="currentPageNo" />
            <input type="hidden" value="${page.totalPage}" id="totalPage" name="totalPage" />
                    共<var id="pagePiece" class="orange">${page.totalCount}</var>条<var id="pageTotal">${page.pageNo}/${page.totalPage}</var>
            <a href="javascript:void(0);" id="firstPage"  >首页</a>
            <a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a>
            <a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a>
            <select id="selectPage">
            	<c:forEach begin="1" end="${page.totalPage }" var="myPage">
            		<option value="${myPage }">第${myPage }页</option>
            	</c:forEach>
            </select>
            <a href="javascript:void(0);" id="lastPage"  >尾页</a>
        </span>
    </div>
</form>
</div></div>
 </body>