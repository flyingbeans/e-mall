<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title><fmt:message key="tag.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
	function checkLogNotes(){
		var objValue = $("#logNotes").val();
		var reg = new RegExp("^.{0,90}$");
		if(!reg.test(objValue)){
			return false;
		}
		return true;
	}

    function checkY(status){
    	if(!checkLogNotes()){
    		alert("请限制在90个字符以内");
    	} else {
    		tipShow('#confirmDiv');
            $("input[id='confirmDivOk']").click(function(){
				$("#auditStatus").val(status);
		       	 var options = { 
		       		beforeSubmit:  validateData,  	 
		   			success:  showResponse 	 
		       	 }; 
		       	 $("#form1").ajaxSubmit(options); 
			})
    		
    	}
    }
	function validateData(formData, jqForm, options){
    	return true;
	}
	function showResponse(responseText, statusText){ 
		var obj=eval("("+responseText+")");
 		alert(obj.message);
		if(obj.result=="success"){
			document.location=url="${base}/activity/listAudit.do?auditStatus=${auditStatus}&labelStatus=${labelStatus}";	
		}
	}
	$(document).ready(function(){
		//适用地市
		var area = $("area");
		//选中已选的地市
		$("input[name='offerGroupArea']").each(function(){
			var value = $(this).val();
			<c:forEach items='${offerGroup.listOfferGroupArea }' var="area1">
			if('${area1.areaId}' == value ){
				$(this).attr("checked",true);
			}
		    </c:forEach>
		});
	});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<a href="${base}/activity/listAudit.do" title="营销案管理">营销案审核</a>&nbsp;&raquo;&nbsp;<span class="gray">审核营销案</span><a href="${base}/activity/listAudit.do" class="inb btn120x20">返回营销案审核</a></div>
	<form id="form1" name="form1" action="${base}/activity/auditOfferGroup.do" method="post">
         <div class="edit set">
         	<p>
            	<label>营销类型：</label>
            	<c:choose>
            		<c:when test="${offerGroup.offerType==1 }">购物赠送礼品</c:when>
            		<c:when test="${offerGroup.offerType==2 }">预存话费送手机</c:when>
            		<c:when test="${offerGroup.offerType==3 }">购买手机送话费</c:when>
            	</c:choose>
            </p>
            <p>
            	<label>营销案名称：</label>
            	<span>${offerGroup.offerGroupName }</span>
            </p>
            <p>
            	<label>营销案编号：</label>
            	<span>${offerGroup.offerGroupNo }</span>
            </p>
            <p>
            	<label>营销案简称：</label>
           		<span>${offerGroup.shortName }</span>
            </p>
            <p>
            	<label>排序：</label>
            	<span>${offerGroup.offerGroupSort }</span>
            </p>
            <p>
            	<label>页面关键词：</label>
            	<span><c:out value="${offerGroup.keywords}"/></span>
            </p>
            <p>
				<label for="ftp">营销案图片：</label>
				<img id='defaultImgImgSrc' src="${rsImgUrlInternal}${offerGroup.defaultImg }" height="100" width="100" />
			</p>
            <p>
            	<label>购买条件：</label>
            	<c:forEach items="${offerGroup.listConstr }" var="constr">
            		<c:if test="${constr.constrName=='神州行' }"><c:set var="doing1" value="1"/></c:if>
            		<c:if test="${constr.constrName=='全球通' }"><c:set var="doing2" value="2"/></c:if>
            		<c:if test="${constr.constrName=='动感地带' }"><c:set var="doing3" value="3"/></c:if>
            	</c:forEach>
            	<input type="checkbox" name="constrId" value="1" <c:if test='${doing1==1 }'>checked</c:if> disabled="disabled"/>神州行
            	<input type="checkbox" name="constrId" value="2" <c:if test='${doing2==2 }'>checked</c:if> disabled="disabled"/>全球通
            	<input type="checkbox" name="constrId" value="3" <c:if test='${doing3==3 }'>checked</c:if> disabled="disabled"/>动感地带
            </p>
            <!-- 
            <p>
            	<label class="alg_t">开始日期：</label>
            	<span><fmt:formatDate value="${offerGroup.validBegin}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </p>
            <p>
            	<label class="alg_t">结束日期：</label>
            	<span><fmt:formatDate value="${offerGroup.validEnd}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
            </p>
             -->
            <%-- <p>
            	<label class="alg_t">赠品：</label>
            	<c:forEach items="${offerGroup.listskuFree }" var="skuFree">
            		<c:if test="${skuFree.skuId==1 }">
            			<c:set value="1" var="doing"/>
            		</c:if>
            		<c:if test="${skuFree.skuId==2 }">
            			<c:set value="2" var="doing"/>
            		</c:if>
            	</c:forEach>
            	<select id="skufreeId" name="skufreeId" disabled="disabled">
                    <option value="1" <c:if test='${doing==1 }'>selected</c:if>>洗衣粉</option>
                    <option value="2" <c:if test='${doing==2 }'>selected</c:if>>食用油</option>
                </select>
            </p> --%>
            <div class="wp92"><label>适用地市：</label>
            	<div class="pre">
	            	<c:forEach items="${area }" var="myarea" varStatus="status">
	            		 <input type="checkbox" name="offerGroupArea" value="${myarea.areaId }" disabled="disabled"><c:out value="${myarea.areaName }"></c:out>
	            		 <c:if test="${status.count == 10 }"><br/></c:if>
	            	</c:forEach>
	            	<div id="offerGroupAreaErr" class="red"></div>
            	</div>
            </div>
            <p>
            	<label class="alg_t">页面描述：</label>
            	<textarea name="pageDesc" rows="2" cols="45" disabled="disabled">${offerGroup.pageDesc }</textarea>
            </p>
            <p>
            	<label>营销案详情地址：</label>
            	<span><c:out value="${offerGroup.website }"/></span>
            </p>
            <p>
            	<label class="alg_t">营销案简介：</label>
            	<textarea name="offerGroupIntro" rows="4" cols="45" disabled="disabled">${offerGroup.offerGroupIntro }</textarea>
            </p>
             <p>
                 <input type="hidden" name="auditStatus" id="auditStatus"  value="${offerGroup.auditStatus}" >
                 <input type="hidden" name="showStatus" id="showStatus"  value="${offerGroup.showStatus}" >

             </p>
             <p>
             	<label class="alg_t">操作备注：</label>
             	<textarea id="logNotes" name="logNotes" class="are arew" style="width:50%;" rows="6" cols="80" reg="^(.|\n){0,90}$" tip="请限制在90个字符以内"></textarea>
             </p>
            <p>
            	<label>&nbsp;</label>
            	<input type="hidden" name="offerGroupId" value="${offerGroup.offerGroupId }">
            	<input  type="button" class="hand btn83x23" value="确认审核" onclick="checkY(1)"/>
                <input  type="button" class="hand btn83x23" value="审核不通过" onclick="checkY(2)" />              
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>
    <div class="edit set"><h2>操作记录</h2></div>
	 <iframe src="${base}/consolelog/top10.do?entityId=${offerGroup.offerGroupId}&tableName=EB_OFFER_GROUP" 
		width="100%" 
		height="400" 
		marginwidth="0" 
		marginheight="0" 
		frameBorder="no" 
		framespacing="0" 
		allowtransparency="true" 
		scrolling="auto"></iframe> 
</div></div>
</body>