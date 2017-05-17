<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑网银_<c:out value="${paymentOrg.poName}"></c:out>支持网银列表_支付机构管理_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
	function checkFileType(type) {
		var allowFileTypes = new Array(/^\.(g|G)(i|I)(f|F)$/,/^\.(p|P)(n|N)(g|G)$/,/^\.(j|J)(p|P)(g|G)$/);
		for(var i=0;i<allowFileTypes.length;i++) {
			if (allowFileTypes[i].test(type)) {
				return true;
			}
		}
		return false;
	}
	function submitUpload(componentName) {
		var path=$('#olbankLogoFile').val();
		if(path==""){
			return;
		}
		var point=path.lastIndexOf(".");
		var type=path.substr(point);
		if (!checkFileType(type)) {
			alert("只允许上传格式为gif、png、jpg的图片");
			return;
		}
		var options = {
			success:showUploadResponse,
			type:'post',
			dataType:"script",
			data:{
				'fileObjName':"olbankLogo"
			},
			url:$("#uploadAction").val()
		};
		$('#form1').ajaxSubmit(options);
	}
	function showUploadResponse(responseText, statusText, xhr, $form) {
		responseText = $.parseJSON(responseText);
		var filePath = responseText[0].filePath;
		var relativePath = responseText[0].relativePath;
		$('#olbankLogo').attr("value", relativePath);
		$('#olbankLogoImg').attr("src", filePath+"?t="+(new Date()).getTime());
	}
	function changeOlbankDescType(){
		var olbankDescType = $("#olbankDescType").val();
		if(olbankDescType==1){
			$("#olbankDescP").show();
			$("#olbankDescUrlP").hide();
		}else if(olbankDescType==2){
			$("#olbankDescP").show();
			$("#olbankDescUrlP").show();
		}else{
			$("#olbankDescP").hide();
			$("#olbankDescUrlP").hide();
		}
	}
	function validOlbankName(){
		var duplicate = true;
		var olbankName = $("#olbankName").val();
		var olbankId = $("#olbankId").val();
		var poId = $("#poId").val();
		$.ajax({
			url:"validOlbankName.do",
			async:false,
			data:{
				olbankName:encodeURI(olbankName),
				olbankId:olbankId,
				poId:poId
			},
			dataType:"text",
			success:function(data){
				if(data!=null&data=="duplicate"){
					duplicate = false;
				}
			}
		});
		return duplicate;
	}
	function validPoName(){
		var induplicate = true;
		var poName = $("#poName").val();
		$.ajax({
			url:"validPoName.do",
			async:false,
			data:{
				olbankName:encodeURI(poName)
			},
			dataType:"text",
			success:function(data){
				if(data!=null&data=="duplicate"){
					induplicate = false;
				}
			}
		});
		return induplicate;
	}
	function check(){
		var flag=true;
		$("input[reg]:visible").each(function(index){
			var reg = new RegExp($(this).attr("reg"));
			if(!reg.test($(this).val())){
				$(this).next("span").text($(this).attr("err"));
				$(this).focus();
				flag=false;
			}else{
				$(this).next("span").empty();
			}
		});
		if($("#olbankName").val()==""){
			$("#olbankName").next("span").text("请输入网银名称！");
			$("#olbankName").focus();
			flag=false;
		}else if(!validOlbankName()){
			$("#olbankName").next("span").text("此支付机构已存在该网银！");
			$("#olbankName").focus();
			flag=false;
		}
		if($("#olbankLogo").val()==""){
			$("#olbankLogo").next("span").text("请上传网银logo！");
			flag=false;
		}
		return flag;
	}
	function submitForm(){
		if(!check()){
			return;
		}
		var olbankDescType = $("#olbankDescType").val();
		if(olbankDescType == 1){
			$("#olbankDescUrl").val("");
		}else if(olbankDescType == 2){
			// 无操作
		}else{
			$("#olbankDesc").val("");
			$("#olbankDescUrl").val("");
		}
		//$("#form1").submit();
		document.getElementById("form1").submit();
	}
	$(function(){
		$("input[reg]").focus(function(){
			if($(this).next("span").text()==""){
				$(this).next("span").text($(this).attr("desc"));
			}
		});
		$("input[reg]").blur(function(){
			var reg = new RegExp($(this).attr("reg"));
			if(!reg.test($(this).val())){
				$(this).next("span").text($(this).attr("err"));
			}else{
				$(this).next("span").empty();
			}
		});
		$("#olbankName").blur(function(){
			if($(this).val()==""){
				$(this).next("span").text("请输入网银名称！");
			}
		});
		changeOlbankDescType();
	});
</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<a href="<c:url value='/${system}/payment/listPaymentOrg.do'/>">支付机构管理</a>&nbsp;&raquo;&nbsp;<a href="<c:url value='/${system}/payment/listPayOlbank.do?poId=${paymentOrg.poId}'/>"><c:out value="${paymentOrg.poName}"></c:out>支持网银列表</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑网银</span>
	    <a href="<c:url value="/${system }/payment/listPayOlbank.do?poId=${paymentOrg.poId}"/>" title="返回实体商品" class="inb btn80x20">返回网银列表</a>
	    </div>
	    
	    
		<form id="form1" name="form1" action="${base}/payment/updatePayOlbank.do" method="post">
			<div id="tab_1" class="edit set">
				<input type="hidden" id="poId" name="poId" value="${paymentOrg.poId}"/>
				<input type="hidden" id="olbankId" name="olbankId" value="${payOlbank.olbankId}"/>
				<input type="hidden" id="isShow" name="isShow" value="${payOlbank.isShow}"/>
				<p><label>所属机构：</label><c:out value="${paymentOrg.poName}"></c:out>
				</p>
				<p><label><samp>*</samp>网银代码：</label><input type="text" id="olbankCode" name="olbankCode" value="${payOlbank.olbankCode}" class="text state" reg="^.+$" desc="网银代码不能为空！" err="网银代码不能为空！"/>
				<span></span>
				</p>
				<p><label><samp>*</samp>网银名称：</label><input type="text" id="olbankName" name="olbankName" value="${payOlbank.olbankName}" class="text state" reg="^[a-zA-Z\u4e00-\u9fa5]{0,16}$" desc="请输入16位内的中英文" err="请输入16位内的中英文！"/>
				<span></span>
				</p>
				<p><label class="alg_t"><samp>*</samp>工具logo：</label><img id="olbankLogoImg" src="${rsImgUrlInternal}/${payOlbank.olbankLogo}" onerror="this.src='${path}/res/imgs/deflaut.jpg'" height="42" width="151" />
				</p>
				<p><label></label><input type="file" id="olbankLogoFile" name="olbankLogoFile" class="file" onchange='submitUpload()' />
				<input type='hidden' id='olbankLogo' name='olbankLogo' value="${payOlbank.olbankLogo}"/>
				<span class="orange">请上传jpg、png、gif格式的图片。</span>
				<input type='hidden' id='uploadAction' value='${base}/uploads/upload_pic.do' />
				</p>
				<p><label>支付说明：</label><select id="olbankDescType" name="olbankDescType" class="select" onchange="changeOlbankDescType()">
					<c:choose>
						<c:when test="${payOlbank.olbankDescType==1}">
							<option value="">请选择说明类型</option>
							<option value="1" selected="selected">文字</option>
							<option value="2">链接</option>
						</c:when>
						<c:when test="${payOlbank.olbankDescType==2}">
							<option value="">请选择说明类型</option>
							<option value="1">文字</option>
							<option value="2" selected="selected">链接</option>
						</c:when>
						<c:otherwise>
							<option value="" selected="selected">请选择说明类型</option>
							<option value="1">文字</option>
							<option value="2">链接</option>
						</c:otherwise>
					</c:choose>
				</select>
				</p>
				<p id="olbankDescP" style="display: none"><label>说明文字：</label><input type="text" id="olbankDesc" name="olbankDesc" value="${payOlbank.olbankDesc}" class="text state" reg="^.{0,12}$" desc="请输入12位内的中英文、数字和符号" err="请输入12位内的中英文、数字和符号！"/>
				<span></span>
				</p>
				<p id="olbankDescUrlP" style="display: none"><label>链接地址：</label><input type="text" id="olbankDescUrl" name="olbankDescUrl" value="${payOlbank.olbankDescUrl}" class="text state" reg="^(http:\/\/).{0,245}$" desc="请以http://开头，250个字符以内" err="请以http://开头，250个字符以内！"/>
				<span></span>
				</p>
				<p><label>&nbsp;</label><input id="button1"
					type="button" value="提 交" class="hand btn83x23" onclick="submitForm()"/>&nbsp;&nbsp; <input
					type="button" onclick="javascript:history.back();" value="取消" class="hand btn83x23b" /></p>
			</div>
		</form>
	</div></div>
</body>