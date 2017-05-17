<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付方式_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
function cancel(){
	//window.location.href="/ecps-console/ecps/console/payment/listpaymentway.do";
	window.history.back();
}
var validsen = new Array();
$(function(){

	
	$("input[type='text'],textarea").change(function(){
		var obj = $(this);
		var idName = $(this).attr('id');
		var name = "";
		if(idName == "pwText"){
			name = "文字内容";
		} else if (idName == "pwMemo"){
			name = "备注";
		}else {
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
	
	$("#pwUrl").focus(function(){
		if($(this).next("span").text()==""){
			$(this).next("span").text($(this).attr("desc"));
		}
	});
	$("#pwUrl").blur(function(){
		var reg = new RegExp($(this).attr("reg"));
		if(!reg.test($(this).val())){
			$(this).next("span").text($(this).attr("err"));
		}else{
			$(this).next("span").empty();
		}
	}); 
});
function showTip(txt){
	$('#tipText').html(txt);
	tipShow('#tipDiv');
}
	function check() {
		var flag = true;
		var reg = new RegExp($("#pwUrl").attr("reg"));
		if ($("#pwUrl").val()!="" && !reg.test($("#pwUrl").val())) {
			$("#pwUrl").next("span").text($("#pwUrl").attr("err"));
			$("#pwUrl").focus();
			flag = false;
		} else if($("#pwUrl").val()==""){
			$("#pwUrl").next("span").empty();
		}
		var info = "";
		for(var i = 0;i < validsen.length; i++){
	        info += (validsen[i]+"<br/>");
		}
		if(info != ""){
			showTip(info);
			flag=false;
		}
		return flag;
	};

	//提交前验证
	function forsubmitvaluate() {
		var t = /^.{0,10}$/;
		var txt = $.trim($('#pwText').val());
		var url = $.trim($('#pwUrl').val());
		if (txt.length > 10) {
			return;
		}
		if (!t.test(txt)) {
			return;
		}
		if (txt != "" && txt.length != 0) {
			if (url == "" || url.length == 0) {
				$('#uv').addClass("err").html("请为帮助文字填写url地址！");
				return;
			} 
		}
		if (url != "" && url.length != 0) {
			if (txt == "" || txt.length == 0) {
				$('#uv1').addClass("err").html("请为帮助链接输入文字内容！");
				return;
			}
		}
		
		 if (!check()) {
			return;
		} 
		$("#myForm").action = "${base}/payment/updatepaymentway.do";
		//$("#myForm").submit();
		document.getElementById("myForm").submit();
	};

	 function hid(opt){
	 	$('#'+opt).html('');
	 }
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/paymentmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
	
    <div class="loc icon"><samp class="t12"></samp>支付管理&nbsp;&raquo;&nbsp;支付方式管理&nbsp;&raquo;&nbsp;<span class="gray" title="支付方式列表">支付方式编辑</span></div>
	
     <form name="myForm" id="myForm" action="${base}/payment/updatepaymentway.do" method="post">   
     	<ul class="uls edit set">
            <li>
            	<label class="alg_t">备注:</label><textarea id="pwMemo" name="pwMemo" rows="4" cols="21" class="are">${pw.pwMemo}</textarea>
            </li>
			<li><label>帮助链接:</label><div class="pre">
			<div class="sch" style="margin:0">
			<p>文字内容:<input type="text" name="pwText" id="pwText" class="text state" value="${pw.pwText}" reg="^.{0,10}$" tip="必须是10位内的中英文或字符" onfocus="hid('uv1')"/><span id="uv1"></span></p>
			<p>&nbsp;URL地址:<input type="text" name="pwUrl" id="pwUrl" class="text state" value="${pw.pwUrl}"   reg="^(http:\/\/).{0,245}$" desc="请以http://开头，250个字符以内" err="请以http://开头，250个字符以内！"/><span id="uv"></span></p>
			</div>
			</div>
			</li>
            <li>
            	<label>&nbsp;</label><input type="button" class="hand btn83x23" value="提交" onclick="forsubmitvaluate();" />
            	<input type="button" class="hand btn83x23b" value="取消" onclick="cancel();" />
            </li>
        </ul>
        <input type="hidden" name="pwId" value="${pw.pwId}"/>
     </form>
</div></div>       
</body>