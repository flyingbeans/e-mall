<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>商品录入及上下架管理_商品管理</title>
<meta name="heading" content="商品录入及上下架管理"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
	$(function(){
		
		//上架状态
		var showStatus = $("#showStatus").val();
		if(showStatus == '0'){
			$("#label5").attr("class","here");
		} else if(showStatus == '1'){
			$("#label4").attr("class","here");
		} else {
			$("#label6").attr("class","here");
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
		
		$("#confirm").click(function(){
			$("#showItemForm").submit();
		});
	})
	
function publishItem(itemId){
	tipShow("#importLoadDiv");
	//发布商品
	$.ajax({
		type:"post",
		dataType:"text",
		data:{
			itemId:itemId
		},
		url:"${path}/item/publishItem.do",
		success:function(responseText){
			if(responseText == "success"){
				alert("发布成功");
			} else {
				alert("发布失败");
			}
			tipHide("#importLoadDiv");
		},
		error:function(){
			alert("系统错误");
			tipHide("#importLoadDiv");
		}
	});
	
}
</script>
</head>
<body id="main">
<form action="${path}/item/showItem.do" method="post" id="showItemForm">
	<input type="hidden" name="itemId" id="itemId" value="">
	<input type="hidden" name="showStatus" id="myShowStatus" value="">
</form>
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<span class="gray" title="商品录入及上下架">商品录入及上下架</span></div>

    <h2 class="h2_ch"><span id="tabs" class="l">
        <!--  <a id="label3" href="${base}/item/listEntity.do?showStatus=2"   title="待上架实体商品" class="nor">待上架</a>  -->
        <a id="label6" href="${path}/item/listItem.do"   title="全部实体商品" class="nor">全部</a>
        <a id="label4" href="${path}/item/listItem.do?showStatus=1"   title="未上架实体商品" class="nor">未上架</a>
        <a id="label5" href="${path}/item/listItem.do?showStatus=0"  title="已上架实体商品" class="nor">已上架</a>
    </span></h2>

<form id="form1" name="form1" action="${path}/item/listItem.do" method="post">
	<input type="hidden" id="showStatus" value="${qc.showStatus }">
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
        <span class="r inb_a">
            <a href="${path}/item/toAddItem.do" class="btn80x20" title="添加商品">添加商品</a>
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
				<c:if test="${item.showStatus == 1 }">
					<a href="javascript:void(0);" onclick="publishItem(${item.itemId})">上架</a>
					<a href="/ecps-console/ecps/console/item/editItem.do?type=1&itemId=2384">编辑</a>
	  				<a href="javascript:void(0);" onclick="singleDel('2384')">删除</a>
				</c:if>
			</td>
		</tr>
		</c:forEach>
			</tbody>
			<tr>
				<td colspan="13" align="right">
                选择：<a href="javascript:void(0);" title="全选" onclick="checkAllIds();">全选</a>
                <samp>-</samp> <a href="javascript:void(0);" title="取消" onclick="uncheckAllIds()">取消</a>
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