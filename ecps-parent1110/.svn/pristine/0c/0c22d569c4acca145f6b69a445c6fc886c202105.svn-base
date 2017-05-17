<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>新增支付机构_支付机构管理_支付管理</title>
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
	function submitUpload() {
		var path=$('#poLogoFile').val();
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
				'fileObjName':"poLogo"
			},
			url:$("#uploadAction").val()
		};
		$('#form1').ajaxSubmit(options);
	}
	function showUploadResponse(responseText, statusText, xhr, $form) {
		responseText = $.parseJSON(responseText);
		var filePath = responseText[0].filePath;
		var relativePath = responseText[0].relativePath;
		$('#poLogo').attr("value", relativePath);
		$('#poLogoImg').attr("src", filePath+"?t="+(new Date()).getTime());
	}
	function changePoDescType(){
		var poDescType = $("#poDescType").val();
		if(poDescType==1){
			$("#poDescP").show();
			$("#poDescUrlP").hide();
		}else if(poDescType==2){
			$("#poDescP").show();
			$("#poDescUrlP").show();
		}else{
			$("#poDescP").hide();
			$("#poDescUrlP").hide();
		}
	}
	function enableListPayOlbank(url){
		$("#listPayOlbankA").attr("class","");
		$("#listPayOlbankA").attr("href",url);
	}
	function disableListPayOlbank(){
		$("#listPayOlbankA").attr("class","gray");
		$("#listPayOlbankA").attr("href","###");
	}
	function validPoName(){
		var induplicate = true;
		var poName = $("#poName").val();
		$.ajax({
			url:"validPoName.do",
			async:false,
			data:{
				poName:encodeURI(poName)
			},
			dataType:"text",
			success:function(data){
				if(data!=null && data=="duplicate"){
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
		if($("#poName").val()==""){
			$("#poName").next("span").text("请输入支付机构名称！");
			$("#poName").focus();
			flag=false;
		}else if(!validPoName()){
			$("#poName").next("span").text("该支付机构已存在！");
			$("#poName").focus();
			flag=false;
		}
		if($("#poLogo").val()==""){
			$("#poLogo").next("span").text("请上传工具logo！");
			flag=false;
		}
		return flag;
	}
	function submitForm(){
		 if(!check()){
			return;
		}
		var info = "";
		for(var i = 0;i < validsen.length; i++){
	        info += (validsen[i]+"<br/>");
		}
		if(info != ""){
			showTip(info);
			return false;
		}
		var poDescType = $("#poDescType").val();
		if(poDescType == 1){
			$("#poDescUrl").val("");
		}else if(poDescType == 2){
			// 无操作
		}else{
			$("#poDesc").val("");
			$("#poDescUrl").val("");
		}
	   //jQuery("#form1").submit();
	    document.getElementById("form1").submit();
	}
	var validsen = new Array();
	function showTip(txt){
		$('#tipText').html(txt);
		tipShow('#tipDiv');
	}
	$(function(){
		$("input[type='text'],textarea").change(function(){
			var obj = $(this);
			var name = $(this).prev().html();
			name = name.replace("<samp>*</samp>", "").replace(":", "");
			name = name.replace("<SAMP>*</SAMP>", "");
			
			if((name != "机构名称")&&(name != "说明文字")){
    			return ;
    		}
			$.ajax({
	             type:"POST",
	             async: false,
	             url:"${path }/item/validSen1.do",
	             dataType:'json',
	             data:{
	            	 content:obj.val()
	             },
	             complete:function(data){
	            	 var a = eval("("+data.responseText+")");
	            	if((a[0].senkey != null )&&(a[0].senkey != "" )){
	            		showTip("'"+name+"'不能含有敏感词:"+a[0].senkey);
	            		for(var i = 0;i < validsen.length; i++){
	            			var reg = new RegExp(name);
	            	        if(reg.test(validsen[i])){
	            	        	validsen.splice(i,1);
	            	        	break ;
	            	        }
	            		}
	            		validsen.push("'"+name+"'不能含有敏感词:"+a[0].senkey);
	            	} else {
	            		for(var i = 0;i < validsen.length; i++){
	            			var reg = new RegExp(name);
	            	        if(reg.test(validsen[i])){
	            	        	validsen.splice(i,1);
	            	        	break ;
	            	        }
	            		}
	            	}
	            	
	             	
	             	obj.focus();
	             	return false;
	            }
	        });
		});
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
		$("#poName").blur(function(){
			if($(this).val()==""){
				$(this).next("span").text("请输入支付机构名称！");
			}
		});
	});
</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>:支付管理&nbsp;&raquo;&nbsp;<a href="<c:url value='/${system}/payment/listPaymentOrg.do'/>">支付机构管理</a>&nbsp;&raquo;&nbsp;<span class="gray">新增支付机构</span>
	    </div>
	    
	    
		<form id="form1" name="form1" action="${base}/payment/savePaymentOrg.do" method="post">
			<div class="edit set">
				<p><label><samp>*</samp>机构名称:</label><input type="text" id="poName" name="poName" class="text state" reg="^[a-zA-Z\u4e00-\u9fa5]{0,16}$" desc="请输入16位内的中英文" err="请输入16位内的中英文！"/>
				<span></span>
				</p>
				<p><label><samp>*</samp>商户账号ID:</label><input type="text" id="accountCode" name="accountCode" class="text state" reg="^.+$" desc="商户账号ID不能为空！" err="商户账号ID不能为空！"/><span></span>
				</p>
				<p><label><samp>*</samp>密钥:</label><input type="text" id="accountKey" name="accountKey" class="text state" reg="^.+$" desc="密钥不能为空！" err="密钥不能为空！"/><span></span>
				</p>
				<p><label><samp>*</samp>支持网银支付:</label><input type="radio" name="isOlbank" value="1" class="txt" checked="checked" onclick="enableListPayOlbank('${base}/payment/listPayOlbank.do')">是&nbsp;&nbsp;
				<input type="radio" name="isOlbank" value="0" class="txt" onclick="disableListPayOlbank()">否&nbsp;&nbsp;&nbsp;&nbsp;<a href="${base}/payment/listPayOlbank.do" id="listPayOlbankA">网银列表</a>
				</p>
				<p><label class="alg_t"><samp>*</samp>工具logo:</label><img id="poLogoImg" src="${path}/res/imgs/deflaut.jpg" height="42" width="151" />
				</p>
				<p><label></label><input type="file" id="poLogoFile" name="poLogoFile" class="file" onchange='submitUpload()' />
				<input type='hidden' id='poLogo' name='poLogo'/>
				<span class="orange">请上传jpg、png、gif格式的图片。</span>
				<input type='hidden' id='uploadAction' value='${base}/uploads/upload_pic.do' />
				</p>
				<p><label>支付说明:</label><select id="poDescType" name="poDescType" class="select" onchange="changePoDescType()">
					<option value="">请选择说明类型</option>
					<option value="1">文字</option>
					<option value="2">链接</option>
				</select>
				</p>
				<p id="poDescP" style="display: none"><label>说明文字:</label><input type="text" id="poDesc" name="poDesc" class="text state" reg="^.{0,12}$" desc="请输入12位内的中英文、数字和符号" err="请输入12位内的中英文、数字和符号！"/>
				<span></span>
				</p>
				<p id="poDescUrlP" style="display: none"><label>链接地址:</label><input type="text" id="poDescUrl" name="poDescUrl" class="text state" reg="^(http:\/\/).{0,245}$" desc="请以http://开头，250个字符以内" err="请以http://开头，250个字符以内！"/>
				<span></span>
				</p>
				<p><label>&nbsp;</label><input id="button1" type="button" value="提 交" class="hand btn83x23" onclick="submitForm()"/>&nbsp;&nbsp; <input type="button" onclick="javascript:history.back();" value="取消" class="hand btn83x23b" /></p>
			</div>
		</form>
	</div></div>
</body>