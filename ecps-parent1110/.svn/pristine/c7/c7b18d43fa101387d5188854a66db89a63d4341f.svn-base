<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title><fmt:message key="DistributorMgmtMenu.title" />_合作伙伴</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="RelationShipMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
 function preTreat(){
       if ($("#searchDistriName").val() == '请输入配送商名称') {
		$("#searchDistriName").val('');
	}
	if ($("#searchContact").val() == '请输入联系人') {
		$("#searchContact").val('');
	}
 }
function getQueryPara(){
	//将后台传给前台的搜索值赋值给后台
	$("#searchDistriName").val("${searchDistriName}");
	$("#searchContact").val("${searchContact}");
}
function updateActive(id,isActive){
     preTreat();
     var form=document.getElementById("form1");
    form.action="${base}/distri/updateActive.do?id="+id+"&isActive="+isActive;
    form.submit();
}
function previewDistri(id){
    preTreat();
     var form=document.getElementById("form1");
    form.action="${base}/distri/previewDistri.do?distriId="+id;
    form.submit();
}
//全选与取消
//全选checkbox
function checkAll(e, itemName) {
	var aa = document.getElementsByName(itemName);
	for ( var i = 0; i < aa.length; i++)
		aa[i].checked = e.checked;
}
//条目checkbox
function checkItem(e, allName) {
	var all = document.getElementsByName(allName)[0];
	if (!e.checked)
		all.checked = false;
	else {
		var aa = document.getElementsByName(e.name);
		for ( var i = 0; i < aa.length; i++)
			if (!aa[i].checked)
				return;
		all.checked = true;
	}
}
//全选链接
function checkAllIds() {
	var bb=  document.getElementById("all");
	bb.checked = true;
	var aa = document.getElementsByName("ids");
	for ( var i = 0; i < aa.length; i++)
		aa[i].checked = true;
}
//取消链接
function uncheckAllIds() {
	var bb=  document.getElementById("all");
	bb.checked = false;
	var aa = document.getElementsByName("ids");
	for ( var i = 0; i < aa.length; i++)
		aa[i].checked = false;
}
//跳转页
function _gotoPage(pageNo) {
	var tableForm = document.getElementById('form1');
	$("#pageNo").val(pageNo);
	// 搜索值初始赋值
	getQueryPara();	
	if ($("#searchDistriName").val() == '请输入配送商名称') {
		$("#searchDistriName").val('');
	}
	if ($("#searchContact").val() == '请输入联系人') {
		$("#searchContact").val('');
	}
	tableForm.action="${base}/distri/distributorList.do"
	tableForm.onsubmit=null;
	tableForm.submit();
}

function _inputgotoPage(pageNo) {
    if(isNaN(pageNo)){ 
    	alert("请输入正整数的页码");
	} else{

		var r = /^[0-9]*[1-9][0-9]*$/;
		if(r.test(pageNo)){ 
			var tableForm = document.getElementById('form1');
			var totalPage=${pagination.totalPage};
			if(pageNo>totalPage)
			{
				$("#pageNo").val(totalPage);
			}
			else{
				$("#pageNo").val(pageNo);
				
			}
			// 搜索值初始赋值
			getQueryPara();
			
			if ($("#searchDistriName").val() == '请输入配送商名称') {
				$("#searchDistriName").val('');
			}
			if ($("#searchContact").val() == '请输入联系人') {
				$("#searchContact").val('');
			}
			tableForm.action="${base}/distri/distributorList.do"
			tableForm.onsubmit=null;
			tableForm.submit();
		}
		else{
			alert("请输入正整数的页码");
		}
	}
}
//搜寻预处理
function search() {
	if ($("#searchDistriName").val() == '请输入配送商名称') {
		$("#searchDistriName").val('');
	}
	if ($("#searchContact").val() == '请输入联系人') {
		$("#searchContact").val('');
	}
	$("#pageNo").val('1');
	var form = document.getElementById("form1"); 
	form.action="${base}/distri/distributorList.do";
	form.submit();
}

function singleDel(itemId) {
     preTreat();
	var delChkUrl = $("#deleteCheckAction").val();
	
	var options = {
			beforeSubmit: showDeleteCheckRequest,
			success:      showDeleteCheckResponse,
			type:         'post',
			dataType:     "script",
			data:{
				'itemId':itemId
			},
			url:          delChkUrl
	};
	$('#form1').ajaxSubmit(options);
}

function showDeleteCheckRequest(formData, jqForm, options) {
	return true;
}

function showDeleteCheckResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	
	var status = responseText[0].deleteAble;
	if (status == "true") {
		var itemId = responseText[0].itemId;
		var delUrl = $("#deleteAction").val();
		
		if(confirm("确定删除该商品？")) {
			var form = document.getElementById("form1");
			form.action = delUrl + "?itemId=" + itemId;
			form.submit();
		}
	} else if (status == "false") {
		alert("无法删除，该商品已审核通过！");
	} else {
		alert("删除失败！");
	}
	
}

function deleteTip(distriId) {	
	$.ajax({
        type:"get",
        url:"${base}/distri/hasOrders.do",
        data:"distriId="+distriId+"&ajax=true",
        dataType:    "script",       
        cache:   false,
        async:   false,
        success: function(responseText){        	
            var dataObj=eval("("+responseText+")");
            if(dataObj[0].result=="error"){
               alert(dataObj[0].message);
               return;
            }
                    	
        	if (distriId == null || distriId == "") {
        		alert("删除失败！");
        	}
        	if(!confirm("确认删除？")) {
        		return;
        	} else {
        		var deleteUrl = $("#deleteObject").val();
        		var form = document.getElementById("form1");
        		form.action = deleteUrl + "?distriId=" + distriId;
        		form.submit();
        	}
        }
    });
	
}

function isChecked() {
	var isselected=false;
	$("input[name='ids']").each(function() {
		if ($(this).attr("checked")) {
			isselected=true;
		}
	});
	return isselected;
}

function batchDel() {
	if (!isChecked()) {
		alert("请选择记录");
		return;
	}
	var check = true;
	$("input[name='ids']").each(function() {	
		if ($(this).attr("checked")) {
			var active = $("#active" + $(this).val()).val();
			if (active == "1") {
				check = false;
			}
		}		
	});
	if(!check){
		alert("启用状态的配送商不可删除！");
		return;	
	}
	
	check = true;
	var cn = 0;
	$("input[name='ids']").each(function() {		
		if ($(this).attr("checked")) {
			cn++;
			$.ajax({
		        type:"get",
		        url:"${base}/distri/hasOrders.do",
		        data:"distriId="+$(this).val()+"&ajax=true",
		        dataType:    "script",
		        cache:   false,
		        async:   false,
		        success: function(responseText){
		            var dataObj=eval("("+responseText+")");
		            if(dataObj[0].result=="error"){		              
		               check = false;
		            }		            		            
		        },
		        complete: function(){
		        	cn--;
		        }
		    });
		}		
	});	
	
	while(cn>0){
		// 循环等待
	}
	
	if(!check){
		alert("所选配送商中，存在已有订单的配送商，不能批量删除");
		return;	
	}	
	
	if (confirm("确定删除这些记录")) {
        preTreat();
		var batchDeleteUrl = $("#batchDeleteObject").val();
		var form = document.getElementById("form1"); 
		form.action = batchDeleteUrl;
		form.submit();
	}	
		
}
function batchUpActive() {
	  if (!isChecked()) {
		alert("请选择记录");
		return;
	}     
// 	  var check = true;
// 	  $("input[name='ids']").each(function() {
// 			if ($(this).attr("checked")) {
// 				var username = $("#td"+$(this).val()).html();
// 				if(username==null || username==""){					
// 					check = false;					
// 				}
// 			}
// 		});	  
// 	  if(!check){
// 		  alert("选中的配送商中存在没有绑定用户的，无法批量启用");
// 		  return;
// 	  }
	  preTreat();
        var batchDeleteUrl = $("#batchUpdateActive").val();
		var form = document.getElementById("form1");
		form.action = batchDeleteUrl+"?isActive=1";
		form.submit();
	}
	
    function batchDownActive() {
	  if (!isChecked()) {
		alert("请选择记录");
		return;
	  }     	  
	  preTreat();
        var batchDeleteUrl = $("#batchUpdateActive").val();
		var form = document.getElementById("form1");
		form.action = batchDeleteUrl+"?isActive=0";
		form.submit();
	}
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/relationalmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：合作伙伴管理&nbsp;&raquo;&nbsp;<span class="gray" title="<fmt:message key='DistributorMgmtMenu.title'/>"><fmt:message key='DistributorMgmtMenu.title'/></span></div>

<input type="hidden" id="deleteObject" name="deleteObject" value="${base}/distri/deleteObject.do" />
<input type="hidden" id="batchDeleteObject" name="batchDeleteObject" value="${base}/distri/batchDeleteObject.do" />
<input type="hidden" id="batchUpdateActive" name="batchUpdateActive" value="${base}/distri/batchUpdateActive.do" />
<input type="hidden" id="updateActive" name="updateActive" value="${base}/distri/updateActive.do" />

<div>

    <form id="form1" name="form1" action="${base}/distri/distributorList.do" method="post">

    <div class="sch">
        <p>
            <fmt:message key="menu.distr.name"/>：<input id="searchDistriName" name="searchDistriName" type="text" onkeypress="if(event.keyCode==13){search();}"
            <c:choose>
            <c:when test="${searchDistriName==null||searchDistriName==''}"> value='请输入配送商名称' class="gray text20 medium" </c:when>
            <c:otherwise> value="${searchDistriName}" class="text20 medium" </c:otherwise>
            </c:choose>
            onblur="if(this.value==''){this.value='请输入配送商名称';this.className='gray text20 medium'}" onfocus="if(this.value=='请输入配送商名称'){this.value='';this.className='text20 medium'}" /><fmt:message key="menu.distr.contact"/>：<input id="searchContact" name="searchContact" type="text" onkeypress="if(event.keyCode==13){search();}"
            <c:choose>
            <c:when test="${searchContact==null||searchContact==''}"> value='请输入联系人' class="gray text20 medium" </c:when>
            <c:otherwise> value="${searchContact}" class="text20 medium" </c:otherwise>
            </c:choose>
            onblur="if(this.value==''){this.value='请输入联系人';this.className='gray text20 medium'}" onfocus="if(this.value=='请输入联系人'){this.value='';this.className='text20 medium'}" /><input type="button" value="查询" class="hand btn60x20" id="searchbutton" onclick="search()"/>
        </p>
    </div>

    <div class="page_c">
        <span class="l">
            <input type="button" onclick="batchUpActive();" value="启用" class="hand btn60x20" />
            <input type="button" onclick="batchDownActive();" value="停用" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="删除" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
        	<%-- <a href="${base}/item/addCatItem.do"  class="btn80x20"><fmt:message key="tag.batchAdd"/></a> --%>
            <a href="${base}/distri/addDistri.do"  class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="all" onclick="checkAll(this, 'ids')" name="all" title="<fmt:message key="tag.selected.allORcancel"/>" />
				</th>
				<th><fmt:message key='menu.distr.name'/></th>
				<th><fmt:message key='menu.distr.contact'/></th>
				<th><fmt:message key='menu.distr.fixedphone'/></th>
				<th><fmt:message key='menu.distr.bankNo'/></th>
				<th><fmt:message key='menu.distr.bankAccount'/></th>
				<th><fmt:message key='menu.distr.distrArea'/></th>
				<th><fmt:message key='menu.distr.address'/></th>
                <th><fmt:message key='tag.column.status'/></th>
				<th><fmt:message key='tag.column.operation'/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="item">
				<tr>
					<input type="hidden" id="active${item.distriId}" name="active${item.distriId}" value="${item.isActive}" />
					<td><input type="checkbox" name="ids" value="${item.distriId}"/></td>
					<td class="nwp"><a href="javascript:void(0);" onclick="previewDistri('${item.distriId}')"><c:out value='${item.distriName}'/></a></td>
					<td class="nwp"><c:out value='${item.contact}'/></td>
					<td class="nwp"><c:out value='${item.fixedPhone}'/></td>
					<td class="nwp"><c:out value='${item.bankNo}'/></td>
					<td class="nwp"><c:out value='${item.bankAccount}'/></td>
                    <td class="nwp"><c:out value='${item.distriArea}'/></td>
					<td class="nwp"><c:out value='${item.address}'/></td>
                    <td>
                        <c:if test="${item.isActive==1}">启用|<a href="javascript:updateActive('${item.distriId}',0);" >停用</a></c:if>
                        <c:if test="${item.isActive==0}"><a href="javascript:updateActive('${item.distriId}',1);" >启用</a>|停用</c:if>
					</td>
					<td>
						<a href="javascript:previewDistri('${item.distriId}');" >详情</a>
						<a href="${base}/distri/editDistri.do?distriId=${item.distriId}">编辑</a>
						<c:choose>
		            		<c:when test="${item.isActive==1}">删除</c:when>
		            		<c:when test="${item.isActive==0}"><a href="javascript:deleteTip('${item.distriId}');" >删除</a></c:when>
		            	</c:choose>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tr>
			<td colspan="10" align="right">
        	    <fmt:message key='tag.select'/>：<a href="#" title="<fmt:message key='tag.selected.all'/>" onclick="checkAllIds();"><fmt:message key='tag.selected.all'/></a> 
            	<samp>-</samp> <a href="#" title="<fmt:message key='tag.selected.cancel'/>" onclick="uncheckAllIds();"><fmt:message key='tag.selected.cancel'/></a>
			</td>
		</tr>
	</table>

    <div class="page_c">
        <span class="l inb_a">
            <input type="button" onclick="batchUpActive();" value="启用" class="hand btn60x20" />
            <input type="button" onclick="batchDownActive();" value="停用" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="删除" class="hand btn60x20" />
        </span>
        <span class="r page inb_a">
            <input type="hidden" value="${pagination.pageNo}" id="pageNo" name="pageNo" />
        	共 <var class="red">${pagination.totalCount}</var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="javascript: _gotoPage('${pagination.prePage}');" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="上一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="javascript: _gotoPage('${pagination.nextPage}');" title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" id="_goPs" class="txts" value="${pagination.pageNo}"/>
            <input type="button" onclick="_inputgotoPage($('#_goPs').val());" value="<fmt:message key="tag.page.jump"/>" class="hand" onkeypress="if(event.keyCode==13){window.event.returnValue= false;}" />
        </span>
    </div>

    </form>
    
</div>

</div></div>
</body>