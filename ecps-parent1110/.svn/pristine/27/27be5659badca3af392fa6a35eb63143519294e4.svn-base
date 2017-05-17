<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>号卡标签管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<meta name="menu" content="SimCardMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script type="text/javascript">
	
$(function(){
    pageInitialize('#form1');
});
	
$(document).ready(function(){
	searchText('#searchText','#labelName',40);
	$("#all").click(function(){
     	if($("#all").attr("checked")){
        	$("input[name='ids']").attr("checked", true);
        }else{
        	$("input[name='ids']").attr("checked", false);
        }
    });
	$("#goSearch").click(function(){
		 $("#pageNo").val(1);
	});
	$("#checkall").click(function(){
		$("input[name='ids']").attr("checked", true);
		$("#all").attr("checked",true)
	});
	$("#cancelall").click(function(value){
		$("input[name='ids']").attr("checked", false);
		$("#all").attr("checked",false)
	});


	<c:if test="${message!=null }">
		alert('<c:out value="${message }"/>');
	</c:if>
	
	<c:if test="${failMessage!=null }">
		<c:if test="${failMessage == 1}">alert("该标签已启用，请停用后再删除！")</c:if>
		<c:if test="${failMessage == 2}">alert("该标签已跟号码关联，请取消关联后再停用！")</c:if>
	</c:if>
	
});

function stopById(labelId){
	tipShow('#confirmDiv');
    $("input[id='confirmDivOk']").click(function(){
    	$("#form1").attr("action","${base }/simcard/simCardLabel/stopUseSimCardLabel.do?labelId="+labelId);
       	$("#form1").submit();
		});
}

function startById(labelId){
	tipShow('#confirmDiv');
    $("input[id='confirmDivOk']").click(function(){
    	$("#form1").attr("action","${base }/simcard/simCardLabel/startUseSimCardLabel.do?labelId="+labelId);
       	$("#form1").submit();
		});
}

function deleteById(labelId){
	  tipShow('#confirmDiv');
	     $("input[id='confirmDivOk']").click(function(){
	    		$("#form1").attr("action","${base }/simcard/simCardLabel/deleteSimCardLabelById.do?labelId="+labelId);
	    	   	$("#form1").submit();
			});
}

function forBatchDel(){
	
	 if(!isChecked()){
	        alert("请选择记录");
	        return;
	    }
	    tipShow('#confirmDiv');
     $("input[id='confirmDivOk']").click(function(){
			$("#form1").attr("action","${base}/simcard/simCardLabel/deleteSimCardLabelByIds.do");
	       	$("#form1").submit();
		});
}

function forStop(){
	
	if(!isChecked()){
        alert("请选择记录");
        return;
    }
    tipShow('#confirmDiv');
 	$("input[id='confirmDivOk']").click(function(){
		$("#form1").attr("action","${base}/simcard/simCardLabel/stopUseSimCardLabels.do");
       	$("#form1").submit();
	});
}

function forStart(){
	if(!isChecked()){
        alert("请选择记录");
        return;
    }
    tipShow('#confirmDiv');
 	$("input[id='confirmDivOk']").click(function(){
		$("#form1").attr("action","${base}/simcard/simCardLabel/startUseSimCardLabels.do");
       	$("#form1").submit();
	});
}

</script>
</head>
<body id="main">
	<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/simcardmenu.jsp"/>
	</div></div>
	<div class="frameR"><div class="content">
	<div class="loc icon"><samp class="t12"></samp>当前位置：号卡管理&nbsp;&raquo;&nbsp;<span class="gray">标签管理</span></div>
	<form name="form1" id="form1" action="${base}/simcard/listSimCardLabel.do" method="post">
	<div class="sch">
		&nbsp;
		<fmt:message key="tag.search"/>：
		<input type="text"  id="searchText"  name="searchText"  value="<c:out value='${searchText}' escapeXml='true'/>"  title="请输入标签名称"  class="text20 medium gray"  />
		<input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>"  />
	</div>
	<div class="page_c">
		<span class="r inb_a">
            <a href="${base }/simcard/simCardLabel/addSimCardLabel.do"  class="btn80x20">添加标签</a>
    	</span>
   	</div>
    <span class="l inb_a">
    	&nbsp;&nbsp;&nbsp;
    	<input type="button" onclick="forStart();" value="启用" class="hand btn60x20" />
    	<input type="button" onclick="forStop();" value="停用" class="hand btn60x20" />
        <input type="button" onclick="forBatchDel();" value="删除" class="hand btn60x20" />
    </span>
	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" name="all" id="all" title="全选/取消" /></th>
			<th>标签编号</td>
			<th>标签名</td>
			<th>标签类别</td>
			<th>状态</td>
			<th>操作</td>
		</thead>
		<c:if test="${null != pagination.list}">
			<c:forEach items="${pagination.list}" var = "label">
				<tr>
					<td><input type="checkbox" name="ids"  value="${label.labelId}" /></td>
					<td><c:out value="${label.labelNum}"/></td>
					<td class="nwp"><c:out value="${label.labelName }"  escapeXml='true'/></td>
					<td class="nwp"><c:out value="${label.labelDesc }"  escapeXml="true"/></td>
					<td><c:if test="${label.status==1 }">启用</c:if><c:if test="${label.status==0 }">停用</c:if></td>
					<td>
						<a href="${base }/simcard/simCardLabel/editSimCardLabel.do?labelId=${label.labelId}">编辑</a>
						<c:if test="${label.status==1 }"><a id="stop" onclick="stopById(${label.labelId})" href="javascript:void(0);">停用</a></c:if>
						<c:if test="${label.status==0 }"><a id="start" onclick="startById(${label.labelId})" href="javascript:void(0);">启用</a></c:if>
						<a id="delete" onclick="deleteById(${label.labelId})" href="javascript:void(0);">删除</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
                	选择： <a id="checkall" href="javascript:void(0);" >全选</a> <samp>-</samp>
                		  <a id="cancelall" href="javascript:void(0);" >取消</a>
				</td>
			</tr>
		</c:if>
	</table>
	
    <div class="page_c">
       <span class="l inb_a">
	    	<input type="button" onclick="forStart();" value="启用" class="hand btn60x20" />
	    	<input type="button" onclick="forStop();" value="停用" class="hand btn60x20" />
	        <input type="button" onclick="forBatchDel();" value="删除" class="hand btn60x20" />
	    </span>
        <span class="r page">
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
            共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
        </span>
    </div>
	</form>
</div></div>
</body>