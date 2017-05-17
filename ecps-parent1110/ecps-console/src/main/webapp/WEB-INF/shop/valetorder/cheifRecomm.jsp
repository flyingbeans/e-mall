<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>主推机型_代客下单管理</title>
<meta name="heading"
	content="<fmt:message key='SubscribeMgmtMenu.heading'/>" />
<meta name="menu" content="relpaceGuestSubmitOrder" />
<script type="text/javascript"
	src="<c:url value='/res/js/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
	function searchFeeAndMeter(type) {
		
		var phone = $("#searchText").attr("value");
		if (phone == '请输入客户手机号码') {
			alert("请输入客户手机号码");
			return;
		}
		if(phone == '' || !checkTelephone(phone)){
			alert("请输入正确手机号码!");
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
	
	// 设置子页面按钮是否可用
	function setOrderUrlEnable() {
		// 子页面
		$("span[name=labelOrder]").css("display","block");
		$("a[name=aOrder]").css("display","none");
	}
	
	// 设置子页面按钮是否可用
	function setOrderUrlDis(){
		// 子页面
		$("span[name=labelOrder]").css("display","none");
		$("a[name=aOrder]").css("display","block");
	}
	
	// 商品参数隐藏
	function hideItem(itemId) {
		tipHide('#recommItemParam'+itemId);
	}
	
	// 商品参数展示
	function openParam(itemId,e){
		var e = e || window.event
		// 模态窗口高度和宽度
		var whparamObj = { width: 605, height: 430 };
		// 相对于浏览器的居中位置
		var bleft = ($(window).width() - whparamObj.width) / 2;
		var btop = ($(window).height() - whparamObj.height) / 2;
		// 根据鼠标点击位置算出绝对位置
		var tleft = e.screenX - e.clientX;
		var ttop = e.screenY - e.clientY; 
		// 最终模态窗口的位置 
		var left = bleft + tleft;
		var top = btop + ttop;   
		// 参数     
		var p = "help:no;status:no;center:yes;";   
			p += 'dialogWidth:'+(whparamObj.width)+'px;';     
			p += 'dialogHeight:'+(whparamObj.height)+'px;';  
			p += 'dialogLeft:' + left + 'px;';
			p += 'dialogTop:' + top + 'px;';
        showModalDialog("${path}/valetOrder/getItemParam.do?itemId="+itemId,"_blank", p);
	}
	
	function orderOpen(itemId) {
		if($(window.parent.document).find("#searchText").length>0){
			var phoneId = $(window.parent.document).find("#searchText").val();
			if (phoneId == '' || phoneId == null || phoneId == '请输入客户手机号码') {
				alert("请输入用户名，点击‘查询’可点击‘购买裸机’");
				return false;
			}
			phoneId = phoneId.replace(/[ ]/g,""); //替换所有空格！
			/*
			if(!checkTelephone(phoneId)){
				alert("请输入用户名，点击‘查询’可点击‘购买裸机’");
				return false;
			}
			*/
		}
		window.open('${path}/valetOrder/guestSubmitOrder.do?itemId='+itemId+'&phoneId='+phoneId,
					'_blank','height=800,width=1000,scrollbars=yes,location=no,resizable=yes');
	}
	function checkPhone() {
		var phone = $("#searchText").val();
		if(phone == '' || !checkTelephone(phone)){
			alert("请输入正确手机号码，点击‘查询’，查询正确后，可点击‘进入订购步骤’");
			return false;
		}
	}
	function checkTelephone(teleNumber) {
		var phoneNumber=/^\d{11}$/;
		if (!(phoneNumber.test(teleNumber))) {
			return false;
		} else {
			return true;
		}
	}
	
	$(document).ready(function(){
		searchText('#searchText','#phone',11);
		
		var user_phone_id = '${sessionScope.user_phone_id}';
		if(user_phone_id != '' && user_phone_id != null){
			$("#searchText").val(user_phone_id);
			searchFeeAndMeter(1);
		}
	});
	
	function checkhc(){
		//用户当前号码营销案与商品营销案是否互斥
		var phone = $("#searchText").attr("value");
		if (phone == '请输入客户手机号码') {
			alert("请输入客户手机号码");
			return;
		}
		if(phone == '' || !checkTelephone(phone)){
			alert("请输入正确手机号码!");
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
		var initHref = $("#guestOrderHref").attr("href");
		var phoneCharAt = initHref.indexOf('?');
		if(phoneCharAt>0){
			initHref = initHref.substring(0,phoneCharAt);
		}
		var href = initHref+"?phone="+phone;
		$("#guestOrderHref").attr("href",href);
	}
	$(function(){
		var phone = $("#searchText").val();
		if(phone !="" && phone !=null && phone!="请输入客户手机号码"){
			setHref(phone)
			searchFeeAndMeter(1);
			checkhc();
		}
	})
	
</script>
</head>
<body id="main">

	<div class="frameL">
		<div class="box">
			<div class="menu icon">
				<jsp:include page="/${system}/common/valetordermenu.jsp" />
			</div>
		</div>
	</div>

	<div class="frameR">
		<div class="box">
			<div class="content">

				<div class="loc icon">
					<samp class="t12"></samp>
					<fmt:message key='menu.current.loc' />
					：代客下单管理&nbsp;&raquo;&nbsp;<span class="gray" title="预约单列表">主推机型</span>
				</div>

				<div class="sch">
					<input type="hidden" id="phone" name="phone" />
					<%-- <p>手机号码：<input type="text" value="${phone }" id="searchText" onblur="setHref(this.value);" name="searchText" class="text20 medium gray" maxlength="11" title="请输入客户手机号码" /> --%>
					<p>手机号码：<input type="text" value="${phone}" id="searchText" name="searchText" class="text20 medium gray" maxlength="11" title="请输入客户手机号码" />
					<input id="chaxun" name="chaxun" type="button" onclick="searchFeeAndMeter(1);" class="hand btn60x20" value="查询" />
				    <!-- <input id="yupan" name="yupan" type="button"  onclick="checkhc();" class="hand btn120x20"   value="预判互斥活动"/> --> 
				    </p>
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
				
				<!-- <h2 class="h2" title="主推机型">主推机型</h2> -->
				<table cellspacing="0" summary="" class="tab">
					<thead>
						<tr>
							<th>商品编号</th>
							<th>手机基本信息</th>
							<th>商品亮点</th>
							<th>合约亮点</th>
							<th>库存（件）</th>
							<th>销量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items='${pagination.list}' var="item" varStatus="status">
							<tr>
								<td class="alg_c">
									${item.itemNo}
								</td>
								<td class="nwp pic orange">
									<a href="javascript:void(0);" title="${item.itemName}" class="img" onclick="openParam('${item.itemId }',event);return false;">  
										<c:forEach
											items='${item.pictureSet}' var="pic" varStatus="status">
											<c:if test='${status.index==0}'>
												<img src="${resourcePath}${pic.fileRelativePath}-150x150"
													alt="${item.itemName}" />
											</c:if>
										</c:forEach>
									</a>
									<dl>
										<dt>
											<a href="javascript:void(0);" title="${item.itemName}" onclick="openParam('${item.itemId }',event);return false;"> 
												<c:choose>
													<c:when test="${fn:length(item.itemName) > 16}">
														${fn:substring(item.itemName,0,15)}...
													</c:when>
													<c:otherwise>
														${item.itemName}
													</c:otherwise>
												</c:choose>
											</a>
										</dt>
										<dd class="h40">
											<c:choose>
												<c:when test="${fn:length(item.promotion) > 30}">
													${fn:substring(item.promotion,0,29)}...
												</c:when>
																		<c:otherwise>
													${item.promotion}
												</c:otherwise>
											</c:choose>
										</dd>
										<dd>
											<span class="f14 red b">
												<c:choose>
													<c:when test="${ebItemPriceMap[item.itemId].minSkuPrice == ebItemPriceMap[item.itemId].maxSkuPrice}">
														¥ <fmt:formatNumber value="${ebItemPriceMap[item.itemId].minSkuPrice/100}" pattern="#0.00" type="number"/>
													</c:when>
													<c:otherwise>
														¥ <fmt:formatNumber value="${ebItemPriceMap[item.itemId].minSkuPrice/100}" pattern="#0.00" type="number"/><samp>-</samp>
														<fmt:formatNumber value="${ebItemPriceMap[item.itemId].maxSkuPrice/100}" pattern="#0.00" type="number"/>
													</c:otherwise>
												</c:choose>						
											</span>
											<del class="gray">
												¥
												<c:choose>
													<c:when
														test="${ebItemPriceMap[item.itemId].minMarketPrice!=null && ebItemPriceMap[item.itemId].maxMarketPrice!=null}">
														<fmt:formatNumber
															value="${ebItemPriceMap[item.itemId].maxMarketPrice/100}"
															pattern="#0.00" type="number" />
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when
																test="${ebItemPriceMap[item.itemId].minMarketPrice==null}">
																暂无报价
															</c:when>
															<c:when
																test="${ebItemPriceMap[item.itemId].minMarketPrice!=null || ebItemPriceMap[item.itemId].maxMarketPrice!=null}">
																暂无报价
															</c:when>
															<c:when
																test="${ebItemPriceMap[item.itemId].maxMarketPrice==null}">
																暂无报价
															</c:when>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</del>
										</dd>
									</dl>
								</td>
								<td class="nwp">
									<c:out value="${item.itemHighlight}" escapeXml="true"></c:out>
								</td>
								<td class="nwp">
									<c:out value="${item.contrHighl}" escapeXml="true"></c:out>
								</td>
								<td class="alg_c">
									${item.stockInventory}
								</td>
								<td class="alg_c">
									${item.sales}
								</td>
								<td class="alg_c">
									<!-- <span onclick="checkPhone();" name="labelOrder">进入订购步骤</span> -->
									<a onclick="orderOpen('${item.itemId}');return false;" href="javascript:void(0);" name="aOrder">购买裸机</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

