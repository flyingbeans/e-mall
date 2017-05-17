<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>商品销量报表_报表管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/fusionchart/js/FusionCharts.js'/>"></script>
<script type="text/javascript">
//光标进入商品框 
function onfocusOfferGroupName(){
	if($("#offerGroupName").val()=='请输入营销案名称'){
		$("#offerGroupName").val('');
	}
}
//光标进入商品框 onblurOfferGroupName
function onblurOfferGroupName(){
	if($("#offerGroupName").val()==''){
		$("#offerGroupName").val('请输入营销案名称');
	}
}
//提交表单验证
function submitForm(){
	if($("#offerGroupName").val()== '' || $("#offerGroupName").val()=="请输入营销案名称"){
		 $("#offerGroupName").val(null);
	}
	var beginTime = $("#beginTime").val();
	var endTime = $("#endTime").val();
	if(beginTime== '' || beginTime=="请选择开始时间"){
		alert("请选择开始时间");
		return false;
	}else if(endTime== '' || endTime=="请选择结束时间"){
		alert("请选择结束时间");
		return false;
	}else if(beginTime == endTime){
		alert("开始时间不能等于结束日期");
		return false;
	}else if(beginTime > endTime){
		alert("开始时间不能大于结束日期");
		return false;
	}
	document.getElementById("form1").submit();
}
function exportMarketSalesReport(){
	submitForm();
	var form = document.getElementById("form1");
	form.action = "${base}/report/exportMarketSalesReport_marketingcase.do";
	form.submit();
	form.action = "${base}/report/getMarketSalesReport_marketingcase.do?reportType=3";
}
//文档加载完，默认选中
$(document).ready(function(){
	var offerGroupNameReturn = '${offerGroupName}';
	if(offerGroupNameReturn != ''){
		$("#offerGroupName").attr('value',offerGroupNameReturn);
	}else{
		$("#offerGroupName").attr('value','请输入营销案名称');
	}
	
	var cityArea = '${cityArea}';
	if(cityArea != ''){
		var cityAreas = $('#cityArea').find('option');
		for(var i=0;i<cityAreas.length;i++){
			var thisCityArea = cityAreas[i];
			if(cityArea == thisCityArea.value){
				thisCityArea.selected = true;
			}
		}
	}else{
		var cityAreas = $('#cityArea').find('option');
		for(var i=0;i<cityAreas.length;i++){
			var thisCityArea = cityAreas[i];
			if('' == thisCityArea.value){
				thisCityArea.selected = true;
			}
		}
	}
	
	if('${beginTime}' != '' && '${beginTime}' !="请选择开始时间"){
		$("#beginTime").val('${beginTime}');
	}
	if('${endTime}' != ''&& '${endTime}' !="请选择结束时间"){
		$("#endTime").val('${endTime}');
	}
});
</script>
</head>
<body id="main">

	<div class="frameL"><div class="box"><div class="menu icon">
	    <jsp:include page="/${system }/common/reportMenu.jsp"/>
	</div></div></div>
	
	<div class="frameR"><div class="content">
			<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：报表管理&nbsp;&raquo;&nbsp;<span class="gray">商品销量报表</span>
	    	</div>
	    	<h2 class="h2_ch"><span id="tabs" class="l">
		        <a id="label1" href="${base}/report/getMarketSalesReport_baremachine.do?reportType=1"   title="裸机" class="nor">裸机</a>
		        <a id="label2" href="${base}/report/getMarketSalesReport_marketingcase.do?reportType=3"   title="营销案" class="here">营销案</a>
		        <%-- <a id="label3" href="${base}/report/getMarketSalesReport_simcard.do?reportType=2" class="nor">号卡</a> --%>
		    </span></h2>							
		<form id="form1" name="form1" action="${base}/report/getMarketSalesReport_marketingcase.do?reportType=3" method="post">
			<div class="sch">
				<p>
					归属地:
					<select id="cityArea" name="cityArea">
						<option value="" class="text20  gray">全省</option>
						<c:forEach items="${list_cityArea}" var="ebCityArea">
							<option value="${ebCityArea.areaCode }" class="text20  gray">
								<c:out value="${ebCityArea.areaName }"></c:out>
							</option>
						</c:forEach>
					</select>
					名称:
					<input type="text" id="offerGroupName" name="offerGroupName" class="text20 medium gray" value="请输入营销案名称" onfocus="onfocusOfferGroupName()" onblur="onblurOfferGroupName()">
					开始时间:
					<input type="text" id="beginTime" name="beginTime" onfocus="WdatePicker()" class="text20 date gray" value="请选择开始时间" readonly="readonly"/>
					结束时间:
					<input type="text" id="endTime" name="endTime" onfocus="WdatePicker()" class="text20 date gray" value="请选择结束时间" readonly="readonly"/>
					&nbsp;&nbsp;
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
					&nbsp;&nbsp;备注: 如果查询结果数量超过10条，则只显示前10条数据
				</p>
			</div>
	  		<div id="chartDiv" class="page_c"></div>
			<table class="tab" cellspacing="0" >
				<thead>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>曲线图色值</th>
					<th>营销案名称</th>
					<th>机型名称</th>
					<th>归属地</th>
					
					
					<th>销量</th>
					<th>金额（元）</th>
				</thead>
				<tbody>
					<c:set var="skuIndex" value="0"/>
					<c:set var="offerGroupName" value=""/>
					<c:forEach items="${map_offerGroup_tab }" var="mapOfferGroup">
						<c:forEach items="${mapOfferGroup.value}" var="mapItemName">
							<c:forEach items="${mapItemName.value}" var="mapAreaName">
								<c:choose>
									<c:when test="${mapOfferGroup.key != offerGroupName}">
										<tr>
											<td>
												<c:out value="${beginTime }"></c:out>
											</td>
											<td>
												<c:out value="${endTime }"></c:out>
											</td>
											<td style="text-align:center"><span class="nail n0${skuIndex}"></span></td>
											<td>
												<c:out value="${mapOfferGroup.key}"></c:out>
											</td>
											<td>
												<c:out value="${mapItemName.key}"></c:out>
											</td>
											<td>
												<c:out value="${mapAreaName.key}"></c:out>
											</td>
											
											
											<td>
												<c:out value="${mapAreaName.value.sumQuantity}"></c:out>
											</td>
											<td>
												<c:out value="${mapAreaName.value.sumPrice}"></c:out>	
												
											</td>
										</tr>
									</c:when>
									<c:when test="${mapOfferGroup.key == offerGroupName}">
										<tr>
											<td>
												&nbsp;
											</td>
											<td>
												&nbsp;
											</td>
											
											<td>&nbsp;</td>
											
											<td>&nbsp;</td>
											<td>
												<c:out value="${mapItemName.key}"></c:out>
											</td>
											<td>
												<c:out value="${mapAreaName.key}"></c:out>
											</td>
											
											<td>
												<c:out value="${mapAreaName.value.sumQuantity}"></c:out>
											</td>
											<td>
												<c:out value="${mapAreaName.value.sumPrice}"></c:out>
											</td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
							
							
							<c:set var="offerGroupName" value="${mapOfferGroup.key}"/>
							<c:set var="skuIndex" value="${skuIndex + 1}"/>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				var width = "100%";
				var labStep = 1;
				var date_tag_day= ${date_tag_day};
				if(date_tag_day != 0 && date_tag_day >= 30){
					labStep = date_tag_day/15;
				}
				var chart = new FusionCharts("<c:url value='/ecps/console/fusionchart/Charts/MSLine.swf'/>","ChartId",width,"350","0","0");
				var xmlData = "<graph baseFont='宋体' baseFontSize='16' palette='3' caption='营销案销售量' subCaption='' "
								+"showValues='0' divLineDecimalPrecision='1' limitsDecimalPrecision='1' yAxisName='数量(个)' xAxisName='' numberPrefix='' "
								+"formatNumberScale='0' labelDisplay='ROTATE' slantLabels='1' showLegend='0' labelStep='"+labStep+"'>";
					
					//判断map不等于null时，默认显示图表
					<c:choose>
						<c:when test="${map_offerGroup_chart != null}">
							xmlData += "<categories>";
							<c:forEach items="${map_offerGroup_chart }" var="mapOfferGroup" varStatus="idxStatus">
								<c:if test="${idxStatus.index == 0}">
									<c:forEach items="${mapOfferGroup.value}" var="mapDate">
										xmlData += "<category name='${mapDate.key}' />";
									</c:forEach>
								</c:if>
							</c:forEach>
							xmlData += "</categories>";
						</c:when>
						<c:otherwise>
							xmlData += "<categories>";
								xmlData += "<category name='10007-06-06' />";
								xmlData += "<category name='10007-06-07' />";
							xmlData += "</categories>";
							xmlData += "<dataset seriesName='默认商品' renderAs='Line' >";
								
							xmlData +=	"</dataset>";
						</c:otherwise>
					</c:choose>
							
							//默认显示报表为空并判断
							var quantity_all = 0;
							<c:forEach items="${map_offerGroup_chart }" var="mapOfferGroup">
									//判断是否显示该曲线
									var quantity_temp = 0;
									<c:forEach items="${mapOfferGroup.value}" var="marketingcase">
										quantity_temp += ${marketingcase.value.sumQuantity};
									</c:forEach>
										quantity_all += quantity_temp;
									//显示曲线
									if(quantity_temp > 0){
										xmlData += "<dataset seriesName='${mapOfferGroup.key}' renderAs='Line' >";
										//开始显示线条
										<c:forEach items="${mapOfferGroup.value}" var="marketingcase">
											<c:if test="${marketingcase != null && marketingcase.value != null }">
												xmlData += "<set value='${marketingcase.value.sumQuantity}' />";
											</c:if>
										</c:forEach>
										xmlData +=	"</dataset>";
									}
								//结束显示线条
							</c:forEach>
							if(quantity_all <= 0){
								xmlData += "<dataset seriesName='默认商品' renderAs='Line' >";
								xmlData +=	"</dataset>";
							}
							xmlData += "</graph>";
							xmlData = xmlData.replace(/\"/g,'\'');
							chart.setDataXML(xmlData);    
							chart.render("chartDiv");
			</script>
			<div class="page_c">
				<span class="r inb_a">
					<input type="button"  class="btn80x20" value="导出查询结果" onclick="exportMarketSalesReport()" />
				</span>
			</div>				
		</form>
	</div></div>
</body>