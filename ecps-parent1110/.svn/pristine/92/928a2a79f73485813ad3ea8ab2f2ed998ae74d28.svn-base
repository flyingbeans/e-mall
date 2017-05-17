<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>搜索</title>
<c:set var="imgurl" value="http://10.182.20.38:8808/shop/rsmanager/"
	scope="application" />
<script language="javascript" type="text/javascript"
	src="${base}/res/js/unitpngfix.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="<c:url value='/ecps/console/res/css/shop.css'/>" />
<script language="javascript" type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.js'/>"></script>
<script language="javascript" type="text/javascript"
	src="<c:url value='/ecps/console/res/js/com.js'/>"></script>
<script language="javascript" type="text/javascript"
	src="<c:url value='/ecps/console/res/js/many_form_validator.js'/>"></script>
<script language="javascript" type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.md5.js'/>"></script>
<script type="text/javascript">
	$(function() {
		var allFeatureIdsValue = $("#allFeatureIdsValue").val();
		var data = "${jsonStr}";
		if (data != null && data != "") {
			var newstr = data.replace(/;/g, "'");
			var dataObj = eval("(" + newstr + ")");
			if (allFeatureIdsValue != null && allFeatureIdsValue != "") {
				var arr = allFeatureIdsValue.split(",");
				var str = "";
				for ( var i = 0; i < arr.length; i++) {
					var featureKey = arr[i];
					var featureValue = dataObj[featureKey];
					str = str
							+ "<input type='hidden' name='"+featureKey+"' id='"+featureKey+"' value='"+featureValue+"' />";
				}
				$("#addHidden").html(str);
			}
		}

		$("input[name='imgPath']").each(function() {
			var imgPath = $(this).val();
			if (imgPath != '' || imgPath != underfined) {
				var imgName = eval("(" + imgPath + ")");
				var id = $(this).attr('id');
				$("#img" + id).attr("src", imgName[0].filePath);
			}
		});

		//var iframeH = $(document.body).height() + 40;
		//parent.$('#searchFrame').attr("height",iframeH);

		//pageInitialize('#form1');
		//orderByInit();
	});
	function feature(filter) {
		$("#filter").val(filter);
		$("#form1").submit();
	}
	function orderBy(orderBy) {
		var orderByStatus = $("#orderByStatus").val();
		if (orderByStatus == null || orderByStatus == '') {
			$("#orderByStatus").val("desc");//代表排序方式，即升序还是降序
		}
		if (orderByStatus == 'desc') {
			$("#orderByStatus").val("asc");//代表排序方式，即升序还是降序
		}
		if (orderByStatus == 'asc') {
			$("#orderByStatus").val("desc");//代表排序方式，即升序还是降序
		}

		if (orderBy == 'SKUPRICE' && $("#orderByStatus").val() == 'asc') {
			orderBy = 'MINSKUPRICE';
		}
		if (orderBy == 'SKUPRICE' && $("#orderByStatus").val() == 'desc') {
			orderBy = 'MAXSKUPRICE';
		}
		$("#orderBy").val(orderBy);//代表按那个字段排序
		$("#form1").submit();
	}
	$(function() {
		$("#nima").change(function() {
			var s = $(this).val();
			if (s == "") {
				$("#orderBy").val("");
				$("#orderByStatus").val("");
			} else {
				var array = new Array();
				array = s.split(","); //字符分割   
				$("#orderBy").val(array[0]);
				$("#orderByStatus").val(array[1]);
			}
			$("#form1").submit();
		})
		$("option").each(function() {
			if ($(this).val() == "${orderBy},${orderByStatus}") {
				$(this).attr("selected", "selected");
			}
		})
	})
	function jump(pageNo) {
		$("#pageNo").val(pageNo);
		$("#form1").submit();
	}
	//判断手机号码
	function checkTelephone(teleNumber) {
		var phoneNumber=/^\d{11}$/;
		if (!(phoneNumber.test(teleNumber))) {
			return false;
		} else {
			return true;
		}
	}
	function checkPhone() {
		var phone = $("#searchText").val();
		var phoneId=$(window.parent.document).find("#phone").val();
		if((phoneId != '' && typeof(phoneId) !='undefined')){
			phone = phoneId;
		}
		/*
		if(phone == '' || !checkTelephone(phone)){
			alert("请输入正确手机号码，点击‘查询’，查询正确后，可点击‘进入订购步骤’");
			return false;
		}*/
	}
	//弹出待客下单详情窗口
	function openGuestSubmitOrder(itemId){
		//验证用户是否输入手机号码查询出的结果
		if($(window.parent.document).find("#searchText").length>0){
			var phoneId = $(window.parent.document).find("#searchText").val();
			if(phoneId == ''||phoneId == null){
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
		var orderNumPass=$(window.parent.document).find("#orderNumPass").val();
		var taskIdPass=$(window.parent.document).find("#taskIdPass").val();
		
		window.open('${path}/valetOrder/guestSubmitOrder.do?itemId='+itemId+'&phoneId='+phoneId+'&orderNumPass='+orderNumPass+'&taskIdPass='+taskIdPass,'_blank','height=800,width=1000,scrollbars=yes,location=no,resizable=yes');
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
	
	$(function() { 
		var orderNumPass=$(window.parent.document).find("#orderNumPass").val();
		var queryFlag = $("#queryFlag").val();
		if((orderNumPass != '' && typeof(orderNumPass) !='undefined') || queryFlag == '1'){
			setOrderUrlDisChi();
		}
		var iframeH = $('table').height() + 76;
		parent.$('#searchFrame').attr("height", iframeH);
	});
	
	// 设置子页面按钮是否可用
	function setOrderUrlDisChi(){
		// 子页面
		$("span[name=labelOrder]").css("display","none");
		$("a[name=aOrder]").css("display","block");
		$("#queryFlag").val("1");
	}
	
</script>
</head>
<body>
	<a name="ST"></a>
	<div class="yjpITab clearfix">
		<ul id="choose">
			<li class="current" ><a
				href="javascript:void(0);">手机列表</a></li>
		</ul>
		<div class="r yjpITabR">
			<a href="javascript:orderBy('sales');"
				class="l <c:if test="${orderByStatus=='asc'&&orderBy=='sales'}">yjpITabUp</c:if><c:if test="${orderByStatus=='desc'&&orderBy=='sales'}">yjpITabDown</c:if>">销量</a>
			<a href="javascript:orderBy('SKUPRICE');"
				class="l <c:if test="${orderByStatus=='desc'&&orderBy=='MAXSKUPRICE'}">yjpITabDown</c:if><c:if test="${orderByStatus=='asc'&&orderBy=='MINSKUPRICE'}">yjpITabUp </c:if>">价格</a>
			<select class="l" id="nima" value="${ordeBy},${orderByStatus}">
				<option value="">按默认排序(推荐优先)</option>
				<option value="ON_SALE_TIME,desc">按上市时间降序</option>
				<option value="ON_SALE_TIME,asc">按上市时间升序</option>
				<option value="sales,desc">按销量由大到小</option>
				<option value="sales,asc">按销量由小到大</option>
				<option value="MINSKUPRICE,asc">按价格由低到高</option>
				<option value="MAXSKUPRICE,desc">按价格由高到低</option>
			</select>
		</div>
	</div>
	
	<table cellspacing="0" summary="" class="tabp tabfix">
		<thead>
			<tr>
				<th>商品编号</th>
				<th width="20%">手机基本信息</th>
				<th width="15%">商品亮点</th>
				<th width="15%">合约亮点</th>
				<th>可购买数量（件）</th>
				<th>销量</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach items='${pagination.list}' var="item" varStatus="status">
				<tr>
					<td>
						${item.itemNo}
					</td>
					<td class="pic nwp orange"><a
						href="javascript:void(0);" title="${item.itemName}" onclick="openParam('${item.itemId}',event)"
						> <c:forEach
								items='${item.pictureSet}' var="pic" varStatus="status">
								<c:if test='${status.index==0}'>
									<img src="${resourcePath}${pic.fileRelativePath}-150x150"
										alt="${item.itemName}" />
								</c:if>
							</c:forEach>
					</a>
						<dl>
							<dt>
								<a href="javascript:void(0);" onclick="openParam('${item.itemId}',event)"
									title="${item.itemName}"  > <c:choose>
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
										<c:when
											test="${ebItemPriceMap[item.itemId].minSkuPrice == ebItemPriceMap[item.itemId].maxSkuPrice}">
					¥ <fmt:formatNumber
												value="${ebItemPriceMap[item.itemId].minSkuPrice/100}"
												pattern="#0.00" type="number" />
										</c:when>
										<c:otherwise>
					¥ <fmt:formatNumber
												value="${ebItemPriceMap[item.itemId].minSkuPrice/100}"
												pattern="#0.00" type="number" />
											<samp>-</samp>
											<fmt:formatNumber
												value="${ebItemPriceMap[item.itemId].maxSkuPrice/100}"
												pattern="#0.00" type="number" />
										</c:otherwise>
									</c:choose>
								</span><br />
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
						</dl> </td>
					<td class="nwp"><c:out value="${item.itemHighlight}" escapeXml="true"></c:out></td>
					<td class="nwp"><c:out value="${item.contrHighl}" escapeXml="true"></c:out></td>
					<td class="alg_c">${item.stock}</td>
					<td class="alg_c">${item.sales }</td>
					<td class="alg_c">
						<input type="hidden" id="beginTime3428" value="2012-08-06" /> 
						<input type="hidden" id="endTime3428" value="2030-01-01" /> 						
						<span onclick="checkPhone();" name="labelOrder">购买裸机</span>
						<a onclick="openGuestSubmitOrder('${item.itemId}');return false;" href="javascript:void(0);" style="display: none" name="aOrder">购买裸机</a>
						
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form method="post" action="${path}/valetOrder/getFrontPageList.do"
		name="form1" id="form1">
		
		<div class="page_c">
			<span class="r page"> 
			共 <var class="red">${pagination.totalCount}</var> 条&nbsp;&nbsp;
			<a title="首页" id="startNo" class="inb"
				href="javascript:jump(1);">首&nbsp;页</a> <c:choose>
					<c:when test="${pagination.pageNo==1}">
						<span title="上一页" class="inb" id="previousNo"><samp>&lt;&lt;</samp>上一页</span>
					</c:when>
					<c:otherwise>
						<a title="上一页" id="previous" class="inb"
							href="javascript:jump(${pagination.pageNo-1});"><samp>&lt;&lt;</samp>上一页</a>
					</c:otherwise>
				</c:choose> <var id="pageTotal">${pagination.pageNo}/${pagination.totalPage}</var>
				<c:choose>
					<c:when test="${pagination.pageNo==pagination.totalPage}">
						<span title="下一页" class="inb" id="nextNo">下一页<samp>&gt;&gt;</samp></span>
					</c:when>
					<c:otherwise>
						<a title="下一页" id="next" class="inb"
							href="javascript:jump(${pagination.pageNo+1});">下一页<samp>&gt;&gt;</samp></a>
					</c:otherwise>
				</c:choose> <a title="尾页" id="endNo" class="inb"
				href="javascript:jump(${pagination.totalPage});">尾&nbsp;页</a>
			</span>
		</div>
		
		<input type="hidden" value="${param.queryFlag }" id="queryFlag" name="queryFlag" />
		<input type="hidden" value="" id="queryString" name="queryString" />
		<input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
		<input type="hidden" value="${orderByStatus}" id="orderByStatus"
			name="orderByStatus" /> <input type="hidden" value="" id="pageNo"
			name="pageNo" /> <input type="hidden" value="" id="pageSize"
			name="pageSize" /> <input type="hidden" name="catId" id="catId"
			value="${catId}" /> <input type="hidden" name="filter" id="filter"
			value="${filter}" /> <input type="hidden" name="selOfferId"
			id="selOfferId" value="${selOfferId}" /> <input type="hidden"
			name="selBrandId" id="selBrandId" value="${selBrandId}" /> <input
			type="hidden" name="selPriceRange" id="selPriceRange"
			value="${selPriceRange}" /> <input type="hidden" name="selAppearance"
			id="selAppearance" value="${selAppearance}" /> <input type="hidden"
			name="selControl" id="selControl" value="${selControl}" /> <input
			type="hidden" name="selSystem" id="selSystem" value="${selSystem}" />
		<input type="hidden" name="publishTime" id="publishTime"
			value="${publishTime}" /> <input type="hidden"
			name="allFeatureIdsValue" id="allFeatureIdsValue"
			value="${allFeatureIdsValue}" /> <input type="hidden"
			value="${pagination.totalCount}" id="paginationPiece"
			name="paginationPiece" /> <input type="hidden"
			value="${pagination.pageNo}" id="paginationPageNo"
			name="paginationPageNo" /> <input type="hidden"
			value="${pagination.totalPage}" id="paginationTotal"
			name="paginationTotal" /> <input type="hidden"
			value="${pagination.prePage}" id="paginationPrePage"
			name="paginationPrePage" /> <input type="hidden"
			value="${pagination.nextPage}" id="paginationNextPage"
			name="paginationNextPage" />
		<p id="addHidden" name="addHidden" style="display:none"></p>
	</form>

</body>