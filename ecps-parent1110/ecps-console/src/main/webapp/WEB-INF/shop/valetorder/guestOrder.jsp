<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>选机中心_代客下单管理</title>
<meta name="heading" content="<fmt:message key='SubscribeMgmtMenu.heading'/>"/>
<meta name="menu" content="relpaceGuestSubmitOrder"/>
<script type="text/javascript" src="<c:url value='/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
</head>
<body id="main">
<script type="text/javascript">

function selBrand(brandId,brandName){
	$('#selBrandId').val(brandId);
	$('#selBrandName').val(brandName);
	search();
}

function selOffer(offerType) {
	if (offerType == '1') {//裸机
		$('#selOfferId').val('');
		$('#locationId').val('1');
	} else {
		$('#locationId').val('');
		$('#selOfferId').val(offerType);
	}
	search();
}

function selectItemName(){
	var queryString = $.trim($('#queryString').val());
	search();
}

function search(){
	var queryString = $.trim($('#queryString').val());
	var selOfferId = $('#selOfferId').val();
	var locationId = $('#locationId').val();
	var selBrandId = $('#selBrandId').val();
	var selPriceRange = $('#selPriceRange').val();
	var publishTime = $('#publishTime').val();
	var catId = $('#catId').val();
	var url="${path}/valetOrder/getFrontPageList.do?selOfferId="+selOfferId+"&selBrandId="+selBrandId+"&selPriceRange="+selPriceRange+"&locationId="+locationId;
	var allFeatureIdsValue = $("#allFeatureIds").val();
	if(allFeatureIdsValue!=null&&allFeatureIdsValue!=""){
		var arr = allFeatureIdsValue.split(",");
		for(var i=0;i<arr.length;i++){
			var selValue = $('#'+arr[i]).val();
			url = url + "&"+arr[i]+"="+encodeURI(encodeURI(selValue));
		}
	}
	url = url + "&allFeatureIdsValue=" + allFeatureIdsValue;
	url = url + "&publishTime=" + publishTime;
	url = url + "&catId=" + catId;
	var abc=document.getElementById('searchFrame').contentWindow;
	var iframeCon = abc.document.getElementById("form1");
	if(queryString=='请输入商品名称关键字')
		queryString='';
	iframeCon.queryString.value = queryString;
  	iframeCon.action = url;
  	iframeCon.submit();
	showSearchCondition();
}

function showSearchCondition(){
	var str = "";
	var selOfferName = $('#selOfferName').val();
	var selBrandName = $('#selBrandName').val();
	var selPriceRange = $('#selPriceRange').val();
	var selAppearance = $('#selAppearance').val();
	var selControl = $('#selControl').val();
	var selSystem = $('#selSystem').val();
	if(selOfferName != null && selOfferName != ''){
		str = str + "|" + selOfferName;
	}
	if(selBrandName != null && selBrandName != ''){
		str = str + "|" + selBrandName;
	}
	if(selPriceRange != null && selPriceRange != ''){
		str = str + "|" + selPriceRange;
	}
	if(selAppearance != null && selAppearance != ''){
		str = str + "|" + selAppearance;
	}
	if(selControl != null && selControl != ''){
		str = str + "|" + selControl;
	}
	if(selSystem != null && selSystem != ''){
		str = str + "|" + selSystem;
	}
	var allFeatureIdsValue = $("#allFeatureIds").val();
	if(allFeatureIdsValue!=null&&allFeatureIdsValue!=""){
		var arr = allFeatureIdsValue.split(",");
		for(var i=0;i<arr.length;i++){
			var selFeatureValue = $('#'+arr[i]).val();
			if(selFeatureValue != null && selFeatureValue != ''){
				str = str + "|" + selFeatureValue;
			}
		}
	}
	str = str.substring(1);
	str = "<samp>&gt;</samp>" + str;
	$("#displayCondition").html(str);
}
function selPriceRange(range){
	$('#selPriceRange').val(range);
	search();
}
function selFeature(featureId,featureName){
	$('#'+featureId.split('_')[0]).val(featureName);
	search();
}

function checkTelephone(teleNumber) {
	var phoneNumber=/^\d{11}$/;
	if (!(phoneNumber.test(teleNumber))) {
		return false;
	} else {
		return true;
	}
}

function searchFeeAndMeter(type){
	
	var phone = $("#searchText").attr("value");
	if (phone == '请输入客户用户名') {
		alert("请输入用户名");
		return;
	}
	if(phone == ''|| !checkTelephone(phone)){
		alert("用户名不合法，只能是手机号");
		return false;
	}
	tipShow("#refundLoadDiv");
	var url = "${path}/valetOrder/qryFeeAndMeter.do?phone="+phone+"&type="+type;
	$.ajax({
	    type:"post",
		dataType: 'json',
		url:url,
		complete:function(data){
			var msg=eval("("+data.responseText+")");
			if (msg[0].result == "error") {
				//alert(msg[0].message);
				var shopUser = msg[0].shopUser;
				var isMobile = msg[0].isMobile;
				var phoneHtml = '';
				if(shopUser == 'yes' && isMobile == 'true'){
					phoneHtml = '<tr><td>' + '该用户是商城移动用户,' + msg[0].message + '</td></tr>';
				}else if(shopUser == 'yes' && isMobile != 'true'){
					phoneHtml = '<tr><td>该用户是商城非移动用户</td></tr>';
				}else if(shopUser != 'yes' && isMobile == 'true'){
					phoneHtml = '<tr><td>没有查询到该商城的移动用户，已经为该手机号创建商城移动用户</td></tr>';
				}else if(shopUser != 'yes' && isMobile != 'true'){
					phoneHtml = '<tr><td>没有查询到该商城的非移动用户，已经为该号创建商城非移动用户</td></tr>';
				}
				$("#almostThreeMonths").show().empty().html(phoneHtml);
				setOrderUrlDis();
				//$("#almostThreeMonths").empty();
			} else {
				var phoneHtml = '';
				phoneHtml += '<tr><th width="10%">近三个月</th><th>'+msg[0].date0+'</th><th>'+msg[0].date1+'</th><th>'+msg[0].date2+'</th></tr>';
				phoneHtml += '<tr><th>话费</th><td>￥'+msg[0].payfee0+'</td><td>￥'+msg[0].payfee1+'</td><td>￥'+msg[0].payfee2+'</td></tr>';
				phoneHtml += '<tr><th>其它话费</th><td>￥'+msg[0].otherpayfee0+'</td><td>￥'+msg[0].otherpayfee1+'</td><td>￥'+msg[0].otherpayfee2+'</td></tr>';
				$("#almostThreeMonths").show().empty().html(phoneHtml);
				/* var shopUser = msg[0].shopUser;
				var isMobile = msg[0].isMobile;
				var phoneHtml
				if(shopUser == 'yes' && isMobile == 'true'){
					phoneHtml = '<tr><td>该用户是商城移动用户</td></tr>';
				}else if(shopUser == 'yes' && isMobile != 'true'){
					phoneHtml = '<tr><td>该用户是商城非移动用户</td></tr>';
				}else if(shopUser != 'yes' && isMobile == 'true'){
					phoneHtml = '<tr><td>没有查询到该商城的移动用户，已经为该手机号创建商城移动用户</td></tr>';
				}else if(shopUser != 'yes' && isMobile != 'true'){
					phoneHtml = '<tr><td>没有查询到该商城的非移动用户，已经为该号创建商城非移动用户</td></tr>';
				} */
				
				// 子页面
				setOrderUrlDis();
			}
			tipHide('#refundLoadDiv');
		}
  	});
}
$(document).ready(function(){
	searchText('#searchText','#phone',11);
	
	$('.filter li a').mousedown(function(){
    	var cln = $(this).attr("class");
		if(cln == undefined){
			$(this).attr("class",'');
			cln = $(this).attr("class");
		};
		if(cln.indexOf("btn80x22") == 0){
			return;
		}
		var type = $(this).parent().is("p");
		var obj;
		if(type){
			obj = $(this).parent().find('a');
		}else{
			obj = $(this).parent().parent().find('a');
		}
		obj.removeClass('here');
		$(this).addClass('here');
    });
	<c:if test="${orderNumPass != null}">
	searchFeeAndMeter(1);
	</c:if>
	
	var user_phone_id = '${sessionScope.user_phone_id}';
	if(user_phone_id != '' && user_phone_id != null){
		$("#searchText").val(user_phone_id);
		searchFeeAndMeter(1);
	}
});

//设置子页面按钮是否可用
function setOrderUrlEnable(){
	// 子页面
	$("#searchFrame").contents().find("span[name=labelOrder]").css("display","block");
	$("#searchFrame").contents().find("a[name=aOrder]").css("display","none");
	$("#searchFrame").contents().find("input[name=queryFlag]").val("1");
}

// 设置子页面按钮是否可用
function setOrderUrlDis(){
	// 子页面
	$("#searchFrame").contents().find("span[name=labelOrder]").css("display","none");
	$("#searchFrame").contents().find("a[name=aOrder]").css("display","block");
	$("#searchFrame").contents().find("input[name=queryFlag]").val("1");
}

function checkhc(skuOfferidVal){
	//用户当前号码营销案与商品营销案是否互斥
	var phone = $("#searchText").attr("value");
	if (phone == '请输入客户用户名') {
		alert("请输入客户用户名");
		return;
	}
	if(phone == ''){
		alert("用户名不能为空!");
		return false;
	}
	var chkUrl = '${base}/order/isExcludeOfferGroup.do?phoneId='+phone;
    $.ajax({
    	url:chkUrl,
    	type:"get",
    	complete:function(data){
			var result=eval("("+data.responseText+")");
     		if(result[0].txt == 'false'){
     			alert('用户当前营销案与商品的营销案存在互斥！');
     		}else{
     			alert('该营销案可以购买！');
     		}
    	}
    });
	
}
//设置左菜单的链接，将phone写入主推机型菜单链接(主推机型与选机中心切换时不需要再输入手机号码)
function setHref(phone){
	if(phone == '' || !checkTelephone(phone)){
		alert("请输入用户名!");
		return false;
	}
	var initHref = $("#chiefRecommdHref").attr("href");
	var phoneCharAt = initHref.indexOf('?');
	if(phoneCharAt>0){
		initHref = initHref.substring(0,phoneCharAt);
	}
	var href = initHref+"?phone="+phone;
	$("#chiefRecommdHref").attr("href",href);
}
$(function(){
	var phone = $("#searchText").val();
	if(phone !="" && phone !=null && phone!="请输入客户用户名"){
		setHref(phone)
		searchFeeAndMeter(1);
		checkhc();
	}
})
</script>
<div class="frameL"><div class="box"><div class="menu icon">
	<jsp:include page="/ecps/console/common/valetordermenu.jsp" />
</div></div></div>

<div class="frameR"><div class="box"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：代客下单管理&nbsp;&raquo;&nbsp;<span class="gray" title="">选机中心</span></div>
	
	<div class="sch">
	<c:choose>
		<c:when test="${orderNumPass == null}">
		<input type="hidden" id="phone" name="phone" />
		<p>
		<!-- onblur="setHref(this.value);" -->
		手机号码：<input type="text" id="searchText" value="${phone }"  name="searchText" class="text20 medium gray" maxlength="11" title="请输入客户用户名" />
		<input id="chaxun" name="chaxun" type="button" onclick="searchFeeAndMeter(1);" class="hand btn60x20" value="查询" />
	    <!-- <input id="yupan" name="yupan" type="button"  onclick="checkhc();" class="hand btn120x20"   value="预判互斥活动"  />  -->
	    </p>
	    </c:when>
		      <c:otherwise>
		      	手机号码：${phoneId} 
		      	<input type="hidden" id="searchText" name="searchText"  value="${phoneId}"/>
		        <input type="hidden" id="orderNumPass" name="orderNumPass"  value="${orderNumPass}"/>
 	        	<input type="hidden" id="taskIdPass" name="taskIdPass"  value="${taskIdPass}"/>
		      </c:otherwise>
  		 </c:choose>
	</div>
	<table cellspacing="0" summary="" id="almostThreeMonths" class="tab4" style="display:none">
		<tr>
			<th width="10%">近三个月</th>
			<th>12月份</th>
			<th>11月份</th>
			<th>10月份</th>
		</tr>
		<tr>
			<th>话费</th>
			<td>￥120</td>
			<td>￥110</td>
			<td>￥100</td>
		</tr>
		<tr>
			<th>流量</th>
			<td>35M</td>
			<td>40M</td>
			<td>45M</td>
		</tr>
	</table>
	
	<div class="loc" style="height:0">&nbsp;</div>
	
	<h2 class="h2">选机中心</h2>
	
	<div class="w98 box_s bg_white mt">
		<input type="hidden" name="locationId" id="locationId" value=""/>
		<input type="hidden" name="selBrandId" id="selBrandId" value=""/>
	    <input type="hidden" name="selBrandName" id="selBrandName" value=""/>
	    <input type="hidden" name="selCardPart" id="selCardPart" value=""/>
	    <input type="hidden" name="selCardCycle" id="selCardCycle" value=""/>
	    <input type="hidden" name="selCardOtherCondition" id="selCardOtherCondition" value=""/>
		<input type="hidden" name="publishTime" id="publishTime" value=""/>
	    <input type="hidden" name="catId" id="catId" value="1"/>
	    <input type="hidden" name="allFeatureIds" id="allFeatureIds" value=""/>
	    <input type="hidden" name="selPriceRange" id="selPriceRange" value=""/>
	    <input type="hidden" name="selOfferId" id="selOfferId" value=""/>

		<ul class="uls filter pt6">
				<li>
					<b>购买方式：</b>
					<p>
						<a href="javascript:void(0);" title="不限" class="here" onclick="selOffer('','');">不限</a>
						<a href="javascript:void(0);"  onclick="selOffer('1');" title="裸机">裸机</a>
						<a href="javascript:void(0);"  onclick="selOffer('2');" title="优惠购机">优惠购机</a>
						<a href="javascript:void(0);"  onclick="selOffer('3');" title="购机送话费">购机送话费</a>
					</p>
				</li>
			<li><b>品牌：</b><p class="blue">
				<a href="javascript:void(0);" title="不限" class="here" onclick="selBrand('','');">不限</a>
				<c:forEach items="${bandlist}" var="brand">
					<a href="javascript:void(0);" title="${brand.brandName}" onclick="selBrand('${brand.brandId}','${brand.brandName}');">${brand.brandName}</a>
			    </c:forEach>
			</p></li>
			<li><b>价格：</b><p class="blue">
				<a href="javascript:void(0);" title="不限" class="here" onclick="selPriceRange('');">不限</a>
				<a href="javascript:void(0);" title="1-499" onclick="selPriceRange('1-499');">1-499</a>
				<a href="javascript:void(0);" title="500-599" onclick="selPriceRange('500-999');">500-999</a>
				<a href="javascript:void(0);" title="1000-1999" onclick="selPriceRange('1000-1999');">1000-1999</a>
				<a href="javascript:void(0);" title="2000-2999" onclick="selPriceRange('2000-2999');">2000-2999</a>
				<a href="javascript:void(0);" title="3000-3999" onclick="selPriceRange('3000-3999');">3000-3999</a>
				<a href="javascript:void(0);" title="4000-4999" onclick="selPriceRange('4000-4999');">4000-4999</a>
				<a href="javascript:void(0);" title="5000以上" onclick="selPriceRange('5000-');">5000以上</a>
			</p></li>
			
			<c:forEach items="${featurelist}" var="feature">
			 
				<script type="text/javascript">
						var allFeatureIdsValue = $("#allFeatureIds").val();
						var newId = "${feature.featureId}";
						if(allFeatureIdsValue!=null&&allFeatureIdsValue!=""){
							$("#allFeatureIds").val(allFeatureIdsValue+","+newId);
						}else{
							$("#allFeatureIds").val(newId);
						}
				</script>
				
			<li><b>${feature.featureName}：</b><p class="blue">
				<a href="javascript:void(0);" title="不限" class="here" onclick="selFeature('${feature.featureId}_all','');">不限</a>
				<input type="hidden" name="${feature.featureId}" id="${feature.featureId}" value=""/>
				<c:set var="selectValues" value="${fn:split(feature.selectValues,',')}"/>
				<c:forEach items="${selectValues}" var="selValue"  varStatus="selValueIdx">
					<a href="javascript:void(0);" title="${selValue}" onclick="selFeature('${feature.featureId}_${selValueIdx.index}','${selValue}');">${selValue}</a>
				</c:forEach>
			</p></li>
			</c:forEach>
			
			<li><b>商品搜索：</b><p class="blue">
				<input type="text" class="txt_sch gray" id="queryString" name="queryString" onfocus="if(this.value=='请输入商品名称关键字'){this.value='';this.className='txt_sch'}" onblur="if(this.value==''){this.value='请输入商品名称关键字';this.className='txt_sch gray'}" value="请输入商品名称关键字" /><input type="button" onclick="selectItemName();" value="搜索" class="hand btn83x23" />
			</p></li>
		</ul>
	</div>

	<div class="w98 mt">
    	<iframe id="searchFrame" src="${path}/valetOrder/getFrontPageList.do" width="100%" height="100%" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="no"></iframe>
	</div>
	
</div></div></div>
</body>
