<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加营销案_营销案管理_商品管理</title>
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
		if(!checkFileType(type)){
			alert("只允许上传格式为gif、png、jpg的图片");
			return;
		}
		var uploadUrl = $('#'+componentName+'Action').val();
		var options = {
			beforeSubmit: showUploadRequest,
			success:      showUploadResponse,
			error:		  showUploadResponse_error,
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
		//added by Fengxq 20121101
		$("#defaultImgFileSpan").html("请上传图片的大小不超过3MB");
	}
	//added by Fengxq 20121101上传图片超过规定的大小以后把提示信息用红色字体显示
	function showUploadResponse_error(){
		$("#defaultImgFileSpan").html("<font color='red'>请上传图片的大小不超过3MB</font>");
	}
	//=======================================================
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

	    	var website=$("#website").val();
	    	if(website!="" && website.length>0){
	    		var reg=new RegExp("^http://(.)*");
	    		if(!reg.test(website)){
	    			alert("请重新填写营销案性情地址并且以http://开头，或者删除详情地址!");
	    		//	$("#website").siblings("span").addClass("err").html("url格式不合法");
	    			return false;
	    		}
	    	}

	    	/*
	    	var begin=$("#validBegin").val();
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
         	var path = $('#defaultImg').val();
			if (path == "") {
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
			
			//得到促销活动归属地信息
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
				document.location.href="${base}/activity/listOfferGroup.do";	
			}
		}
	});
	$(document).ready(function(){
		//适用地市
		var area = $("area");
    	$("input[name='auditStatus']").click(function(){
    		var b=$(this).val();
    		$("#checkAuditStatus").val(b);
    		if(b!=1){
    		   $("input[name='showStatus']").eq(1).attr("checked",true);
    		}
    	});
    	$("input[name='showStatus']").click(function(){
    	   var a = $(this).val();
    	   if(a==0&&$("#checkAuditStatus").val()!=1){
    		   alert("必须得审核通过后，才能上架");
    		   $("input[name='showStatus']").eq(1).attr("checked",true);
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

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：商品管理&nbsp;&raquo;&nbsp;<a href="${base}/activity/listOfferGroup.do" title="营销案管理">营销案管理</a>&nbsp;&raquo;&nbsp;<span class="gray">添加营销案</span>
        <a href="${base}/activity/listOfferGroup.do" class="inb btn120x20">返回营销案管理</a></div>
	<form id="form1" name="form1" action="${base}/activity/addOfferGroup.do" method="post">
         <div class="edit set">
         	<p><label class="alg_t"><samp>*</samp>营销类型：</label>
         	<select name="offerType">
	           	<!-- 
	           	<option value="1">购物送礼</option>
	            -->
	            <option value="2">预存话费送手机</option>
	            <option value="3">购买手机送话费</option>
            </select>
            </p>
            <p><label><samp>*</samp>营销案名称：</label><input type="text" id="offerGroupName" name="offerGroupName" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,50}$" tip="必须是中英文或数字字符，长度1-50" class="text state" />
            	<span class="pos"><c:out value="${offerGroupName }"/></span>
            </p>
            <!-- <p><label><samp>*</samp>营销案简称：</label><input type="text" name="shortName" reg="^[A-Z]$" tip="请输入1至3位的大写字母" class="text state" /> -->
            <p><label><samp>*</samp>营销案简称：</label><input type="text" name="shortName" reg="^[A-Z]{1,3}$" tip="请输入1至3位的大写字母" class="text state" />
            	<span class="pos"></span>
            </p>
            <p><label>排序：</label><input type="text" name="offerGroupSort" reg="^[0-9]{0,3}$" tip="必须是1-3位数字" class="text small" />
            	<span class="pos"></span>
            </p>
            <p><label>页面关键词：</label><input type="text" id="keywords" name="keywords" reg="^.{0,50}$" tip="长度不能大于50字符" class="text state" />
            	<span class="pos"></span>
            </p>
            <p><label class="alg_t"><samp>*</samp>营销案图片：</label><img id="defaultImgImgSrc" src="<c:url value='/ecps/console/images/logo266x64.png'/>" height="100" width="100" /></p>
            <p><label></label><input type='file' size='27' id='defaultImgFile' name='defaultImgFile' class="file" onchange='submitUpload("defaultImg")' /><span class="pos" id="defaultImgFileSpan">请上传图片的大小不超过3MB</span>
            <input type='hidden' id='defaultImgAction' name='defaultImgAction' value='${base}/uploads/upload_pic.do' />
            <input type='hidden' id='defaultImg' name='defaultImg' />
            </p>
            <p><label><samp>*</samp>购买条件：</label><input type="checkbox" name="constrId" value="1" checked="checked"/>神州行&nbsp;&nbsp;<input type="checkbox" name="constrId" value="2" checked="checked"/>全球通&nbsp;&nbsp;<input type="checkbox" name="constrId" value="3" checked="checked"/>动感地带
            </p>                                                           
            <!--  <p><label><samp>*</samp>开始日期：</label><input type="text" name="validBeginStr" id="validBegin" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" tip="请选择开始时间"/>
            	<span class="pos"></span>                                                                            
            </p>
            <p><label><samp>*</samp>结束日期：</label><input type="text" name="validEndStr" id="validEndStr"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" tip="请选择结束时间"/>
            	<span class="pos"></span>
            </p>-->
            <!-- 
            <p><label>赠品：</label><select id="skufreeId" name="skufreeId">
            		<option value="0">请选择</option>
                    <option value="1">洗衣粉</option>
                    <option value="2">食用油</option>
                </select>
            </p>
           	-->
            <div class="wp92"><label><samp>*</samp>适用地市：</label>
            	<div class="pre">
            	<c:forEach items="${area }" var="myarea" varStatus="status">
            		 <input type="checkbox" name="offerGroupArea" value="${myarea.areaId }"><c:out value="${myarea.areaName }"></c:out>
            		 <c:if test="${status.count == 10 }"><br/></c:if>
            	</c:forEach>
            		<div id="offerGroupAreaErr" class="red"></div>
            	</div>
            </div>
            <p><label class="alg_t">页面描述：</label><textarea id="pageDesc" name="pageDesc" rows="4" cols="45" class="are" reg="^.{0,100}$" tip="长度不能大于100"></textarea>
            	<span class="pos"></span>
            </p>
            <p><label>营销案详情地址：</label><input type="text" id="website" name="website" size="50" maxlength="100" class="text state" />
            	<span class="pos">请以http://开头</span>
            </p>
            <p><label class="alg_t">营销案简介：</label><textarea id="offerGroupIntro" name="offerGroupIntro" class="are" reg="^.{0,500}$" tip="长度不能大于500" rows="4" cols="45"></textarea>
            	<span class="pos"></span>
            </p>
            <!--  
            <ui:permTag src="/${system}/offerGroup/review.do">
            <p><label>审核状态：</label><input type="radio" id="auditStatus1" name="auditStatus" value="0" checked="checked"/>待审核&nbsp;&nbsp;<input type="radio" id="auditStatus2"name="auditStatus" value="1"/>审核通过&nbsp;&nbsp;<input type="radio" id="auditStatus3" name="auditStatus" value="2"/>审核不通过
            </p>
            </ui:permTag>
            -->
            <ui:permTag src="/${system}/offerGroup/changeStatus.do">
            <p><label>上下架：</label>
            <input type="radio" id="showStatus1" name="showStatus" value="0" />上架&nbsp;&nbsp;<input type="radio" id="showStatus2" name="showStatus" value="1" checked="checked"/>下架
            </p>
            </ui:permTag>
            <p><label>&nbsp;</label><input id="activityID" type="button" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            <input type="hidden" id="checkAuditStatus" value="0"/>
            <input type="hidden" id="checkShowStatus" value="1"/>
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>