<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>广告位管理_广告管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="AdvertisementMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function() {
	if($("#search").val()==""){
		$("#search").val("请输入广告位名称");
	}
});
function getQueryPara(){
	//将后台传给前台的搜索值赋值给后台
	$("#search").val("${search}");
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
function description(obj){
	try{
	    var note = $(obj).next();
	    if(note==null || note == ''){
	      	alert('无代码');
        }
	    else{
        	document.getElementById( "txt" ).innerHTML= note.val().replace(/</g,"&lt;").replace(/>/g,"&gt;");
        	$('#setSuccess').hide();
	    	tipShow('#description');
        }
	}
    catch(e){}
}
function setTxt() { 
	var t=document.getElementById("txt"); 
	t.select(); 
	$('#setSuccess').show();
	var meintext = t.value;
	try {
		if (window.clipboardData)
		{
			// the IE-manier
		 	window.clipboardData.setData('text',t.createTextRange().text);
		 	return true;
		}
		else if (window.netscape)
		{
			netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
			var clip = Components.classes['@mozilla.org/widget/clipboard;1']
		 	                     .createInstance(Components.interfaces.nsIClipboard);
		 	if (!clip) return false;
			var trans = Components.classes['@mozilla.org/widget/transferable;1']
		 	                      .createInstance(Components.interfaces.nsITransferable);
		 	if (!trans) return false;
		 	trans.addDataFlavor('text/unicode');
		    var str = new Object();
		 	var len = new Object();
			var str = Components.classes["@mozilla.org/supports-string;1"]
		 	                    .createInstance(Components.interfaces.nsISupportsString);
		 	var copytext=meintext;
		 	str.data=copytext;
		 	trans.setTransferData("text/unicode",str,copytext.length*2);
		 	var clipid=Components.interfaces.nsIClipboard;
		 	if (!clip) return false;
		 	clip.setData(trans,null,clipid.kGlobalClipboard);
		}
	} catch (e) {
		alert('因为安全策略的原因，此项功能已被您的浏览器禁止。请按下“Ctrl+C”组合键完成复制。');      
		codeobj.focus();
		return false;
	}
	codeobj.select();
	return true;
} 
function readTxt() { 
    alert(window.clipboardData.getData("text")); 
} 
function showAlt(txt){
	$('#tipText').html(txt);
	tipShow('#tipDiv');
}
function showTip(txt){
	$('#confirmText').html(txt);
	tipShow('#confirmDiv');
}
//单个删除前判断删除项是否有关联项
function checkDeleteId(id){
	$("#delId").val(id);
	action = '${base}/adlocal/checkDeleteAdLocalByIds.do?ids='+id;
	$.ajax({
		type : "post" ,
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		url : action,
		dataType : 'json',
		complete:function(data){
	    	var a = eval("("+data.responseText+")"); 
			if(a[0].result=='error'){
				    $("#sadName").text(a[0].adName);
		    		tipShow('#singleFail');
		    	}else{
		    		$("#confirmDivOk").bind("click",function(){
		    			ids = $("#delId").val();
		    		action = '${base}/adlocal/deleteAdLocalByIds.do?ids='+ids;
		    		$.ajax({
		    			type : "post" ,
		    			contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		    			url : action,
		    			dataType : 'json',
		    			complete:function(data){
		    		    	var a = eval("("+data.responseText+")"); 
		    				if(a[0].result=='error'){
		    			    		tipShow('#fail');
		    			    	}else{
		    			    		window.location.href="${base}/adlocal/adlocal.do";
		    			    	}
		    			}
		    		});});
		    		showTip("删除广告位后将无法恢复，您是否执行此操作？" );
		    	}
		}
	});
}
//计算被选中的项个数
function checkedCount(name){
	var batchChecks = document.getElementsByName(name);
	var count = 0;
	for (var i = 0;i < batchChecks.length; i++) {
		if (batchChecks[i].checked) {
			count++;
		}
	}
	return count;
}
//批量删除前判断要删除项是否有关联项
function checkDeleteIds(){
	if(checkedCount('ids')<=0){
		showAlt("请您选择广告位后，再进行此操作！");
		return;
	}
	action = '${base}/adlocal/checkDeleteAdLocalByIds.do';
	var options = {
			   target: '#tab',
		       url:action,
		       dataType: "json",
		       type: 'POST',
		       success: getCheckResult
		   };
		   $("#myForm").ajaxSubmit(options);
}

//批量删除获取删除项是否有关联的结果处理
function getCheckResult(data, statusText, xhr, $form){
	if(data){
		if(data[0]['result']=="error"){
			$("#adName").text(data[0]['adName']);
			tipShow("#batFail");   
		}else{
			$("#confirmDivOk").bind("click",function(){formSubmit('${base}/adlocal/deleteAdLocalByIds.do');});
    		showTip("删除广告位后将无法恢复，您是否执行此操作？" );
		}
	}
}

//单个删除（无广告位连接）
function singleDel(){
	ids = $("#delId").val();
	action = '${base}/adlocal/deleteAdLocalByIds.do?ids='+ids;
	$.ajax({
		type : "post" ,
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		url : action,
		dataType : 'json',
		complete:function(data){
	    	var a = eval("("+data.responseText+")"); 
			if(a[0].result=='error'){
		    		tipShow('#fail');
		    	}else{
		    		window.location.href="${base}/adlocal/adlocal.do";
		    	}
		}
	});
}
//操作成功后执行
function success(){
	window.location.href="${base}/adlocal/adlocal.do";
}
//单个删除（有广告位连接）
function sdel(){
	tipHide("#singleFail");
	ids = $("#delId").val();
	action = '${base}/adlocal/deleteLinkAdLocalByIds.do?ids='+ids;
	$.ajax({
		type : "post" ,
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		url : action,
		dataType : 'json',
		complete:function(data){
	    	var a = eval("("+data.responseText+")"); 
			if(a[0].result=='error'){
		    		tipShow('#fail');
		    	}else{
		    		window.location.href="${base}/adlocal/adlocal.do";
		    	}
		}
	});
}

//批量删除（无广告位连接）
function batchDel(){
	formSubmit('${base}/adlocal/deleteAdLocalByIds.do');
}

//批量删除（有广告位连接）
function del(){
	tipHide("#batFail");
	action = "${base}/adlocal/deleteLinkAdLocalByIds.do";
	formSubmit(action);
}
//提交表单
function formSubmit(action){
  var options = {
	   target: '#tab',
      url:action,
      dataType: "json",
      type: 'POST',
      success: submitFormResponse
  };
  $("#myForm").ajaxSubmit(options);
}
function submitFormResponse(data, statusText, xhr, $form){
	if(data){
		if(data[0]['result']=="error"){
			tipShow("#fail");
		    
		}else{
			window.location.href="${base}/adlocal/adlocal.do";
		}
	}
}
//排序
function orderBy(){
	if($("#orderBy").val()=='1'){
		$("#orderBy").val('0');
	} else {
		$("#orderBy").val('1');
	}
	getQueryPara();
	var tableForm = document.getElementById('myForm');
	tableForm.action="${base}/adlocal/adlocal.do";
	tableForm.onsubmit=null;
	tableForm.submit();
}
function gotoPage(pageNo){
    if(pageNo!='jump'){
        $("#pageNo").val(pageNo);
    }else{
        var jumppage=$("#pageNo").val();
        var reg = new RegExp("^[1-9][0-9]{0,3}$");
        if(!reg.test(jumppage)){
            alert("请输入数字1~9999内的数字");
            $("#pageNo").val("");
            return;
        }
        getQueryPara();
        var totalPage=<c:out value="${pagination.totalPage}"/>;
        if(jumppage>totalPage){
            $("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
        }
    }
    $("#myForm").submit();
}

function publishOther(locationId){
	tipShow('#staticLoadDiv');
	var otherId;
	if(locationId == 1001){
		otherId=1101;
	}else if(locationId==1002){
		otherId=1102;
	}else if(locationId==1003){
		otherId=1103;
	}else if(locationId==1004){
		otherId=1104;
	}else if(locationId==1005){
		otherId=1105;
	}else if(locationId==1011){
		otherId=1106;
	}else if(locationId==1012){
		otherId=1107;
	}else if(locationId==1013){
		otherId=1108;
	}
	var ajaxData="otherId="+otherId;
    $.ajax({
    	type:"post",
     	url:"${staticPublishUrlPre}/static4ebiz/static/publishSingleOther.do",
     	data:(ajaxData),
     	success:function(responseText){
        	var result=eval("("+responseText+")");
         	if(result._status=="true"){
         		tipHide('#staticLoadDiv');
         		alert("发布成功");
         		window.location.href=window.location.href.replace("#","");
         		/* window.location.href=window.location.href; */
         		//goSearch('#form1','#userSearch');
         	}else{
         		tipHide('#staticLoadDiv');
         		alert(result._mes);
         	}
    	}
 });
}
</script>
</head>
<body id="main">

<input type="hidden" id="delId" value=""/>

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/advertisementmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：广告管理&nbsp;&raquo;&nbsp;<span class="gray" title="广告位管理">广告位管理</span></div>
<form id="myForm" name="myForm" action="${base}/adlocal/adlocal.do" method="post">
    <div class="sch">
        <p>
        	<fmt:message key="tag.search"/>：
        	<input type="text" name="search" id="search" class="gray txt20" value="${search}" onfocus="if(this.value=='请输入广告位名称'){this.value='';this.className='txt20'}" onblur="if(this.value==''){this.value='请输入广告位名称';this.className='gray txt20'}"/>
        	<input type="submit" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>
    <div class="page_c">
        <span class="l">
            <c:url value="${system}/adlocal/addAdlocal.do" var="addAdlocal"></c:url>
            <!-- <input type="button" onclick="checkDeleteIds();" value="删除" class="hand btn60x20" /> -->
        </span>
        <span class="r inb_a">
        	<ui:permTag src="/${system}/adlocal/saveAdlocal.do">
            	<!-- <a href="${base}/adlocal/addAdlocal.do" title="添加广告位" class="btn80x20">添加广告位</a> -->
            </ui:permTag>
        </span>
    </div>
    <table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" name="all" id="all" title="全选/取消" /></th>
			<th>广告位名称</th>
			<th>尺寸</th>
			<th>关联广告数</th>
		    <th><a href="javascript:orderBy();"  title="创建时间" class="icon">创建时间<samp class="inb t14"></samp></a></th>
	        <th>发布状态</th>
	        <th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="adlocal">
			<tr>
				<td><input type="checkbox" name="ids" value="${adlocal.locationId}" /></td>
				<td class="nwp"><c:out value='${adlocal.locationName}'/></td>
				<td><c:out value='${adlocal.locationWidth}*${adlocal.locationHigh}'/></td>
				<td><c:choose>  
 						<c:when test="${not empty adlocal.adCount}"><c:out value='${adlocal.adCount}'/></c:when>  
						<c:otherwise>0</c:otherwise>  
					</c:choose>
				</td>
				<td><fmt:formatDate value="${adlocal.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>
					<c:if test="${adlocal.locationId==1021 || adlocal.locationId==1022 || adlocal.locationId==1023 || adlocal.locationId==1024}">
						<font color="#ff0000">--</font>
					</c:if>
					<c:if test="${adlocal.locationId!=1021 && adlocal.locationId!=1022 && adlocal.locationId!=1023 && adlocal.locationId!=1024}">
					<c:choose>
						<c:when test="${adlocal.psResult==null }">
						<font color="#ff0000">待发布</font>
						</c:when>
						<c:otherwise>
						<font color="#009900">已发布</font>
						</c:otherwise>
					</c:choose>
					</c:if>
				</td>
				<td>
					<c:url value="/${system}/adlocal/editAdlocal.do" var="editAdLocal">
						<c:param name="Id" value="${adlocal.locationId}"/>
					</c:url>
					<c:url value="/${system}/adlocal/adListLink.do" var="adListLink">
						<c:param name="localId" value="${adlocal.locationId}"/>
					</c:url>
					<c:url value="/${system}/adlocal/deleteAdLocalById.do" var="deleteAdLocalById">
						<c:param name="Id" value="${adlocal.locationId}"/>
					</c:url>
					<ui:permTag src="/${system}/adlocal/updateAdlocal.do">
						<!-- <a href="${editAdLocal}">编辑</a> -->
					</ui:permTag>
					<c:choose>  
 						<c:when test="${empty adlocal.adCount}"><label class="u rename"><span style="color:#A4A4A4">广告列表</span>&nbsp;</label></c:when>
 						<c:when test="${adlocal.adCount == 0}"><label class="u rename"><span style="color:#A4A4A4">广告列表</span>&nbsp;</label></c:when>
						<c:otherwise><a href="${adListLink}">广告列表</a></c:otherwise>  
					</c:choose>
					<!-- 根据defect-1160暂时屏蔽调用代码连接 -->
					<!--
					<c:choose>  
 						<c:when test="${not empty adlocal.locationCode}">
							<a href="javascript:void(0)" onclick="description(this);" title="调用代码" >调用代码</a>
		  					<input type="hidden" value="${adlocal.locationCode}" />
						</c:when>  
						<c:otherwise>
							<label class="u rename"><span style="color:#A4A4A4">调用代码</span>&nbsp;</label>
						</c:otherwise>  
					</c:choose>
					  -->
					<!-- <a href="javascript:checkDeleteId('${adlocal.locationId}')" title="删除">删除</a> -->
					<c:if test="${adlocal.locationId==1001 || adlocal.locationId==1002 || adlocal.locationId==1003 || adlocal.locationId==1004 || adlocal.locationId==1005 || adlocal.locationId==1011 || adlocal.locationId==1012 || adlocal.locationId==1013}">
						&nbsp;&nbsp;<a href="#" onclick="publishOther(${adlocal.locationId});">发布</a>
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
            <!-- <input type="button" onclick="checkDeleteIds();" value="删除" class="hand btn60x20" /> -->
        </span>
        <span class="r page inb_a">
	<input type="hidden" value="${orderBy}"  id="orderBy"  name="orderBy" />
	<input type="hidden" value="${orderById}"  id="orderById"  name="orderById" />
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

