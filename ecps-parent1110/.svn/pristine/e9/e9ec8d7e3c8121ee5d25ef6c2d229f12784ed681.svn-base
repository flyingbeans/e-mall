<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>代客下单管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="relpaceGuestSubmitOrder"/>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ecps/console/res/js/district.js'/>"></script>
	
<script language="javascript" type="text/javascript">

function getDistrict(city) {
	//alert(city);
	$("#district").empty();
	var dis = dis1;
	if (city == '南宁市') {
		dis = dis1;
	} else if (city == '柳州市') {
		dis = dis2;
	} else if (city == '桂林市') {
		dis = dis3;
	} else if (city == '梧州市') {
		dis = dis4;
	} else if (city == '北海市') {
		dis = dis5;
	} else if (city == '钦州市') {
		dis = dis6;
	} else if (city == '防城港市') {
		dis = dis7;
	} else if (city == '贵港市') {
		dis = dis8;
	} else if (city == '玉林市') {
		dis = dis9;
	} else if (city == '百色市') {
		dis = dis10;
	} else if (city == '河池市') {
		dis = dis11;
	} else if (city == '贺州市') {
		dis = dis12;
	} else if (city == '来宾市') {
		dis = dis13;
	} else if (city == '崇左市') {
		dis = dis14;
	} else {
		dis = dis1;
	}
	var str = "";
	for (var i = 0; i < dis.length; i++) {
		str = "<option value='" + dis[i] + "'";
		if ("${ebco.ebOrder.district}" == dis[i]) {
			str += "selected ";
		}
		str += ">" + dis[i] + "</option>";
		//alert(str);
		$("#district").append(str);
		str = "";
	}

}
$(window).load(function() {
	getDistrict("${ebco.ebOrder.city}");	
});

//表单提交前验证
function beforeSubmitCheck(){
	var shipNametest = /^\s*[a-zA-Z0-9\u4e00-\u9fa5]{1,20}\s*$/;
	if(!shipNametest.test($("#shipName").val())){
		alert("收货人不能为空、只允许1-20个中英文数字字符");
		return;
	}
	
	var phone=$("#phone").val();
	var fixedPhone=$("#fixedPhone").val();
	if (phone == "" && fixedPhone == "") {
		alert("联系电话或固定电话必须填一项 ");
		return ;
	}
	if(!(/^[0-9]{11}$/.test(phone))&&phone.length!=0){
		alert("联系电话：请输入11位数字 ");
		return ;
	}
	if(!(/^[0-9-]{0,20}$/.test(fixedPhone))&&fixedPhone.length!=0){
		alert("只允许输入0-20位固定电话，如\"010-3882316\"");
		return ;
	}
	
	var zipCodetest = /^\s*[0-9]{6,6}\s*$/;
	if($("#zipCode").val()!='')
	{
		if(!zipCodetest.test($("#zipCode").val())){
			alert("邮政编码只能为6位数字！");
			return;
		}
	}
	
	var addrtest = /^\s*[a-zA-Z0-9\u4e00-\u9fa5]{1,200}\s*$/;
	if(!addrtest.test($("#addr").val())){
		alert("街道地址不能存在空格、特殊字符等，只能为1-200个中英文数字字符！");
		return;
	}
	
	var notestest = /^.{0,200}$/;
	if(!notestest.test($("#notes").val())){
		alert("用户备注不允许超过200个字符！");
		return;
	}
	
	if (window.confirm("确认修改？")) {
		update();
	}
	
}

function update(){
	var notes = $("#notes").attr("value");
	var deliveryMethod = $("#deliveryMethod").attr("value");
	var delivery = $("#delivery").attr("value");
	var isConfirm = $("#isConfirm").attr("value");
	var shipName = $("#shipName").attr("value");
	var phone = $("#phone").attr("value");
	var fixedPhone = $("#fixedPhone").attr("value");
	var zipCode = $("#zipCode").attr("value");
	var province = $("#province").attr("value");
	var city = $("#city").attr("value");
	var district = $("#district").attr("value");
	var addr = $("#addr").attr("value");
	var orderId = $("#orderId").attr("value");
	var orderNum = '${ebco.ebOrder.orderNum}';
	var username = '${user.username}';
	var data = {
		'notes':notes,
		'deliveryMethod':deliveryMethod,
		'delivery':delivery,
		'isConfirm':isConfirm,
		'shipName':shipName,
		'phone':phone,
		'fixedPhone':fixedPhone,
		'zipCode':zipCode,
		'province':province,
		'city':city,
		'district':district,
		'addr':addr,
		'orderId':orderId,
		'orderNum':orderNum,
		'username':username
	};
	
	$.post('${path}/order/updateOrder.do', data, function(){window.location.href='${path}/order/listGuestOrder.do';}, 'json');
}

function getBzqd(spid) {
	$.ajax({
		type : "POST",
		async : false,
		url : "${path}/order/packetAjaxList.do?itemNo="+spid,
		success : function(responseText) {
			var dataObj = eval("(" + responseText + ")");
			var txt = dataObj[0].txt;
			$('#spqd').html(txt);
			tipShow('#spqdDiv');
		}
	});	
}

</script>
</head>
<body id="main">
	<%
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<div class="frameL">
		<div class="box">
			<div class="menu icon">
				<jsp:include page="/${system}/common/valetordermenu.jsp"/>
			</div>
		</div>
	</div>

	<div class="frameR">
		<div class="box">
			<div class="content">

				<div class="loc icon">
					<samp class="t12"></samp><fmt:message key='menu.current.loc'/>：代客下单管理&nbsp;&raquo;&nbsp;查询/修改订单&nbsp;&raquo;&nbsp;<span class="gray" title="修改订单详情">修改订单详情</span>
				</div>
				<form id="myForm" action="${path}/order/orderStock/oper.do"
					method="post">
					<input type="hidden" name="taskId" value="${taskId}" /> <input
						type="hidden" name="userId" value="${userId}" /> <input
						type="hidden" name="orderNum" value="${ebco.ebOrder.orderNum}" />

					
					
					<div class="sch page_c">
						<span class="l"> 订单号：<b class="red"><var>${ebco.ebOrder.orderNum}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${ebco.ebOrder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" />
							</var>&nbsp;&nbsp;&nbsp;<b class="f14 blue"><ui:orderState var="${ebco.ebOrder.orderState}" type="1" /></b><c:if
								test="${ebco.ebOrder.deliveryNo != null}">物流编号:<c:out
									value="${ebco.ebOrder.deliveryNo}" />
							</c:if>
						</span>
							<span class="r">
								<input id="sub" type="button" class="pointer sub1 blue" onclick="beforeSubmitCheck()"	value="修改" />
								<input type="button" class="pointer sub1 blue" onclick="window.history.back(-1);" value="返回列表" />
							</span>
					</div>
					
					
					<div id="tab_1">
						<form id="fm111" name="fm111" action="" method="post">
						<input type='hidden' value="${ebco.ebOrder.orderId}"  id='orderId' name='orderId' />
						<h2 class="h2" title="配送信息">配送信息</h2>
						<table cellspacing="0" summary="" class="tab4">
							<tr>
								<th width="12%">下单用户：</th>
								<td width="21%" class="nwp">${ebco.ebOrder.ptlUser.username}</td>
								<th width="12%">支付方式:</th>
								<td class="21%" class="nwp"><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
								<th width="12%">用户备注:</th>
								<td class="nwp" colspan="3"><input id="notes" name="notes" type="text" value="<c:out value="${ebco.ebOrder.notes}" escapeXml="true"/>" size="100" class="text small2"/></td>
								
							</tr>
							<tr>
								<c:if test="${ebco.ebOrder.isPrint == 1}">
									<th>发票抬头：</th>
									<td class="nwp"><ui:orderState
											var="${ebco.ebOrder.payable}" type="5" /></td>
									<th>单位名称：</th>
									<td width="21%" class="nwp">${ebco.ebOrder.company}</td>
									<th width="12%">发票内容：</th>
									<td class="nwp"><ui:orderState
											var="${ebco.ebOrder.contents}" type="6" /></td>
								</c:if>
							</tr>
							<tr>
								<th>送货方式：</th>
								<td>
									<select id="deliveryMethod">
										<option value="1" <c:if test="${ebco.ebOrder.deliveryMethod == 1}">selected</c:if>>快递</option>
									</select>
								</td>
								<th>送货时间：</th>
								<td>
									<select id="delivery">
										<option value="1" <c:if test="${ebco.ebOrder.delivery == 1}">selected</c:if>>只工作日送货（双休日，节假日不送）</option>
										<option value="2" <c:if test="${ebco.ebOrder.delivery == 2}">selected</c:if>>工作日，双休日，假日均可送货</option>
										<option value="3" <c:if test="${ebco.ebOrder.delivery == 3}">selected</c:if>>只双休日，假日送货</option>
									</select>
								</td>
								<th>送货前电话确认：</th>
								<td>
									<select id="isConfirm">
										<option value="1" <c:if test="${ebco.ebOrder.isConfirm == 1}">selected</c:if>>是</option>
										<option value="0" <c:if test="${ebco.ebOrder.isConfirm == 0}">selected</c:if>>否</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>收货人：</th>
								<td class="nwp"><input id="shipName" name="shipName" type="text" value="${ebco.ebOrder.shipName}" class="text small2"/></td>
								<th>联系方式：</th>
								<td><input id="phone" name="phone" type="text" value="${ebco.ebOrder.phone}" class="text small2"/></td>
								<th>或固定电话：</th>
								<td><input id="fixedPhone" name="fixedPhone" type="text" value="${ebco.ebOrder.fixedPhone}" class="text small2" /></td>
							</tr>
							
							<tr>
								<th>收货地址：</th>
								<td class="nwp" colspan="3">
									<c:if test="${ebco.ebOrder.deliveryMethod == 1}">
										<select id="province">
											<option value="${ebco.ebOrder.province}" <c:if test="${ebco.ebOrder.province != ' '}">selected</c:if>>${ebco.ebOrder.province}</option>
										</select>
										<select id="city" onchange="getDistrict(this.value)">
											<option value="南宁市" <c:if test="${ebco.ebOrder.city == '南宁市'}">selected</c:if>>南宁市</option>
											<option value="柳州市" <c:if test="${ebco.ebOrder.city == '柳州市'}">selected</c:if>>柳州市</option>
											<option value="桂林市" <c:if test="${ebco.ebOrder.city == '桂林市'}">selected</c:if>>桂林市</option>
											<option value="梧州市" <c:if test="${ebco.ebOrder.city == '梧州市'}">selected</c:if>>梧州市</option>
											<option value="北海市" <c:if test="${ebco.ebOrder.city == '北海市'}">selected</c:if>>北海市</option>
											<option value="钦州市" <c:if test="${ebco.ebOrder.city == '钦州市'}">selected</c:if>>钦州市</option>
											<option value="防城港市" <c:if test="${ebco.ebOrder.city == '防城港市'}">selected</c:if>>防城港市</option>
											<option value="贵港市" <c:if test="${ebco.ebOrder.city == '贵港市'}">selected</c:if>>贵港市</option>
											<option value="玉林市" <c:if test="${ebco.ebOrder.city == '玉林市'}">selected</c:if>>玉林市</option>
											<option value="百色市" <c:if test="${ebco.ebOrder.city == '百色市'}">selected</c:if>>百色市</option>
											<option value="河池市" <c:if test="${ebco.ebOrder.city == '河池市'}">selected</c:if>>河池市</option>
											<option value="贺州市" <c:if test="${ebco.ebOrder.city == '贺州市'}">selected</c:if>>贺州市</option>
											<option value="来宾市" <c:if test="${ebco.ebOrder.city == '来宾市'}">selected</c:if>>来宾市</option>
											<option value="崇左市" <c:if test="${ebco.ebOrder.city == '崇左市'}">selected</c:if>>崇左市</option>
										</select>
										<select id="district"></select>
										<input id="addr" name="addr" type="text" value="${ebco.ebOrder.addr}" size="50" class="text"/>
									</c:if>
								</td>
								<th>邮编：</th>
								<td><input id="zipCode" name="zipCode" type="text" value="${ebco.ebOrder.zipCode}" class="text small2"/></td>
							</tr>
							</form>
						</table>

						<c:set var="temp" value="0"></c:set>
						<c:forEach items="${ebco.ebOrderDetail}" var="e">
							<c:if test="${e.orderDetailType==1}">
								<c:set var="temp" value="1"></c:set>
							</c:if>
						</c:forEach>
						<c:if test="${temp==1}">
							<table cellspacing="0" summary="" class="tab3">
								<tr>
									<th width="12%">商品编号</th>
									<th width="12%">商品名称</th>
									<th width="15%">包装清单</th>
									<th width="15%">单价</th>
									<th>数量</th>
								</tr>
								<c:forEach items="${ebco.ebOrderItemDetail}" var="e">
									<tr>
										<td>${e.itemNo}</td>
										<td class="nwp">${e.itemName}</td>
										<td><a href="javascript:void(0);"
											onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>
										<td><fmt:formatNumber value="${e.price/100}"
												pattern="#0.00" />元</td>
										<td>${e.quantity}个</td>
									</tr>
								</c:forEach>
							</table>
						</c:if>


						<c:set var="temp1" value="0"></c:set>
						<c:forEach items="${ebco.ebOrderDetail}" var="e">
							<c:if test="${e.ebSimIdcard!=null}">
								<c:set var="temp1" value="1"></c:set>
							</c:if>
						</c:forEach>
						<c:if test="${temp1==1}">
							<table cellspacing="0" summary="" class="tab3">
								<tr>
									<th width="12%">号卡</th>
									<th width="12%">机主姓名</th>
									<th width="15%">证件类型</th>
									<th>证件号码</th>
									<th>证件地址</th>
									<th>证件到期日期</th>
									<th>联系电话</th>
								</tr>
								<c:forEach items="${ebco.ebOrderDetail}" var="e">
									<c:if test="${e.ebSimIdcard!=null}">
										<tr>
											<td>${e.itemName}</td>
											<td>${e.ebSimIdcard.subscriberName}</td>
											<td><ui:orderState var="${e.ebSimIdcard.idcardType}"
													type="9" /></td>
											<td>${e.ebSimIdcard.idNum}</td>
											<td class="nwp">${e.ebSimIdcard.idAddr}</td>
											<td><fmt:formatDate value="${e.ebSimIdcard.idValidTo}"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td>${e.ebSimIdcard.phone}</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</c:if>
						<c:if test="${!(temp==1)}">
							<h2 class="h2" title="基本信息">基本信息</h2>
							<table cellspacing="0" summary="" class="tab3">
								<tr>
									<th width="12%">档次编号</th>
									<th width="12%">商品编号</th>
									<th width="15%">商品名称</th>
									<th width="15%">规格</th>
									<th width="12%">包装清单</th>
									<th>活动名称</th>
									<th>购机价(销售价-优惠价)元</th>
									<th>实付(购机价+预付=实付)元</th>
									<th>数量</th>
								</tr>
								<c:forEach items="${ebco.ebOrderOfferDetail}" var="e">
									<c:if test="${e.orderDetailType==3}">
										<tr>
											<td>${e.offerNo}</td>
											<td>${e.itemNo}</td>
											<td class="nwp">${e.itemName}</td>
											<td>${e.skuSpec}</td>
											<td><a href="javascript:void(0);"
												onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>
											<td class="nwp">${e.offerGroupName}${e.shortName}${e.shortName2}</td>
											<td class="nwp"><fmt:formatNumber
													value="${e.skuPrice/100}" pattern="#0.00" />-<fmt:formatNumber
													value="${e.skuDiscount/100}" pattern="#0.00" /></td>
											<c:if test="${e.skuPrice-e.skuDiscount<0}">
												<td class="nwp">0+<fmt:formatNumber
														value="${e.prepaid/100}" pattern="#0.00" />=<fmt:formatNumber
														value="${(e.prepaid)/100}" pattern="#0.00" /></td>
											</c:if>
											<c:if test="${e.skuPrice-e.skuDiscount>=0}">
												<td class="nwp"><fmt:formatNumber
														value="${(e.skuPrice-e.skuDiscount)/100}" pattern="#0.00" />+<fmt:formatNumber
														value="${e.prepaid/100}" pattern="#0.00" />=<fmt:formatNumber
														value="${(e.skuPrice+e.prepaid-e.skuDiscount)/100}"
														pattern="#0.00" /></td>
											</c:if>
											<td>1个</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</c:if>

						<c:if test="${!(temp==1)}">
							<h2 class="h2" title="业务信息">业务信息</h2>
							<table cellspacing="0" summary="" class="tab3">
								<tr>
									<th width="12%">业务协议期</th>
									<th width="12%">月承诺话费</th>
									<th width="15%">预存话费</th>
									<th width="12%">返还期</th>
									<th>月返还话费</th>
									<th>首月返还话费</th>
									<th>月末返还话费</th>
									<th>备注</th>
									<th>套餐名称</th>
								</tr>

								<c:forEach items="${ebco.ebOrderOfferDetail}" var="e">
									<c:if test="${e.orderDetailType==3}">
										<tr>
											<td><c:out value="${e.offerTerm}" />个月</td>
											<td><fmt:formatNumber value="${e.commitMonthly/100}"
													pattern="#0.00" />元</td>
											<td class="nwp"><fmt:formatNumber
													value="${e.prepaid/100}" pattern="#0.00" />元</td>
											<td><c:if test="${e.period==0}">立即返还</c:if>
												<c:if test="${e.period!=0}">${e.period}个月</c:if></td>
											<td class="nwp"><fmt:formatNumber
													value="${e.refundMonthly/100}" pattern="#0.00" />元</td>
											<td class="nwp"><fmt:formatNumber
													value="${e.refund1stMonth/100}" pattern="#0.00" />元</td>
											<td class="nwp"><fmt:formatNumber
													value="${e.refundLastMonth/100}" pattern="#0.00" />元</td>
											<td class="nwp">${e.ebOffer.notes}</td>
											<td class="nwp">${e.offerName}</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</c:if>

						<div class="page_c">
							<span class="r">商品金额合计：<fmt:formatNumber
									value="${ebco.ebOrder.orderSum/100}" pattern="#0.00" />元&nbsp;&nbsp;&nbsp;
								运费：0.00元 &nbsp;&nbsp;&nbsp; 应付金额： <b class="f16 red"><fmt:formatNumber
										value="${ebco.ebOrder.orderSum/100}" pattern="#0.00" />元</b>
							</span>
						</div>

					</div>


				</form>

			</div>
		</div>
	</div>
</body>
