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
function onfocusItemName(){
	if($("#itemName").val()=='请输入商品名称'){
		$("#itemName").val('');
	}
}
//光标进入商品框 onblurItemName
function onblurItemName(){
	if($("#itemName").val()==''){
		$("#itemName").val('请输入商品名称');
	}
}
//提交表单验证
function submitForm(){
	if($("#itemName").val()== '' || $("#itemName").val()=="请输入商品名称"){
		alert("请输入商品名称");
		return false;
	}
	if($("#dateTag").val()== '' || $("#dateTag").val()=="请选择日期类型"){
		alert("请选择日期类型");
		return false;
	}
	document.getElementById("form1").submit();
}
//文档加载完，默认选中
$(document).ready(function(){
	var itemNameReturn = '${itemName}';
	if(itemNameReturn != ''){
		$("#itemName").attr('value',itemNameReturn);
	}else{
		$("#itemName").attr('value','请输入商品名称');
	}
	
	var dateTagReturn = '${dateTag}';
	if(dateTagReturn != ''){
		var dateTags = $('#dateTag').find('option');
		for(var i=0;i<dateTags.length;i++){
			var thisDateTag = dateTags[i];
			if(dateTagReturn == thisDateTag.value){
				thisDateTag.selected = true;
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
			<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：报表管理&nbsp;&raquo;&nbsp;<span class="gray">商品销量报表</span>
	    	</div>
	    	<h2 class="h2_ch"><span id="tabs" class="l">
		        <a id="label1" href="${base}/item/listEntity.do"   title="裸机" class="nor">裸机</a>
		        <a id="label2" href="${base}/item/listEntity.do?showStatus=1"   title="营销案" class="nor">营销案</a>
		        <a id="label3" href="${base}/item/listEntity.do?showStatus=0"  title="号卡" class="nor">号卡</a>
		    </span></h2>
		<form id="form1" name="form1" action="${base}/report/marketSalesReport.do" method="post">
			<div class="sch">
				<p>
					商品名称:
					<input type="text" id="itemName" name="itemName" class="text20 medium gray" value="请输入商品名称" onfocus="onfocusItemName()" onblur="onblurItemName()">&nbsp;&nbsp;
					日期类型:
					<select id="dateTag" name="dateTag">
						<option value="" class="text20 date gray">请选择日期类型</option>
						<option value="nearOneWeek" class="text20 date gray">近一周</option>
						<option value="nearOneMonth" class="text20 date gray">近一个月</option>
					</select>&nbsp;&nbsp;
					<input type="button" onclick="submitForm()" class="hand btn60x20" value='<fmt:message key="tag.search"/>'/>
					&nbsp;&nbsp;备注: 如果查询结果数量超过10条，则只显示前10条数据
				</p>
			</div>
	    	<div class="page_c">
		        <span class="l">
		        </span>
		        <span class="r inb_a">
		        </span>
	  		</div>
	  		<div id="chartDiv"></div>
			
			<script type="text/javascript">
				var width = "100%";
				var chart = new FusionCharts("<c:url value='/ecps/console/fusionchart/Charts/MSLine.swf'/>","ChartId",width,"400","0","0");
				var xmlData = "<graph baseFont='宋体' baseFontSize='16' palette='3' caption='商品销售量' subCaption='' "
								+"showValues='0' divLineDecimalPrecision='1' limitsDecimalPrecision='1' yAxisName='数量(个)' xAxisName='日期' numberPrefix='' "
								+"formatNumberScale='0' labelDisplay='ROTATE' slantLabels='1'>";
					xmlData += "<categories>";
					<c:forEach items="${map_item }" var="mapItem" varStatus="idxStatus">
						<c:if test="${idxStatus.index == 0}">
							<c:forEach items="${mapItem.value}" var="item">
								xmlData += "<category name='${item.key}' />";
							</c:forEach>
						</c:if>
					</c:forEach>
					xmlData += "</categories>";
		
				<c:forEach items="${map_item }" var="mapItem">
					xmlData += "<dataset seriesName='${mapItem.key}' renderAs='Line' >";
						<c:forEach items="${mapItem.value}" var="item">
						xmlData += "<set value='${item.value}' />";
						</c:forEach>
					xmlData +=	"</dataset>";
		
				</c:forEach>
				xmlData += "</graph>";
				xmlData = xmlData.replace(/\"/g,'\'');
				chart.setDataXML(xmlData);    
				chart.render("chartDiv");
			</script>
		</form>
</div></div>
</body>