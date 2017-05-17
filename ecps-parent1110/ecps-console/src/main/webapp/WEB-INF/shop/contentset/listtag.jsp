<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title><fmt:message key="tag.title"/>_系统配置</title>
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
            alert("<fmt:message key='tag.choose.record'/>");
            return;
        }
        $("#form1").attr("action","${base}/contentset/tag/batchUpdateStatus.do?status=1");
       	$("#form1").submit();
    }
    function batchStop(){
        if(!isChecked()){
            alert("<fmt:message key='tag.choose.record'/>");
            return;
        }
        $("#form1").attr("action","${base}/contentset/tag/batchUpdateStatus.do?status=0");
       	$("#form1").submit();
    }
    function batchDel(){
        if(!isChecked()){
            alert("<fmt:message key='tag.choose.record'/>");
            return;
        }
        if(confirm("<fmt:message key='tag.delete.confirm'/>")){
            $("#form1").attr("action","${base}/contentset/tag/batchDelTagById.do");
           	$("#form1").submit();
        }
    }
    function singleDel(url){
        if(confirm("<fmt:message key='tag.delete.confirm'/>")){
            document.location=url;
        }
    }
    function gotoPage(pageNo){
        if(pageNo!='jump'){
            $("#pageNo").val(pageNo);
        }else{
            var jumppage=$("#pageNo").val();
            var reg = new RegExp("^[0-9]*$");
            if(!reg.test(jumppage)){
                alert("<fmt:message key='tag.page.num'/>");
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
        $("#orderBy").val(orderBy);
        $("#orderByStatus").val(orderByStatus);
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
<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="<fmt:message key="tag.title"/>"><fmt:message key="tag.title"/></span></div>
<form id="form1" name="form1" action="${base}/contentset/tag/listTag.do" method="post">
	<div class="sch">
    	<p>	
    		<fmt:message key="tag.search"/>：
        	<input type="text" name="search" class="text20 medium" value="${search}" />
           	<input type="submit" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>
    
    <div class="page_c">
        <span class="l">
            <c:url value="/contentset/tag/addtag.do" var="addtag"></c:url>
            <input type="button" onclick="batchStop();" value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
            <input type="button" onclick="batchStart();" value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
            <a href="${addtag}" title="<fmt:message key="tag.add"/>" class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="<fmt:message key='tag.selected.allORcancel'/>" /></th>
			<th class="wp"><a href="javascript:orderBy(1,${nextOrderByStatus});" class="icon"><fmt:message key="tag.column.name"/><samp class="inb t14"></samp></a></th>
			<th><fmt:message key="tag.column.status"/></th>
			<th><a href="javascript:orderBy(0,${nextOrderByStatus});" class="icon"><fmt:message key="tag.column.create"/><samp class="inb t14"></samp></a></th>
			<th><fmt:message key="tag.column.creater"/></th>
			<th><fmt:message key="tag.column.operation"/></th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="tag">
			<tr>
				<td><input type="checkbox" name="ids" value="${tag.tagId}"/></td>
				<td class="nwp"><c:out value='${tag.tagName}'/></td>
				<td>
					<c:if test='${tag.status==1}'><fmt:message key="tag.start"/></c:if>
					<c:if test='${tag.status==0}'><fmt:message key="tag.stop"/></c:if>
				</td>
				<td><fmt:formatDate value="${tag.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:out value='${tag.createrName}'/></td>
				<td>
					<c:url value="/contentset/tag/getTag.do" var="getTag">
						<c:param name="id" value="${tag.tagId}"/>
					</c:url>
					<c:url value="/contentset/tag/deleteTagById.do" var="deleteTagById">
						<c:param name="id" value="${tag.tagId}"/>
					</c:url>
					<c:url value="/contentset/tag/updateStatus.do" var="start">
						<c:param name="id" value="${tag.tagId}"/>	
						<c:param name="status" value="1"/>
					</c:url>
					<c:url value="/contentset/tag/updateStatus.do" var="stop">
						<c:param name="id" value="${tag.tagId}"/>	
						<c:param name="status" value="0"/>
					</c:url>
					<a href="${getTag}"><fmt:message key="tag.update"/></a>
					<a href="#" onclick="singleDel('${deleteTagById}')"><fmt:message key="tag.delete"/></a>
					<c:if test='${tag.status==1}'>
						<a href='${stop}'><fmt:message key="tag.stop"/></a>
					</c:if>
					<c:if test='${tag.status==0}'>
						<a href='${start}'><fmt:message key="tag.start"/></a>
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
            <c:if test='${pagination.pageNo>1}'><a href="javascript: _gotoPage('${pagination.prePage}');" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="#" onclick="gotoPage('${pagination.nextPage}');" title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>
</form>
</div></div>
</body>
