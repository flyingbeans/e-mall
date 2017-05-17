<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title><fmt:message key="SupplierMgmtMenu.title" />_合作伙伴</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="RelationShipMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">

function getQueryPara(){
	//将后台传给前台的搜索值赋值给后台
	$("#supplName").val("${supplName}");
	$("#supplContact").val("${supplContact}");
	$("#supplType").val("${supplType}");
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
	if ($("#supplName").val() == '请输入供货商名称') {
		$("#supplName").val('');
	}
	if ($("#supplContact").val() == '请输入联系人') {
		$("#supplContact").val('');
	}
	tableForm.action="${base}/suppl/supplFrame.do"
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
			
			if ($("#supplName").val() == '请输入供货商名称') {
				$("#supplName").val('');
			}
			if ($("#supplContact").val() == '请输入联系人') {
				$("#supplContact").val('');
			}
			tableForm.action="${base}/suppl/supplFrame.do"
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
	if ($("#supplName").val() == '请输入供货商名称') {
		$("#supplName").val('');
	}
	if ($("#supplContact").val() == '请输入联系人') {
		$("#supplContact").val('');
	}
	$("#pageNo").val('1');
	var form = document.getElementById("form1"); 
	form.action="${base}/suppl/supplFrame.do";
	form.submit();
}

function singleDel(itemId) {
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

function deleteTip(supplId) {
	if (supplId == null || supplId == "") {
		alert("删除失败！");
	}
	if(!confirm("确认删除？")) {
		return;
	} else {
		var deleteUrl = $("#deleteAction").val();
		var form = document.getElementById("form1");
		form.action = deleteUrl + "?supplId=" + supplId;
		form.submit();
	}
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
	if (confirm("确定删除这些记录")) {
		if ($("#supplName").val() == '请输入供货商名称') {
			$("#supplName").val('');
		}
		if ($("#supplContact").val() == '请输入联系人') {
			$("#supplContact").val('');
		}
		var batchDeleteUrl = $("#batchDeleteAction").val();
		var form = document.getElementById("form1"); 
		form.action = batchDeleteUrl;
		form.submit();
	}	
}

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/relationalmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：合作伙伴管理&nbsp;&raquo;&nbsp;<span class="gray" title="<fmt:message key='SupplierMgmtMenu.title'/>"><fmt:message key='SupplierMgmtMenu.title'/></span></div>

    <form id="form1" name="form1" action="${base}/suppl/supplFrame.do" method="post">
        <input type="hidden" id="deleteAction" name="deleteAction" value="${base}/suppl/deleteSuppl.do" />
        <input type="hidden" id="batchDeleteAction" name="batchDeleteAction" value="${base}/suppl/batchDeleteSuppl.do" />

    <div class="sch">
        <p><fmt:message key="tag.search"/>：<select id="supplType" name="supplType">
                <option selected="selected" value="0" <c:if test='${supplType==0}'>selected</c:if>>请选择<fmt:message key="menu.suppl.supplType"/></option>				
				<option value="1" <c:if test='${supplType==1}'>selected</c:if> >手机商家</option>
				<option value="2" <c:if test='${supplType==2}'>selected</c:if> >号卡商家</option>
			</select>
            <fmt:message key="menu.suppl.name"/>：<input id="supplName" name="supplName" type="text" maxlength="20" onkeypress="if(event.keyCode==13){search();}"
            <c:choose>
            <c:when test="${supplName==null||supplName==''}"> value='请输入供货商名称' class="gray text20 medium" </c:when>
            <c:otherwise> value="${supplName}" class="text20 medium" </c:otherwise>
            </c:choose>
            onblur="if(this.value==''){this.value='请输入供货商名称';this.className='gray text20 medium'}" onfocus="if(this.value=='请输入供货商名称'){this.value='';this.className='text20 medium'}" /><fmt:message key="menu.suppl.contact"/>：<input id="supplContact" name="supplContact" type="text" maxlength="20" onkeypress="if(event.keyCode==13){search();}"
            <c:choose>
            <c:when test="${supplContact==null||supplContact==''}"> value='请输入联系人' class="gray text20 medium" </c:when>
            <c:otherwise> value="${supplContact}" class="text20 medium" </c:otherwise>
            </c:choose>
            onblur="if(this.value==''){this.value='请输入联系人';this.className='gray text20 medium'}" onfocus="if(this.value=='请输入联系人'){this.value='';this.className='text20 medium'}" /><input type="button" value="<fmt:message key="tag.search"/>" class="hand btn60x20" id="searchbutton" onclick="search()"/>
        </p>
    </div>

    <div class="page_c">
        <span class="l">
            <input type="button" onclick="batchDel();" value="删除" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
        	<%-- <a href="${base}/item/addCatItem.do"  class="btn80x20"><fmt:message key="tag.batchAdd"/></a> --%>
            <a href="${base}/suppl/addSuppl.do"  class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab" id="myTable">
		<thead>
			<tr>
				<th>
					<input type="checkbox" id="all" onclick="checkAll(this, 'ids')" name="all" title="<fmt:message key="tag.selected.allORtcancel"/>" />
				</th>
				<th><fmt:message key='menu.suppl.name'/></th>
				<th><fmt:message key='menu.suppl.contact'/></th>
				<th><fmt:message key='menu.suppl.fixedphone'/></th>
				<th><fmt:message key='menu.suppl.bankNo'/></th>
				<th><fmt:message key='menu.suppl.bankAccount'/></th>
				<th><fmt:message key='menu.suppl.supplType'/></th>
				<th><fmt:message key='menu.suppl.address'/></th>
				<th><fmt:message key='tag.column.operation'/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="item">
				<tr>
					<td><input type="checkbox" name="ids" value="${item.supplId}"/></td>
					<td class="nwp"><a href="${base}/suppl/previewSuppl.do?supplId=${item.supplId}"><c:out value='${item.supplName}'/></a></td>
					<td><c:out value='${item.contact}'/></td>
					<td><c:out value='${item.phone}'/></td>
					<td><c:out value='${item.bankNo}'/></td>
					<td><c:out value='${item.bankAccount}'/></td>
					<c:choose>
						<c:when test='${item.supplType==1}'>
							<td>
								<c:out value='手机商家'/>
							</td>
					   	</c:when>
					  	<c:when test='${item.supplType==2}'>
							<td>
								<c:out value='号卡商家'/>
							</td>
					   	</c:when>
					</c:choose>
					<td class="nwp"><c:out value='${item.address}'/></td>
					<td>
						<a href="${base}/suppl/previewSuppl.do?supplId=${item.supplId}">详情</a>
						<a href="${base}/suppl/editSuppl.do?supplId=${item.supplId}">编辑</a>
						<a href="javascript:void(0);" onclick="deleteTip('${item.supplId}')">删除</a>
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
        	<input type="button" onclick="batchDel();" value="删除" class="hand btn60x20" />
        </span>
        <span class="r page inb_a">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            共 <var class="red">${totalCount}</var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="javascript: _gotoPage('${pagination.prePage}');" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="javascript: _gotoPage('${pagination.nextPage}');" title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" id="_goPs" class="txts" value="${pagination.pageNo}"/>
            <input type="button" onclick="_inputgotoPage($('#_goPs').val());" value="<fmt:message key="tag.page.jump"/>" class="hand" onkeypress="if(event.keyCode==13){window.event.returnValue= false;}"/>
        </span>
    </div>

    </form>

</div></div>
</body>