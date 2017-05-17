<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@taglib uri="/WEB-INF/html.tld" prefix="ui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑角色_角色管理_系统管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#form111").submit(function(){
		var isSubmit = true;
		$(this).find("[reg],[url]").each(function(){
			if(typeof($(this).attr("reg")) != "undefined"){
				if(!clientValidate($(this))){
					isSubmit=false;
				}
			}
		});
		var offerGroupAreaArr = [];
		var orderAreaArr = [];
		var orderTypeArr = [];
		var value=$.trim($("#description").val());
		var area = $("#area");
		
		$("input[name='offerGroupArea']").each(function(){
			if($(this).attr("checked") == 'checked'){
				offerGroupAreaArr.push($(this).val());
			}
		});
		
		var flag = 0;//标识是否显示归属地
		 $("input[name='orderType']").each(function(){
			 var a = $(this);
			 if((a.val() == "2" || a.val() == "3") && a.attr("checked")){
				 flag = 1;
			 }
		 });
		if(offerGroupAreaArr.length == 0 && flag == 1){
			$("#offerGroupAreaArr").addClass("err").html("营销活动归属地不能为空");
			return false;
		}
		
		$("input[name='orderArea']").each(function(){
			if($(this).attr("checked") == 'checked'){
				orderAreaArr.push($(this).val());
			}
		});
		
		if(orderAreaArr.length == 0  && flag == 1){
			$("#orderAreaArr").addClass("err").html("订单归属地不能为空");
			return false;
		}
		
		$("input[name='orderType']").each(function(){
			if($(this).attr("checked") == 'checked'){
				orderTypeArr.push($(this).val());
			}
		});
		if(orderTypeArr.length == 0){
			$("#orderTypeErr").addClass("err").html("订单类型权限不能为空");
			alert("订单类型权限不能为空");
			return false;
		}else{
			$("#orderTypeErr").addClass("err").html("");
		}
		//运营范围
		var businessScopeArr = [];
		$("input[name='businessScope']").each(function(){
			if($(this).attr("checked") == 'checked'){
				businessScopeArr.push($(this).val());
			}
		});
		if(businessScopeArr.length == 0){
			$("#businessScopeErr").addClass("err").html("运营范围不能为空");
			return false;
		}else{
			$("#businessScopeErr").addClass("err").html("");
		}
		
		var obj=$("#description");
		if(value.length>100){
			obj.siblings("span").addClass("err").html("角色描述最大100个字符");
			isSubmit=false;
		}
		return isSubmit;
	});
	
	$("input[name='offerGroupArea']").each(function(){
		var value = $(this).val();
		<c:forEach items='${role.list }' var="area1">
		if('${area1.areaId}' == value && '${area1.permissionType}' == 2){
			$(this).attr("checked",true);
		}
	    </c:forEach>
	});
	
	$("input[name='orderArea']").each(function(){
		var value = $(this).val();
		<c:forEach items='${role.list }' var="area1">
		if('${area1.areaId}' == value && '${area1.permissionType}' == 1){
			$(this).attr("checked",true);
		}
	    </c:forEach>
	});
	
	$("input[name='orderType']").each(function(){
		var value = $(this).val();
		<c:forEach items='${roleOrderList}' var="roleOrder">
		if('${roleOrder.orderType}' == value){
			$(this).attr("checked",true);
		}
	    </c:forEach>
	});
	$("input[name='businessScope']").each(function(){
		var value = $(this).val();
		<c:forEach items='${roleBusinessScopeList}' var="roleBusinessScope">
		if('${roleBusinessScope.businessScopeId}' == value){
			$(this).attr("checked",true);
		}
	    </c:forEach>
	});
	//初始化归属地的显示状态
	refreshPage();
});

function backToList(inputname){
	 var backListUrl=$("#"+inputname).val();
	 window.location.href=backListUrl;
}

//动态的显示归属地
function refreshPage(){
	 var flag = 0;//标识是否显示归属地
	 $("input[name='orderType']").each(function(){
		 var a = $(this);
		 if((a.val() == 2 || a.val() == 3) && a.attr("checked")){
			 flag = 1;
		 }
	 });
	 if(flag == 0){
		$( "#areaId").css("display","none");
		$("input[name='offerGroupArea']").each(function(){
			var b = $(this);
			b.attr("checked",false);
		});
		$("input[name='orderArea']").each(function(){
			var b = $(this);
			b.attr("checked",false);
		});
	 }else{
		 $( "#areaId").css("display","block");
	 }
}

</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/permissionmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：权限管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/permission/role/listRole.do"/>" title="角色管理">角色管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="编辑角色">编辑角色</span><a href="<c:url value="/${system}/permission/role/listRole.do"/>" title="返回角色管理" class="inb btn120x20">返回角色管理</a></div>
	<form id="form111" name="form111" action="${base}/permission/role/updateRole.do" method="post">
		<div class="edit set">
		 <div class="wp92">
            <div>
            	<label class="alg_t"><samp>*</samp>角色名称：</label><input type="text" name="name" class="text state" value="${role.name}" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{3,20}$" tip="必须是中英文或数字字符，长度3-20"/>
            	<span><c:out value="${rolename}"/></span>
            </div>
            <div>
            	<label class="alg_t"><samp>*</samp>订单类型权限：</label>
            	<div class="pre">
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="裸机"></c:out><input type="checkbox" name="orderType" value="1" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="号卡"></c:out><input type="checkbox" name="orderType" value="2" onclick="refreshPage()" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="营销案"></c:out><input type="checkbox" name="orderType" value="3" onclick="refreshPage()" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="团购"></c:out><input type="checkbox" name="orderType" value="4" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="秒杀"></c:out><input type="checkbox" name="orderType" value="5" /></div>
	            	<p>
	            		<span id="orderDataErr" style="color:red"></span>
	            	</p>
	            </div>
            </div>
            <div>
            	<label class="alg_t"><samp>*</samp>商品运营范围：</label>
            	<div class="pre">
            		<c:forEach items="${businessScopeList}" var="businessScope">
            			<div style="float:left;width:24%;padding-left:1%"><c:out value="${businessScope.businessScopeName}"></c:out><input type="checkbox" name="businessScope" value="${businessScope.businessScopeId}"/></div>
            		</c:forEach>
	            	<p>
	            		<span id="businessScopeErr" style="color:red"></span>
	            	</p>
	            </div>
            </div>
            </div>
            <div id ="areaId" class="wp92" style="display:none;"><%--用于动态的显示归属地 --%>
            <div>
            	<label class="alg_t"><samp>*</samp>营销活动归属地：</label>
            	<div class="pre">
	            	<c:forEach items="${area }" var="myarea">
	            		 <div style="float:left;width:24%;padding-left:1%"><c:out value="${myarea.areaName }"></c:out><input type="checkbox"  name="offerGroupArea" value="${myarea.areaId }"></div>
	            	</c:forEach>
	            	<p>
	            		<span id="offerGroupAreaArr" style="color:red"></span>
	            	</p>
	            </div>
            </div>
            <div>
            	<label class="alg_t"><samp>*</samp>订单归属地：</label>
            	<div class="pre">
	            	<c:forEach items="${area }" var="myarea">
	            		 <div style="float:left;width:24%;padding-left:1%"><c:out value="${myarea.areaName }"></c:out><input type="checkbox"  name="orderArea" value="${myarea.areaId }"></div>
	            	</c:forEach>
	            	<p>
	            		<span id="orderAreaArr" style="color:red"></span>
	            	</p>
	            </div>
            </div>
            </div>
            <div class="wp92">
            	<label class="alg_t">角色描述：</label><textarea rows="4" cols="35" id="description" name="description" class="are">${role.description}</textarea>
            	<span></span>
            </div>
            <div class="wp92">
            	<label>状态：</label><input type="radio" name="status" value="1" <c:if test='${role.status==1}'>checked</c:if>/>启用&nbsp;&nbsp;<input type="radio" name="status" value="0" <c:if test='${role.status==0}'>checked</c:if>/>停用
            </div>
            <p><input type="hidden" name="id" value="<c:out value='${role.id}'/>"/>
            	<label>&nbsp;</label><input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="取消" onclick="backToList('roleListUrl')" />
            </p>
        </div>
	</form>
	<input type="hidden" id="roleListUrl" name="roleListUrl" value="${base}/permission/role/listRole.do" />
    <div class="loc">&nbsp;</div>

</div></div>
</body>

