<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单总览报表_报表管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/fusionchart/js/FusionCharts.js'/>"></script>
<script type="text/javascript">
function submitForm(){
	var beginTime = $("#beginTime").val();
	var endTime = $("#endTime").val();
	if(beginTime== '' || beginTime=="请选择开始时间"){
		alert("请选择开始时间");
		return false;
	}else if(endTime== '' || endTime=="请选择结束时间"){
		alert("请选择结束时间");
		return false;
	}else if(beginTime > endTime){
		alert("开始时间不能大于结束日期");
		return false;
	}
	document.getElementById("form1").submit();
}
function exportOrderSummaryReport(){
	var form = document.getElementById("form1");
	form.action = "${base}/report/exportOrderSummaryReport.do";
	form.submit();
	form.action = "${base}/report/orderSummaryReport.do";
}
//文档加载完，默认选中
$(document).ready(function(){
	if('${beginTime}' != '' && '${beginTime}' !="请选择开始时间"){
		$("#beginTime").val('${beginTime}');
	}
	if('${endTime}' != ''&& '${endTime}' !="请选择结束时间"){
		$("#endTime").val('${endTime}');
	}
	//默认选中订单类型
	var orderTypeRetn = '${orderType}';
	if(orderTypeRetn != ''){
		var orderTypes = $('#orderType').find('option');
		for(var i=0;i<orderTypes.length;i++){
			var thisOrderType = orderTypes[i];
			if(orderTypeRetn == thisOrderType.value){
				thisOrderType.selected = true;
			}
		}
	}
	//默认选中商品类型
	var itemTypeRetn = '${itemType}';
	if(itemTypeRetn != ''){
		var itemTypes = $('#itemType').find('option');
		for(var i=0;i<itemTypes.length;i++){
			var thisItemType = itemTypes[i];
			if(itemTypeRetn == thisItemType.value){
				thisItemType.selected = true;
			}
		}
	}
	
});
</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/reportMenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：报表管理&nbsp;&raquo;&nbsp;<span class="gray">订单总览报表</span>
	    </div>
	    
		<form id="form1" name="form1" action="${base}/report/orderSummaryReport.do" method="post">
			<div class="sch">
				<p>
					开始时间:
					<input type="text" id="beginTime" name="beginTime" onfocus="WdatePicker()" class="text20 date gray" value="请选择开始时间" readonly="readonly"/>
					结束时间:
					<input type="text" id="endTime" name="endTime" onfocus="WdatePicker()" class="text20 date gray" value="请选择结束时间" readonly="readonly"/>
					订单类型:
					<select id="orderType" name="orderType">
						<option value="" class="text20 date gray">请选择订单类型</option>
						<option value="order_valid" class="text20 date gray">有效订单</option>
						<option value="order_cancelled" class="text20 date gray">作废订单</option>
					</select>
					商品类型:
					<select id="itemType" name="itemType">
						<option value="" class="text20 date gray">请选择商品类型</option>
						<option value="1" class="text20 date gray">裸机</option>
						<option value="3" class="text20 date gray">营销案</option>
						<!-- 辽宁2期屏蔽 by zhangjb -->
						<!-- <option value="2" class="text20 date gray">号卡</option>
						<option value="4" class="text20 date gray">团购</option>
						<option value="5" class="text20 date gray">秒杀</option> -->
					</select>
					&nbsp;&nbsp;
					<input type="button" onclick="javascript:submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
					&nbsp;&nbsp;备注: 日期以下单日期为准
				</p>
			</div>
			<div id="chartDiv" class="page_c"></div>
			<table class="tab" cellspacing="0" >
				<thead>
					<th>开始日期</th>
					<th>结束日期</th>
					<th>订单类型</th>
					<th>商品类型</th>
					<th>数量</th>
					
				</thead>
				<tbody>
					<c:forEach items="${map_order_tab}" var="map_order_tab">
						<c:forEach items="${map_order_tab.value}" var="map_order_tab_detail">
							<tr>
								<td>${beginTime}</td>
								<td>${endTime}</td>
								<td>${map_order_tab.key}</td>
								<td>${map_order_tab_detail.key}</td>
								<td>${map_order_tab_detail.value}</td>
							</tr>
						</c:forEach>
						
					
					</c:forEach>
					
				</tbody>
			</table>
			<script type="text/javascript">
				var width = "100%";
				var chart = new FusionCharts("<c:url value='/ecps/console/fusionchart/Charts/Column2D.swf'/>","ChartId",width,"350","0","0");
				var xmlData = "<graph rotateYAxisName='0' baseFont='宋体' baseFontSize='16' palette='3'  caption='订单总览'"
							+"xAxisName='订单类型' yAxisName='订单数量' showValues='1' decimals='0'  useRoundEdges='1' labelDisplay='ROTATE' slantLabels='1'>";
				var sum_order_valid = 0;
				var sum_order_cancelled = 0;
				<c:forEach items="${map_order_tab}" var="map_order_tab">
					<c:forEach items="${map_order_tab.value}" var="map_order_tab_detail">
						<c:if test="${map_order_tab.key =='有效订单' }">
							sum_order_valid += ${map_order_tab_detail.value};
						</c:if>
						<c:if test="${map_order_tab.key =='作废订单'}">
							sum_order_cancelled += ${map_order_tab_detail.value};
						</c:if>
					</c:forEach>
				</c:forEach>
				if('${orderType}' == 'order_valid'){
					xmlData += "<set name='有效订单' value='"+sum_order_valid+"' />";
				}else if('${orderType}'  == 'order_cancelled'){
					xmlData += "<set name='作废订单' value='"+sum_order_cancelled+"' />";
				}else{
					xmlData += "<set name='有效订单' value='"+sum_order_valid+"' />";
					xmlData += "<set name='作废订单' value='"+sum_order_cancelled+"' />";
				}
				xmlData += "</graph>";
				xmlData = xmlData.replace(/\"/g,'\'');
				chart.setDataXML(xmlData);    
				chart.render("chartDiv");
			</script>
			<div class="page_c">
				<span class="r inb_a">
					<input type="button"  class="btn80x20" value="导出查询结果" onclick="exportOrderSummaryReport()" />
				</span>
			</div>		
		</form>
</div></div>
</body>