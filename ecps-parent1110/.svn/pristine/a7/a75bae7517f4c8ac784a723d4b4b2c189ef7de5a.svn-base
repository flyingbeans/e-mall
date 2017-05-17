<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>权限管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/${system}/scripts/dtree/dtree.css'/>"/>
<script type="text/javascript" src="<c:url value='/${system}/scripts/dtree/dtree.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("input[type='checkbox']").click(function(){
		var id=$(this).val();
		var pid=$(this).attr("pid");
		//alert(pid);
		var checked=false;
		if($(this).attr("checked")){
			checked=true;	    	
	    }
		selectedChild(id,checked);
		if(checked){
			selectedParent(pid,checked);
		}
	});
	
});
function selectedChild(pid,checked){
	$("input[pid='"+pid+"']").each(function(){
		$(this).attr("checked",checked);
		var id=$(this).val();
		var num=$("input[pid='"+id+"']").size();
		if(num>0){
			selectedChild(id,checked);
		}
	});
}
function selectedParent(pid,checked){
	$("input[value='"+pid+"']").each(function(){
		$(this).attr("checked",checked);
		var pid=$(this).attr("pid");
		var num=$("input[value='"+pid+"']").size();
		if(num>0){
			selectedParent(pid,checked);
		}
	});
}

$(document).ready(function(){
	 var options = { 
				 url:  "${base}/permission/perm/assignPermForRole.do",
		beforeSubmit:  validateData,  	 
   	 	 	 success:  showResponse 	 
	};
	$("#submit1").click(function(){ 
  		$("#form1").ajaxSubmit(options);
   		return false; 
	});
});
function validateData(formData, jqForm, options){
   return true; 
}
function showResponse(responseText, statusText){ 
	var obj=eval("("+responseText+")");
	alert(obj.message);
	if(obj.result=="success"){
		document.location="${base}/permission/role/listRole.do"
	}
	
} 
function backToList(inputname){
	 var backListUrl=$("#"+inputname).val();
	 window.location.href=backListUrl;
}

</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/permissionmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：角色分配权限<a href="<c:url value="/${system}/permission/role/listRole.do"/>" title="返回角色管理" class="inb btn120x20">返回角色管理</a></div>
	<form id="form1" name="form1" action="${base}/permission/perm/assignPermForRole.do" method="post">
		<div class="edit set">
           	<table align="left">
           		<tr>
           			<td>
           				<p>角色名称：<c:out value="${role.name}"/></p>
           				<p><a href="javascript: d.openAll();">展开</a> | <a href="javascript: d.closeAll();">合并</a></p>
						<script type="text/javascript">
							<!--
							d = new dTree('d',true,"ids");
							d.add(0,-1,'电商系统',false);
							<c:forEach items='${listperm}' var="perm">
								<c:set var="isDoing" value="0"/>
								<c:forEach items='${role.perms}' var="permid">
									<c:if test="${permid==perm.permId }">
										d.add('${perm.permId}','${perm.permUpid}','${perm.permName }',true);
										<c:set var="isDoing" value="1"/>
									</c:if>
								</c:forEach>
								<c:if test="${isDoing==0 }">
									d.add('${perm.permId}','${perm.permUpid}','${perm.permName }',false);
								</c:if>
							</c:forEach>
							document.write(d);
							//-->
						</script>
           			</td>
           		</tr>
           		<tr>
           			<td>
            			<input type="hidden" name="id" value="<c:out value='${role.id}'/>"/>
            			<input type="button" id="submit1" class="hand btn60x20" value="<fmt:message key='tag.confirm'/>" />
            			<input type="reset" class="hand btn60x20" value="取消" onclick="backToList('roleListUrl')" />
           			</td>
           		</tr>
           	</table>
        </div>
	</form>
	<input type="hidden" id="roleListUrl" name="roleListUrl" value="${base}/permission/role/listRole.do" />
    <div class="loc">&nbsp;</div>

</div></div>
</body>

