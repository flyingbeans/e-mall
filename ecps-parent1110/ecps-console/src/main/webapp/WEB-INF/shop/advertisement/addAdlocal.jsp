<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加广告位_广告位管理_广告管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="AdvertisementMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script language="javascript" type="text/javascript">
var validsen = new Array();
$(function(){
	
	$("input[type='text'],textarea").change(function(){
		var obj = $(this);
		var name = $(this).parent().children().first().html();
		name = name.replace("<samp>*</samp>", "").replace(":", "");
		name = name.replace("<SAMP>*</SAMP>", "");
		$.ajax({
             type:"POST",
             async: false,
             url:"${path }/item/validSen1.do",
             dataType:'json',
             data:{
            	 content:obj.val()
             },
             complete:function(data){
            	 var a = eval("("+data.responseText+")");
            	if((a[0].senkey != null )&&(a[0].senkey != "" )){
            		showTip("'"+name+"'不能含有敏感词:"+a[0].senkey);
            		for(var i = 0;i < validsen.length; i++){
            			var reg = new RegExp(name);
            	        if(reg.test(validsen[i])){
            	        	validsen.splice(i,1);
            	        	break ;
            	        }
            		}
            		validsen.push("'"+name+"'不能含有敏感词:"+a[0].senkey);
            	} else {
            		for(var i = 0;i < validsen.length; i++){
            			var reg = new RegExp(name);
            	        if(reg.test(validsen[i])){
            	        	validsen.splice(i,1);
            	        	break ;
            	        }
            		}
            	}
            	
             	
             	obj.focus();
             	return false;
            }
        });
	});
	// 表单提交前验证
	function beforeSubmitCheck(){
		var info = "";
		for(var i = 0;i < validsen.length; i++){
	        info += (validsen[i]+"<br/>");
		}
		if(info != ""){
			showTip(info);
			return false;
		}
		var width = $("#locationWidth").val();
		var high = $("#locationHigh").val();
		var reg = new RegExp("^[0-9]*$");
        if(!reg.test(width)){
        	showTip("广告位宽:请输入1~950之间的整数");
        	return false;
        }
        if(!reg.test(high)){
        	showTip("广告位高:请输入1~950之间的整数");
        	return false;
        }
		if((width>950)||(width<1)){
			showTip("广告位宽:请输入1~950之间的整数");
			return false;
		}
		if((high>950)||(high<1)){
			showTip("广告位高:请输入1~950之间的整数");
			return false;
		}
		return true;
	}
	$("#sub").click(function(){
		var options = {
			beforeSubmit: beforeSubmitCheck,
			success: submitFormResponse,
			type: 'post',
			dataType: 'json',
			url: '${base}/adlocal/saveAdlocal.do'
		};
	    $("#fm").ajaxSubmit(options);
		});
	function submitFormResponse(data, statusText, xhr, $form){
		
		if (data[0].result != "success") {
			showTip(data[0].message);
		} else {
			window.location.href='${base}/adlocal/adlocal.do';
		}
		
	}
	function showTip(txt){
		$('#tipText').html(txt);
		tipShow('#tipDiv');
	}
});
function success(){
	window.location.href='${base}/adlocal/adlocal.do';
}
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
	<jsp:include page="/${system}/common/advertisementmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>:广告管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/adlocal/adlocal.do"/>" title="广告位管理">广告位管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加广告位">添加广告位</span><a href="<c:url value="/${system}/adlocal/adlocal.do"/>" title="返回广告位" class="inb btn120x20">返回广告位</a></div>

	<form id="fm" name="fm" action="" method="post" class="edit set">
		<p>
			<label for=""><samp>*</samp>广告位名称:</label><input type="text" id="locationName" name="locationName" class="txt"/><span class="gray">请输入4~16位的中英文或数字</span>
		</p>
        <p><label class="alg_t">广告位描述:</label><textarea id="locationDescription" name="locationDescription" rows="4" cols="60"></textarea><span class="gray">请输入140个字符内的广告位描述</span></p>
		<p><label for=""><samp>*</samp>广告位尺度:</label>宽:<input type="text" value="" id="locationWidth" name="locationWidth" />px&nbsp;&nbsp;&nbsp;高:<input type="text" id="locationHigh" name="locationHigh"  value= ""/>px<span class="gray">广告位宽、高:请输入1~950之间的整数</span></p>
		<p><label for="submit">&nbsp;</label><input type="button" value="提 交" id="sub" class="hand btn83x23" />&nbsp;&nbsp;<input type="button" value="重 置" onclick="location='${base}/adlocal/addAdlocal.do'"class="hand btn83x23b" /></p>
	</form>

	<div class="loc">&nbsp;</div>
    
</form>
</div></div>
</body>