<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>敏感词管理_系统配置</title>
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
        $("#form1").attr("action","${base}/contentset/sensitive/batchUpdateSensitiveStatus.do?status=1");
       	$("#form1").submit();
    }
    function batchStop(){
        if(!isChecked()){
            alert("请选择记录");
            return;
        }
        $("#form1").attr("action","${base}/contentset/sensitive/batchUpdateSensitiveStatus.do?status=0");
       	$("#form1").submit();
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
            $("#form1").attr("action","${base}/contentset/sensitive/batchDelSensitiveById.do");
           	$("#form1").submit();
        }

    }
    function gotoPage(pageNo){
        if(pageNo!='jump'){
            $("#pageNo").val(pageNo);
        }else{
            var jumppage=$("#pageNo").val();
            var reg = new RegExp("^[0-9]*$");
            if(!reg.test(jumppage)){
                alert("请输入数字");
                $("#pageNo").val("");
                return;
            }
            var totalPage=<c:out value="${pagination.totalPage}"/>;
            if(jumppage>totalPage){
                $("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
            }
        }
        $("#form1").submit();
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
    });
    $(document).ready(function(){
    	$("#form1").submit(function(){
    		 var jumppage=$("#pageNo").val();
             var reg = new RegExp("^[0-9]*$");
             if(!reg.test(jumppage)){
                 $("#pageNo").val("");
             }
    	});
    });
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/systemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="敏感词管理">敏感词管理</span></div>

<form id="form1" name="form1" action="${base}/contentset/sensitive/listSensitive.do" method="post">
    <div class="sch">
        <p>
        	<fmt:message key="tag.search"/>：
        	<input type="text" name="search" class="text20 medium" value="${search}" />
        	<input type="submit" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>

    <div class="page_c">
        <span class="l">
            <c:url value="/${system}/contentset/sensitive/addsensitive.do" var="addsensitive"></c:url>
            <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
            <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
            <a href="${addsensitive}" title="<fmt:message key="tag.add"/>" class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="全选/取消" /></th>
			<th><a href="javascript:orderBy(1,${nextOrderByStatus});" class="icon">敏感词名称<samp class="inb t14"></samp></a></th>
			<th>状态</th>
			<th><a href="javascript:orderBy(0,${nextOrderByStatus});" class="icon">创建时间<samp class="inb t14"></samp></a></th>
			<th>创建者</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="sensitive">
			<tr>
				<td><input type="checkbox" name="ids" value="${sensitive.sensitiveId}"/></td>
				<td class="nwp"><c:out value='${sensitive.sensitiveName}'/></td>
				<td>
					<c:if test='${sensitive.status==1}'>启用</c:if>
					<c:if test='${sensitive.status==0}'>停用</c:if>
				</td>
				<td><fmt:formatDate value="${sensitive.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:out value='${sensitive.createrName}'/></td>
				<td>
					<c:url value="/${system}/contentset/sensitive/getSensitive.do" var="getSensitive">
						<c:param name="id" value="${sensitive.sensitiveId}"/>
					</c:url>
					<c:url value="/${system}/contentset/sensitive/deleteSensitiveById.do" var="deleteSensitiveById">
						<c:param name="id" value="${sensitive.sensitiveId}"/>
					</c:url>
					<c:url value="/${system}/contentset/sensitive/updateSensitiveStatus.do" var="start">
						<c:param name="id" value="${sensitive.sensitiveId}"/>	
						<c:param name="status" value="1"/>
					</c:url>
					<c:url value="/${system}/contentset/sensitive/updateSensitiveStatus.do" var="stop">
						<c:param name="id" value="${sensitive.sensitiveId}"/>	
						<c:param name="status" value="0"/>
					</c:url>
					<a href="${getSensitive}">编辑</a>
					<a href="#" onclick="singleDel('${deleteSensitiveById}')">删除</a>
					<c:if test='${sensitive.status==1}'>
						<a href='${stop}'>停用</a>
					</c:if>
					<c:if test='${sensitive.status==0}'>
						<a href='${start}'>启用</a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
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
            共 <var class="red">${pagination.totalCount}</var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="#" onclick="gotoPage('${pagination.prePage}');" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="#" onclick="gotoPage('${pagination.nextPage}');" title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>
</form>
</div></div>
</body>
