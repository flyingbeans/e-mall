<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>角色管理_用户管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
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
		form.action="${base}/permission/role/batchUpdateRoleStatus.do?status=1";
		form.submit();
	}
	function batchStop(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
		var form = document.getElementById("form1"); 
		form.action="${base}/permission/role/batchUpdateRoleStatus.do?status=0";
		form.submit();
	}
	//将删除角色改为ajax请求，判断该角色是否已关联用户		add by 周忠宸(zhouzc3@asiainfo-linkage.com) at 11.16 2012
	function singleDel(id){
		if(confirm("确定删除记录")){
			var ajaxData = "id=" + id;
			$.ajax({
	        	type:"post",
	         	url:"${base}/permission/role/deleteRoleById.do?ajax=true",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	        			document.location = "${base}/permission/role/listRole.do";
	             	}else{
	             		alert(result._mes);
	             	}
	        	}
	        });
		}
	}
	function batchDel(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
		if(confirm("确定删除这些记录")){
			var form = document.getElementById("form1"); 
			form.action="${base}/permission/role/batchDelRoleById.do";
			form.submit();
		}
		
	}
	$(function(){searchText('#searchText','#search',40);});
    //搜寻预处理
    function goSearch(){
        submitText('#searchText','#search',40);
        var form = document.getElementById("form1");
        form.submit();
    }
    //回车响应搜索
	$(document).keydown(function(event){ 
		if(event.keyCode==13){
			var st = $('#searchText').val();
	        if(st == '' || st == '请输入角色名'){
	        	_inputgotoPage();
	        }
	        else 
			{goSearch();}
	     
		}
	});
	//跳转页
    function _gotoPage(pageNo) {
        var tableForm = document.getElementById('form1');
        $("#pageNo").val(pageNo);
        submitText('#searchText','#search',40);
        tableForm.submit();
    }
    function _inputgotoPage() {
        var pageNo = $('#_goPs').val();
        if(pageNo == '' || pageNo == 0){pageNo = 1};
        var reg = new RegExp("^[0-9]*$");
        if(!reg.test(pageNo)){
              alert("请输入正整数页码！"); return false;
        }else{
            var tableForm = document.getElementById('form1');
            var totalPage=${pagination.totalPage};
            if(pageNo>totalPage)
            {
                $("#pageNo").val(totalPage);
            }
            else{
                $("#pageNo").val(pageNo);

            }
            submitText('#searchText','#userSearch',40);
            tableForm.submit();
        }
    }
	function orderBy(orderBy,orderByStatus){
		$("#orderBy").val(orderBy);//代表按那个字段排序
		$("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
		$("#form1").submit();
	}
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
		<c:if test="${!empty message}">
			alert("${message}");
		</c:if>
	});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/permissionmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：权限管理&nbsp;&raquo;&nbsp;<span class="gray" title="角色管理">角色管理</span></div>

<form id="form1" name="form1" action="${base}/permission/role/listRole.do" method="post">

    <div class="sch">
        <input type="hidden" id="search" name="search" />
        <p>
        	<fmt:message key="tag.search"/>：<input type="text" id="searchText" name="searchText" value="${search}" title="请输入角色名" class="text20 medium gray" /><input type="button" onclick="goSearch();"  class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>
    
    <div class="page_c">
        <span class="l">
            <c:url value="/${system}/permission/role/addRole.do" var="addrole"/>
            <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
            <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
        	 <c:url value="/${system}/permission/role/perAddRole.do" var="peraddrole"/>
            <a href="${peraddrole}" title="<fmt:message key="tag.add"/>" class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>
	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="全选/取消" /></th>
			<th><a href="javascript:orderBy(1,${nextOrderByStatus});" class="icon">角色名称<samp class="inb t14"></samp></a></th>
			<!--  
			<th>地区</th>
			-->
			<th>角色描述</th>
			<th>状态</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="role">
			<c:if test="${role.name != '超级管理员' }">
				<tr>
					<td><input type="checkbox" name="ids" value="${role.id}"/></td>
					<td class="nwp"><c:out value='${role.name}'/></td>
					<!-- 
					<td><c:out value='${role.areaName}'/></td>
					 -->
					<td class="nwp"><c:out value='${role.description}' escapeXml="true"/></td>
					<td>
						<c:if test='${role.status==1}'>启用</c:if>
						<c:if test='${role.status==0}'>停用</c:if>
					</td>
					<td>
						<c:url value="/${system}/permission/role/getRole.do" var="getRole">
							<c:param name="id" value="${role.id}"/>
						</c:url>
						<c:url value="/${system}/permission/role/deleteRoleById.do" var="deleteRoleById">
							<c:param name="id" value="${role.id}"/>
						</c:url>
						<c:url value="/${system}/permission/role/updateRoleStatus.do" var="start">
							<c:param name="id" value="${role.id}"/>	
							<c:param name="status" value="1"/>
						</c:url>
						<c:url value="/${system}/permission/role/updateRoleStatus.do" var="stop">
							<c:param name="id" value="${role.id}"/>	
							<c:param name="status" value="0"/>
						</c:url>
						<c:url value="/${system}/permission/perm/forwardPermission.do" var="assign">
							<c:param name="id" value="${role.id}"/>	
						</c:url>
						<a href="${getRole}">编辑</a>
						<c:if test='${role.status==1}'>
							<a href='${stop}'>停用</a>
						</c:if>
						<c:if test='${role.status==0}'>
							<a href='${start}'>启用</a>
						</c:if>
						<a href="${assign}">分配权限</a>
	                    <%-- <a href="#" onclick="singleDel('${deleteRoleById}')">删除</a> --%>
	                    <a href="#" onclick="singleDel('${role.id}')">删除</a>
					</td>
				</tr>
			</c:if>
			</c:forEach>
			<tr>
				<td colspan="5">
                	选择： <a id="checkall" href="#" >全选</a> <samp>-</samp> 
                		  <a id="cancelall" href="#" >取消</a>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="page_c">
        <span class="l inb_a">
            <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
            <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
        </span>
        <span class="r page inb_a">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            共 <var class="red"><c:out value="${pagination.totalCount}"/></var> 条&nbsp;&nbsp;<var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="javascript: _gotoPage('${pagination.prePage}');" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="javascript:_gotoPage('${pagination.nextPage}');" title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
		    <input type="text" id="_goPs" class="txts" onkeypress="if(event.keyCode==13){ return false; }" />
            <input type="button" onclick="_inputgotoPage();" class="hand" value='<fmt:message key="tag.page.jump"/>' />
        </span>
    </div>
</form>
</div></div>
</body>

