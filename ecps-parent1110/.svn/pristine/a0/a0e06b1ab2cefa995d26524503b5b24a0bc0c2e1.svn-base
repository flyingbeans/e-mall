<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>关联类目_品牌管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/scripts/dtree/dtree.css'/>"/>
<script type="text/javascript" src="<c:url value='/${system }/scripts/dtree/dtree.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	 var options = { 
				 url:  "${path}/item/cat/assignCatForBrand.do",
		beforeSubmit:  validateData,  	 
    	 	 success:  showResponse 	 
	 }; 
	$("#submit1").click(function(){ 
   		$("#form1").ajaxSubmit(options);
    	return false; 
	});
	$("#reset").click(function(){
		document.location.href="<c:url value='/${system }/item/brand/listBrand.do'/>";	
	});
});
function validateData(formData, jqForm, options){
    return true; 
}
function showResponse(responseText, statusText){ 
	var obj=eval("("+responseText+")");
	alert(obj.message);
	if(obj.result=="success"){
		 document.location.href="<c:url value='/${system }/item/brand/listBrand.do'/>";	
	}
} 
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/brand/listBrand.do"/>" title="品牌管理">品牌管理</a>&nbsp;&raquo;&nbsp;<span class="gray">关联类目</span><a href="<c:url value="/${system }/item/brand/listBrand.do"/>" title="返回品牌管理" class="inb btn120x20">返回品牌管理</a></div>
    <form id="form1" name="form1" action="${path}/item/cat/assignCatForBrand.do" method="post">
		<div class="edit set">
            <p><label>品牌名称：</label><c:out value="${brand.brandName }"/></p>
            <p><label>&nbsp;</label><a href="javascript: d.openAll();">展开</a> | <a href="javascript: d.closeAll();">合并</a></p>
            <script type="text/javascript">
                <!--
                d = new dTree('d',true,"ids");
                d.add(0,-1,'电商系统',false);
                <c:forEach items='${listcat}' var="cat">
                    <c:set var="isDoing" value="0"/>
                    <c:forEach items='${brand.cats}' var="catid">
                        <c:if test="${catid==cat.catId }">
                            d.add('${cat.catId }','${cat.parentId }','${cat.catName }',true);
                            <c:set var="isDoing" value="1"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${isDoing==0 }">
                        d.add('${cat.catId}','${cat.parentId}','${cat.catName }',false);
                    </c:if>
                </c:forEach>
                document.write(d);
                //-->
            </script>
            <p><label>&nbsp;</label>&nbsp;&nbsp;<input type="button" id="submit1" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" /><input type="reset" id="reset" class="hand btn83x23b" value='<fmt:message key="button.cancel"/>' />
            <input type="hidden" name="brandId" value="<c:out value='${brand.brandId}'/>"/>
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>

