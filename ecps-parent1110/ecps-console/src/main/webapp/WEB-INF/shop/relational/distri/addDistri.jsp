<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<title>添加配送商_配送商管理_合作伙伴</title>
<meta name="heading" content="添加配送商"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">

function checkUser(){
    var flag=false;
    if($("#userName").val()=="") return true;
    $.ajax({
           type:"post",
           url:"${base}/distri/checkUser.do",
           data:"userName="+$("#userName").val(),
           dataType:    "script",
           cache:   false,
           async:   false,
           success: function(responseText){
                var dataObj=eval("("+responseText+")");
               if(dataObj[0].sta=="false"){
                  alert(dataObj[0].mes);
               }else if(dataObj[0].sta=="true"){
                    flag=true;
               }
           }
            });
    return flag;
}

function checkZipCode(zipCode) {
	if (!(/^\d{6}$/.test(zipCode))) {
		return false;
	} else {
		return true;
	}
}

function checkEmail(email){
	if(!(/^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/.test(email))){
		return false;
	} else {
		return true;
	}
}

 <!-- 验证配送商配送商曾用名-->
function checkNameFormat(name) {
	if (!(/^[0-9a-zA-Z\u4e00-\u9fa5()\s]{1,200}$/.test(name))) {
		return false;
	} else {
		return true;
	}
}
//added by Fengxq 20120802  过滤空格
function checkNameFormat02(name) {
	if (!(/^[0-9a-zA-Z\u4e00-\u9fa5()\s]{1,20}$/.test(name))) {
		return false;
	} else {
		return true;
	}
}
function checkUnicodeNameFormat(name) {
	if (!(/^[\u4e00-\u9fa5]{1,200}$/.test(name))) {
		return false;
	} else {
		return true;
	}
}

function checkMobile(mobileNumber) {
	if (isNaN(mobileNumber)) {
		return false;
	} else {
		return true;
	}
}

function checkPhone(phoneNumber) {
	if (!(/^0\d{2,3}\-\d{7,8}$/.test(phoneNumber))) {
		return false;
	} else {
		return true;
	}
}

function checkBankName(name) {
	if (/^[a-zA-Z\u4e00-\u9fa5\s0-9]{1,20}$/.test(name)) {
		return true;
	} else {
		return false;
	}
}

<!-- 法人代表 联系人名  英文 汉字 空格-->
	function checkEnZh(word){
		if ((/^[a-zA-Z\u4e00-\u9fa5\s0-9]{1,20}$/.test(word))) {
		return true;
	} else {
		return false;
	}
}
<!-- 地址  中英文 数字 空格-->
	function checkEnZhNum(word){
		if ((/^[a-zA-Z\u4e00-\u9fa5\s0-9]*$/.test(word))) {
		return true;
	} else {
		return false;
	}
}
<!--注册资本   中文 数字-->
function checkZhNum(word){
		if ((/^[0-9\u4e00-\u9fa5]*$/.test(word))) {
	return true;
	} else {
		return false;
	}
}
<!--营业执照号码  数字-->
function checkNum(word){
		if ((/^[\d]*$/.test(word))) {
		return true;
	} else {
		return false;
	}
}

<!--电话号码 传真号    数字 连接符- -->
function checkNumCon(word){
		if ((/^[\d\-]*$/.test(word))) {
		return true;
	} else {
		return false;
	}
}
 function checkNoZh(word){
		if ((/^[^\u4e00-\u9fa5]*$/.test(word))) {
		return true;
	} else {
		return false;
	}
}
function saveDistri() {	
	var check = checkForm();	
    if(check){
        var saveDistri ="${base}/distri/saveDistri.do";
		var options = {
				beforeSubmit: showAddRequest,
				success:      showAddResponse,
				type:         'post',
				dataType:    "script",
				url:          saveDistri
		};
		$('#distriSave').ajaxSubmit(options);
    }

}

function showAddRequest(formData, jqForm, options) {
	return true;
}


function showAddResponse(responseText)  {
    var dataObj=eval("("+responseText+")");
    alert(dataObj[0].mes);
    var distriListUrl=$("#distriListUrl").val();
	window.location.href = distriListUrl;
}

function check(object, value) {
	if (value == "") {
		$("#" + object).focus();
		return false;
	}
	return true;
}

function checkForm() {
	var as = true;
	
	var distriName = $("#distriName").val();
	var fka = $("#FKA").val();
	var legalRep = $("#legalRep").val();
	var regCapital = $("#regCap").val();
	var bizScope = $("#bizScope").val();
	var licenseNo = $("#licenseNo").val();
	var contact = $("#contact").val();
	var mobile = $("#mobile").val();
	var phone = $("#fixedPhone").val();
	var fax = $("#fax").val();
	var email = $("#email").val();
	var webSite = $("#webSite").val();
	var address = $("#address").val();
	var zip = $("#zip").val();
	var bankName = $("#bankName").val();
	var bankNo = $("#bankNo").val();
	var bankAccount = $("#bankAccount").val();
	var taxNo = $("#taxNo").val();
	var establishDate = $("#establishDate").val();
    var distriArea = $("#distriArea").val();
    var notDelivery = $("#notDelivery").val();
    var branchNum = $("#branchNum").val();
    var employeeNum = $("#employeeNum").val();
    var featuredSvr = $("#featuredSvr").val();
    var chargeStd = $("#chargeStd").val();
	
	if (!check('distriName', distriName) || distriName.length > 20 || !checkNameFormat02(distriName)) {
		$('#spanDistriName').html("只允许输入1-20个字符，且只能为数字、英文、汉字、英文括号和空格");
		as = false;
	} else
		$('#spanDistriName').html('');
	
	if (fka.length > 20 || (fka != "" && !checkNameFormat02(fka))) {
		$('#spanFka').html("只允许输入0-20个字符，且只能为数字、英文、汉字、英文括号和空格");
		as = false;
	} else
		$('#spanFka').html('');
		
	if (legalRep.length > 20 || (legalRep != "" && !checkEnZh(legalRep))) {
		$('#spanLegalRep').html("只允许输入0-20个字符，且只能为英文、汉字和数字");
		as = false;
	} else
		$('#spanLegalRep').html('');
	
	if (regCapital.length > 20 || (regCapital != "" && !checkZhNum(regCapital))) {
		$('#spanRegCapital').html("只允许输入0-20个字符，且只能为数字和汉字");
		as = false;
	} else
		$('#spanRegCapital').html('');
		
	if (!check('bizScope',bizScope) || bizScope.length > 200) {
		$('#spanBizScope').html("只允许输入1-200个字符");
		as = false;
	} else
		$('#spanBizScope').html('');
	
	if (licenseNo.length > 30 || (licenseNo != "" && !checkNum(licenseNo))) {
		$('#spanLicenseNo').html("只允许输入0-30个数字");
		as = false;
	} else
		$('#spanLicenseNo').html('');
	
	var establishDateYear = parseInt($("#establishDate").val().substring(0,4));
	var establishDateMonth = parseInt($("#establishDate").val().substring(5,7));
	var establishDateDay = parseInt($("#establishDate").val().substring(8,10));
	var nowDate = new Date();
	var nowYear = nowDate.getFullYear();
	var nowMonth = nowDate.getMonth()+1;
	var nowDay = nowDate.getDate();
	if (nowYear < establishDateYear) {
		$('#spanEstablishDate').html("创立时间不正确，请重新选择！");
		as = false;
	} else {
		if (nowYear == establishDateYear) {
			if (nowMonth < establishDateMonth) {
				$('#spanEstablishDate').html("创立时间不正确，请重新选择！");
				as = false;
			} else {
				if (nowMonth == establishDateMonth) {
					if (nowDay < establishDateDay) {
						$('#spanEstablishDate').html("创立时间不正确，请重新选择！");
						as = false;
					} else
						$('#spanEstablishDate').html('');
				} else
					$('#spanEstablishDate').html('');
			}
		} else
			$('#spanEstablishDate').html('');
	}
	
	if (!check('contact', contact) || contact.length > 20 || !checkEnZh(contact)) {
		$('#spanContact').html("只允许输入1-20个字符，且只能为英语、汉字和数字");
		as = false;
	} else
		$('#spanContact').html('');
	
	if ((mobile != "" &&mobile.length != 11) || (mobile != "" && !checkNum(mobile))) {
		$('#spanMobile').html("移动电话为11位数字，并且需要输入正确的格式！");
		as = false;
	} else
		$('#spanMobile').html('');
		
	if (!check('fixedPhone', phone) || phone.length > 15 || !checkNumCon(phone)) {
		$('#spanFixedPhone').html('只允许输入1-15个数字或"-"');
		as = false;
	} else
		$('#spanFixedPhone').html('');
		
	if (fax.length > 15 || (fax!=''&&!checkNumCon(fax))) {
		$('#spanFax').html('只允许输入1-15个数字或"-"');
		as = false;
	} else
		$('#spanFax').html('');
	
	if (email.length > 50 || (email!=''&!checkNoZh(email)) || (email!='' && !checkEmail(email))) {
		$('#spanEmail').html("email不能大于50个字符，并且需要输入正确的格式！");
		as = false;
	} else
		$('#spanEmail').html('');
	
	if (webSite.length >50 || (webSite!=''&!checkNoZh(webSite))) {
		$('#spanWebSite').html("只允许输入0-50个非汉字字符");
		as = false;
	} else if (webSite != "" && (webSite.length < 7 || webSite.substr(0,7) != "http://")) {
		$('#spanWebSite').html("网址请以http://开头");
		as = false;
	} else
		$('#spanWebSite').html('');
	  
	if (!check('address', address) || address.length > 50 || !checkEnZhNum(address)) {
		$('#spanAddress').html("只允许输入1-50个英语汉字数字字符");
		as = false;
	} else
		$('#spanAddress').html('');
	     
	if (!check('bankName', bankName) || bankName.length > 20 || !checkBankName(bankName)) {
		$('#spanBankName').html("只允许输入1-20个字符，且只能为英语、汉字和数字");
		as = false;
	} else
		$('#spanBankName').html('');
	
    if (!check('bankNo', bankNo) || !checkNum(bankNo) || bankNo.length!= 12) {
		$('#spanBankNo').html("只允许输入12个数字字符");
		as = false;
	} else
		$('#spanBankNo').html('');
    
    if (!check('bankAccount', bankAccount) || !checkNum(bankAccount) || bankAccount.length > 30) {
		$('#spanBankAccount').html('只允许输入12个数字字符');
		as = false;
	} else
		$('#spanBankAccount').html('');
		
	if ((taxNo!=''&&taxNo.length!=15) || (taxNo!=''&&!(/^[0-9xlXL]*$/.test(taxNo)))) {
		$('#spanTaxNo').html("纳税号为15个字符，并且需要输入正确的格式！");
		as = false;
	} else
		$('#spanTaxNo').html('');
	      
	if (zip!=''&&!checkZipCode(zip) ) {
		$('#spanZip').html("邮政编码只能为6位数字！");
		as = false;
	} else
		$('#spanZip').html('');
		
    if (!check('distriArea', distriArea) || distriArea.length > 200) {
		$('#spanDistriArea').html("只允许输入1-200个字符");
		as = false;
	} else
		$('#spanDistriArea').html('');
		
    if (!check('notDelivery', notDelivery) || notDelivery.length > 200) {
		$('#spanNotDelivery').html("只允许输入1-200个字符");
		as = false;
	} else
		$('#spanNotDelivery').html('');
     
    if (!check('chargeStd', chargeStd) || chargeStd.length > 200) {
		$('#spanChargeStd').html("只允许输入1-200个字符");
		as = false;
	} else
		$('#spanChargeStd').html('');
		
    if (featuredSvr.length > 200) {
		$('#spanFeaturedSvr').html("只允许输入0-200个字符");
		as = false;
	} else
		$('#spanFeaturedSvr').html('');
    
    if (!check('branchNum', branchNum) || branchNum.length > 10 || !checkNum(branchNum)) {
		$('#spanBranchNum').html("只允许输入1-10个数字字符");
		as = false;
	} else
		$('#spanBranchNum').html('');
		    
    if (!check('employeeNum', employeeNum) || employeeNum.length > 10 || !checkNum(employeeNum)) {
		$('#spanEmployeeNum').html("只允许输入1-10个数字字符");
		as = false;
	} else
		$('#spanEmployeeNum').html('');
         
    if(as)
    	return true;
    else
		return false;
}

function backToBackList() {
	var supplListUrl = $("#distriListUrl").val();
	window.location.href = supplListUrl;
}

function checkFileType(type) {
	var allowFileTypes = new Array(/^\.(d|D)(o|O)(c|C)$/,/^\.(p|P)(d|D)(f|F)$/,/^\.(r|R)(a|A)(r|R)$/,/^\.(z|Z)(i|I)(p|P)$/);
	
	for(var i=0;i<allowFileTypes.length;i++) {
		if (allowFileTypes[i].test(type)) {
			return true;
		}
	}
	return false;
}

function submitUpload(componentName) {
	var componentNameValue = $("#"+componentName).val();
	
	if (componentNameValue != "") {
		alert("已经上传文件，请选择删除操作！");
		return;
	}
	
	var path = $('#'+componentName+'File').val();
	if (path == "") {
		return;
	}
	var point = path.lastIndexOf(".");
	var type = path.substr(point);
	
	if (!checkFileType(type)) {
		alert("文件上传支持doc、pdf、rar、zip格式文件!");
		return;
	}
	
	var uploadUrl = $('#'+componentName+'UploadAction').val();
	var options = {
			beforeSubmit: showUploadRequest,
			success:      showUploadResponse,
			type:         'post',
			dataType:     "script",
			data:{
				'fileObjName':componentName
			},
			url:          uploadUrl
	};
	$('#distriSave').ajaxSubmit(options);
}

function showUploadRequest(formData, jqForm, options) {
	return true;
}

function showUploadResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	
	var ret = responseText[0].error;
	if (ret != undefined) {
		alert(ret);
		return;
	}
	
	var componentName = responseText[0].componentName;
	var filePath = responseText[0].filePath;
	var fileName = responseText[0].fileName;
	var fileSize = responseText[0].fileSize;
	var fileType = responseText[0].fileType;
	var base = responseText[0].base;
// 	var filePath = base + filePath;
	
	var uploadStruct = '{"fileName":"'+fileName+'","filePath":"'+filePath+'","fileSize":"'+fileSize+'","fileType":"'+fileType+'"}';
	
	$('#'+componentName).attr("value", uploadStruct);
	$('#'+componentName+'UploadLbl').html(fileName+"&nbsp;&nbsp;&nbsp;"+fileType+"&nbsp;&nbsp;&nbsp;"+fileSize+"KB");
	$('#'+componentName+'UploadDiv').fadeIn('slow');
}

function deleteUpload(componentName) {
	var componentNameValue = $("#"+componentName).val();
	
	if (componentNameValue == "") {
		alert("没有可删除文件");
		return;
	} else {
		if (confirm("确定删除该文件？")) {
			var uploadStructJson = $.parseJSON(componentNameValue);
			var filePath = uploadStructJson.filePath;
			
			var deleteUrl = $('#'+componentName+'DeleteAction').val();
			$.ajax({
				type:"post",
				url:deleteUrl,
				dataType:"json",
		        data: {
		        	'componentName':componentName,
		        	'filePath':filePath
		        },
				complete:function(data){
					var obj = $.parseJSON(data.responseText);
					var componentName = obj[0].componentName;
					$('#'+componentName).attr("value", "");
					$('#'+componentName+'UploadDiv').fadeOut('slow');
					$('#'+componentName+'UploadLbl').html("");
				}
			});
		}
	}
}

$(function(){
	$("input[reg1]").blur(function(){
		var a=$(this);
		var id = a.attr("id");
		var spanId = "span"+id.substring(0,1).toUpperCase()+id.substring(1,id.length);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+spanId).text(a.attr("desc"));
		}else{
			$("#"+spanId).text("");
		}
	});
	$("textarea[reg1]").blur(function(){
		var a=$(this);
		var id = a.attr("id");
		var spanId = "span"+id.substring(0,1).toUpperCase()+id.substring(1,id.length);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.text();
		if(!reg.test(objValue)){
			$("#"+spanId).text(a.attr("desc"));
		}else{
			$("#"+spanId).text("");
		}
	});
});
</script>
</head>
<body id="main">

<input type="hidden" id="distriListUrl" name="distriListUrl" value="${base}/distri/distributorList.do"/>

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/relationalmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon">
        <c:url value="/${system}/distri/distributorList.do" var="list">
        <c:param name="url" value="system/list"/>
        </c:url>
        <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：合作伙伴管理&nbsp;&raquo;&nbsp;<a href="${list}" title="配送商管理" >配送商管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加配货商">添加配货商</span>
        <a href="${base}/distri/distributorList.do" title="返回配送商管理" class="inb btn120x20">返回配送商管理</a>
    </div>

    <form id="distriSave" name="distriSave" action="${base}/distri/saveDistri.do" method="post" >
			
	<div class="edit set">
		<h2 title="注册信息">注册信息</h2>

		<p>
			<label><samp>*</samp>配送商名称：</label><input type="text" id="distriName" name="distriName" class="text state" maxlength="20" value="" reg1="^[0-9a-zA-Z\u4e00-\u9fa5()\s]{1,20}$" desc="只允许输入1-20个字符，且只能为数字、英文、汉字、英文括号和空格" />
			<span id="spanDistriName"></span>
		</p>
		
		<p>
			<label>配送商曾用名：</label><input type="text" id="FKA" name="FKA" class="text state" maxlength="20" value="" reg1="^[0-9a-zA-Z\u4e00-\u9fa5()\s]{0,20}$" desc="只允许输入0-20个字符，且只能为数字、英文、汉字、英文括号和空格"/>
			<span id="spanFka"></span>
		</p>

		<p>
			<label>法人代表：</label><input type="text" id="legalRep" name="legalRep" class="text state" maxlength="20" value="" reg1="^[a-zA-Z\u4e00-\u9fa5\s0-9]{0,20}$" desc="只允许输入0-20个字符，且只能为英文、汉字和数字"/>
			<span id="spanLegalRep"></span>
		</p>
		
		<p>
			<label>注册资本：</label><input type="text" id="regCap" name="regCap" class="text state" maxlength="20" value="" reg1="^[0-9\u4e00-\u9fa5]{0,20}$" desc="只允许输入0-20个字符，且只能为数字和汉字"/>
			<span id="spanRegCapital"><span class="gray">格式：只允许输入中文或者数字，且不能超过20个字符</span></span>
		</p>
		
		<p>
			<label>企业类型：</label><select id="corpType" name="corpType">
				<option value="1" selected>国有企业</option>
				<option value="2">集体企业</option>
				<option value="3">私营企业</option>
				<option value="4">联营企业</option>
				<option value="5">有限责任公司</option>
				<option value="6">股份有限公司</option>
				<option value="7">股份合作企业</option>
				<option value="8">其他企业</option>
                <option value="9">港、澳、台商投资企业</option>
				<option value="10">外商投资企业</option>
			</select>
			<span id="spanCorpType"></span>
		</p>
		
		<p>
			<label class="alg_t"><samp>*</samp>经营范围：</label><textarea id="bizScope" name="bizScope" rows="6" cols="50" class="are arew" maxlength="200" reg1="^.{1,200}$" desc="只允许输入1-200个字符"></textarea>
		</p>
		<p>
			<label class="alg_t"></label>
			<span id="spanBizScope"></span>
		<p>
		
		<p>
			<label>营业执照号：</label>
			<input type="text" id="licenseNo" name="licenseNo" class="text state" maxlength="30" value="" reg1="^\d{0,30}$" desc='只允许输入0-30个数字'/>
			<span id="spanLicenseNo"></span>
		</p>
		
		<p>
			<label>创立日期：</label>
			<input type="text" id="establishDate" name="establishDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="text20 date" value=""/>
			<span id="spanEstablishDate"></span>
		</p>
	</div>
	
	<div class="loc">&nbsp;</div>
	
	<div class="edit set">
		<h2 title="联系方式">联系方式</h2>
		
		<p>
			<label><samp>*</samp>联系人：</label><input type="text" id="contact" name="contact" class="text state" maxlength="20" value="" reg1="^[a-zA-Z\u4e00-\u9fa5\s0-9]{1,20}$" desc="只允许输入1-20个字符，且只能为英语、汉字和数字"/>
			<span id="spanContact"></span>
		</p>
		
		<p>
			<label>移动电话：</label><input type="text" id="mobile" name="mobile" class="text state" value="" reg1="^\d{11}$" desc="移动电话为11位数字，并且需要输入正确的格式！"/>
			<span id="spanMobile"></span>
		</p>
		
		<p>
			<label><samp>*</samp>固定电话：</label><input type="text" id="fixedPhone" name="fixedPhone" class="text state" maxlength="15" value="" reg1="^[\d\-]{0,15}$" desc='只允许输入1-15个数字或"-"'/>
			<span id="spanFixedPhone"><span class="gray">格式：xxx-xxxxxxxx</span></span>
		</p>
		
		<p>
			<label>传真：</label><input type="text" id="fax" name="fax" class="text state" maxlength="15" value="" reg1="^[\d\-]{0,15}$" desc='只允许输入1-15个数字或"-"' />
			<span id="spanFax"><span class="gray">格式：xxx-xxxxxxxx</span></span>
		</p>
		
		<p>
			<label>Email：</label><input type="text" id="email" name="email"  class="text state" maxlength="50" value="" reg1="^(|(\w)+(\.\w+)*@(\w)+((\.\w+)+))$" desc="email不能大于50个字符，并且需要输入正确的格式！"/>
			<span id="spanEmail"></span>
		</p>
		
		<p>
			<label>网址：</label><input type="text" id="webSite" name="webSite"  class="text state" maxlength="50" value="" reg1="^[^\u4e00-\u9fa5]{0,50}" desc="只允许输入0-50个非汉字字符"/>
			<span id="spanWebSite"></span>
		</p>
		
		<p>
			<label class="alg_t"><samp>*</samp>地址：</label><input type="text" id="address" name="address"  class="text state" maxlength="50" value="" reg1="^[a-zA-Z\u4e00-\u9fa5\s0-9]{1,50}" desc="只允许输入1-50个字符，且只能为英语、汉字和数字"/>
			<span id="spanAddress"></span>
		</p>
		
		<p>
			<label>邮编：</label><input type="text" id="zip" name="zip"  class="text state" value="" reg1="^(|\d{6})$" desc="邮政编码只能为6位数字！"/>
			<span id="spanZip"></span>
		</p>
	</div>

	<div class="loc">&nbsp;</div>
	
	<div class="edit set">
		<h2 title="账户信息">账户信息</h2>
		
		<p>
			<label><samp>*</samp>开户行：</label><input type="text" id="bankName" name="bankName" class="text state" maxlength="20" value="" reg1="^[a-zA-Z\u4e00-\u9fa5\s0-9]{1,20}$" desc="只允许输入1-50个字符，且只能为英语、汉字和数字"/>
			<span id="spanBankName"></span>
		</p>
		
		<p>
			<label><samp>*</samp>开户行行号：</label><input type="text" id="bankNo" name="bankNo" class="text state" value="" reg1="^\d{12}$" desc='只允许输入12个数字字符'/>
			<span id="spanBankNo"></span>
		</p>
		
		<p>
			<label><samp>*</samp>银行账号：</label><input type="text" id="bankAccount" name="bankAccount" class="text state" maxlength="30" value="" reg1="^\d{1,30}$" desc='只允许输入1-30个数字字符' />
			<span id="spanBankAccount"></span>
		</p>
		
		<p>
			<label>纳税号：</label><input type="text" id="taxNo" name="taxNo" class="text state" value="" maxlength="15" reg1="^[0-9xlXL]{0,15}$" desc="纳税号为15个字符，并且需要输入正确的格式！"/>
			<span id="spanTaxNo"></span>
		</p>
	</div>

	<div class="loc">&nbsp;</div>
	
	<div class="edit set">
		<h2 title="服务信息">服务信息</h2>
	    <p>
			<label class="alg_t"><samp>*</samp>配送区域：</label><textarea type="text" id="distriArea" name="distriArea"  rows="6" cols="50" class="are arew" reg1="^.{1,200}$" desc="只允许输入1-200个字符"></textarea>
		</p>
		<p>
			<label class="alg_t"></label>
			<span id="spanDistriArea"></span>
		</p>
        <p>
			<label class="alg_t"><samp>*</samp>不配送货品：</label><textarea type="text" id="notDelivery" name="notDelivery" rows="6" cols="50" class="are arew" reg1="^.{1,200}$" desc="只允许输入1-200个字符"></textarea>
		</p>
		<p>
			<label class="alg_t"></label>
			<span id="spanNotDelivery"></span>
		</p>
        <p>
			<label class="alg_t"><samp>*</samp>资费标准：</label><textarea type="text" id="chargeStd" name="chargeStd" rows="6" cols="50" class="are arew" reg1="^.{1,200}$" desc="只允许输入1-200个字符"></textarea>
		</p>
		<p>
			<label class="alg_t"></label>
			<span id="spanChargeStd"></span>
		</p>
        <p>
			<label class="alg_t">特色服务：</label><textarea type="text" id="featuredSvr" name="featuredSvr"  rows="6" cols="50" class="are arew" reg1="^.{0,200}$" desc="只允许输入0-200个字符"></textarea>
		</p>
		<p>
			<label class="alg_t"></label>
			<span id="spanFeaturedSvr"></span>
		</p>
        <p>
			<label><samp>*</samp>配送站点数：</label><input type="text" id="branchNum" name="branchNum" class="text state" maxlength="20" value="" reg1="^[\d]{1,10}$" desc="只允许输入1-10个数字字符"/>
			<span id="spanBranchNum"></span>
		</p>
        <p>
			<label><samp>*</samp>配送人员数量：</label><input type="text" id="employeeNum" name="employeeNum" class="text state" maxlength="20" value="" reg1="^[\d]{1,10}$" desc="只允许输入1-10个数字字符" />
			<span id="spanEmployeeNum"></span>
		</p>
	</div>

	<div class="loc">&nbsp;</div>

    <div class="edit set">
		<h2 title="文件上传">文件上传</h2>
        <p id="attachmentUploadDiv" style="display:none"><label></label><b id="attachmentUploadLbl"></b></p>
        <p><label></label><input type='file' size='27' id='attachmentFile' name='attachmentFile' class="file" contenteditable="false" /><span class="pos">文件上传支持doc、pdf、rar、zip格式文件</span>
        <input type='hidden' id='attachmentUploadAction' name='attachmentUploadAction' value='${base}/uploads/upload_attach.do' />
        <input type='hidden' id='attachmentDeleteAction' name='attachmentDeleteAction' value='${base}/uploads/upload_delete.do' />
        <input type='hidden' id='attachment' name='attachment' value='' />
        <p><label></label><input type="button" value="上传" onclick="submitUpload('attachment')" class="hand btn83x23" /><input type="button" value="删除" onclick="deleteUpload('attachment')" class="hand btn83x23b" /></p>
        </p>
	</div>
	<div class="loc">&nbsp;</div>
	<!--  deleted by Fengxq 20121029
	
        <div class="edit set">
		<h2 title="登录账号">登录账号</h2>
		<p>
            <label>用户名：</label><input type="text" id="userName" name="userName" class="text state" value="" onblur="checkUser();"/>
        </p>
    </div>
	-->
	<div class="edit set">
		<p>
			<label for="button">&nbsp;</label><input type="button" value="确定" onclick="saveDistri()" class="hand btn102x26" />
			<input type="button" value="取消" onclick="backToBackList()" class="hand btn102x26b" />
		</p>
	</div>

    </form>

</div></div>
</body> 