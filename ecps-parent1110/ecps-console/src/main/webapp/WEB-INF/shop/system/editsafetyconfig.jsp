<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<title>编辑性能及安全设置_性能及安全设置_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
function safety(param) {
    var safetyconfig = document.getElementById('safetyconfig');
    if (param == "reset") {
        document.safetyconfig.action = "index.do";
        document.safetyconfig.submit();
    }
    else if (param == "update" && checkform(safetyconfig)) {
        document.safetyconfig.action = "safety_update.do";
        document.safetyconfig.submit();
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
    if(!(check(obj.safetyMaxResult) && check(obj.safetySearchMin) && check(obj.safetySearchMax)))
    {
        alert('输入项不能为空，请重新输入！');
        return false;
    }

    if(!(parseInt(obj.safetyMaxResult.value)>=0 && parseInt(obj.safetyMaxResult.value) <=200))
    {
        alert("最大返回搜索结果数的值只能在0-200之内！");
        return false;
    }

    if(parseInt(obj.safetySearchMin.value)>parseInt(obj.safetySearchMax.value))
    {
        alert("搜索关键字最小长度不能大于搜索关键字最大长度！");
        return false;
    }
    if(parseInt(obj.safetySearchMin.value)<1 || parseInt(obj.safetySearchMax.value)>40)
    {
        alert("搜索关键字长度限制在1-40！");
        return false;
    }
	*/
    return true;
}
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/system/safety/index.do"/>" title="性能及安全设置">性能及安全设置</a>&nbsp;&raquo;&nbsp;<span class="gray" title="编辑性能及安全设置">编辑性能及安全设置</span>
    <a href="<c:url value="/system/safety/index.do"/>" title="返回性能及安全设置" class="inb btn120x20">返回性能及安全设置</a></div>

    <form id="safetyconfig" name="safetyconfig" action="${base}/system/safety/safety_update.do" method="post">

    <%--
    <div class="edit set">
		<h2 title="搜索设置">搜索设置</h2>
		<p><label><samp>*</samp>最大返回搜索结果数：</label>
		<!-- reg="^([0-1]?\d{0,2})$" tip="请输入0-200之间的数字" -->
		<input type="text" id="safetyMaxResult" name="safetyMaxResult"  class="text state" value="${safety_key.safetyMaxResult}"
		  	onkeyup="this.value=value.replace(/[^\d]/g,'')"
			onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/><span class="inb gray">请输入0-200之间的数字。</span></p>
		<p><label><samp>*</samp>搜索关键字长度：</label>
		<input type="text" id="safetySearchMin" name="safetySearchMin" class="text small" value="${safety_key.safetySearchMin}"
			onkeyup="this.value=value.replace(/[^\d]/g,'')"
			onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>&nbsp;～&nbsp;
		<input type="text" id="safetySearchMax" name="safetySearchMax" class="text small" value="${safety_key.safetySearchMax}"
			onkeyup="this.value=value.replace(/[^\d]/g,'')"
			onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>个字符之间</p>
	</div>

	<div class="loc">&nbsp;</div>
	--%>
	<div class="edit set">
		<h2 title="后台设置">后台设置</h2>
		<p>
			<label>后台登陆超时时间限制：</label>
			<input type="text" id="safetySessionTime" name="safetySessionTime" class="text state" value="${safety_key.safetySessionTime}" />
			&nbsp;分钟<span class="inb gray">&nbsp;&nbsp;超时将强制退出，必须重新登录。</span>
		</p>
		<%--
		<p><label><samp>*</samp>记录登陆日志：</label>
			<input type="radio" value="1" name="safetyLoginLog" <c:if test='${safety_key.safetyLoginLog==1}'>checked</c:if>/>是&nbsp;&nbsp;
			<input type="radio" value="0" name="safetyLoginLog" <c:if test='${safety_key.safetyLoginLog==0}'>checked</c:if>/>否
		</p>
		<p><label><samp>*</samp>记录操作日志：</label>
			<input type="radio" value="1" name="safetyOperateLog" <c:if test='${safety_key.safetyOperateLog==1}'>checked</c:if>/>是&nbsp;&nbsp;
			<input type="radio" value="0" name="safetyOperateLog" <c:if test='${safety_key.safetyOperateLog==0}'>checked</c:if>/>否
		</p>
		--%>
	</div>
	<%--
	<div class="loc">&nbsp;</div>
	
	<div class="edit set">
		<h2 title="备份信息">备份信息</h2>
		<p><label>数据备份路径：</label>${safety_key.safetyBackupPath}
		<input type="hidden" name="safetyBackupPath" value="${safety_key.safetyBackupPath}" />
		</p>
	</div>
	
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="其他信息">其他信息</h2>
		<p><label>静态页后缀：</label>${safety_key.safetyStaticPageSuffix}
		<input type="hidden" name="safetyStaticPageSuffix" value="${safety_key.safetyStaticPageSuffix}" />
		</p>
		<p><label>动态页后缀：</label>${safety_key.safetyDynamicPageSuffix}
		<input type="hidden" name="safetyDynamicPageSuffix" value="${safety_key.safetyDynamicPageSuffix}" />
		</p>
	</div>
	--%>

	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<p><label>&nbsp;</label><input type="button" value="恢复初始设置" onclick="safety('reset')" class="hand btn102x26" />&nbsp;&nbsp;<input type="button" value="保存当前设置" onclick="safety('update')" class="hand btn102x26b" /></p>
	</div>
	
    </form>

</div></div></div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    