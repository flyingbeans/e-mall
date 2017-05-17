<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<title>团购预告列表</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="SimCardMgmtMenu"/
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/uploads.js'/>"></script>
<script type="text/javascript">
	
$(function(){
    pageInitialize('#form1');
    
    $("#activityID").click(function(){
    	reg=/^.{0,90}$/;
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
    		if($(this).val()==null || $(this).val()=="" ||!reg2.test($(this).val()) || $(this).val().length>4 ){
    			alert('排序值请输入4位数字');
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
	<div class="loc icon"><samp class="t12"></samp>促销活动 - 团购预告列表
		<div style="float:right;top:10px;">
		<img src="${base}/images/orange.gif"/>&nbsp;即将开始&nbsp;&nbsp;&nbsp;
		<img src="${base}/images/green.gif"/>&nbsp;正在进行&nbsp;&nbsp;&nbsp;
		<img src="${base}/images/gray.gif"/>&nbsp;时间截止
		</div>
	</div>
	<form name="form1" id="form1" action="${base}/groupon/heraldGrouponUpdate.do" method="post">
		
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
		<c:forEach items="${pagination.list }" var = "groupon">
				<tr>
					<td><input type="text" class="noticeOrder" name="noticeOrder${groupon.grouponId }" style="width:50px;" maxlength="4" value="${groupon.noticeOrder }" />
						<input type="hidden" name="grouponIds" value="${groupon.grouponId }" />
					</td>
					<td><c:out value="${groupon.grouponId }"/></td>
					<%--
					<td>
						<c:set var="listArea" value="${groupon.areaList}"></c:set> 
						<c:set var="listAreaLen" value="${fn:length(groupon.areaList)}"></c:set>
						<c:forEach items="${listArea }" var="area" varStatus="p">
							<c:out value="${area.areaName}"/>
							<c:if test="${p.count != listAreaLen }">|</c:if>
						</c:forEach>
					</td>
					 --%>
					<td><c:out value="${groupon.skuList[0].itemName }"/></td>
					<td>
						 <fmt:formatDate pattern="yyyy/MM/dd HH时" value="${groupon.startTime}" type="both"/>-
					 	 <fmt:formatDate pattern="yyyy/MM/dd HH时" value="${groupon.endTime}" type="both"/>
					 </td>
					<td><fmt:formatNumber value='${groupon.skuList[0].grouponPrice/100}' pattern="#0.00"></fmt:formatNumber></td>					
					<td>
						<c:if test="${now >= groupon.endTime }">
							<img src="${base}/images/gray.gif"/>
						</c:if>
						<c:if test="${now < groupon.startTime }">
							<img src="${base}/images/orange.gif"/>
						</c:if>
						<c:if test="${now >= groupon.startTime  && now < groupon.endTime}">
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
    	<span class="pos" id="warn" style="display:none">请限制在90个字符以内</span></p>
    	<p><label>&nbsp;</label><input type="button" id="activityID" class="hand btn83x23" value="保存" /></p>
   	</div>
        
	</form>
	
	<div class="loc">&nbsp;</div>

    <div class="edit set"><h2>操作记录</h2></div>
    <iframe src="${base}/consolelog/top10.do?entityId=1&tableName=EB_GROUPON" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>
    
	</div></div>
</body>