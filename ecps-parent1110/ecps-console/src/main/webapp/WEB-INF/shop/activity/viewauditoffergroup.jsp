<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>查看营销案_营销案审核_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
	function checkFileType(type) {
		var allowFileTypes = new Array(/^\.(g|G)(i|I)(f|F)$/,/^\.(p|P)(n|N)(g|G)$/,/^\.(j|J)(p|P)(g|G)$/);
		for(var i=0;i<allowFileTypes.length;i++) {
			if (allowFileTypes[i].test(type)) {
				return true;
			}
		}
		return false;
	}
	
	function submitUpload(componentName) {
		var path=$('#'+componentName+'File').val();
		if(path==""){
			return;
		}
		var point=path.lastIndexOf(".");
		var type=path.substr(point);
		if (!checkFileType(type)) {
			alert("只允许上传格式为gif、png、jpg的图片");
			return;
		}
		var uploadUrl = $('#'+componentName+'Action').val();
		var options = {
				beforeSubmit: showUploadRequest,
				success:      showUploadResponse,
				type:         'post',
				dataType:     "script",
				data:{
					'fileObjName':componentName
				},
				url:          uploadUrl
		};
		$('#form1').ajaxSubmit(options);
	}
	function showUploadRequest(formData, jqForm, options) {
		return true;
	}
	function showUploadResponse(responseText, statusText, xhr, $form) {
		responseText = $.parseJSON(responseText);
		var componentName = responseText[0].componentName;
		var filePath = responseText[0].filePath;
		var relativePath = responseText[0].relativePath;
		$('#'+componentName).attr("value", relativePath);
		$('#'+componentName+'ImgSrc').attr("src", filePath+"?t="+(new Date()).getTime());
	}
	$(document).ready(function(){ 
	    var options = { 
	    	beforeSubmit:  validateData,  	 
	        	 success:  showResponse 	 
	    }; 
	    $("#activityID").click(function(){ 	    	
	        $("#form1").ajaxSubmit(options); 
	        return false; 
	    });
	    function validateData(formData, jqForm, options){
        	var path = $('#defaultImg').val();
			if(path == ""){
				alert("必须上传图片");
				return false;
			}
			var batchChecks = document.getElementsByName('constrId');
			var count = 0;
			for (var i = 0;i < batchChecks.length; i++) {
				if (batchChecks[i].checked) {
					count++;
				}
			}
			if(count == 0){
				alert("请选择购买条件");
        		return false;
			}
			/*
			var begin=$("#validBeginStr").val();
	    	var end=$("#validEndStr").val();
	    	if(typeof(begin)=="undefined"|| begin==""){
	    		alert("请填写开始日期！")
	    		return false;
	    	}
	    	if(typeof(end)=="undefined"|| end==""){
	    		alert("请填写结束日期！");
	    		return false;
	    	}
	    	var beginTime=new Date(Date.parse(begin.replace(/(-)/g,"/")));
	    	var endTime=new Date(Date.parse(end.replace(/(-)/g,"/")));
	    	var timeSpan=endTime-beginTime;
	    	if(timeSpan<0){
	    		alert("结束日期不能早于开始日期！");
	    		return false;
	    	}
			*/
			/*
			var website=$("#website").val();
	    	if(website!="" && website.length>0){
	    		var reg=new RegExp("^(http|https):\/\/(.){1,60}$");
	    		if(!reg.test(website)){
	    			$("#website").siblings("span").addClass("err").html("url格式不合法");
	    			return false;
	    		}
	    	}
	    	*/
	    	reg=/^.{0,90}$/;
	    	if(!reg.test($('#logNotes').val())){
	    		$('#warn').show();
	    		return false;
	    	}
	    	
	    	//得到营销案归属地信息
			var offerGroupAreaArr = [];
			$("input[name='offerGroupArea']").each(function(){
				if($(this).attr("checked") == 'checked'){
					offerGroupAreaArr.push($(this).val());
				}
			});
			
			if(offerGroupAreaArr.length == 0){
				$("#offerGroupAreaErr").addClass("err").html("适用地市不能为空");
				return false;
			}else{
				$("#offerGroupAreaErr").addClass("err").html("");
			}
	    	
	    	var result=true;
			$.ajax({
	        	type:"post",
	        	async: false,
	            url:"${base}/item/validActiveSen.do",
	            data:"offerGroupName="+$("#offerGroupName").val()+"&keywords="+$("#keywords").val()+"&pageDesc="+$("#pageDesc").val()+"&offerGroupIntro="+$("#offerGroupIntro").val()+"&offerGroupNo="+$("#offerGroupNo").val(),
	            success:function(responseText){
	            	var dataObj=eval("("+responseText+")");
	            	if(dataObj[0]._success=="false"){
	            		alert(dataObj[0]._message);
	            		result=false;
	            	}
	            }
	        });
			if(!result){
				return false;
			}
	    	return judgeWetherCanSubmit();

		}
		function showResponse(responseText, statusText){ 
			var obj=eval("("+responseText+")");
			alert(obj.message);
			if(obj.result=="success"){
				document.location.href="${base}/activity/listOfferGroup.do?labelStatus=${labelStatus}&showStatus=${offerGroup.showStatus}";	
			}
		}
	    
	});
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
		
    	$("input[name='auditStatus']").click(function(){
    		var b=$(this).val();
    		if(b==2&&$("#checkShowStatus").val()==0){
    			alert("审核不通过前需要将商品下架");
    			$("input[name='auditStatus']").eq($("#checkAuditStatus").val()).attr("checked",true);
    			return;
    		}
    		$("#checkAuditStatus").val(b);
    		if(b!=1){
    		   $("input[name='showStatus']").eq(1).attr("checked",true);
    		   $("#checkShowStatus").val(1);
    		}
    	});
    	$("input[name='showStatus']").click(function(){
    	   var a = $(this).val();
    	   $("#checkShowStatus").val(a);
    	   if(a==0&&$("#checkAuditStatus").val()!=1){
    		   alert("必须得审核通过后，才能上架");
    		   $("input[name='showStatus']").eq(1).attr("checked",true);
    		   $("#checkShowStatus").val(1);
    	   }
    	});
    });
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：商品管理&nbsp;&raquo;&nbsp;<a href="${base}/activity/listAudit.do" title="营销案审核">营销案审核</a>&nbsp;&raquo;&nbsp;<span class="gray">查看营销案</span>
        <a href="${base}/activity/listAudit.do" class="inb btn120x20">返回营销案审核</a></div>
    <form id="form1" name="form1" action="${base}/activity/updateOfferGroup.do" method="post">
         <div class="edit set">
         	<p><label>营销类型：</label>
         		<c:choose>
            		<%-- <c:when test="${offerGroup.offerType==1 }">购物送礼</c:when> --%>
            		<c:when test="${offerGroup.offerType==2 }">预存话费送手机</c:when>
            		<c:when test="${offerGroup.offerType==3 }">购买手机送话费</c:when>
            	</c:choose>
            </p>
            <p><label><samp>*</samp>营销案名称：</label><input type="text" id="offerGroupName" name="offerGroupName" value="${offerGroup.offerGroupName }" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,50}$" tip="必须是中英文或数字字符，长度1-50" class="text state" disabled="disabled"/>
            	<span class="pos"><c:out value="${offerGroupName }"/></span>
            </p>
            <p><label>营销案编号：</label><input type="text" id="offerGroupNo" name="offerGroupNo" value="${offerGroup.offerGroupNo }" maxlength="8" class="text state" reg="^[0-9]{0,8}$" tip="必须是1-8位数字" disabled="disabled"/>
            	<span class="pos"><c:out value="${offerGroupNo }"/></span>
            </p>
            <%-- <p><label><samp>*</samp>营销案简称：</label><input type="text" name="shortName" value="${offerGroup.shortName }" reg="^[A-Z]$" tip="只能是A-Z的单个字母" class="text state" /> --%>
            <p><label><samp>*</samp>营销案简称：</label><input type="text" name="shortName" value="${offerGroup.shortName }" reg="^[A-Z]{1,3}$" tip="只能是A-Z的一个至三个字母" class="text state" disabled="disabled"/> 
           		<span class="pos"></span>
            </p>
            <p><label>排序：</label><input type="text" name="offerGroupSort" value="${offerGroup.offerGroupSort}" reg="^[0-9]{0,3}$" tip="必须是1-3位数字" class="text small" disabled="disabled"/>
            	<span class="pos"></span>
            </p>
            <p><label>页面关键词：</label><input type="text" id="keywords" name="keywords" value="${offerGroup.keywords }" reg="^.{0,50}$" tip="长度不能大于50字符" class="text state" disabled="disabled"/>
            	<span class="pos"></span>
            </p>
            <p><label class="alg_t"><samp>*</samp>营销案图片：</label><img id="defaultImgImgSrc" src="${rsImgUrlInternal}${offerGroup.defaultImg }" onerror="this.src='${path}/res/imgs/deflaut.jpg'" height="100" width="100" /></p>
            <p><label></label><input type='file' size='27' id='defaultImgFile' name='defaultImgFile' class="file" onchange='submitUpload("defaultImg")' disabled="disabled"/><span class="pos"></span>
            <input type='hidden' id='defaultImgAction' name='defaultImgAction' value='${base}/uploads/upload_pic.do' />
            <input type='hidden' id='defaultImg' name='defaultImg' value="${offerGroup.defaultImg }"/>
            </p>
            <p><label><samp>*</samp>购买条件：</label>
            	<c:forEach items="${offerGroup.listConstr }" var="constr">
            		<c:if test="${constr.constrName=='神州行' }"><c:set var="doing1" value="1"/></c:if>
            		<c:if test="${constr.constrName=='全球通' }"><c:set var="doing2" value="2"/></c:if>
            		<c:if test="${constr.constrName=='动感地带' }"><c:set var="doing3" value="3"/></c:if>
            	</c:forEach>
            	<input type="checkbox" name="constrId" value="1"<c:if test='${doing1==1 }'> checked</c:if> disabled="disabled"/>神州行
            	<input type="checkbox" name="constrId" value="2"<c:if test='${doing2==2 }'> checked</c:if> disabled="disabled"/>全球通
            	<input type="checkbox" name="constrId" value="3"<c:if test='${doing3==3 }'> checked</c:if> disabled="disabled"/>动感地带
            </p>
            
            <!--  <p><label><samp>*</samp>开始日期：</label><input type="text" id="validBeginStr" name="validBeginStr" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value="${offerGroup.validBegin}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" tip="请选择开始时间"/>
            	<span class="pos"></span>
            </p>
            <p><label><samp>*</samp>结束日期：</label><input type="text" id="validEndStr" name="validEndStr" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value="${offerGroup.validEnd}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" tip="请选择开始时间"/>
               <span class="pos"></span>
            </p>-->
            <div class="wp92"><label><samp>*</samp>适用地市：</label>
            	<div class="pre">
	            	<c:forEach items="${area }" var="myarea" varStatus="status">
	            		 <input type="checkbox" name="offerGroupArea" value="${myarea.areaId }" disabled="disabled"><c:out value="${myarea.areaName }"></c:out>
	            		 <c:if test="${status.count == 10 }"><br/></c:if>
	            	</c:forEach>
	            	<div id="offerGroupAreaErr" class="red"></div>
            	</div>
            </div>
            <p><label class="alg_t">页面描述：</label><textarea id="pageDesc" name="pageDesc" rows="4" cols="45" class="are" reg="^.{0,100}$" tip="长度不能大于100" disabled="disabled"><c:out value="${offerGroup.pageDesc }"/></textarea>
            	<span class="pos"></span>
            </p>
            <p><label>营销案详情地址：</label><input type="text" id="website" name="website" size="50" value="${offerGroup.website }" maxlength="100" class="text state" disabled="disabled"/>
           		<span class="pos">请以http://开头</span>
            </p>
            <p><label class="alg_t">营销案简介：</label><textarea id="offerGroupIntro" name="offerGroupIntro" rows="4" cols="45" class="are" reg="^.{0,500}$" tip="长度不能大于500" disabled="disabled"><c:out value="${offerGroup.offerGroupIntro}"/></textarea>
            	<span class="pos"></span>
            </p>
             <ui:permTag src="/${system}/offerGroup/review.do">
             <!-- 
            <p><label>审核状态：</label><input type="radio" id="auditStatus1" name="auditStatus" value="0"<c:if test='${offerGroup.auditStatus==0 }'> checked</c:if> />待审核&nbsp;&nbsp;<input type="radio" id="auditStatus2" name="auditStatus" value="1"<c:if test='${offerGroup.auditStatus==1 }'> checked</c:if> />审核通过&nbsp;&nbsp;<input type="radio" id="auditStatus3" name="auditStatus" value="2"<c:if test='${offerGroup.auditStatus==2 }'> checked</c:if> />审核不通过
            </p>
             -->
            </ui:permTag>
             <ui:permTag src="/${system}/offerGroup/changeStatus.do">
            <p><label>上下架：</label><input type="radio" id="showStatus1" name="showStatus" value="0"<c:if test='${offerGroup.showStatus==0 }'> checked</c:if> />上架&nbsp;&nbsp;<input type="radio" id="showStatus2" name="showStatus" value="1"<c:if test='${offerGroup.showStatus==1 }'> checked</c:if> />下架
            </p>
            </ui:permTag>
            <!-- 编辑营销案，设置审核状态为待审核状态,设置上下架状态为下架状态 edited by Fengxq 20121015 -->
            <input type="hidden" id="checkAuditStatus" name="checkAuditStatus" value="0"/>
            <input type="hidden" id="checkShowStatus" name="checkShowStatus" value="1"/>
            
             <p><label class="alg_t">操作备注：</label><textarea id="logNotes" name="logNotes" class="are arew" style="width:50%;" rows="6" cols="80" disabled="disabled"></textarea><span class="pos" id="warn" style="display:none">请限制在90个字符以内</span>
            	<input type="hidden" name="oldAuditStatus" id="oldAuditStatus" value="${offerGroup.auditStatus }" >
            </p>
            <p><label>&nbsp;</label>
                <input type="hidden" name="offerGroupId" value="${offerGroup.offerGroupId }">
                <input type="hidden" name="offerType" value="${offerGroup.offerType }">
                <%-- <input type="hidden" name="mark" value="${offerGroup.shortName }"> --%>
            </p>
        </div>
	</form>
<div class="loc">&nbsp;</div>

<div class="edit set"><h2>操作记录</h2></div>
<iframe src="${base}/consolelog/top10.do?entityId=${offerGroup.offerGroupId}&tableName=EB_OFFER_GROUP" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>

</div></div>
</body>