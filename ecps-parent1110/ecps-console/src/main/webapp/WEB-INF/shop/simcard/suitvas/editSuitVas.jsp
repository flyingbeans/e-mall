<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑套餐 增值业务</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>

<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>

<script type="text/javascript">
function backList(url) {
	document.location = url;
}

$(document).ready(function() {
	$("#form111").submit(function(){
		var isSubmit = check();
		if(isSubmit == false) {
			return false;
		}
		
		return isSubmit;
	});
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
    <jsp:include page="/${system }/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
	<c:url value="/${system }/simcard/listSuitVas.do?suitId=${suitId }" var="backurl"/>
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/simcard/listSuitVas.do"/>" title="套餐管理">增值策划管理</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑增值策划</span>

    </div>
    <form id="form111" name="form111" action="${path}/simcard/updateSuitVas.do" method="post" enctype="multipart/form-data">
		<div class="edit set">
			<p><label>增值业务编号：</label><span><c:out value="${suitVas.suitVasId}"/>&nbsp;</span>
			</p>
			<p><label><samp>*</samp>增值业务名称：</label><input type="text" name="suitVasName" value="<c:out value='${suitVas.suitVasName}' escapeXml='true'/>" class="text state"  reg1="^[a-zA-Z0-9\u4e00-\u9fa5]{1,60}$" desc="只允许1-60个中英文数字字符!"  errorspan="suitNameStyle"/><span id="suitNameStyle" class="pos"></span>
			</p>
			<p><label>增值业务类型：</label>
				<c:if test="${suitVas.suitVasType ==0 }">必选</c:if>
				<c:if test="${suitVas.suitVasType ==1 }">可选(默认选中)</c:if>
				<c:if test="${suitVas.suitVasType ==2 }">可选(默认不选)</c:if>
			</p>
			<p><label>所属主套餐：</label><span>
				<c:forEach items='${suitVas.suitNames }' var='suitName' varStatus='p'>
						<c:if test='${p.count > 1 }'>|</c:if>
						<c:out value='${suitName }'/>
					</c:forEach>
			</span>
			</p>
			<p><label class="alg_t">增值业务描述：</label><textarea rows="4" cols="45" name="suitVasDesc" class="are" reg1="^(.|\n){0,160}$" desc="最多只允许160个中英文字符、数字或符号!" errorspan="suitDescStyle"><c:out value='${suitVas.suitVasDesc}' escapeXml='true'/></textarea><span id="suitDescStyle" class="pos"></span>
			</p>
			<p><label><samp>*</samp>排序：</label><input type="text" name="suitVasSort" value="${suitVas.suitVasSort}" class="text state" reg1="^[1-9]{1}\d{0,3}$" desc="只允许1-9999的数字!" errorspan="sortStyle"/><span id="sortStyle" class="pos"></span>
			</p>
			<p><label>&nbsp;</label><input type="submit" class="hand btn83x23" value="提交" /><input type="button" class="hand btn83x23b" id="reset1" value='<fmt:message key="button.cancel"/>' onclick="backList('${backurl}')"/>
				<input type="hidden" name="suitVasId" value="${suitVas.suitVasId}"/>
				<input type="hidden" name="suitId" value="${suitId }"/>
			</p>
		</div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>