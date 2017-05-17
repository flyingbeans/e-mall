<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加属性_属性管理_类目管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#inputType").change(function(){
		var value=$("#inputType").val();
		if(value==4){
			$("#a1").hide();
		}else{
			$("#a1").show();
		}
		if(value==2){
			$("#g1").removeAttr("disabled");
			$("#g1").attr("checked","checked");
			$("#g2").removeAttr("disabled");
			$("#t1").attr("disabled","disabled");
			$("#t2").removeAttr("disabled");
			$("#t2").attr("checked","checked");
		}
		if(value==1){
			$("#g1").removeAttr("checked");
			$("#g1").attr("disabled","disabled");
			$("#g2").removeAttr("disabled");
			$("#g2").attr("checked","checked");
			$("#t1").removeAttr("disabled");
			$("#t1").attr("checked","checked");
			$("#t2").removeAttr("disabled");
		}
		if(value==3 || value==4){
			$("#t1").removeAttr("checked");
			$("#t1").attr("disabled","disabled");
			$("#g1").removeAttr("checked");
			$("#g1").attr("disabled","disabled");
			$("#t2").removeAttr("disabled");
			$("#t2").attr("checked","checked");
			$("#g2").removeAttr("disabled");
			$("#g2").attr("checked","checked");
		}
	});
	
	$("#g1").click(function(){
		var value = $("#inputType").val();
		if(value == 3 || value == 4 || value == 1){
			return false;
		}else{
			$("#t1").attr("disabled",true);
			$("#t2").attr("checked",true);
		}
		return true;
	});
	$("#g2").click(function(){
		var value = $("#inputType").val();
		if(value == 3 || value == 4 || value == 1){
			return false;
		}else{
			$("#g1").removeAttr("disabled");
			$("#g2").removeAttr("disabled");
			$("#t1").removeAttr("disabled");
			$("#t2").removeAttr("disabled");
		}
		return true;
	});
	
	$("#form111").submit(function(){
		var obj=$("#selectValues");
		var feature=$("#featureName");
		var featurename=feature.val();
		var inputType=$("#inputType").val();//判断是那种类型
		var selectValues=obj.val();//判断是那种类型
		//可选择如果有中文逗号，转换成英文逗号
		selectValues = selectValues.replace(/，/ig,',');
		document.getElementById("selectValues").value = selectValues;
		var nameReg = new RegExp("^[a-zA-Z0-9\u4e00-\u9fa5]{1,25}$");
		if($.trim(featurename).length==0||$.trim(featurename).length>25 || !nameReg.test(featurename)){
			feature.siblings("span").addClass("err").html("必须是中英文或数字字符，长度1-25");
			return false;
		}
		var sort = $("#featureSort");
		var featureSort = sort.val();
		var sortReg = new RegExp("^[1-9][0-9]{0,2}$");
		if($.trim(featureSort).length==0|| !sortReg.test(featureSort)){
			sort.siblings("span").addClass("err").html("必须是1-999正整数");
			return false;
		}
		if(inputType!=4){
			var values=selectValues.split(",");
			if($.trim(values).length==0){
				obj.siblings("span").addClass("err").html("可选值不能为空，单个选项长度1-20");
				return false;
			}else{
				obj.siblings("span").addClass("err").html("");
			}
			
			var reg = new RegExp("^(.{1,20})$");
			if(values.length>99){
				obj.siblings("span").addClass("err").html("单选项个数最大不能大于100个");
				return false;
			}
			var errNum = 0;
			var errValue = "";
			for(var a=0;a<values.length;a++){
				if($.trim(values[a]).length==0){
					obj.siblings("span").addClass("err").html("单选项中两个英文逗号之间不能有空格");
					return false;
				}
				if(!reg.test(values[a])){
					errNum += 1;
					errValue = values[a];
					//obj.siblings("span").addClass("err").html("可选值中存在超出限制的字符数");
					//return false;
				}		
			}
			if(errNum == 1){
				obj.siblings("span").addClass("err").html("单选项中"+errValue+"长度超出限制");
				return false;
			}else if(errNum > 1){
				obj.siblings("span").addClass("err").html("可选值中存在超出限制的字符数");
				return false;
			}
			
		}
		return true;
	});
	
	
});

function backList(url){
	document.location=url;
}
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system }/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<c:url value="/${system }/item/feature/listFeature.do" var="backurl">
		<c:param name="catId" value="${catId }"/>
	</c:url>

    <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/cat/listCat.do?catType=1"/>">类目管理</a>&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/feature/listFeature.do?catId=${catId }"/>">属性管理</a>&nbsp;&raquo;&nbsp;<span class="gray">添加属性</span><a href="<c:url value="/${system }/item/feature/listFeature.do?catId=${catId }"/>" class="inb btn120x20">返回属性管理</a></div>

	<form id="form111" name="form111" action="${path}/item/feature/addFeature.do" method="post">
		<div class="edit set">
            <p><label><samp>*</samp>属性名称：</label><input type="text" id="featureName" name="featureName" class="text state" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,25}$" tip="必须是中英文或数字字符，长度1-25"/>
				<span><c:out value="${featureName}"/></span>
            </p>
            <p><label class="alg_t">属性类型：</label><select id="inputType" name="inputType" class="select">
 					<option value="1">下拉列表</option>
 					<option value="2">单选</option>
 					<option value="3">复选</option>
 					<option value="4">文本</option>
 				</select>           	
            </p>
            <p id="a1">
            	<label><samp>*</samp>可选值：</label><input type="text" id="selectValues" name="selectValues" class="text state" value="" reg="^[\\S\u4e00-\u9fa5]+$" tip="可选值不能为空，单个选项长度1-20" size="40" />
            	<span></span>
            </p>
            <p><label><samp>*</samp>排序：</label><input type="text" id="featureSort" name="featureSort" class="text small" value="1" size="3" maxlength="3" reg="^[1-9][0-9]{0,2}$" tip="必须是1-999正整数"/>
            	<span></span>
            </p>
            <p><label>规格属性：</label><input id="g1" type="radio" name="isSpec" value="1" disabled="disabled"/>是&nbsp;&nbsp;
            	<input id="g2" type="radio" name="isSpec" value="0" checked="checked" />否
            </p>
            <p><label>筛选条件：</label><input id="t1" type="radio" name="isSelect" value="1" checked="checked"/>是&nbsp;&nbsp;
            	<input id="t2" type="radio" name="isSelect" value="0" />否
            </p>
            <p><label>是否显示：</label><input type="radio" name="isShow" value="1" checked="checked"/>是&nbsp;&nbsp;
            	<input type="radio" name="isShow" value="0" />否
            </p>
            <p><label>&nbsp;</label><input type="submit" class="hand btn83x23" value="保存" /><input type="button" class="hand btn83x23b" id="reset1" value='取消' onclick="backList('${backurl}')"/>
            <input type="hidden" name="catId" value="${catId }"/>
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>

