<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<title>编辑会员设置_会员设置_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
function member(param) {
	var memberconfig = document.getElementById('memberconfig');
	if (param == "reset") {
		document.memberconfig.action = "index.do";
		document.memberconfig.submit();
	}
	else if (param == "update" && checkform(memberconfig) ) {
		document.memberconfig.action = "member_update.do";
		document.memberconfig.submit();
	}
}
function check(object)
{
  if(object.value=="")
  {
    object.focus();
    return false;
  }
  return true;
}

function checkform(obj)
{
	/*
	var reg_min=obj.memberRegisterNameMin.value;
	var reg_max=obj.memberRegisterNameMax.value;
	var reg_p_min=obj.memberRegisterPasswordMin.value;
	var reg_p_max=obj.memberRegisterPasswordMax.value;
	
	if(!(check(obj.memberRegisterNameMin) && check(obj.memberRegisterNameMax) && check(obj.memberRegisterPasswordMin) &&
			 check(obj.memberRegisterPasswordMin) && check(obj.memberRegisterPasswordMax)))
	{
		alert("输入项不能为空，请重新输入！");
		return false;
	}	
	if(parseInt(reg_min)>=parseInt(reg_max))
	{
		alert("注册用户名最小长度不能大于等于注册名最大长度！");
		return false;
	}
	if((parseInt(reg_min)<1) || parseInt(reg_max)>50)
	{
		alert("注册用户名长度范围超出限制【1-50】！");
		return false;
	}
	 if(parseInt(reg_p_min)>=parseInt(reg_p_max))
	{
		alert("注册密码长度最小值不能大于注册密码等于长度最大值！");
		return false;
	}
	if((parseInt(reg_p_min)<1) || parseInt(reg_p_max)>50)
	{
		alert("注册密码长度超出限制【1-50】!");
		return false;
	}
	*/
	if(checkReserveName(obj.memberRegisterReserveName.value)){
		alert("请输入正确的格式，如“admin”或”*admin*“。长度不超过20位字符,‘*’不在计算范围内。");
		return false;
	}
	return true;
}
//验证用户名保留字的格式：1、可以为空 2、格式为*abc*或者abc的，前者模糊匹配，后者全匹配
function checkReserveName(name){
	if(name.length==0){
		return false;
	}
	if(name.charAt(0)=="*"){
		var str=/^\*{1}[a-zA-Z0-9_\u4e00-\u9fa5]{1,20}\*{1}$/;
	}else {
		var str=/^[a-zA-Z0-9_\u4e00-\u9fa5]{0,20}$/;
	}
	if(str.test(name)){
		return false;
	}
	return true;
}

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/system/member/index.do"/>" title="会员设置">会员设置</a>&nbsp;&raquo;&nbsp;<span class="gray" title="编辑会员设置">编辑会员设置</span>
    <a href="<c:url value="/system/member/index.do"/>" title="返回会员设置" class="inb btn80x20">返回会员设置</a></div>

    <form id="memberconfig" name="memberconfig" action="${base}/system/member/member_update.do" method="post">
			
	<div class="edit set">
		<h2 title="基本设置">基本设置</h2>
		<%--
		<p><label><samp>*</samp>是否开启会员功能：</label>
				<input type="radio" value="1" name="memberOption" <c:if test='${member_key.memberOption==1}'>checked</c:if>/>是&nbsp;&nbsp;
				<input type="radio" value="0" name="memberOption" <c:if test='${member_key.memberOption==0}'>checked</c:if>/>否
		</p>
		<p><label><samp>*</samp>是否开启会员注册：</label>
				<input type="radio" value="1" name="memberRegisterOption" <c:if test='${member_key.memberRegisterOption==1}'>checked</c:if>/>是&nbsp;&nbsp;
				<input type="radio" value="0" name="memberRegisterOption" <c:if test='${member_key.memberRegisterOption==0}'>checked</c:if>/>否
		</p>
		<p><label><samp>*</samp>注册用户名长度：</label><input type="text" id="memberRegisterNameMin" name="memberRegisterNameMin"  class="text small" value="${member_key.memberRegisterNameMin}"
														onkeyup="this.value=value.replace(/[^\d]/g,'')"
          													onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>&nbsp;~&nbsp;<input type="text" id="memberRegisterNameMax" name="memberRegisterNameMax"  class="text small" value="${member_key.memberRegisterNameMax}"
														onkeyup="this.value=value.replace(/[^\d]/g,'')"
          													onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>&nbsp;个字符</p>
		<p><label><samp>*</samp>注册密码长度：</label><input type="text" id="memberRegisterPasswordMin" name="memberRegisterPasswordMin"  class="text small" value="${member_key.memberRegisterPasswordMin}"
													 onkeyup="this.value=value.replace(/[^\d]/g,'')"
          												 onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>&nbsp;~&nbsp;
		<input type="text" id="register_pass_length_max" name="memberRegisterPasswordMax"  class="text small" value="${member_key.memberRegisterPasswordMax}"
			   onkeyup="this.value=value.replace(/[^\d]/g,'')"
          		onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>&nbsp;个字符</p>
		--%>
		<p><label>用户名保留字：</label><input type="text" id="memberRegisterReserveName" name="memberRegisterReserveName"  class="text state" value="${member_key.memberRegisterReserveName}" /><span class="inb gray">可以使用 * 作为通配符，如: *admin*。</span></p>
	</div>

	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<p><label for="button">&nbsp;</label><input type="button" value="恢复初始设置" onclick="member('reset')" class="hand btn102x26" />&nbsp;&nbsp;<input type="button" value="保存当前设置" onclick="member('update')" class="hand btn102x26b" /></p>
	</div>

    </form>

</div></div></div>
</body>