<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>用户管理_权限管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/scripts/tabletree/css/jquery.treeTable.css'/>"/>
<script type="text/javascript" src="<c:url value='/scripts/tabletree/js/jquery.treeTable.min.js'/>"></script>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
	function isChecked(){
		var isselected=false;
		$("input[name='ids']").each(function(){
			if($(this).attr("checked")){
				isselected=true;
			}
		});
		return isselected;
	}
	function batchStart(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
		var form = document.getElementById("form1");
		form.action="${base}/permission/perm/batchUpdatePermStatus.do?status=1";
		form.submit();
	}
	function batchStop(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
		var form = document.getElementById("form1"); 
		form.action="${base}/permission/perm/batchUpdatePermStatus.do?status=0";
		form.submit();
	}
	function singleDel(url){
		if(confirm("确定删除记录")){
			document.location=url;			
		}
	}
	function batchDel(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
		if(confirm("确定删除这些记录")){
			var form = document.getElementById("form1"); 
			form.action="${base}/permission/perm/batchDelPermById.do";
			form.submit();
		}
		
	}
	$(document).ready(function() {
		$("#treeid").treeTable({treeColumn:1});
	});
	$(document).ready(function(){
		$("#all").click(function(){
	     	if($("#all").attr("checked")){
	        	$("input[name='ids']").attr("checked", true);
	        }else{
	        	$("input[name='ids']").attr("checked", false);
	        }
	    });
		$("#checkall").click(function(){
			$("input[name='ids']").attr("checked", true);
			$("#all").attr("checked",true)
		});
		$("#cancelall").click(function(value){
			$("input[name='ids']").attr("checked", false);
			$("#all").attr("checked",false)
		});
	});
	$(document).ready(function(){
		<c:if test="${message!=null }">
			alert("<c:out value='${message }'/>");
		</c:if>
	});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/permissionmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：权限管理&nbsp;&raquo;&nbsp;<span class="gray" title="权限配置">权限配置</span></div>

<form id="form1" name="form1" action="${base}/permission/perm/listAllPerm.do" method="post">
	<div class="page_c">
        <span class="l">
            <c:url value="/permission/perm/forwardperm.do" var="addperm"/>
            <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
            <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
            <a href="${addperm}" title="<fmt:message key="tag.add"/>" class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>
    <!-- ======================================================================================================= -->
    <c:url value="/permission/perm/getPerm.do" var="getPerm"/>
	<c:url value="/permission/perm/deletePermById.do" var="deletePermById"/>
	<c:url value="/permission/perm/updatePermStatus.do" var="start"/>
	<c:url value="/permission/perm/updatePermStatus.do" var="stop"/>
    <ui:table name="treeid" list="listperm" rootId="0" delURL="${deletePermById }" editURL="${getPerm }" startURL="${start }" stopURL="${stop }"/>
	<!-- ======================================================================================================= -->
	<div class="page_c">
        <span class="l inb_a">
            <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
            <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
        </span>
    </div>
</form>
</div></div>
</body>


