<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>订单详情_备货单_<fmt:message key="OrderMgmtMenu.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="OrderMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script type="text/javascript">
function initInput(inputDom){
	var title=inputDom.attr("title");
	var inputValue=inputDom.val();
	if(inputValue==""){
		inputDom.val(title).addClass("gray");
	}	
	inputDom.focus(function(){
		var val=$(this).val();
		if(val==title){
			$(this).val("");$(this).removeClass("gray");
		}
	});
	inputDom.blur(function(){
		if($(this).val()==""){
			$(this).val(title).addClass("gray");
		}
	});
}
$(function(){
	initInput($("#seriesCode"));
	var obj=null;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
			tObj = $(this);
			
		});
	});
//     $("#n1").change(function(){
//         $("#n").val($(this).val());
//     });
//     $("#n").change(function(){
//         $("#n1").val($(this).val());
//     });
	$(".sub1").click(function(){
		obj=$(this);
		$("#errorInfoAdd").html("<label>&nbsp;</label>");
	    $("#itemNote").val("");
	    tipHide("#errorInfoAdd");
	    //判定配送商不能为空
	    var  deliveryPartner = $("#n1").val();
	    if((${ebco.ebOrder.orderState}==4) && (deliveryPartner == null || deliveryPartner == "")){
	    	alert("配送商不能为空,请先添加配送商!");
	    	return;
	    }
	    
	    var deliveryNo=$("#deliveryNo").val();
		if(deliveryNo.length<1 && (${ebco.ebOrder.orderState}==4 || ${ebco.ebOrder.orderState}==5)){
			alert("请输入物流编号");
			return;
		}
		if(deliveryNo.length>20){
			alert("物流编号不得超过20个字 ");
			return;
		}
	   var d=$("#addItemNote h2").attr("title","系统提示").html("系统提示");
	    if(obj.val().indexOf("失败")!=-1||obj.val().indexOf("异常")!=-1){
			tipShow('#addItemNote');
	    }else{
	    	tipShow("#confirmDiv");
	    }
	});
	$("#confirmDivOk").bind("click",function(){
		var a=$("#myForm");
	 	a.append('<input type="hidden" name="r" value="'+obj.val()+'">');
		a.submit();
	});
	$("input[id='addItemNoteConfirm']").click(function(){
		if(obj==null){
			return;
		}
		var a=$("#myForm");
		var itemNote=$("#itemNote").val();
		if(itemNote.length>200){
			tipShow("#errorInfoAdd");
			$("#errorInfoAdd").html("<label>&nbsp;</label>操作备注不能大于200个字符");
			return;
		}
		a.append('<input type="hidden" name="note" id="x"/>');
		$("#x").val(itemNote);
		a.append('<input type="hidden" name="r"  value="'+obj.val()+'"/>');
		a.submit();
        tipHide('#addItemNote');
	});
});
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

function queryCard() {
	<c:if test="${ebco.ebOrder.orderType == 2}">
		var a=$("#myForm");
		//var sn=$("#shortName").val();
		var sn2=$("#shortName2").val();
		//if(!(/^[0-9]{15}$/.test(sn))) {
		//	alert("IMSI应输入15位数字！ ");
		//	return;
	//	}
		if(!(/^[a-zA-Z0-9]{20}$/.test(sn2))) {
			alert("ICCID应输入20位字母或数字！ ");
			return;
		}
		confirm1("备货完成");
	</c:if>
}

function querySCode() {
	<c:if test="${ebco.ebOrder.orderType == 3}">
		var a=$("#myForm");
		var scc=$("#seriesCode").val();
		if(!(/^[0-9]{15}$/.test(scc))){
			alert("串号应输入15位数字！ ");
			return;
		}
		confirm1("备货完成");
	</c:if>
}

function querySCodes() {
	var a=$("#myForm");
	var scs = $("input[scs=0]");
	for (i = 0; i < scs.length; i++) {
		var val = scs[i].value;
		if (val == "") {
			alert("您还有串号没有录入！ ");
			return;
		}
	}
	confirm1("备货完成");
}

function test(){
	$.ajax({
		type : "POST",
		async : false,
		url : "${path}/order/queryAjaxSCode.do?seriescode="+$("#seriesCode").val(),
		success : function(responseText) {
			var dataObj = eval("(" + responseText + ")");
			var txt = dataObj[0].txt;
			if(txt==true){
// 			$('#query111').html("串号正确，点击确定办理");
// 			$("#but5").show();
				confirm1("备货完成");
			}else{
				tipHide("#refundLoadDiv");
				$("#but5").hide();
				$('#query111').html("串号不存在或不可用，请核对");
				tipShow('#queryDiv1');
			}
			
		}
	});
}
function confirm1(str){
	tipHide("#refundLoadDiv");
	var a=$("#myForm");
	a.append('<input type="hidden" name="r" value="'+str+'" />');
	a.submit();
}

function showSeriesCode(skuId) {
	$("#tddiv"+skuId).fadeIn('slow');
	$("#hideSCdiv"+skuId).show();
	$("#showSCdiv"+skuId).hide();
}
//团购
function showSeriesCodeGroupon() {
	$("#tddiv_groupon").fadeIn('slow');
	$("#hideSCdiv_groupon").show();
	$("#showSCdiv_groupon").hide();
}

function hideSeriesCode(skuId) {
	var num = $("#seriesCodeNum"+skuId).val();
	var numvar = parseInt(num);
	for (i = 1; i <= numvar; i++) {
		var ret = clientValidate($("#"+i+"seriesCode"+skuId));
		if (!ret) {
			return;
		}
	}
	
	var scs = "";
	for (i = 1; i <= numvar; i++) {
		scs += $("#"+i+"seriesCode"+skuId).val();
		if (i != numvar) {
			scs += "</br>";
		}
	}
	$("#seriesCodes"+skuId).val(scs);
	$("#showSCSspan"+skuId).html(scs);
	$("#tddiv"+skuId).hide();
	$("#hideSCdiv"+skuId).hide();
	$("#showSCdiv"+skuId).fadeIn('slow');
}

//团购
function hideSeriesCodeGroupon() {
	var num = $("#seriesCodeNum_groupon").val();
	var numvar = parseInt(num);
	for (i = 1; i <= numvar; i++) {
		var ret = clientValidate($("#"+i+"seriesCode_groupon"));
		if (!ret) {
			return;
		}
	}
	
	var scs = "";
	for (i = 1; i <= numvar; i++) {
		scs += $("#"+i+"seriesCode_groupon").val();
		if (i != numvar) {
			scs += "</br>";
		}
	}
	$("#seriesCodes_groupon").val(scs);
	$("#showSCSspan_groupon").html(scs);
	$("#tddiv_groupon").hide();
	$("#hideSCdiv_groupon").hide();
	$("#showSCdiv_groupon").fadeIn('slow');
}

$(document).ready(function() {
	$("[reg],[url]").blur(function() {
		var isContinue=true;
		if(typeof($(this).attr("reg")) != "undefined") {
			isContinue=clientValidate($(this));
		}
		if(isContinue){
			$("#"+$(this).attr("id")+"pos").html("");
		}
	});
});

function clientValidate(obj) {
	var reg = new RegExp(obj.attr("reg"));
	var objValue = obj.attr("value");
	if(!reg.test(objValue)) {
		$("#"+obj.attr("id")+"pos").html("<span style='color:red'>"+obj.attr("tip")+"</span>");
		return false;
	}
	return true;
}

function getIccid(serviceNum, areaCode) {
	$.ajax({
		type : "POST",
		async : false,
		url : "${path}/order/preemptSimCardRes.do",
		data : {serviceNum:serviceNum,areaCode:areaCode,orderSource:$("#orderSource").val()},
		success : function(responseText) {
			if(responseText!=null){
				$("#shortName2").val(responseText);
			}
		},
		error : function() {
			alert("查询ICCID时出错");
		}
	});
}
</script>
</head>
<body id="main">
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
%>
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/ordermenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon">
    <c:if test="${oprType == '1'}">
    <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='OrderMgmtMenu.title'/>&nbsp;&raquo;&nbsp;订单总览&nbsp;&nbsp;<span class="gray" title="订单详情"></span>
    </c:if>
    <c:if test="${oprType == '2'}">
    <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='OrderMgmtMenu.title'/>&nbsp;&raquo;&nbsp;有效订单&nbsp;&nbsp;<span class="gray" title="订单详情"></span>
    </c:if>
    <c:if test="${oprType==null}">
    <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='OrderMgmtMenu.title'/>&nbsp;&raquo;&nbsp;备货单&nbsp;&nbsp;<span class="gray" title="订单详情"></span>
    </c:if>
</div>
<form id="myForm" action="${path}/order/orderStock/oper.do" method="post">
    <input type="hidden" name="taskId" value="${taskId}"/>
    <input type="hidden" name="userId" value="${userId}"/>
    <input type="hidden" name="oprType" value="${oprType}"/>
    <input type="hidden" name="orderNum" value="${ebco.ebOrder.orderNum}"/>

 <div class="sch page_c">
    	<span class="l">
    	 订单号：<b class="red"><var>${ebco.ebOrder.orderNum}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${ebco.ebOrder.orderTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var>&nbsp;&nbsp;&nbsp;<b class="f14 blue"><ui:orderModule var="${ebco.ebOrder.orderState}" type="12"/></b>&nbsp;&nbsp;&nbsp;
  
  	<c:if test="${ebco.ebOrder.distriId != null}">
  		<c:forEach items="${ebUsers}" var="e">
		 <c:if test="${e.distriId==ebco.ebOrder.distriId}">${e.distriName}&nbsp;&nbsp;&nbsp;</c:if>
		</c:forEach>
  	</c:if>
  <%-- <c:if test="${ebco.ebOrder.deliveryNo != null}"> 
 物流编号:<c:out value="${ebco.ebOrder.deliveryNo}"/>
</c:if> --%>
    <ui:permTag src="/ecps/console/order/orderStock/oper.do">
   <c:if test="${ebco.ebOrder.orderState == 4 && oprType !=1}">     
   		<b class="f14 orange">选择配送商  </b><select id="n1" name="n" style="width:100px;">
		<c:forEach items="${ebUsers}" var="e">
		 <option value="C8-${e.distriId}">${e.distriName}</option>
		</c:forEach>
		</select>		 
            输入物流编号：<input id="deliveryNo" name="deliveryNo" type="text" value='<c:out value="${ebco.ebOrder.deliveryNo}"/>'
					 class="text small2" />
			<input type="text" style="display:none">
            <input name="r" type="button" class="pointer sub1" value="打包完成"/>
          </c:if>
            <c:if test="${ebco.ebOrder.orderState == 5 && oprType !=1}">      
            输入物流编号：<input id="deliveryNo" name="deliveryNo" type="text" value='<c:out value="${ebco.ebOrder.deliveryNo}"/>' class="text small2" />
            <input type="text" style="display:none">
            <input name="r" type="button" class="pointer sub1" value="物流已取货"/></c:if>
		<c:if test="${ebco.ebOrder.orderState == 2 && oprType !=1}">
		<input type="hidden" name="r1" value="备货中"/>
		<c:if test="${ebco.ebOrder.orderType == 2}">
			<input type="button" name="r" class="pointer " onclick="queryCard();"value="备货完成"/>
		</c:if>
		<c:if test="${ebco.ebOrder.orderType == 3}">
			<input type="button" name="r" class="pointer " onclick="querySCode();"value="备货完成"/>
		</c:if>
		<c:if test="${ebco.ebOrder.orderType == 1 || ebco.ebOrder.orderType == 4 || ebco.ebOrder.orderType == 5}">
			<input type="button" name="r" class="pointer " onclick="querySCodes();"value="备货完成"/>
		</c:if>
		</c:if>
	</ui:permTag>

    	 </span>
	</div>


	<h2 class="h2_ch">
	<span id="tabs" class="l">
	<a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
	<a href="javascript:void(0);" ref="#tab_2" title="支付信息" class="nor">支付信息</a>
	<a href="javascript:void(0);" ref="#tab_3" title="操作记录" class="nor">操作记录</a>
	</span>
	<span class="r"><input type="button" class="pointer" onclick="window.open('${base}/order/preview.do?orderId=${ebco.orderId}&type=12','_blank','height=300,width=500,scrollbars=yes,location=no,resizable=yes')" value="打印订单" /><input type="button" class="pointer" onclick="window.history.back(-1);" value="返回列表"/></span>
	</h2>


	<div id="tab_1">
		
	   	<!-- 基本信息 -->
		<table cellspacing="0" summary="" class="tab4">
			<tr>
				<th width="12%">归属地：</th>
				<td width="21%" class="nwp">${ebco.ebOrder.areaName}</td>
				<th width="12%">购买类型：</th>
				<td width="21%" class="nwp">
					<c:choose>
						<c:when test="${ebco.ebOrder.orderType == 4}">团购</c:when>
						<c:when test="${ebco.ebOrder.orderType == 5}">秒杀</c:when>
						<c:otherwise>常规</c:otherwise>
					</c:choose>
				</td>
				<c:choose>
					<c:when test="${ebco.ebOrder.orderType == 2 && ebco.ebOrder.orderSource == 2}">
						<th width="12%">订单来源</th>
						<td class="nwp"><c:out value="套卡"></c:out><input type="hidden" id="orderSource" value="${ebco.ebOrder.orderSource}" /></td>
					</c:when>
					<c:when test="${ebco.ebOrder.orderSource == 1}">
						<th width="12%">订单来源</th>
						<td class="nwp"><c:out value="待客下单"></c:out></td>
					</c:when>
					<c:otherwise>
						<th width="12%">
						</th>
						<td class="nwp">
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th width="12%">下单用户：</th>
				<td width="21%" class="nwp">${ebco.ebOrder.userName}</td>
				<th width="12%">支付方式:</th>
				<c:choose>
					<c:when test="${ebco.ebOrder.orderSource == 1}">
						<td class="nwp"><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
						<th width="12%">待客下单人</th>
						<td class="nwp"><c:out value="${ebco.ebOrder.orderExt5 }"></c:out></td>
					</c:when>
					<c:otherwise>
						<td class="nwp" colspan="3"><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<c:if test="${ebco.ebOrder.payable != 0}">
				<tr>
					<th>发票抬头：</th>
					<td class="nwp"><ui:orderState var="${ebco.ebOrder.payable}" type="5" /></td>
					<th>单位名称：</th>
					<td width="21%" class="nwp">${ebco.ebOrder.company}</td>
					<th width="12%">发票内容：</th>
					<td class="nwp"><ui:orderState var="${ebco.ebOrder.contents}" type="6" /></td>
				</tr>
			</c:if>
			<tr>
				<th>送货方式：</th>
				<td>
					<c:choose>
						<c:when test="${ebco.ebOrder.deliveryMethod == 2}">到厅自提</c:when>
						<c:otherwise>快递</c:otherwise>
					</c:choose>
				<th>送货时间：</th>
				<td>
					<c:choose>
						<c:when test="${ebco.ebOrder.deliveryMethod == 2}"></c:when>
						<c:otherwise><ui:orderState var="${ebco.ebOrder.delivery}" type="7" /></c:otherwise>
					</c:choose>
				</td>
				<th>送货前电话确认：</th>
				<td><ui:orderState var="${ebco.ebOrder.isConfirm}"type="8" /></td>
			</tr>
			<tr>
				<th>收货人：</th>
				<td class="nwp">${ebco.ebOrder.shipName}</td>
				<th>联系方式：</th>
				<td><var>
					<c:choose>
						<c:when test="${not empty ebco.ebOrder.phone && not empty ebco.ebOrder.fixedPhone}">
							${ebco.ebOrder.phone}&nbsp;/&nbsp;${ebco.ebOrder.fixedPhone}
						</c:when>
						<c:when test="${not empty ebco.ebOrder.phone}">
							${ebco.ebOrder.phone}
						</c:when>
						<c:when test="${not empty ebco.ebOrder.fixedPhone}">
							${ebco.ebOrder.fixedPhone}
						</c:when>
					</c:choose>
				</var></td>
				<th>邮编：</th>
				<td><var>${ebco.ebOrder.zipCode}</var></td>
			</tr>
			<tr>
				<th>收货地址：</th>
				<td class="nwp" colspan="5">
				<c:if test="${ebco.ebOrder.province != ' '}">${ebco.ebOrder.province}&nbsp;</c:if>
				<c:if test="${ebco.ebOrder.city != ' '}">${ebco.ebOrder.city}&nbsp;</c:if>
				<c:if test="${ebco.ebOrder.district != ' '}">${ebco.ebOrder.district}&nbsp;</c:if>
				<c:out value="${ebco.ebOrder.addr}"></c:out>
				</td>
			</tr>
			<tr>
				<th>用户备注:</th>
				<td class="nwp" colspan="5">${ebco.ebOrder.notes}</td>
			</tr>
		</table>
			
		<!-- 根据分类显示详情 -->
		<c:choose>
			<%-- 裸机 --%>
			<c:when test="${ebco.ebOrder.orderType == 1 || ebco.ebOrder.orderType == 4 || ebco.ebOrder.orderType == 5}">
				<table cellspacing="0" summary="" class="tab3">
					<tr>
						<th width="12%">商品编号</th>
						<th width="12%">商品名称</th>
						<th width="15%">规格</th>
						<th width="15%">包装清单</th>
						<th width="15%">单价</th>
						<th>数量</th>
						<th>串号</th>
					</tr>
					<c:forEach items="${ebco.ebOrderItemDetail}" var="e">
					<tr>
						<td>${e.itemNo}</td>
						<td class="nwp">${e.itemName}</td>
						<td>${e.skuSpec}</td>
						<td><a href="javascript:void(0);" onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>
						<td><fmt:formatNumber value="${e.price/100}" pattern="#0.00"/>元</td>
						<td>${e.quantity}个</td>
						<td id="tds${e.skuId}">
							<c:choose>
								<c:when test="${ebco.ebOrder.orderState==2}">
									<div id="showSCdiv${e.skuId}">
										<span id="showSCSspan${e.skuId}"></span><br>
										<a href="javascript:void(0);" onclick="showSeriesCode('${e.skuId}')">录入串号</a>
									</div>
									<div id="tddiv${e.skuId}" style="display:none">
										<c:forEach var="x" begin="1" end="${e.quantity}" step="1">
											<input id="${x}seriesCode${e.skuId}" name="seriesCode" type="text" class="text small2" reg="^[0-9]{15}$" tip="串号应输入15位数字！ " />
											<span id="${x}seriesCode${e.skuId}pos"></span>
											<br>
										</c:forEach>
										<input type="text" style="display:none">
									</div>
									<div id="hideSCdiv${e.skuId}" style="display:none">
										<a href="javascript:void(0);" onclick="hideSeriesCode('${e.skuId}')">确定</a>
									</div>
								</c:when>
								<c:otherwise>
									${e.seriescode}
								</c:otherwise>
							</c:choose>
							<input type="hidden" id="seriesCodes${e.skuId}" name="seriesCodes${e.skuId}" scs="0" value="" />
							<input type="hidden" id="seriesCodeNum${e.skuId}" name="seriesCodeNum${e.skuId}" value="${e.quantity}" />
						</td>
					</tr>
					</c:forEach>
				</table>
			</c:when>
			<%-- 号卡 --%>
			<c:when test="${ebco.ebOrder.orderType == 2}">
				<table cellspacing="0" summary="" class="tab3">
					<tr>
						<th>入网姓名</th>
						<th>证件类型</th>
						<th>证件号码</th>
						<th>证件地址</th>
					</tr>
					<c:forEach items="${ebco.ebOrderSimDtail}" var="e">
						<c:if test="${e.ebSimIdcard!=null}">
							<tr>
								<td><c:out value="${e.ebSimIdcard.subscriberName}"></c:out></td>
								<td>
									<c:choose>
										<c:when test="${e.ebSimIdcard.idcardType==1}">身份证</c:when>
										<c:when test="${e.ebSimIdcard.idcardType==2}">军官证</c:when>
										<c:otherwise>未知</c:otherwise>
									</c:choose>
								</td>
								<td><c:out value="${e.ebSimIdcard.idNum}"></c:out></td>
								<td><c:out value="${e.ebSimIdcard.idAddr}"></c:out></td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<table cellspacing="0" summary="" class="tab3">
					<tr>
						<th width="12%">商品编号</th>
						<th>商品名称</th>
						<th>单价(号码预存 + 套餐预存 + 押金 + SIM卡费)</th>
						<th>ICCID</th>
					</tr>
					<c:forEach items="${ebco.ebOrderSimDtail}" var="e">
						<tr>
							<td><c:out value="${e.itemNo}"></c:out></td>
							<td class="nwp">
								号码: <c:out value="${e.itemName}"></c:out></br>
								归属地: <c:out value="${ebco.ebOrder.areaName}"></c:out></br>
								品牌: <c:out value="${e.skuSpec}"></c:out></br>
								基本套餐: <c:out value="${e.offerGroupName}"></c:out></br>
								<c:if test="${fn:length(ebco.cardSuitType0) > 0}">
									必选业务: 
									<c:forEach items="${ebco.cardSuitType0}" var="suitType0">
										<c:out value="${suitType0.name}"></c:out>&nbsp;
									</c:forEach></br>
								</c:if>
								<c:if test="${fn:length(ebco.cardSuitType1) > 0}">
								可选业务: 
								<c:forEach items="${ebco.cardSuitType1}" var="suitType1">
									<c:out value="${suitType1.name}"></c:out>&nbsp;
								</c:forEach>
								<c:if test="${fn:length(ebco.cardSuitType2) > 0}">
									<c:forEach items="${ebco.cardSuitType2}" var="suitType2">
										<c:out value="${suitType2.name}"></c:out>&nbsp;
									</c:forEach>
								</c:if>
							</c:if>
							</td>
							<td><fmt:formatNumber value="${e.prepaid/100}" pattern="#0.00"/>+
								<fmt:formatNumber value="${e.refundMonthly/100}" pattern="#0.00"/>+
								<fmt:formatNumber value="${e.refund1stMonth/100}" pattern="#0.00"/>+
								<fmt:formatNumber value="${e.refundLastMonth/100}" pattern="#0.00"/>=
								<fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元
							</td>
							<c:choose>
								<c:when test="${ebco.ebOrder.orderState==2}">
									<!-- <td>
										<input id="shortName" name="shortName"   type="text" class="text small2" />
										<input type="text" style="display:none">
									</td> -->
									<td>
										<p><input id="shortName2" name="shortName2"   type="text" class="text small2" /></p>
										<p><a href="###" onclick="getIccid('${e.itemName}','${ebco.ebOrder.areaCode}')">白卡获取ICCID</a></p>
										<input type="text" style="display:none">
									</td>
								</c:when>
								<c:otherwise>
									<td><c:out value="${e.shortName2}"></c:out></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<%-- 营销案 --%>
			<c:when test="${ebco.ebOrder.orderType == 3}">
				<table cellspacing="0" summary="" class="tab3">
					<tr>
						<th width="12%">档次编号</th>
						<th width="12%">商品编号</th>
						<th width="15%">商品名称</th>
						<th width="15%">规格</th>
						<th width="12%">包装清单</th>
						<th>活动名称</th>
						<th>购机价</th>
						<th>实付价</th>
						<th>数量</th>
						<th>串号</th>
					</tr>
					<c:forEach items="${ebco.ebOrderOfferDetail}" var="e">
					<c:if test="${e.orderDetailType==3}">
					<tr>
					 <td>${e.offerNo}</td>
					 <td>${e.itemNo}</td>
					 <td class="nwp">${e.itemName}</td>
					 <td>${e.skuSpec}</td>
				     <td><a href="javascript:void(0);" onclick="getBzqd(${e.itemNo});">查看包装清单</a></td>	 
					 <td class="nwp">${e.offerGroupName}${e.shortName}${e.shortName2}</td>
					 <td class="nwp"><fmt:formatNumber value="${e.purchasePrice/100}" pattern="#0.00" />元</td>
				   	 <td class="nwp"><fmt:formatNumber value="${e.paymentPrice/100}" pattern="#0.00" />元</td>
					 <td>1个</td>
					 <td>
					 	<c:choose>
							<c:when test="${ebco.ebOrder.orderState==2}">
								<input id="seriesCode" name="seriesCode"   type="text" class="text small2" />
								<input type="text" style="display:none">
							</c:when>
							<c:otherwise>
								${e.seriescode}
							</c:otherwise>
						</c:choose>
					</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
				
				<h2 class="h2" title="业务信息">业务信息</h2>
				<table cellspacing="0" summary="" class="tab3">
					<tr>
						<th width="12%">业务协议期</th>
						<th width="12%">月承诺话费</th>
						<th width="15%">预存/赠送话费</th>
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
					 <td><c:out value="${e.offerTerm}"/>个月</td>
					 <td><fmt:formatNumber value="${e.commitMonthly/100}" pattern="#0.00"/>元</td>
					 <td class="nwp"><fmt:formatNumber value="${e.prepaid/100}" pattern="#0.00"/>元</td>
				     <td><c:if test="${e.period==0}">立即返还</c:if><c:if test="${e.period!=0}">${e.period}个月</c:if></td>	 
					 <td class="nwp"><fmt:formatNumber value="${e.refundMonthly/100}" pattern="#0.00"/>元</td>
					 <td class="nwp"><fmt:formatNumber value="${e.refund1stMonth/100}" pattern="#0.00"/>元</td>
					 <td class="nwp"><fmt:formatNumber value="${e.refundLastMonth/100}" pattern="#0.00"/>元</td>
					 <td class="nwp">${e.ebOffer.notes}</td>
					 <td class="nwp">${e.offerName}</td>
					</tr>
					</c:if>
					</c:forEach>
				</table>
			</c:when>
		</c:choose>
		
		<!-- 金额合计 -->
		<div class="page_c">
			<span class="r">商品金额合计：<fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元&nbsp;&nbsp;&nbsp;
					 运费：0.00元 &nbsp;&nbsp;&nbsp; 应付金额： <b class="f16 red"><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元</b>
			</span>
		</div>
								
	</div>
<div id="tab_2" style="display: none">
	<table cellspacing="0" summary="" class="tab3">
		<tr><th width="12%">支付流水号：</th><td>${epr.payRecordNum}</td></tr>
		<tr><th width="12%">支付方式：</th><td><ui:orderState var="${ebco.ebOrder.payment}" type="2" /></td></tr>
		<tr><th width="12%">支付平台：</th><td>${epr.poName}</td></tr>
		<tr><th width="12%">支付金额：</th><td><fmt:formatNumber value="${ebco.ebOrder.orderSum/100}" pattern="#0.00"/>元</td></tr>
		<tr><th width="12%">支付状态：</th><td><ui:orderState var="${ebco.ebOrder.isPaid}" type="3" /></td></tr>
		<tr><th width="12%">付款时间：</th><td><var><fmt:formatDate value="${ebco.ebOrder.payTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var></td></tr>
		<tr><th width="12%">到账时间：</th><td><var><fmt:formatDate value="${ebco.ebOrder.depositTime}"pattern="yyyy-MM-dd" /></var></td></tr>
	</table>
</div>		

					
<div id="tab_3" style="display: none">
	<table cellspacing="0" summary="" class="tab">
		<tr> 
		<th width="12%">操作类型</th> 
		<th width="12%">操作时间</th> 
		<th width="15%">操作人</th> 
		<th>操作备注</th> 
		</tr> 
		<c:forEach items="${ebJbpmLog}" var="e"> 
		<tr> 
		<td>${e.oper}</td> 
		<td><fmt:formatDate value="${e.operTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> 
		<td class="nwp">${e.operUser}</td> 
		<td class="nwp"><c:out value="${e.note}"/></td>
		</tr> 
		</c:forEach> 
	</table> 
</div>

</form>

</div></div>
</body>

