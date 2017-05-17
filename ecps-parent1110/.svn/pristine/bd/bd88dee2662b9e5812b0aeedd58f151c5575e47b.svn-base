<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@taglib uri="/WEB-INF/html.tld" prefix="ui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>角色添加</title>
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
		//判断是否返回错误信息
		if(!isSubmit){
			return false;
		}
		var value=$.trim($("#description").val());
		var area = $("area");
		//得到促销活动归属地信息
		var offerGroupAreaArr = [];
		$("input[name='offerGroupArea']").each(function(){
			if($(this).attr("checked") == 'checked'){
				offerGroupAreaArr.push($(this).val());
			}
		});
		
		var flag = 0;//标识是否显示归属地
		 $("input[name='orderType']").each(function(){
			 var a = $(this);
			 if((a.val() == 2 || a.val() == 3) && a.attr("checked")){
				 flag = 1;
			 }
		 });
		
		if(offerGroupAreaArr.length == 0 && flag == 1){
			$("#offerGroupAreaErr").addClass("err").html("营销案归属地不能为空");
			return false;
		}else{
			$("#offerGroupAreaErr").addClass("err").html("");
		}
		//得到订单归属地
		var orderAreaArr = [];
		$("input[name='orderArea']").each(function(){
			if($(this).attr("checked") == 'checked'){
				orderAreaArr.push($(this).val());
			}
		});
		
		if(orderAreaArr.length == 0 && flag == 1){
			$("#orderAreaErr").addClass("err").html("订单归属地不能为空");
			return false;
		}else{
			$("#orderAreaErr").addClass("err").html("");
		}
		
		//订单类型
		var orderTypeArr = [];
		$("input[name='orderType']").each(function(){
			if($(this).attr("checked") == 'checked'){
				orderTypeArr.push($(this).val());
			}
		});
		if(orderTypeArr.length == 0){
			$("#orderTypeErr").addClass("err").html("订单类型权限不能为空");
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

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：权限管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/permission/role/listRole.do"/>" title="角色管理">角色管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加角色">添加角色</span><a href="<c:url value="/${system}/permission/role/listRole.do"/>" title="返回角色管理" class="inb btn120x20">返回角色管理</a></div>
	<form id="form111" name="form111" action="${base}/permission/role/addRole.do" method="post">
		<div class="edit set">
            <div class="wp92">
            <div class="wp92">
            	<label class="alg_t"><samp>*</samp>角色名称：</label><input type="text" name="name" class="text state" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{3,20}$" tip="必须是中英文或数字字符，长度3-20"/>
            	<span><c:out value="${rolename}"/></span>
            </div>
            <div class="wp92">
            	<label class="alg_t"><samp>*</samp>订单类型权限：</label>
            	<div class="pre">
            		<div style="float:left;width:24%;padding-left:1%"><c:out value="裸机"></c:out><input type="checkbox" name="orderType" value="1"/></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="号卡"></c:out><input type="checkbox" name="orderType" value="2" onclick="refreshPage()" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="营销案"></c:out><input type="checkbox" name="orderType" value="3" onclick="refreshPage()" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="团购"></c:out><input type="checkbox" name="orderType" value="4" /></div>
	            	<div style="float:left;width:24%;padding-left:1%"><c:out value="秒杀"></c:out><input type="checkbox" name="orderType" value="5" /></div>
	            	<p>
	            		<span id="orderTypeErr" style="color:red"></span>
	            	</p>
	            </div>
            </div>
            <div class="wp92">
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
            <div id ="areaId" style="display:none;"><%--用于动态的显示归属地 --%>
            <div class="wp92">
            	<label class="alg_t"><samp>*</samp>营销案归属地：</label>
            	<div class="pre">
	            	<c:forEach items="${area }" var="myarea">
	            		 <div style="float:left;width:24%;padding-left:1%"><c:out value="${myarea.areaName }"></c:out><input type="checkbox" name="offerGroupArea" value="${myarea.areaId }"></div>
	            	</c:forEach>
	            	<p>
	            		<span id="offerGroupAreaErr" style="color:red"></span>
	            	</p>
	            	
	            </div>
            </div>
            <div class="wp92">
            	<label class="alg_t"><samp>*</samp>订单归属地：</label>
            	<%--
            	<select id="area" name="cityArea">
            		<option selected="selected">---请选择---</option>
            		<c:forEach items="${area }" var="myarea">
            			<option value="${myarea.areaId }"><c:out value="${myarea.areaName }"></c:out></option>
            		</c:forEach>
            		
            	</select>
            	 --%>
            	<div class="pre">
	            	<c:forEach items="${area }" var="myarea">
	            		 <div style="float:left;width:24%;padding-left:1%"><c:out value="${myarea.areaName }"></c:out><input type="checkbox" name="orderArea" value="${myarea.areaId }"></div>
	            	</c:forEach>
	            	<p>
	            		<span id="orderAreaErr" style="color:red"></span>
	            	</p>
	            	
	            </div>
	            </div>
	            </div>
            <div class="wp92">
            <div class="wp92">
            	<label class="alg_t">角色描述：</label><textarea rows="4" cols="35" class="are" id="description" name="description"></textarea>
            	<span></span>
            </div>
            <div class="wp92">
            	<label>状态：</label><input type="radio" name="status" value="1" checked="checked"/>启用&nbsp;&nbsp;<input type="radio" name="status" value="0" />停用
            </div>
            <p>
            	<label>&nbsp;</label><input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="取消" onclick="backToList('roleListUrl')" />
            </p>
        </div>
	</form>
	<input type="hidden" id="roleListUrl" name="roleListUrl" value="${base}/permission/role/listRole.do" />
    <div class="loc">&nbsp;</div>

</div></div>
</body>

