<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>订单详情_CRM单_<fmt:message key="OrderMgmtMenu.title"/></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="OrderMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">

function sub1(value){		
	$("#errorInfoAdd").html("<label>&nbsp;</label>");
    $("#itemNote").val("");
    tipHide("#errorInfoAdd");
    //var d=$("#addItemNote h2").attr("title","系统提示").html("系统提示");
    if(value.indexOf("失败")!=-1||value.indexOf("异常")!=-1){
		tipShow('#addItemNote');
    }else{
    	tipShow("#confirmDiv");
    }
    $("#r").val(value);
}

$(function(){
	$("#addItemNoteH2").html('办理异常推至外呼');
	
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
	
	$("#confirmDivOk").bind("click",function(){
		crm();
	});
	$("input[id='addItemNoteConfirm']").click(function(){
		
		var note=$("#itemNote").val();
		
		if(note.length>200){
			tipShow("#errorInfoAdd");
			$("#errorInfoAdd").html("<label>&nbsp;</label>操作备注不能大于200个字符");
			return;
		}
		tipHide('#addItemNote');
		tipShow("#refundLoadDiv");
		setTimeout(crm,500);
        
	});
	
	function crm() {
		var note = $("#itemNote").val();
		var oprType=$("#oprType").val();
		var orderNum=$("#orderNum").val();
		var taskId=$("#taskId").val();
		var r=$("#r").val();
		
		$.ajax({
			type : "POST",
			async : false,
			url : "${path}/order/doAjaxCrm.do",
			data:{
				orderNum:orderNum,
				oprType:oprType,
				note:note,
				taskId:taskId,
				r:r
			},
			success : function(responseText) {
				var dataObj = eval("(" + responseText + ")");
				var txt = dataObj[0].txt;
				alert(txt);//弹出办理结果提示信息
				tipHide("#refundLoadDiv");
				//$('#query11').html(txt);				
				//tipShow('#queryDiv');
				var oprType=$("#oprType").val();
			    if(oprType=="2"){
			    	window.location.href="${path}/order/orderValid.do?orderState=3"
			    	
			    } else {
			    	window.location.href="${path}/order/orderCrm.do?orderState=3"
			    }
			}
		});
		
		}
	
	/*
	$("#r").click(function(){
	    tipHide("#errorInfoAdd");
	    var d=$("#addItemNote h2").attr("title","系统提示").html("系统提示");
			tipShow('#addItemNote');
	});
	*/
	
	$("#addItemNoteClose").click(function(){
		tipHide('#addItemNote');
		$("#itemNote").val("");
	});
	$("#addItemNoteReset").click(function(){
		tipHide('#addItemNote');
		$("#itemNote").val("");
	});
	$("#but1").click(function(){
		var oprType=$("#oprType").val();
	    if(oprType=="2"){
	    	window.location.href="${path}/order/orderValid.do?orderState=3"
	    	
	    } else {
	    	window.location.href="${path}/order/orderCrm.do?orderState=3"
	    }
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
    <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='OrderMgmtMenu.title'/>&nbsp;&raquo;&nbsp;CRM单&nbsp;&nbsp;<span class="gray" title="订单详情"></span>
    </c:if>
</div>
<form id="myForm" action="${path}/order/orderCrm/oper.do" method="post">
    <input type="hidden" name="taskId" id="taskId" value="${taskId}"/>
    <input type="hidden" name="userId" id="userId" value="${userId}"/>
    <input type="hidden" name="orderNum" id="orderNum" value="${ebco.ebOrder.orderNum}"/>
    <input type="hidden" name="oprType" id="oprType" value="${oprType}"/>

   <div class="sch page_c">
    	<span class="l">
    	 订单号：<b class="red"><var>${ebco.ebOrder.orderNum}</var></b>&nbsp;&nbsp;&nbsp;下单时间：<var><fmt:formatDate value="${ebco.ebOrder.orderTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var>&nbsp;&nbsp;&nbsp;<b class="f14 blue"><ui:orderModule var="${ebco.ebOrder.orderState}" type="4"/>
    	<c:if test="${ebco.ebOrder.orderState != 3 }"> (<var><fmt:formatDate value="${ebco.ebOrder.crmCallsTime}"pattern="yyyy-MM-dd HH:mm:ss" /></var>)</c:if>
    	 </b>&nbsp;&nbsp;&nbsp;
    	<c:if test="${ebco.ebOrder.orderState == 3 && oprType !=1}">
    		<ui:permTag src="/ecps/console/order/orderCrm/oper.do">
    		<!-- 
    		<input type="button" name="r" class="pointer" id="r" value="CRM开始办理"/>
    		-->
    		<input type="button" onclick="sub1('办理成功');" class="pointer sub1" value="办理成功"/>
    		<input type="button" onclick="sub1('办理异常推至外呼');" class="pointer sub1" value="异常推至外呼"/>（以上按钮为测试使用）
    		<input type="button" onclick="sub1('CRM开始办理');" class="pointer sub1" value="CRM开始办理"/><!-- （调用crm接口使用） -->
    		<input type="hidden" id="r" />
     
            </ui:permTag>
            </c:if>
    	</span>
	</div>

<h2 class="h2_ch"><span id="tabs" class="l">
<a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" ref="#tab_2" title="支付信息" class="nor">支付信息</a>
<a href="javascript:void(0);" ref="#tab_3" title="操作记录" class="nor">操作记录</a>
</span>
<span class="r"><input type="button" class="pointer" onclick="window.open('${base}/order/preview.do?orderId=${ebco.orderId}&type=4','_blank','height=300,width=500,scrollbars=yes,location=no,resizable=yes')" value="打印订单" /><input type="button" class="pointer" onclick="window.history.back(-1);" value="返回列表"/></span>
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
						<td class="nwp"><c:out value="套卡"></c:out></td>
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
		<%-- 裸机/团购裸机 /秒杀裸机--%>
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
					<td>${e.seriescode}</td>
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
						<td><c:out value="${e.shortName2}"></c:out></td>
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
				 <td>${e.seriescode}</td>
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

