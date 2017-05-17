<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>修改资料</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
$(function(){
	
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
	
	$("#go").click(function(){
		var password=$("#password").val();
		var email=$("#email").val();
		var fullName=$("#fullName").val();
		confirmPassword = $("#confirmPassword").val();
		var passwordReg = new RegExp("^[a-zA-Z0-9]{6,8}$");
		var emailReg = new RegExp("^[a-zA-Z0-9_-]{1,}@[a-zA-z0-9_-]{1,}\.[a-zA-z]{1,}$");
		var fullNameReg = new RegExp("^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$");
		if((password == "")||(password == null)){
			$("#passwordTip").html("请输入登录密码");
			return false;
		}
		if(!passwordReg.test(password)){
			$("#passwordTip").html("必须是英文或数字字符，长度6-8");
			return false;
		}
		if(password != confirmPassword){
			$("#confirmPasswordTip").html("确认密码请与登录密码一致");
			return false;
		}
		if(!emailReg.test(email)){
			return false;
		}
		if(!fullNameReg.test(fullName)){
			return false;
		}
		var tmpPassword=$("#password").val();
		if(tmpPassword.length>0){
			var md5Password=$.md5(tmpPassword);
			$("#password").val(md5Password);
		}
		var table = document.getElementById("form1");
		table.submit();
	});
});
function onchangePassword(){
	password = $("#password").val();
	confirmPassword = $("#confirmPassword").val();
	if(password == confirmPassword){
		$("#confirmPasswordTip").html("");
	}
	if((password == "")||(password == null)){
		$("#passwordTip").html("请输入登录密码");
		return false;
	} else {
		$("#passwordTip").html("");
	}
	var passwordReg = new RegExp("^[a-zA-Z0-9]{6,8}$");
	if(!passwordReg.test(password)){
		$("#passwordTip").html("必须是英文或数字字符，长度6-8");
		return false;
	} else {
		$("#passwordTip").html("");
	}
}
function onchangeConfirmPassword(){
	password = $("#password").val();
	confirmPassword = $("#confirmPassword").val();
	if(password != confirmPassword){
		$("#confirmPasswordTip").html("确认密码请与登录密码一致");
	} else {
		$("#confirmPasswordTip").html("");
	}
}
</script>
</head>
<body id="main" style="background:#f1f1f1 none">


<div class="content" style="width:100%;padding-bottom:10px;text-align:center">
	
	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统&nbsp;&raquo;&nbsp;修改资料</div>
	<form id="form1" name="form1" action="${base}/permission/user/updateUserIndex.do" method="post">
		<div class="edit set">
            <p>
            	<label class="alg_t"><samp>*</samp>登录密码：</label>
            	<input type="password" name="password" id="password" value="" onchange="onchangePassword();" /><span id="passwordTip"></span>
				<span></span>
            </p>
            <p>
            	<label class="alg_t"><samp>*</samp>确认密码：</label>
            	<input type="password" name="confirmPassword" id="confirmPassword" value="" onchange="onchangeConfirmPassword();" /><span id="confirmPasswordTip"></span>
				<span></span>
            </p>
            <p>
            	<label class="alg_t"><samp>*</samp>电子邮箱：</label>
            	<input type="text" id="email" name="email" size="30" value="${user.email }" reg1="^[a-zA-Z0-9_-]{1,}@[a-zA-z0-9_-]{1,}\.[a-zA-z]{1,}$" desc="请输入正确的email地址如XX@XX.com" errorspan="mailErroSpan"/>
				<span id="mailErroSpan"></span>
            </p>
            <p>
            	<label class="alg_t"><samp>*</samp>真实姓名：</label>
   				<input type="text" id="fullName" name="fullName" size="30" value="${user.fullName }" reg1="^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$" desc="必须是中英文或数字字符，长度2-20" errorspan="nameErroSpan"/>
				<span id="nameErroSpan"></span>
            </p>
            <p>
            	<label>性别：</label>
            	<input type="radio" name="gender" value="1" <c:if test='${user.gender==1}'>checked</c:if>/>男&nbsp;&nbsp;
				<input type="radio" name="gender" value="0" <c:if test='${user.gender==0}'>checked</c:if>/>女
            </p>
            <p>
            	<label>&nbsp;</label>
            	<input type="hidden" name="userId" value="<c:out value='${user.userId}'/>"/>
            	<input type="button" id="go" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>"/>
            	<input type="button" onclick="window.history.go(-1)" class="hand btn83x23b" value='<fmt:message key="button.cancel"/>' />
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div>
</body>

