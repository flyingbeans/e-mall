<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>商品分类_实体商品_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/${system}/scripts/tabletree/css/jquery.treeTable.css'/>"/>
<script type="text/javascript" src="<c:url value='/${system}/scripts/tabletree/js/jquery.treeTable.min.js'/>"></script>
<meta name="item" content="itemName"/>
<script language="javascript" type="text/javascript" >
$(function(){
	var tObj;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
			tObj = $(this);
		});
	});
	
});

$(document).ready(function() {
	$("#treeid").treeTable({treeColumn:0});
});
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/item/listEntity.do"/>" title="实体商品">实体商品</a>&nbsp;&raquo;&nbsp;<span class="gray">商品分类</span>
        <a href="<c:url value="/${system}/item/listEntity.do"/>" title="返回实体商品" class="inb btn120x20">返回实体商品</a>
    </div>

    <c:url value="/${system}/item/addItem.do" var="addItem"/>
    <ui:itemTable name="treeid" list="list" rootId="0" addURL="${addItem}"/>

    <div class="loc">&nbsp;</div>

</div></div>
</body>
