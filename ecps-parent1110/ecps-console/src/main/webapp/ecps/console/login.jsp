<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<!-- 由于订单打印order/preview.do等跳转页面不能使用装饰器，在session过期后转会login.jsp会丢失元数据及资源文件引用 故添加此段，并将login.jsp在装饰其中进行排除配置
		added by liwei(liwei17@asiainfo-linkage.com) at 2012.11.07 start -->
	<%@ include file="common/meta.jsp" %>
	<link rel="shortcut icon" href="/ecps-console/res/imgs/favicon.ico; " type="image/x-icon" />
	<link rel="stylesheet" type="text/css" media="all"  href="<c:url value='/ecps/console/res/css/style.css'/>" />
	<link rel="stylesheet" type="text/css" media="print" href="<c:url value='/ecps/console/res/css/print.css'/>" />
	<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.js'/>" ></script>
	<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/com.js'/>" ></script>
	<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/many_form_validator.js'/>" ></script>
	<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.md5.js'/>" ></script>
	<!-- liwei add end -->
    
    <title><fmt:message key="login.title"/></title>
    <meta name="heading" content="<fmt:message key='login.heading'/>"/>
    <meta name="menu" content="Login"/>
<script type="text/javascript">
$(function(){
	$("#go").click(function(){
		var tmpPassword=$("#password").val();
		if(tmpPassword.length>0){
			var md5Password=$.md5(tmpPassword);
			$("#password").val(md5Password);
		}
		var table = document.getElementById("loginForm");
		table.submit();
	});
	$(document).keydown(function(event){ 
		if(event.keyCode==13){
			$("#go").click();
		}
	});
})
</script>

</head>
<body id="login">
<div class="sbox">
	<h1 title="AsiaInfo Linkage - Tangram ECPS">AsiaInfo Linkage - Tangram ECPS</h1>
    <div class="cont">
		<h2 title="ECPS电子商城平台">ECPS电子商城平台</h2>
        <form method="post" id="loginForm" action="<%=request.getContextPath()%>/ecps/console/enter.do">
            <ul class="uls set">
            <c:if test="${message != null}">
                <li class="errorTip"><c:out value="${message}"/></li>
            </c:if>
            <li>
                <label class="required desc"><fmt:message key="label.username"/></label>
                <input type="text" class="text medium" name="username" tabindex="1" />
            </li>
            <li>
                <label class="required desc"><fmt:message key="label.password"/></label>
                <input type="password" id="password" class="text medium" name="password" tabindex="2" />
            </li>
            <!--<li><label for="captcha">验证码：</label><input type="text" id="captcha" name="captcha" maxLength="7" vld="{required:true}" class="txt txt2" /><img src="../res/img/pic/code.png" onclick="this.src='${base}/captcha.svl?d='+new Date()" class="code" alt="换一张" /><a href="#" onclick="this.src='${base}/captcha.svl?d='+new Date()" title="换一张">换一张</a></li> -->
            <li><label></label>
                <input type="button" id="go" class="hand btn102x26" name="login" value="<fmt:message key='button.login'/>" tabindex="3" />
            </li>
<!--            <li class="alg_c dev"><fmt:message key="login.passwordHint"/></li>-->
            </ul>
        </form>
	</div>
</div>
</body>
</html>