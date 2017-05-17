<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>号卡列表_号卡管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="simCardSuit" content="simCardSuitName"/>
<script type="text/javascript">
$(document).ready(function() {
	if($("#saleStatus").val() == 1) {
        $("#label1").attr("class", "here");
    } else if($("#saleStatus").val() == 2) {
        $("#label2").attr("class", "here");
    } else if($("#saleStatus").val() == 3) {
        $("#label3").attr("class", "here");
    }
	
    searchText('#searchText','#simcardNumber',40);
    pageInitialize('#form1','#simcardNumber');
    $('#goSearch').click(function(){
        $("#pageNo").val(1);
        goSearch('#form1','#simcardNumber');
    });
    
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
	<c:if test="${failMessage!=null }">
		alert('<c:out value="${failMessage }"/>');
	</c:if>
});

function getLabelDetail(simcardId) {
	$.ajax({
		type : "POST",
		async : false,
		url : "${path}/simcard/getSimCardLabel.do?simcardId=" + simcardId,
		success : function(responseText) {
			var dataObj = eval("(" + responseText + ")");
			var labels = dataObj[0].labels;
			$('#cardlbl').html(labels);
			tipShow('#cardlblDiv');
		}
	});
}

function forBatchDel(){
	
	 if(!isChecked()){
	        alert("请选择记录");
	        return;
	    }
	    tipShow('#confirmDiv');
    $("input[id='confirmDivOk']").click(function(){
			$("#form1").attr("action","${base }/simcard/deleteSimCardByIds.do");
	       	$("#form1").submit();
		});
}

function deleteById(simcardId){
	  tipShow('#confirmDiv');
	     $("input[id='confirmDivOk']").click(function(){
	    		$("#form1").attr("action","${base }/simcard/deleteSimCardById.do?simcardId="+simcardId);
	    	   	$("#form1").submit();
			});
}
function turnStatus(showStatus,simcardId){
	//tipShow('#confirmDiv');
	tipShow('#addItemNote');
	if(showStatus == 0){
		$("#addItemNoteH2").attr("title","确定要上架吗？").html("确定要上架吗？");
	}else{
		$("#addItemNoteH2").attr("title","确定要下架吗？").html("确定要下架吗？");
	}
	$("input[id='addItemNoteConfirm']").click(function(){
			if(showStatus == 0){
				showStatus = 1;
			}else{
				showStatus = 0;
			}
			$("#logNotes").val($("#itemNote").val());
			$("#form1").attr("action","${base }/simcard/turnShowStatus.do?oldShowStatus="+showStatus+"&simcardIds="+simcardId);
		   	$("#form1").submit();
	});
}

function importSimcard() {
	tipShow("#importSimcardTip");
}

$(function(){
	$("#importSimcardTipOk").click(function(){
		var areaCodeId = $("#areaCodeId").val();
		if (areaCodeId != null) {
			tipHide("#importSimcardTip");
			tipShow("#importLoadDiv");
			$.ajax({
				type : "POST",
				url : "${path}/simcard/importSimcard.do?areaCode=" + areaCodeId,
				success : function(responseText) {
					tipHide("#importLoadDiv");
					var dataObj = eval("(" + responseText + ")");
					$("#importResultText").text(dataObj.message);
					if (dataObj.result=="true") {
						$("#importResultTitle").text("导入成功");
					} else {
						$("#importResultTitle").text("导入失败");
					}
					$("#importResultClose").click(function(){
						tipHide("#importResultDiv");
					});
					$("#importResultOk").click(function(){
						location.href = "<c:url value='/ecps/console/simcard/listSimCard.do'/>";
					});
					tipShow("#importResultDiv");
				}
			});
		}
	});
});

function turnStatusBatch(showStatus) {
	tipShow('#addItemNote');
	if(showStatus == 0){
		$("#addItemNoteH2").attr("title","确定要上架吗？").html("确定要上架吗？");
	}else{
		$("#addItemNoteH2").attr("title","确定要下架吗？").html("确定要下架吗？");
	}
	$("input[id='addItemNoteConfirm']").click(function(){
			if(showStatus == 0){
				showStatus = 1;
			}else{
				showStatus = 0;
			}
			$("#logNotes").val($("#itemNote").val());
			var index = 0;
			var ids = "";
			$("input[name='ids']").each(function(){
				var checkbox = $(this);
				if(checkbox.attr("checked")=="checked"){
					if(index>0){
						ids=ids+","+checkbox.val();
						index++;
					}else{
						ids=ids+checkbox.val();
						index++;
					}
				}
			});
			$("#form1").attr("action","${base }/simcard/turnShowStatus.do?oldShowStatus="+showStatus+"&simcardIds="+ids);
		   	$("#form1").submit();
	});
}
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<span class="gray">号卡列表</span></div>

<h2 class="h2_ch">
	<span id="tabs" class="l">
    	<a id="label1" href="${base}/simcard/listSimCard.do?saleStatus=1" title="可售" class="nor">可售</a>
        <a id="label2" href="${base}/simcard/listSimCard.do?saleStatus=2" title="预占" class="nor">预占</a>  
        <a id="label3" href="${base}/simcard/listSimCard.do?saleStatus=3" title="已售" class="nor">已售</a>
    </span>
</h2>

<form id="form1" name="form1" action="${base}/simcard/listSimCard.do" method="post">
	<input type="hidden" id="saleStatus" name="saleStatus" value="${saleStatus}" />
	<input type="hidden" id="logNotes" name="logNotes" value="" />
    <div class="sch">
    	<input type="hidden" id="simcardNumber" name="simcardNumber" />
        <p>
        	<fmt:message key="tag.search"/>：
        	<select id="simcardLocale" name="simcardLocale">
		        <option value="-1" selected>归属地</option>
		        <c:forEach items="${cityList }" var = "city">
		        	<option value="${city.areaName}"  <c:if test='${simcardLocale ==  city.areaName}'>selected</c:if>><c:out value="${city.areaName}"/></option>
		        </c:forEach>
	        </select>
        	<select id="brandName" name="brandName">
		        <option value="" >全部品牌</option>
		       <c:forEach items="${brandNameList }" var="brandName">
		        	 <option value="${brandName }" <c:if test='${lastBrandName == brandName }'>selected</c:if>><c:out value="${brandName }"/></option>
		        </c:forEach>
	        </select>
	        <select id="showStatus" name="showStatus">
		        <option value="-1" selected>全部状态</option>
		        <option value="0" <c:if test='${showStatus==0}'>selected</c:if>>已下架</option>
		        <option value="1" <c:if test='${showStatus==1}'>selected</c:if>>已上架</option>
	        </select>
	        <input type="text" id="searchText" name="searchText" value="<c:out value='${simcardNumber}' escapeXml='true'/>" title="请输入号卡" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>" />
        </p>
    </div>

    <div class="page_c">
		<span class="l inb_a">
			<input type="button" onclick="forBatchDel();" value="删除" class="hand btn60x20" />
			<ui:permTag src="/${system}/simcard/turnShowStatus.do">
			<input type="button" onclick="turnStatusBatch(0);" value="上架" class="hand btn60x20" /><input type="button" onclick="turnStatusBatch(1);" value="下架" class="hand btn60x20" />
			</ui:permTag>
	    </span>
	    <span class="r inb_a">
            <a href="###" onclick="importSimcard()" class="btn80x20" title="导入号卡">导入号卡</a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th width="3%"><input type="checkbox" name="all" id="all" title="全选/取消" /></th>
			<th>商品编号</th>
			<th>归属地</th>
			<th>号码</th>
			<th>所属品牌</th>
			<th>主套餐</th>
			<th>上下架</th>
			<th>预存话费</th>
			<c:if test="${saleStatus==1}">
				<th width="10%">操作</th>
			</c:if>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="card">
			<tr>
				<td><input type="checkbox" name="ids"  value="${card.simcardId}" /></td>
				<td><c:out value='${card.simcardNo}'/></td>
				<td><c:out value='${card.simcardLocale}'/></td>
				<td><c:out value='${card.simcardNumber}'/></td>
				<td><c:out value='${card.brandName}'/></td>
				<td><c:out value='${card.suitName }'/></td>
				<td>
					<c:choose>
						<c:when test="${card.showStatus==0}">已下架</c:when>
					   	<c:when test="${card.showStatus==1}">已上架</c:when>
					</c:choose>
				</td>
				<td>
					<c:if test="${card.prepaid != null}">
						<fmt:formatNumber value="${card.prepaid/100}" pattern="#0.00"/>元
					</c:if>
				</td>
				<c:if test="${saleStatus==1}">
					<td>
						<%--屏蔽查看功能 --%>
                    	<%-- <a href="${base}/simcard//viewSimCard.do?simcardId=${card.simcardId}" title="查看">查看</a>--%>
						<c:url value="/${system}/simcard/editSimCard.do" var="getSimCardDetail">
							<c:param name="simcardId" value="${card.simcardId}"/>
						</c:url>
						<c:if test="${card.showStatus==0 }">
								<a href="${getSimCardDetail}">编辑</a>
								<%-- <c:url value="/${system}/simcard/getSimCardLabel.do" var="getSimCardLabel">
									<c:param name="simcardId" value="${card.simcardId}"/>
								</c:url> --%>
								<a href="javascript:void(0);" onclick="deleteById(${card.simcardId})" >删除</a>
						</c:if>
						<c:if test="${card.showStatus==1 }">
								<a href="#" class="gray">编辑</a>
								<%-- <c:url value="/${system}/simcard/getSimCardLabel.do" var="getSimCardLabel">
									<c:param name="simcardId" value="${card.simcardId}"/>
								</c:url> --%>
								<a href="javascript:void(0);"   class="gray" >删除</a>
						</c:if>
						<ui:permTag src="/${system}/simcard/turnShowStatus.do">
						<c:if test="${ card.showStatus==0}">
							<a href="javascript:void(0);" onclick="turnStatus(${ card.showStatus},${card.simcardId})" >上架</a>
						</c:if>
						<c:if test="${ card.showStatus==1}">
							<a href="javascript:void(0);" onclick="turnStatus(${ card.showStatus},${card.simcardId})" >下架</a>
						</c:if>
						</ui:permTag>
						<a href="javascript:void(0);" onclick="getLabelDetail(${card.simcardId});">查看标签</a>
					</td>
				</c:if>
			</tr>
			</c:forEach>
			<tr>
				<c:choose>
					<c:when test="${saleStatus==1}"><td colspan="8"></c:when>
				   	<c:otherwise><td colspan="7"></c:otherwise>
				</c:choose>
                	选择： <a id="checkall" href="javascript:void(0);" >全选</a> <samp>-</samp>
                		  <a id="cancelall" href="javascript:void(0);" >取消</a>
				</td>
			</tr>
		</tbody>
	</table>
	<span class="l inb_a">
		&nbsp;&nbsp;&nbsp;
        <input type="button" onclick="forBatchDel();" value="删除" class="hand btn60x20" />
    </span>
    
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