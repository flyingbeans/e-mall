<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<title>配送商信息详情</title>
<meta name="heading" content="配送商信息详情"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script language="javascript">

function backToBackList() {
	 var form=document.getElementById("form1");
         form.action=$("#distriListUrl").val();
    	  form.submit();
}
function stopAjax(){
    var form=document.getElementById("form1");
         form.action=$("#stopUrl").val();
    		form.submit();
}
function startAjax(id){
	var un = $("#spanUN").html();
	if(un==null || un==""){
		alert("配送商没有绑定用户，无法启用");
		return;
	}
	var form=document.getElementById("form1");
    form.action=$("#startUrl").val();
    form.submit();
}
function deleteObject(id) {
	var check = true;
	$.ajax({
        type:"post",
        url:"${base}/distri/hasOrders.do",
        data:"distriId="+id,
        dataType:    "script",
        cache:   false,
        async:   false,
        success: function(responseText){
            var dataObj=eval("("+responseText+")");
            if(dataObj[0].result=="error"){
               alert(dataObj[0].message);
               check = false;
            }
        }
    });
	if(!check)
		return;	
	
	if (id == null || id == "") {
		alert("删除失败！");
	}
	if(!confirm("确认删除？")) {
		return;
	} else {

		var deleteUrl = $("#deleteObjectUrl").val();
		
		var options = {
				beforeSubmit: showDeleteRequest,
				success:      showDeleteResponse,
				type:         'post',
				dataType:    "script",
				data:{
					'distriId':id
				},
				url:          deleteUrl
		};
		$('#form1').ajaxSubmit(options);
	}
}

function showDeleteRequest(formData, jqForm, options) {
	return true;
}

function showDeleteResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	var message = responseText[0].message;
	alert(message);

	var distriListUrl=$("#distriListUrl").val();
	window.location.href = distriListUrl;
}

</script>
</head>
<body id="main">

<div class="frameL">
	
		<div class="menu icon">
    		<jsp:include page="/ecps/console/common/relationalmenu.jsp"/>
		</div>

</div>

<div class="frameR">
	
		<div class="content">

			<div class="loc icon">
				<c:url value="/${system}/distri/distributorList.do" var="list">
		        <c:param name="url" value="system/list"/>
		        </c:url>
                <span class="l">
                <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：合作伙伴管理&nbsp;&raquo;&nbsp;<a href="${list}" title="配送商信息详情">配送商管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="查看配送商">查看配送商</span>
                </span>
                <span class="r">
			    <input type="hidden" id="startUrl" name="startUrl"  value="${base}/distri/previewActiveStart.do"/>
                <input type="hidden" id="stopUrl" name="stopUrl"  value="${base}/distri/previewActiveStop.do"/>
			    <input type="hidden" id="distriListUrl" name="distriListUrl"  value="${base}/distri/distributorList.do"/>
			    <input type="hidden" id="deleteObjectUrl" name="deleteObjectUrl" value="${base}/distri/deleteDistriAjax.do"/>
                <input type="button" value="编辑" onclick="window.location.href='${base}/distri/editDistri.do?distriId=${item.distriId}'" class="hand btn80x20" />
                <c:choose>
            		<c:when test="${item.isActive==1}">
            			<input type="button" value="删除" onclick="javascript:void(0);" class="hand btn80x20" disabled="disabled" />
            		</c:when>
            		<c:when test="${item.isActive==0}">
            			<input type="button" value="删除" onclick="deleteObject('${item.distriId}')" class="hand btn80x20" />
            		</c:when>
            	</c:choose>
                </span>
			</div>
			
			<form id="form1" name="form1" action="#" method="post">
                 <input type="hidden" id="searchDistriName" name="searchDistriName"  value="${searchDistriName}"/>
			    <input type="hidden" id="searchContact" name="searchContact"  value="${searchContact}"/>
			    <input type="hidden" id="pageNo" name="pageNo" value="${pageNo}"/>
				<div class="edit set">
					<h2 title="注册信息">注册信息</h2>
					<ul class="uls">
					<li>
						<label>配送商名称：</label><c:out value='${item.distriName}'/>
					</li>
				
					<li>
						<label>配送商曾用名：</label><c:out value='${item.FKA}'/>
					</li>
				
					<li>
						<label>法人代表：</label><c:out value='${item.legalRep}'/>
					</li>
				
					<li>
						<label>注册资本：</label><c:out value='${item.regCap}'/>
					</li>
					
					<li>
						<label>企业类型：</label>
						<c:choose>
							<c:when test='${item.corpType==1}'>
								<c:out value='国有企业'/>
						   	</c:when>
						  	<c:when test='${item.corpType==2}'>
								<c:out value='集体企业'/>
						   	</c:when>
						   	<c:when test='${item.corpType==3}'>
								<c:out value='私营企业'/>
						   	</c:when>
						  	<c:when test='${item.corpType==4}'>
								<c:out value='联营企业'/>
						   	</c:when>
						   	<c:when test='${item.corpType==5}'>
								<c:out value='有限责任公司'/>
						   	</c:when>
						  	<c:when test='${item.corpType==6}'>
								<c:out value='股份有限公司'/>
						   	</c:when>
						   	<c:when test='${item.corpType==7}'>
								<c:out value='股份合作企业'/>
						   	</c:when>
						  	<c:when test='${item.corpType==8}'>
								<c:out value='其他企业'/>
						   	</c:when>
                            <c:when test='${item.corpType==9}'>
								<c:out value='港、澳、台商投资企业'/>
						   	</c:when>
                            <c:when test='${item.corpType==10}'>
								<c:out value='外商投资企业'/>
						   	</c:when>
						</c:choose>
					</li>
					
					<li>
						<label>经营范围：</label><div class="pre"><c:out value='${item.bizScope}'/></div>
					</li>
					
					<li>
						<label>营业执照号：</label><c:out value='${item.licenseNo}'/>
					</li>
					
					<li>
						<label>创立日期：</label><c:out value='${item.establishDate}'/>
					</li>
                    </ul>
				</div>
				
				<div class="loc">&nbsp;</div>
				
				<div class="edit set">
					<h2 title="联系方式">联系方式</h2>
					
					<p>
						<label>联系人：</label><c:out value='${item.contact}'/>
					</p>
					
					<p>
						<label>移动电话：</label><c:out value='${item.mobile}'/>
					</p>
					
					<p>
						<label>固定电话：</label><c:out value='${item.fixedPhone}'/>
					</p>
					
					<p>
						<label>传真：</label><c:out value='${item.fax}'/>
					</p>
					
					<p>
						<label>Email：</label><c:out value='${item.email}'/>
					</p>
					
					<p>
						<label>网址：</label><c:out value='${item.website}'/>
					</p>
					
					<p>
						<label>地址：</label><c:out value='${item.address}'/>
					</p>
					
					<p>
						<label>邮编：</label><c:out value='${item.zip}'/>
					</p>
				</div>
			
				<div class="loc">&nbsp;</div>
				
				<div class="edit set">
					<h2 title="账户信息">账户信息</h2>
					
					<p>
						<label>开户行：</label><c:out value='${item.bankName}'/>
					</p>
					
					<p>
						<label>开户行行号：</label><c:out value='${item.bankNo}'/>
					</p>
					
					<p>
						<label>银行账号：</label><c:out value='${item.bankAccount}'/>
					</p>
					
					<p>
						<label>纳税号：</label><c:out value='${item.taxNo}'/>
					</p>
				</div>
			
				<div class="loc">&nbsp;</div>
				
				<div class="edit set">
					<h2 title="服务信息">服务信息</h2>
                    <ul class="uls">
					<li>
						<label>配送区域：</label><div class="pre"><c:out value='${item.distriArea}'/>&nbsp;</div>
					</li>
                    <li>
						<label>不配送货品：</label><div class="pre"><c:out value='${item.notDelivery}'/>&nbsp;</div>
					</li>
                    <li>
						<label>资费标准：</label><div class="pre"><c:out value='${item.chargeStd}'/>&nbsp;</div>
					</li>
                    <li>
						<label>特色服务：</label><div class="pre"><c:out value='${item.featuredSvr}'/>&nbsp;</div>
					</li>
                    <li>
						<label>配送站点数：</label><c:out value='${item.branchNum}'/>
					</li>
                    <li>
						<label>配送人员数量：</label><c:out value='${item.employeeNum}'/>
					</li>
                        </ul>
				</div>
			
				<div class="loc">&nbsp;</div>

                <div class="edit set">
					<h2 title="文件信息">文件信息</h2>
                    <p id="attachmentUploadDiv" <c:if test='${item.attachment==null}'>style="display:none"</c:if>><label></label><b id="attachmentUploadLbl"><a target="_blank" href="${filePath}">${fileName}</a></b></p>
				</div>
				
				<div class="loc">&nbsp;</div>

                <div class="edit set">
                <h2 title="登录账号">登录账号</h2>
                <p> <label>用户名：</label> <c:if test="${item.userId==null}">未绑定登录账号</c:if><span id="spanUN"><c:out value='${item.userName}'/></span>
                    <input type="hidden" id="distributorId" name="distributorId"  value="${item.distriId}" />
                    <input type="hidden" id="isActive" name="isActive"  value="${item.isActive}" />
                    <c:if test="${item.isActive==1}"><input type="button" value="启用" disabled="disabled" class="hand btn83x23b" />
                    <input type="button" value="停用" onclick="stopAjax();" class="hand btn83x23b" /></c:if>
                    <c:if test="${item.isActive==0}"><input type="button" value="启用"  onclick="startAjax();" class="hand btn83x23b" />
                    <input type="button" value="停用"  disabled="disabled" class="hand btn83x23b" /></c:if>
                </p>
                </div>
			
				<div class="edit set">
					<p><label for="button">&nbsp;</label><input type="button" onclick="backToBackList()" value="返回列表" onclick="" class="hand btn102x26" /></p>
				</div>
			
			</form>
		
	</div>
</div>
</body>