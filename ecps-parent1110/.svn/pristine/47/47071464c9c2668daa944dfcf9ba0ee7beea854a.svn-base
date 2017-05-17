<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>数据导入_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script language="javascript" type="text/javascript">
function showAlt(txt){
	$('#tipText').html(txt);
	tipShow('#tipDiv');
}

//批量删除前判断要删除项是否有关联项
function syncData(){
	action = '${base}/activity/syncData.do';
	$.ajax({
		type : "post" ,
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		url : action,
		dataType : 'json',
		complete:function(data){
	    	var a = eval("("+data.responseText+")"); 
			if(a[0].result=='false'){
				showAlt("数据导入失败");
	    	}else{
	    		showAlt("数据导入成功");
	    	}
		}
	});
}

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：商品管理&nbsp;&raquo;&nbsp;<span class="gray" title="数据导入">数据导入</span></div>
	<div class="page_c">
	        <span class="l">
	            <ui:permTag src="/${system}/activity/syncData.do">
					<input type="button" onclick="syncData();" value="数据导入" class="hand btn60x20" />
				</ui:permTag>
	        </span>
	</div>
	
</div></div>
</body>

