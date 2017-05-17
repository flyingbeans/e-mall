<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
<title>成交金额报表_报表管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/fusionchart/js/FusionCharts.js'/>"></script>
<script type="text/javascript">
//提交表单验证
function submitForm(){
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
function exportAmountReport(){
	var form = document.getElementById("form1");
	form.action = "${base}/report/exportAmountReport.do";
	form.submit();
	form.action = "${base}/report/amountReport.do";
}
//文档加载完，默认选中
$(document).ready(function(){
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

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/reportMenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content" style="overflow:auto" >
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：报表管理&nbsp;&raquo;&nbsp;<span class="gray">成交金额报表</span>
	    </div>
	    
		<form id="form1" name="form1" action="${base}/report/amountReport.do" method="post">
			<div class="sch">
				<p>
					开始时间:
					<input type="text" id="beginTime" name="beginTime" onfocus="WdatePicker()" class="text20 date gray" value="请选择开始时间" readonly="readonly"/>
					结束时间:
					<input type="text" id="endTime" name="endTime" onfocus="WdatePicker()" class="text20 date gray" value="请选择结束时间" readonly="readonly"/>
					&nbsp;&nbsp;
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
					&nbsp;&nbsp;备注: 日期以下单日期为准
				</p>
			</div>
			<div class="page_c" id="chartDiv"></div>
			
			<script type="text/javascript">
				var sumAmountValue = 0.00;
				var width = "100%";
				var labStep = 1;
				var date_tag_day= ${date_tag_day};
				if(date_tag_day != 0 && date_tag_day >= 30){
					labStep = date_tag_day/15;
				}
				var chart = new FusionCharts("<c:url value='/ecps/console/fusionchart/Charts/MSLine.swf'/>","ChartId",width,"350","0","0");
				var xmlData = "<chart baseFont='宋体' baseFontSize='16' palette='3' caption='成交金额' subCaption='' bgcolor='#f1f7fd' "
							+"showValues='0' divLineDecimalPrecision='1' limitsDecimalPrecision='1' yAxisName='金额(元)' xAxisName='' numberPrefix='' "
							+"formatNumberScale='0' labelDisplay='ROTATE' slantLabels='1' showLegend='0' labelStep='"+labStep+"'> ";
					xmlData += "<categories>";
						<c:forEach items="${map_sumPrice }" var="sumPrice" varStatus="idxStatus">
							xmlData += "<category label='${sumPrice.key}' />";
						</c:forEach>
					xmlData += "</categories>";
					xmlData += "<dataset  renderAs='Line' > color='#FF9999'";
						<c:forEach items="${map_sumPrice }" var="sumPrice">
							<c:choose>
								<c:when test="${sumPrice.value == null}">
									xmlData += "<set name='${sumPrice.key}' value='0' />";
								</c:when>
								<c:otherwise>
									xmlData += "<set name='${sumPrice.key}' value='${sumPrice.value}' />";
									sumAmountValue += ${sumPrice.value};
								</c:otherwise>
							</c:choose>
						</c:forEach>
					xmlData +=	"</dataset>";
				xmlData += "</chart>";
				xmlData = xmlData.replace(/\"/g,'\'');
				chart.setDataXML(xmlData);    
				chart.render("chartDiv");
			</script>
			<table class="tab" cellspacing="0" >
				<thead>
					<th>开始日期</th>
					<th>结束日期</th>
					<th>金额(元)</th>
				</thead>
				<tbody>
					<tr>
						<td>${beginTime}</td>
						<td>${endTime}</td>
						<td><script type="text/javascript">document.write((sumAmountValue).toFixed(2))</script> </td>
					</tr>
				</tbody>
			</table>
			<div class="page_c">
				<span class="r inb_a">
					<input type="button"  class="btn80x20" value="导出查询结果" onclick="exportAmountReport()" />
				</span>
			</div>
		</form>
</div></div>
	
</body>