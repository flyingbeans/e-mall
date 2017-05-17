<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<title>供应商信息详情</title>
<meta name="heading" content="供应商信息详情"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script language="javascript">

function backToBackList() {
	var supplListUrl = $("#supplListUrl").val();
	window.location.href = supplListUrl;
}

function deleteSupplAction(supplId) {
	if (supplId == null || supplId == "") {
		alert("删除失败！");
	}
	if(!confirm("确认删除？")) {
		return;
	} else {

		var deleteUrl = $("#deleteSupplUrl").val();
		
		var options = {
				beforeSubmit: showDeleteRequest,
				success:      showDeleteResponse,
				type:         'post',
				dataType:     "script",
				data:{
					'supplId':supplId
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
	
	var supplListUrl = $("#supplListUrl").val();
	window.location.href = supplListUrl;
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
                <span class="l">
                <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：合作伙伴管理&nbsp;&raquo;&nbsp;<a href="${list}" title="供应商管理">供应商管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="查看供应商">查看供应商</span>
                </span>
                <span class="r">
			    <input type="hidden" id="supplListUrl" name="supplListUrl" value="${base}/suppl/supplFrame.do"/>
			    <input type="hidden" id="deleteSupplUrl" name="deleteSupplUrl" value="${base}/suppl/deleteSupplAjax.do"/>
                <input type="button" value="编辑" onclick="window.location.href='${base}/suppl/editSuppl.do?supplId=${item.supplId}'" class="hand btn80x20" />
                <input type="button" value="删除" onclick="deleteSupplAction('${item.supplId}')" class="hand btn80x20" />
                </span>
			</div>
			
			<form id="form1" name="form1" action="" method="post">
			
				<div class="edit set">
					<h2 title="注册信息">注册信息</h2>
					<ul class="uls">
					<li>
						<label>供应商名称：</label><c:out value='${item.supplName}'/>
					</li>
				
					<li>
						<label>供应商曾用名：</label><c:out value='${item.fka}'/>
					</li>
				
					<li>
						<label>法人代表：</label><c:out value='${item.legalName}'/>
					</li>
				
					<li>
						<label>注册资本：</label><c:out value='${item.regCapital}'/>
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
						<label>经营范围：</label><div class="pre"><c:out value='${item.bizScope}'/>&nbsp;</div>
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
						<label>固定电话：</label><c:out value='${item.phone}'/>
					</p>
					
					<p>
						<label>传真：</label><c:out value='${item.fax}'/>
					</p>
					
					<p>
						<label>Email：</label><c:out value='${item.email}'/>
					</p>
					
					<p>
						<label>网址：</label><c:out value='${item.webSite}'/>
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
					<h2 title="供货信息">供货信息</h2>
					<p>
						<label>供货类型：</label><c:choose>
							                                    <c:when test='${item.supplType==1}'>
								                                        <c:out value='手机商家'/>
						                                                	</c:when>
						  	                                     <c:when test='${item.supplType==2}'>
								                                        <c:out value='号卡商家'/>
						   	                                                    </c:when>
						                                            </c:choose>
					</p>
				</div>
			
				<div class="loc">&nbsp;</div>
				
				<div class="edit set">
					<h2 title="文件信息">文件信息</h2>
                    <p id="attachmentUploadDiv" <c:if test='${item.attachment==null}'>style="display:none"</c:if>><label></label><b id="attachmentUploadLbl"><a target="_blank" href="${filePath}">${fileName}</a></b></p>
				</div>
				
				<div class="loc">&nbsp;</div>
			
				<div class="edit set">
					<p><label for="button">&nbsp;</label><input type="button" onclick="backToBackList()" value="返回列表" onclick="" class="hand btn102x26" /></p>
				</div>
			
			</form>
		
	</div>
</div>
</body>