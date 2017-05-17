<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/html.tld" prefix="ui" %>
<head>
<title>编辑类目_分类管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="cat" content="catName"/>
<script type="text/javascript">
function backList(url){
	document.location=url;
}
function checkCatNameAndMark(catId ,catName,catMark){
	var lock=0;
	$.ajax({
		type:'post',
		url:'${path }/item/cat/checkCatName.do?catId='+catId+'&catName='+catName,
		dataType: 'json',
		async:false,
		complete:function(data) {
			if(data!=undefined && data.responseText !=undefined && data.responseText !=""){
                var valueData = eval("("+data.responseText+")");
				var result=valueData.result;
				if(result==2){
					$("#nameInfo").html("此分类名称已经存在！");
					$("#catName").focus();
					return false;
				}
				else {
					if(checkCatMark(catId ,catMark)){
						lock=1;					
					}else{
						//do nothing
					}
				}
			}
	        }
	});
	return lock;
}
function checkCatMark(catId ,catMark){
	var lock=0;
	$.ajax({
		type:'post',
		url:'${path }/item/cat/checkCatMark.do?catId='+catId+'&catMark='+catMark,
		dataType: 'json',
		async:false,
		complete:function(data) {
			if(data!=undefined && data.responseText !=undefined && data.responseText !=""){
                var valueData = eval("("+data.responseText+")");
				var result=valueData.result;
				if(result==2){
					$("#markInfo").html("此标识已经存在!");
					$("#catMark").focus();
				}else {
					lock=1;
				}
					
			}
	        }
	});
	return lock;
}
$(document).ready(function(){
	
	<c:if test="${catNameInfo0!=null }">
    	alert("<c:out value='${catNameInfo0 }'/>");
	</c:if>
	
	$("#form111").submit(function(){
		var isSubmit = true;
		var catId=$("#catId").val();
		var catName=$("#catName").val();
		var catMark=$("#catMark").val();
		if(!checkCatNameAndMark(catId ,catName,catMark)){
			isSubmit = false;
		}
		var parentId=$("#parentId").val();
		$(this).find("[reg],[url]").each(function(){
			
			if(typeof($(this).attr("reg")) != "undefined"){
				if(!clientValidate($(this))){
					isSubmit = false;
				}
			}
		});
		return isSubmit;
	});
});
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
	<c:if test="${rootId==1 }">
		<c:url value="/${system}/item/cat/listCat.do?catType=${rootId }" var="backurl"/>
	</c:if>
	<c:if test="${rootId==2 }">
		<c:url value="/${system}/card/listCardCat.do?catType=${rootId }" var="backurl"/>
	</c:if>
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/item/cat/listCat.do?catType=1"/>" title="分类管理">分类管理</a>&nbsp;&raquo;&nbsp;<fmt:message key='menu.editCat'/>
    <a href="${backurl }" title="返回分类管理" class="inb btn80x20">返回分类管理</a>
    </div>
	<form id="form111" name="form111" action="${path }/item/cat/updateCat.do" method="post">
	    <div class="edit set">      
            <p><label><samp>*</samp>分类名称：</label><input type="text" id="catName" name="catName" class="text state" value="${cat.catName}" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,40}$" tip="必须是中英文或数字字符，长度1-40"/>
            <span id="nameInfo"><c:out value="${catNameInfo1}"/></span>
            </p>
            
      		<p><label>上级分类：</label><ui:select name="parentId" list="listcat" currentValue="${cat.parentId }" rootId="0" defaultvalue="0" defaulttext="请选择类目"/>
      		</p>
      		
      		<p><label><samp>*</samp>标识：</label><input type="text" id="catMark" name="mark" id="catMark" class="text state" value="${cat.mark}" reg="^[a-zA-Z0-9]{1,20}$" tip="必须是英文或数字字符，长度1-20"/>
      		<span id="markInfo" class="pos"><c:out value="${catNameInfo2}"/></span>
      		</p>
            <p><label><samp>*</samp>排序：</label><input type="text" name="catSort" class="text small" value="${cat.catSort}" reg="^(?!0)(?:[0-9]{1,3})$" tip="必须是正整数，大于等于1小于1000"/>
            <span class="pos"></span>
            </p>           
            
      		<p><label>页面关键词：</label><input type="text" name="keywords" class="text state" value="${cat.keywords}" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{0,40}$" tip="必须是中英文或数字字符，大于0小于等于40个字符    "/>
      		<span class="pos"></span>
      		</p>           
      		
            <p><label class="alg_t">页面描述：</label><textarea rows="4" cols="45" name="catDesc" class="are" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{0,80}$" tip="必须是中英文或数字字符，大于0小于等于80个字符    ">${cat.catDesc}</textarea>
            <span class="pos"><c:out value=""/></span>
            </p>
            
            <p><label><samp>*</samp>是否显示：</label><input type="radio" value="1" name="isDisplay"<c:if test='${cat.isDisplay == 1}'> checked</c:if> />是&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="0" name="isDisplay"<c:if test='${cat.isDisplay == 0}'> checked</c:if> />否
            </p>   
            
            <p><label>&nbsp;</label>
            <input type="submit" class="hand btn83x23" value="完成" />
           
             <input type="hidden" name="catType" value="${cat.catType }"/>
            <input type="button" class="hand btn83x23b" id="reset1" value='<fmt:message key="button.cancel"/>' onclick="backList('${backurl}')"/>
           	<input type="hidden" id="catId" name="catId" value="${cat.catId}"/>
           	<input type="hidden" name="path" value="${cat.mark}"/>
            </p>
        </div>
	</form>

    <div class="loc">&nbsp;</div>

</div></div>
</body>
