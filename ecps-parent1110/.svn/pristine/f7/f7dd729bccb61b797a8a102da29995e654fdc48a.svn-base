<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑品牌_号卡品牌管理_号卡管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>

<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>

<script type="text/javascript">
function backList(url) {
	document.location = url;
}

$(document).ready(function() {
	$("#form111").submit(function(){
		var isSubmit = check();
		/* $(this).find("[reg],[url],[reg1]").each(function(){
			if(typeof($(this).attr("reg")) != "undefined" || typeof($(this).attr("reg1")) != "undefined"){
				if($(this).attr("name") != "website"){
					if(!clientValidate($(this))){
						isSubmit = false;
					}
				}else{
					if($.trim($(this).val()) != ""){
						if(!clientValidate1($(this))){
							isSubmit = false;
						}
					}
				}

			}
			
		}); */
		if(isSubmit == false) {
			return false;
		}
		/* var sortValue=$("#brandSort").val();
		if(sortValue!=""){
			isSubmit=checkNumber(sortValue);
		}
		if(isSubmit&&$("#brandName").val()!="${brand.brandName}"){
			var rename=true;
			$.ajax({
		         type:"POST",
		         async: false,
		         url:"${path }/item/brand/validJSONName.do",
		         data:"brandName="+$("#brandName").val(),
		         success:function(data){
		             if(data == "false"){
		             	rename=false;
		             }
		        }  
			});
			if(!rename){
				alert("品牌名称重复");
				return false;
			}
		} */
		return isSubmit;
	});
	
	$("input[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
		}else{
			a.next("span").empty();
		}
	});
	
	$("textarea[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
		}else{
			a.next("span").empty();
		}
	});
	
});

function check(){
	var isOk = true;
	$("input[reg1]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
			isOk = false;
		}
	});
	$("textarea[reg1]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
			isOk = false;
		}
	});
	return isOk;
}
</script>

</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system }/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<c:url value="/${system }/simcard/listSimCardBrand.do" var="backurl"/>
	
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：号卡管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/simcard/listSimCardBrand.do"/>" title="品牌管理">品牌管理</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑品牌</span>

    </div>
    <form id="form111" name="form111" action="${path}/simcard/updateSimCardBrand.do" method="post" enctype="multipart/form-data">
		<div class="edit set">
			<p><label>品牌编号：</label><span><c:out value="${brand.brandNo}"/>&nbsp;</span>
				<input type="hidden" name="brandNo" value="${brand.brandNo}"/>
			</p>
			<p><label>品牌名称：</label><span><c:out value="${brand.brandName}"/>&nbsp;</span>
				<input type="hidden" name="brandName" value="${brand.brandName}"/>
			</p>
			<p><label class="alg_t">品牌描述：</label><textarea rows="4" cols="45" name="brandDesc" class="are" reg1="^(.|\n){0,160}$" desc="最多只允许160个中英文字符、数字或符号!" errorspan="brandDescStyle">${brand.brandDesc}</textarea><span id="brandDescStyle" class="pos"></span>
				<span class="pos">&nbsp;</span>
			</p>
			<p><label class="alg_t">入网协议：</label><textarea rows="10" cols="60" name="brandAgreement" class="are" reg1="^(.|\n){0,2000}$" desc="字符个数不能超过2000!" errorspan="agreementStyle">${brand.brandAgreement}</textarea><span id="agreementStyle" class="pos"></span>
				<span class="pos">&nbsp;</span>
			</p>
			<p><label>&nbsp;</label><input type="submit" class="hand btn83x23" value="提交" /><input type="button" class="hand btn83x23b" id="reset1" value='<fmt:message key="button.cancel"/>' onclick="backList('${backurl}')"/>
				<input type="hidden" name="brandId" value="${brand.brandId}"/>
			</p>
		</div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>

