<%--
  Created by IntelliJ IDEA.
  User: Lanser
  Date: 11-11-14
  Time: 下午8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>会员列表_<fmt:message key='EbPtlUserMgmtMenu.title'/></title>
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
        if ($("#cellPhone").val()=='请输入手机号码') {
			$("#cellPhone").val('');
		}
        if ($("#cellPhone").val().trim()=='') {
			$("#cellPhone").val('');
		}
        if ($("#regInfo").val()=='请输入注册邮箱/用户名') {
   			$("#regInfo").val('');
   		}
        if ($("#regInfo").val().trim()=='') {
			$("#regInfo").val('');
		}
		var form = document.getElementById("form1");
		form.action="${base}/ptlUser/batchUpdatePtlUserStatus.do?status=1";
		form.submit();
	}
	function batchStop(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
        if ($("#cellPhone").val()=='请输入手机号码') {
			$("#cellPhone").val('');
		}
        if ($("#cellPhone").val().trim()=='') {
			$("#cellPhone").val('');
		}
        if ($("#regInfo").val()=='请输入注册邮箱/用户名') {
    		$("#regInfo").val('');
    	}
        if ($("#regInfo").val().trim()=='') {
			$("#regInfo").val('');
		}
		var form = document.getElementById("form1");
		form.action="${base}/ptlUser/batchUpdatePtlUserStatus.do?status=0";
		form.submit();
	}
	function gotoPage(pageNo){
		if(pageNo!='jump'){
			$("#pageNo").val(pageNo);
		}else{
			var jumppage=$("#pageNo").val();
			var reg = new RegExp("^[0-9]*$");
			if(!reg.test(jumppage)){
				alert("请输入正整数页码");
				$("#pageNo").val($("#pageNo1").val());
				return;
			}
			var totalPage=<c:out value="${pagination.totalPage}"/>;
			if(jumppage>totalPage){
				$("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
			}
		}
        if ($("#cellPhone").val()=='请输入手机号码') {
			$("#cellPhone").val('');
		}
        if ($("#cellPhone").val().trim()=='') {
			$("#cellPhone").val('');
		}
        if ($("#regInfo").val()=='请输入注册邮箱/用户名') {
			$("#regInfo").val('');
		}
        if ($("#regInfo").val().trim()=='') {
			$("#regInfo").val('');
		}
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
	});


    //回车响应搜索
$(document).keydown(function(event) {
	if (event.keyCode==13) {
        searchList();
    }
});
    function searchList(){
        if ($("#cellPhone").val()=='请输入手机号码') {
			$("#cellPhone").val('');
		}
        if ($("#cellPhone").val().trim()=='') {
			$("#cellPhone").val('');
		}
        if ($("#regInfo").val()=='请输入注册邮箱/用户名') {
 			$("#regInfo").val('');
 		}
        if ($("#regInfo").val().trim()=='') {
			$("#regInfo").val('');
		}
         var jumppage=$("#pageNo").val();
			var reg = new RegExp("^[0-9]*$");
			if(!reg.test(jumppage)){
				alert("请输入正整数页码");
				$("#pageNo").val($("#pageNo1").val());
				return;
			}
        var totalPage=<c:out value="${pagination.totalPage}"/>;
			if(jumppage>totalPage){
				$("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
			}
		var form = document.getElementById("form1");
		form.action="${base}/ptlUser/ptlUserList.do";
		form.submit();
    }
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="./ptlUserBar.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<div class="loc icon"><samp class="t12"></samp>
    当前位置：<fmt:message key='EbPtlUserMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<span class="gray">会员列表</span></div>

<form id="form1" name="form1" action="${base}/ptlUser/ptlUserList.do" method="post">
	<div class="sch">
		<p>
			<select id="client" name="client">
				<option value="2">请选择用户类型</option>
				<c:if test="${client == 0 }">
					<option value="0" selected>非移动用户</option>
				</c:if>
				<c:if test="${client != 0 }">
					<option value="0">非移动用户</option>
				</c:if>
				<c:if test="${client == 1 }">
					<option value="1" selected>移动用户</option>
				</c:if>
				<c:if test="${client != 1 }">
					<option value="1">移动用户</option>
				</c:if>
			</select>
        	手机号码:
        	<input type="text" id="cellPhone" name="cellPhone" class="text20 medium"
                   <c:choose>
                    <c:when test="${cellPhone==null||cellPhone==''}"> value='请输入手机号码' style="color:#888" </c:when>
                    <c:otherwise> value="${cellPhone}"</c:otherwise>
                    </c:choose>
                    onblur="if(this.value==''){this.value='请输入手机号码';this.className='gray txt20 medium'}" onfocus="if(this.value=='请输入手机号码'){this.value='';this.className='txt20 medium'}"/>
             注册信息:
              <input type="text" id="regInfo" name="regInfo" class="text20 medium"
                    <c:choose>
                    <c:when test="${regInfo==null||regInfo==''}"> value='请输入注册邮箱/用户名' style="color:#888" </c:when>
                    <c:otherwise> value="${regInfo}"</c:otherwise>
                    </c:choose>
                    onblur="if(this.value==''){this.value='请输入注册邮箱/用户名';this.className='gray txt20 medium'}" onfocus="if(this.value=='请输入注册邮箱/用户名'){this.value='';this.className='txt20 medium'}"/>
        	<input type="button" onclick="searchList();" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>

     <div class="page_c">
         <span class="l">
             <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
             <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
         </span>
     </div>
    <!-- ======================================================================================================= -->
        <!-- ======================================================================================================= -->

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="全选/取消" /></th>
			<th>注册邮箱</th>
		    <th>用户名</th>
			<th>真实姓名</th>
			 <th>手机</th>
			 <th>固话</th>
			<th class="nwp">居住详细地址</th>
            <th>邮编</th>
            <th>状态</th>
            <th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="user">
             <c:url value="/${system}/ptlUser/ptlUserInfoDetail.do" var="info">
                <c:param name="id" value="${user.ptlUserId}"/>
                 <c:param name="pageNo" value="${pagination.pageNo}"/>
                  <c:param name="cellPhone" value="${cellPhone}"/>
                  <c:param name="client" value="${client}"/>
                  <c:param name="regInfo" value="${regInfo}"/>
             </c:url>
			<tr>
			<c:if test="${ user.isMobileClient == 0}">
				<td><input type="checkbox" name="ids" value="${user.ptlUserId}"/></td>
				<td><a href='${info}'><c:out value="${user.email }"/></a></td>
				<td><c:out value='${user.username }'/></td>
				 <td><c:out value='${user.realName }'/></td>
			</c:if>
			<c:if test="${ user.isMobileClient == 1}">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</c:if>
                <td><c:out value='${user.cellPhone }'/></td>
             <c:if test="${ user.isMobileClient == 0}">
                <td><c:out value="${user.phone }"/></td>
                <td class="nwp">
                	<c:out value="${user.resiProv }"/><c:out value="${user.resiCity }"/><c:out value="${user.resiDist }"/><c:out value="${user.addr }" escapeXml="true"/>
                </td>
                <td><c:out value='${user.zipCode}'/></td>
             </c:if>
             <c:if test="${ user.isMobileClient == 1}">
             	<td></td>
             	<td class="nwp"></td>
             	<td></td>
             </c:if>
        <c:url value="/${system}/ptlUser/updatePtlUserStatus.do" var="start">
            <c:param name="id" value="${user.ptlUserId}"/>
			<c:param name="status" value="1"/>
        </c:url>
        <c:url value="/${system}/ptlUser/updatePtlUserStatus.do" var="stop">
            <c:param name="id" value="${user.ptlUserId}"/>
			<c:param name="status" value="0"/>
        </c:url>
        <c:if test="${ user.isMobileClient == 0}">
 				<td>
                     <c:choose>
 					    <c:when test='${user.status==1}'>启用|<a href='${stop}'>停用</a></c:when>
 					    <c:when test='${user.status==0}'><a href='${start}'>启用</a>|停用</c:when>
                         <c:otherwise><a href='${start}'>启用</a>|<a href='${stop}'>停用</a></c:otherwise>
                    </c:choose>
				</td>
		</c:if>
		<c:if test="${user.isMobileClient == 1 }">
			<td></td>
		</c:if>
                <td><a href='${info}'>详细信息</a></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="9">
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
        </span>
        <span class="r page inb_a">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${pagination.pageNo}" id="pageNo1" name="pageNo1" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            共 <var class="red"><c:out value="${pagination.totalCount}"/></var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="javascript:gotoPage('${pagination.prePage}');"  title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="javascript:gotoPage('${pagination.nextPage}');" ><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>
</form>
</div></div>
</body>

