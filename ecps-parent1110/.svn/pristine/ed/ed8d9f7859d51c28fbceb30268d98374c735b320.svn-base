<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>广告管理_广告管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="AdvertisementMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script language="javascript" type="text/javascript">
$(function() {
	if($("#search").val()==""){
		$("#search").val("请输入广告名称");
	}
});
function getQueryPara(){
	//将后台传给前台的搜索值赋值给后台
	$("#search").val("${search}");
	$("#adType").val("${adType}");
}
$(document).ready(function(){
	$("#all").click(function(){
     	if($("#all").attr("checked")){
        	$("input[name='adIds']").attr("checked", true);
        }else{
        	$("input[name='adIds']").attr("checked", false);
        }
    });
	$("#checkall").click(function(){
		$("input[name='adIds']").attr("checked", true);
		$("#all").attr("checked",true)
	});
	$("#cancelall").click(function(value){
		$("input[name='adIds']").attr("checked", false);
		$("#all").attr("checked",false)
	});
	
});
function showAlt(txt){
	$('#tipText').html(txt);
	tipShow('#tipDiv');
}
function showTip(txt){
	$('#confirmText').html(txt);
	tipShow('#confirmDiv');
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

//操作成功后执行
function success(){
	window.location.href="${base}/advertisement/advertisement.do";
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
	tableForm.action="${base}/advertisement/advertisement.do";
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
//单个删除准备
function delSingle(id){
	$('#dors').val('single');
	$("#delId").val(id);
	checkLink('single',id);
}
//删除前检查要删除广告是否在关联广告位上显示状态	
function checkLink(dod,id){
	if(dod=="single"){
		checkLinkSingle(id);
		return;
	}else{
		action="${base}/advertisement/checkLink.do";
	}
	 var options = {
			   target: '#tab',
		       url:action,
		       dataType: "json",
		       type: 'POST',
		       complete: submitFormResponse1
		   };
		   $("#myForm").ajaxSubmit(options);
}
//单个删除检查连接
function checkLinkSingle(id){
	action="${base}/advertisement/checkLink.do?adIds="+id;
	$.ajax({
		type : "post" ,
		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		url : action,
		dataType : 'json',
		complete:submitFormResponse1
	});
}
function submitFormResponse1(data, statusText, xhr, $form){
	if(data){
		$('#linkMsgtest').html("");
		var a = eval("("+data.responseText+")"); 
		if(a.result=="fail"){
			x=a.linkList;
			for(var j=0;j<x.length;j++){
				html="<p class='alg_c'>";
				html += '广告';
				html += '【';
				html += x[j].adName;
				html += '】';
				html += '在广告位';
				html +='【';
				html += x[j].adLocalName;
				html += '】';
				html += '上唯一显示；';
				html += '</p>';
				/*$('#test').append("<p class='alg_l'");
				$('#test').append('>物料');
				$('#test').append('【');
				$('#test').append(x[i].adName);
				$('#test').append('】');
				$('#test').append('在版位');
				$('#test').append('【');
				$('#test').append(x[i].adLocalName);
				$('#test').append('】');
				$('#test').append('上唯一显示；');
				$('#test').append("</p>"); 
				*/
				$('#linkMsgtest').append(html);
				}
			$('#linkMsgtest').append("<p class='alg_c'>请为广告位设置其他显示广告后再删除</p>");
			tipShow("#linkMsg");
		}else{
			if($('#dors').val()=='double'){
				$("#confirmDivOk").bind("click",function(){formSubmit('${base}/advertisement/delete.do');});
	    		showTip("删除广告后将无法恢复，您是否执行此操作？" );
			}else{
				$("#confirmDivOk").bind("click",function(){action = "${base}/advertisement/delete.do?adIds="+$("#delId").val();
					$.ajax({
						type : "post" ,
						contentType: "application/x-www-form-urlencoded; charset=utf-8", 
						url : action,
						dataType : 'json',
						success: submitFormResponse
					});});
	    		showTip("删除广告后将无法恢复，您是否执行此操作？" );
			}
		}
	}
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
	tipHide("#singleDelTip");
	tipHide("#delByIds");
	tipHide("#batchDel");
	if(data){
		if(data['result']=="error"){
			showAlt("删除失败");
		}else{
			window.location.href="${base}/advertisement/advertisement.do";
		}
	}
}
//批量删除
function forBatchDel(){
	$('#dors').val('double');
	if(checkedCount('adIds')<=0){
		showTip('没有选中任何广告');
		return;
	}
	checkLink('double','123');
}
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/advertisementmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：广告管理&nbsp;&raquo;&nbsp;<span class="gray" title="广告管理">广告管理</span></div>
<form id="myForm" name="myForm" action="${base}/advertisement/advertisement.do" method="post">
<input type="hidden" id="dors" value=""/>
<input type="hidden" id="delId" value=""/>
    <div class="sch">
        <p>
        	<fmt:message key="tag.search"/>：
        	<select name="adType" id="adType">
				<option value="-1" <c:if test="${adType==-1}">selected</c:if>>请选择广告类型</option>
			<!--  	<option value="0" <c:if test="${adType==0}">selected</c:if>>文字</option> -->
				<option value="1" <c:if test="${adType==1}">selected</c:if>>图片</option>		
			<!--  	<option value="2" <c:if test="${adType==2}">selected</c:if>>flash</option> -->
				<option value="3" <c:if test="${adType==3}">selected</c:if>>轮播图片</option>
			</select>
        	<input type="text" name="search" id="search" class="gray txt20" onfocus="if(this.value=='请输入广告名称'){this.value='';this.className='txt20'}" onblur="if(this.value==''){this.value='请输入广告名称';this.className='gray txt20'}"  value="${search}" onfocus="if(this.value=='请输入广告名称'){this.value='';this.className='txt20'}" onblur="if(this.value==''){this.value='请输入广告名称';this.className='gray txt20'}" />
        	<input type="submit" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>
    <div class="page_c">
        <span class="l">
            <input type="button" onclick="forBatchDel();" value="删除" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
        	<ui:permTag src="/${system}/advertisement/saveAdvertisement.do">
            	<a href="${base}/advertisement/addAdvertisement.do" title="添加广告" class="btn80x20">添加广告</a>
            </ui:permTag>
        </span>
    </div>
    <table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" name="all" id="all" title="全选/取消" onclick="checkAll(this, 'adIds')"/></th>
			<th>广告名称</th>
			<th class="wp">目标广告位</th>
			<th>类型</th>
			<th><a href="javascript:orderBy();" title="创建时间" class="icon">创建时间<samp class="inb t14"></samp></a></th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="advertisement">
			<tr>
				<td><input type="checkbox" name="adIds" value="${advertisement.adId}" /></td>
				<td title="${advertisement.adName}"><c:out value='${advertisement.adName}'/></td>
				<td class="nwp" title="${advertisement.localListNameString}"><c:out value='${advertisement.localListNameString}'/></td>
				<td>
					<c:choose>  
		 				<c:when test="${advertisement.adType == 1}">图片</c:when>
		 				<c:when test="${advertisement.adType == 0}">文字</c:when> 
		 				<c:when test="${advertisement.adType == 2}">flash</c:when> 
		 				<c:when test="${advertisement.adType == 3}">轮播图片</c:when>   
					</c:choose>
				</td>
				<td><var><fmt:formatDate value="${advertisement.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></var></td>
				<td>
					<c:url value="/${system}/advertisement/editAdvertisement.do" var="editAdvertisement">
						<c:param name="adId" value="${advertisement.adId}"/>
					</c:url>
					<c:url value="/${system}/advertisement/preview.do" var="previewAdvertisement">
						<c:param name="adId" value="${advertisement.adId}"/>
					</c:url>
					
					<ui:permTag src="/${system}/advertisement/preview.do">
					<a href="${previewAdvertisement}" title="预览"  target="_blank">预览</a>
					</ui:permTag>
					<ui:permTag src="/${system}/advertisement/updateAdvertisement.do">
						<a href="${editAdvertisement}">编辑</a>
					</ui:permTag>
					<a href="javascript:delSingle('${advertisement.adId}')" title="删除">删除</a>
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
            <input type="button" onclick="forBatchDel();" value="删除" class="hand btn60x20" />
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

