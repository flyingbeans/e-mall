<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑套餐 产品</title>
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
	<c:url value="/${system }/simcard/listSuitItem.do?suitId=${suitId }" var="backurl"/>
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/simcard/listSuitItem.do"/>" title="套餐管理">主套餐产品管理</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑主套餐产品</span>

    </div>
    <form id="form111" name="form111" action="${path}/simcard/updateSuitItem.do" method="post" enctype="multipart/form-data">
		<div class="edit set">
			<p><label>产品编号：</label><span><c:out value="${suitItem.suitItemId}"/>&nbsp;</span>
			</p>
			<p><label><samp>*</samp>产品名称：</label><input type="text" name="suitItemName" value="<c:out value='${suitItem.suitItemName}' escapeXml='true'/>" class="text state"  reg1="^[a-zA-Z0-9\u4e00-\u9fa5]{1,60}$" desc="只允许1-60个中英文数字字符!"  errorspan="suitNameStyle"/><span id="suitNameStyle" class="pos"></span>
			</p>
			<p>
			<label>产品类型：</label>
			<c:if test="${suitItem.suitItemType == 0 }">必选</c:if>
			<c:if test="${suitItem.suitItemType == 1 }">可选(默认选中)</c:if>
			<c:if test="${suitItem.suitItemType == 2 }">可选(默认不选)</c:if>
			</p>
			<p><label>所属主套餐：</label><span>
				<c:forEach items='${suitItem.suitNames }' var='suitName' varStatus='p'>
						<c:if test='${p.count > 1 }'>|</c:if>
						<c:out value='${suitName }'/>
					</c:forEach>
			</span>
			</p>
			<p><label class="alg_t">产品描述：</label><textarea rows="4" cols="45" name="suitItemDesc" class="are" reg1="^(.|\n){0,160}$" desc="最多只允许160个中英文字符、数字或符号!" errorspan="suitDescStyle"><c:out value='${suitItem.suitItemDesc}' escapeXml='true'/></textarea><span id="suitDescStyle" class="pos"></span>
			</p>
			<p><label><samp>*</samp>排序：</label><input type="text" name="suitItemSort" value="${suitItem.suitItemSort}" class="text state" reg1="^[1-9]{1}\d{0,3}$" desc="只允许1-9999的数字!" errorspan="sortStyle"/><span id="sortStyle" class="pos"></span>
			</p>
			<p><label>&nbsp;</label><input type="submit" class="hand btn83x23" value="提交" /><input type="button" class="hand btn83x23b" id="reset1" value='<fmt:message key="button.cancel"/>' onclick="backList('${backurl}')"/>
				<input type="hidden" name="suitItemId" value="${suitItem.suitItemId}"/>
				<input type="hidden" name="suitId" value="${suitId }"/>
			</p>
		</div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>