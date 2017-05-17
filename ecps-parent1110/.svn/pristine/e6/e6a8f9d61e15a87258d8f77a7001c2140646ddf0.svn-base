<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>主推机型配置_代客下单</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="relpaceGuestSubmitOrder"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function(){
    	$("input[id='confirmDivOk']").click(function(){
			var form = document.getElementById("form1");
            form.action = objDelUrl + "?itemId=" + objItemId;
            form.submit();
		})
    	$("input[id='recommItemConfigConfirm']").click(function(){
    		var itemId=$("#itemId").val();
			var recommId=$("#recommId"+itemId).val();
    		var operaType = $("#operaType"+itemId).val();
			var itemHighlight=$("#itemHighlight").val();
			var contrHighl=$("#contrHighl").val();
			var expanParam1 = $("#expanParam1").val();
			if(expanParam1==''){
				$("#errorInfoAdd").html("<label>&nbsp;</label>请排序主推机型");
			}
			if(itemHighlight.length>200){
				alert("机型亮点不能大于200个字符");
				return false;
			}
			
			if(contrHighl.length>200){
				alert("合约亮点不能大于200个字符");
				return false;
			}
			var r = /^\+?[1-9][0-9]*$/;//正整数 
			if(expanParam1 !=null && expanParam1!=''){
				if(!r.test(expanParam1)){
					alert("排序只能输入正整数");
					return false;
				}
			}
			if(expanParam1>10){
				alert("排序不能大于10");
				return false;
			}
			var ajaxData="itemId="+itemId+"&itemHighlight="+itemHighlight+"&contrHighl="+contrHighl+"&operaType="+operaType+"&recommId="+recommId+"&expanParam1="+expanParam1;
			saveRecom(ajaxData);
    	});
    });
    
    
    function openParam(itemId,e){
		var e = e || window.event
		// 模态窗口高度和宽度
		var whparamObj = { width: 605, height: 430 };
		// 相对于浏览器的居中位置
		var bleft = ($(window).width() - whparamObj.width) / 2;
		var btop = ($(window).height() - whparamObj.height) / 2;
		// 根据鼠标点击位置算出绝对位置
		var tleft = e.screenX - e.clientX;
		var ttop = e.screenY - e.clientY; 
		// 最终模态窗口的位置 
		var left = bleft + tleft;
		var top = btop + ttop;   
		// 参数     
		var p = "help:no;status:no;center:yes;";   
			p += 'dialogWidth:'+(whparamObj.width)+'px;';     
			p += 'dialogHeight:'+(whparamObj.height)+'px;';  
			p += 'dialogLeft:' + left + 'px;';
			p += 'dialogTop:' + top + 'px;';
        showModalDialog("${path}/valetOrder/getItemParam.do?itemId="+itemId,"_blank", p);
	}

    $(document).ready(function(){
        searchText('#searchText','#userSearch',40);
        pageInitialize('#form1','#userSearch');
        $('#goSearch').click(function(){
            $("#pageNo").val(1);
            goSearch('#form1','#userSearch');
        });
    });

    //排序
    function orderBy(orderBy) {
		var orderByStatus = $("#orderByStatus").val();
		if (orderByStatus == null || orderByStatus == '') {
			$("#orderByStatus").val("desc");//代表排序方式，即升序还是降序
		}
		if (orderByStatus == 'desc') {
			$("#orderByStatus").val("asc");//代表排序方式，即升序还是降序
		}
		if (orderByStatus == 'asc') {
			$("#orderByStatus").val("desc");//代表排序方式，即升序还是降序
		}

		$("#orderBy").val(orderBy);//代表按那个字段排序
		$("#form1").submit();
	}
    
    //取消主推
    function singleDel(itemId) {
        var delChkUrl = '${base}/valetOrder/delRecommByItemId.do?itemId='+itemId;
        $.ajax({
        	url:delChkUrl,
        	type:"get",
         	success:function(responseText){
         		alert("操作成功");
         		window.location.href="${base}/valetOrder/configRecomm.do";
        	}
        });
    }
    //保存主推
    function saveRecom(ajaxData){
    	$.ajax({
        	type:"post",
         	url:"${base}/valetOrder/saveRecommItemAjax.do",
         	data:(ajaxData),
         	success:function(responseText){
            	var result=eval("("+responseText+")");
             	if(result._status=="true"){
             		alert(result._mes);
             		window.location.href="${base}/valetOrder/configRecomm.do";
             	}else{
             		alert(result._mes);
             	}
             	tipHide('#addItemNote');
        	}
        });
    }
    //取消\添加主推
    function toggleRecom(isRecom,itemId){
    	if(isRecom=='is'){
    		singleDel(itemId);
    	}else{
    		var ajaxData="itemId="+itemId+"&operaType=1";
    		saveRecom(ajaxData);
    	}
    }
    
    //弹出编辑/新增亮点窗口
    function openRecomDiv(itemId){
    	$("#itemId").val(itemId);
		var itemHighlight =$("#itemHighlight"+itemId).val();
		var contrHighl =$("#contrHighl"+itemId).val();
		var operaType = $("#operaType"+itemId).val();
		var expanParam1 = $("#expanParam1"+itemId).val();
		$("#errorInfoConfig").html("<label>&nbsp;</label>");
	    $("#expanParam1").val("");
	    $("#itemHighlight").val("");
	    $("#contrHighl").val("");
		if(operaType == 0 ||operaType =="0"){
			$("#itemHighlight").val(itemHighlight);
		    $("#contrHighl").val(contrHighl);
		    $("#expanParam1").val(expanParam1);
		}
	    tipHide("#errorInfoConfig");
		tipShow('#recommItemConfig');
    }
</script>
</head>
<body id="main">

<div class="frameL"><div class="box"><div class="menu icon">
	<jsp:include page="/ecps/console/common/valetordermenu.jsp"/>
</div></div></div>

<div class="frameR"><div class="box"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：代客下单管理&nbsp;&raquo;&nbsp;<span class="gray" title="主推机型 配置">主推机型配置</span></div>


<form id="form1" name="form1" action="${base}/valetOrder/configRecomm.do" method="post">
    <div class="sch">
        <input type="hidden" id="userSearch" name="userSearch" />
        <p><fmt:message key="tag.search"/>：
        <ui:select name="catID" list="catList" rootId="0" defaulttext="所有分类" defaultvalue="" currentValue="${catID}"/>
        <select id="brandId" name="brandId">
            <option value="">全部品牌</option>
            <c:forEach items='${brandList}' var="brand">
                <option value="${brand.brandId}"<c:if test='${brandId==brand.brandId}'> selected </c:if>>${brand.brandName}</option>
            </c:forEach>
        </select>
        <select name="queryRecomType">
        	<option value="0" <c:if test='${queryRecomType==0}'> selected </c:if>>全部</option>
        	<option value="1" <c:if test='${queryRecomType==1}'> selected </c:if>>主推</option>
        </select>
        <input type="text" id="searchText" name="searchText" value="${userSearch}" title="请输入商品编号或商品名称" class="text20 medium gray" />
        <input type="hidden" id="orderByStatus" name="orderByStatus" value="${orderByStatus }">
        <input type="hidden" id="orderBy" name="orderBy" value="${orderBy}">
        <input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search" />" />
    </p></div>

	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
			<th>商品编号<samp class="inb t14"></samp></th>
            <th class="wp">
            <fmt:message key='menu.rightItem.itemName'/><samp class="inb t14"></samp></th>
			<th>
			商城价
			</th>
            <th>总库存</th>
            <th>销量</th>
			<th>主推</th>
			<th>排序</th>
			<th id="operTh"><fmt:message key='tag.column.operation'/></th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="item">
			<tr>
				<td>
				<c:out value='${item.itemNo}'/></td>
                <td class="nwp">
                <c:forEach items='${item.pictureSet}' var="pic" varStatus="status">
					<c:if test='${status.index==0}'>
						<img src="${resourcePath}${pic.fileRelativePath}-50x50" />
					</c:if>
				</c:forEach>
                
                <a href="javascript:void(0);" title="${item.itemName}" onclick="openParam('${item.itemId}',event)"><c:out value='${item.itemName}' escapeXml="false" /></a>
                </td>
				<td>
				<var><fmt:formatNumber type="number" value="${item.skuPriceMin/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>元起
				</td>
                <td>
               	 <c:out value="${item.stockInventory}"></c:out>
                </td>
                <td>
               	 <c:out value="${item.sales}"></c:out>
                </td>
				<td>
					<c:choose>
						<c:when test="${ item.recommId ==null}">
						    <a href="javascript:void(0);" id="notRecom" onclick="toggleRecom('not','${item.itemId}')"><span class="not"></span></a>
							<c:set var="operaType" value="1"/><!-- 操作类型：1新增，0修改 -->
						</c:when>
						<c:otherwise>
							<a href="javascript:void(0);" id="isRecom" onclick="toggleRecom('is','${item.itemId}')"><span class="is"></span></a>
							<c:set var="operaType" value="0"/>
						</c:otherwise>
					</c:choose>
                    <input type="hidden"  id="operaType" name="operaType" value="${operaType}"/>
                    </td>
				</td>
				<td>
					${ item.expanParam1}
				</td>
				<td>
					<a href="javascript:void(0);" id="opContrHighl" onclick="openRecomDiv('${item.itemId}')" >
						<input type="hidden" value="<c:out value="${item.itemHighlight}" escapeXml="true"></c:out>" name="itemHighlight${item.itemId}" id="itemHighlight${item.itemId}">
						<input type="hidden" value="<c:out value="${item.contrHighl}" escapeXml="true"></c:out>" name="contrHighl${item.itemId}" id="contrHighl${item.itemId}">
						<input type="hidden" value="<c:out value="${item.note}" escapeXml="true"></c:out>" name="note${item.itemId}" id="note${item.itemId}">
						<input type="hidden" value="${operaType}" name="operaType${item.itemId}" id="operaType${item.itemId}">
						<input type="hidden" value="${item.recommId}" name="recommId${item.itemId}" id="recommId${item.itemId}">
						<input type="hidden" value="<c:out value="${item.expanParam1}" escapeXml="true"></c:out>" name="expanParam1${item.itemId}" id="expanParam1${item.itemId}">
						<c:choose>
							<c:when test="${not empty item.itemHighlight || not empty item.contrHighl}">
								编辑亮点
							</c:when>
							<c:otherwise>
								添加亮点
							</c:otherwise>
						</c:choose>
					</a>
				</td>
			</tr>
			</c:forEach>
			</tbody>
	</table>

    <div class="page_c">
        <span class="l inb_a">
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
</div></div></div>
 </body>