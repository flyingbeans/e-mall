<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/uploads.js'/>"></script>
<title>秒杀预告列表</title>
<script type="text/javascript">
	
$(function(){
    pageInitialize('#form1');
    
    $("#activityID").click(function(){
    	reg=/^.{0,160}$/;
    	//操作备注可以为空
    	if(!reg.test($('#logNotes').val())){
    		$('#warn').show();
    		return false;
    	} else {
    		$('#warn').hide();
    	}
    	
    	var flag = true;
    	var reg2 = new RegExp("^[\\d]*$");
    	$('.noticeOrder').each(function(index){
    		if(!reg2.test($(this).val()) || $(this).val().length>4 ){
    			alert('排序值请输入1-4位整数');
    			flag = false;
    		}
    	});
    	
    	if(flag) {
    		$("#form1").submit();	
    	}    	
    });
});

</script>
</head>
<body id="main">
	<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/promotionmenu.jsp"/>
	</div></div>
	<div class="frameR"><div class="content">
	<div class="loc icon"><samp class="t12"></samp>促销活动 - 秒杀预告列表
		<div style="float:right;top:10px;">
		<img src="${base}/images/orange.gif"/>&nbsp;即将开始&nbsp;&nbsp;&nbsp;
		<img src="${base}/images/green.gif"/>&nbsp;正在进行&nbsp;&nbsp;&nbsp;
		<img src="${base}/images/gray.gif"/>&nbsp;时间截止
		</div>
	</div>
	<form name="form1" id="form1" action="${base}/secKill/heraldSecKillUpdate.do" method="post">
		
	<div style="display:none;" id="order"></div>
   	<%--列表 --%>
	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th>排序</th>
			<th>活动编号</th>
			<%-- <th>适用地</th>--%>
			<th>商品名称</th>
			<th>活动时间</th>
			<th>活动价</th>			
			<th>时效</th>			
		</thead>
		<c:forEach items="${pagination.list }" var = "secKill">
				<tr>
					<td><input type="text" class="noticeOrder" name="noticeOrder${secKill.secKillId }" style="width:50px;" maxlength="4" value="${secKill.noticeOrder }" />
						<input type="hidden" name="secKillIds" value="${secKill.secKillId }" />
					</td>
					<td><c:out value="${secKill.secKillId }"/></td>
					<%--
					<td>
						<c:set var="listArea" value="${secKill.areaList}"></c:set> 
						<c:set var="listAreaLen" value="${fn:length(secKill.areaList)}"></c:set>
						<c:forEach items="${listArea }" var="area" varStatus="p">
							<c:out value="${area.areaName}"/>
							<c:if test="${p.count != listAreaLen }">|</c:if>
						</c:forEach>
					</td>
					 --%>
					<td class="nwp"><c:out value="${secKill.skuList[0].itemName }"/></td>
					<td>
						 <fmt:formatDate pattern="yyyy/MM/dd HH时" value="${secKill.startTime}" type="both"/>-
					 	 <fmt:formatDate pattern="yyyy/MM/dd HH时" value="${secKill.endTime}" type="both"/>
					 </td>
					<td>
					<c:set var="size" value="${fn:length(secKill.skuList)}"></c:set>
					<c:if test="${size>1}">
						<c:if test="${secKill.skuList[0].secKillPrice==secKill.skuList[size-1].secKillPrice}">
							<fmt:formatNumber value='${secKill.skuList[0].secKillPrice/100 }' pattern="#0.00"></fmt:formatNumber>
						</c:if>
						<c:if test="${secKill.skuList[0].secKillPrice!=secKill.skuList[size-1].secKillPrice }">
							<fmt:formatNumber value='${secKill.skuList[0].secKillPrice/100 }' pattern="#0.00"></fmt:formatNumber>&nbsp;-
							<fmt:formatNumber value='${secKill.skuList[size-1].secKillPrice/100 }' pattern="#0.00"></fmt:formatNumber>
						</c:if>
					</c:if>
					<c:if test="${size<=1 }">
					<fmt:formatNumber value='${secKill.skuList[0].secKillPrice/100}' pattern="#0.00"></fmt:formatNumber>
					</c:if>
					</td>					
					<td>
						<c:if test="${now >= secKill.endTime }">
							<img src="${base}/images/gray.gif"/>
						</c:if>
						<c:if test="${now < secKill.startTime }">
							<img src="${base}/images/orange.gif"/>
						</c:if>
						<c:if test="${now >= secKill.startTime  && now < secKill.endTime}">
							<img src="${base}/images/green.gif"/>
						</c:if>
					</td>					
				</tr>
			</c:forEach>			
	</table>
	<%--分页 --%>
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
    
    <div class="edit set">
    	<p><label class="alg_t">操作备注：</label><textarea id="logNotes" name="logNotes" class="are arew" style="width:50%;" rows="6" cols="80"></textarea>
    	<span class="pos" id="warn" style="display:none">请限制在160个字符以内</span></p>
    	<p><label>&nbsp;</label><input type="button" id="activityID" class="hand btn83x23" value="保存" /></p>
   	</div>
        
	</form>
	
	<div class="loc">&nbsp;</div>

    <div class="edit set"><h2>操作记录</h2></div>
    <iframe src="${base}/consolelog/top10.do?entityId=2&tableName=EB_SECKILL" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>
    
	</div></div>
</body>
</html>