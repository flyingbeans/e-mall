<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑标签</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="simcardmenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>

<script type="text/javascript">

$(document).ready(function() {
	pageInitialize('#form1');
	
	$("input[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
		}else{
			a.next("span").empty();
		}
	});
	
	$("textarea[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
		}else{
			a.next("span").empty();
		}
	});
	
	$("#form1").submit(function(){
			var isOk = check();
			if($(':input:radio:checked').val() == "0"){
				$.ajax({
			         type:"Get",
			         async:false,
			         url:"${base }/simcard/simCardLabel/checkLabelStatus.do",
			         data:"labelId="+${simCardLabel.labelId},
			         success:function(data){
			             if(data == "false"){
			             	isOk=false;
			             	alert("该标签已跟号码关联，请取消关联后再停用！");
			             }
			        }
				});
			}
			if(isOk){
				$.ajax({
			         type:"POST",
			         async: false,
			         url:"${base }/simcard/simCardLabel/validJSONName.do",
			         data:"labelName="+$("#labelName").val()+"&labelId="+$("#labelId").val(),
			         success:function(data){
			             if(data == "false"){
			             	isOk=false;
			             	alert("改名称已经被使用！");
			             }
			        }  
				});
			}
			return isOk;
	});
});

function check(){
	var isOk = true;
	$("input[reg1]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
			isOk = false;
		}
	});
	$("textarea[reg1]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
			isOk = false;
		}
	});
	return isOk;
}

</script>

</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<div class="loc icon"><samp class="t12"></samp>当前位置：号卡管理&nbsp;&raquo;&nbsp;</samp><a href="${base}/simcard/listSimCardLabel.do" title="标签管理">标签管理&nbsp;&raquo;&nbsp;</a><span class="gray">编辑标签</span></div>
	<form id="form1" name="form1" action="${base }/simcard/simCardLabel/updateSimCardLabel.do"  method="post" class="edit set">
		<input type="hidden" id="labelId" name="labelId" value="${simCardLabel.labelId}"/>
		<input type="hidden" id="labelNum" name="labelNum" value="${simCardLabel.labelNum}"/>
		 <p><label class="alg_t"><samp>*</samp>标签类别:</label><input type="text" id="labelDesc" name="labelDesc" reg1="^(.|\n){1,4}$" desc="只允许1-4个中英文数字符号字符!" errorspan="labelDescStyle" value="<c:out value='${simCardLabel.labelDesc}' escapeXml='true'/>"/><span id="labelDescStyle" class="pos"></span></p>
		<p>
			<label for=""><samp>*</samp>标签名称:</label><input type="text" id="labelName" name="labelName" class="txt" value="${simCardLabel.labelName}" reg1="^[a-zA-Z0-9\u4e00-\u9fa5]{1,10}$" desc="只允许1-10个中英文数字字符!" errorspan="labelNameStyle"/><span id="labelNameStyle" class="pos"></span>
		</p>
        <p><label class="alg_t">状态：</label>
        <c:if test="${simCardLabel.status == 1}">
	        <input id="status" name="status" type="radio" value= "1" checked="checked"/>启用
	        
	        <input id="status" name="status" type="radio" value= "0" />停用
	    </c:if>
	    <c:if test="${simCardLabel.status == 0}">
	        <input id="status" name="status" type="radio" value= "1" /> 启用
	        
	        <input id="status" name="status" type="radio" value= "0" checked="checked"/> 停用
	    </c:if>
		<p><label for="submit">&nbsp;</label><input type="submit" value="提 交" id="sub" class="hand btn83x23"/>&nbsp;&nbsp;
			<input type="button" value="取消" onclick="location='${base}/simcard/listSimCardLabel.do'"class="hand btn83x23b" />
		</p>
	</form>
	
	<div class="loc">&nbsp;</div>
    
</form>
</div></div></div>
</body>