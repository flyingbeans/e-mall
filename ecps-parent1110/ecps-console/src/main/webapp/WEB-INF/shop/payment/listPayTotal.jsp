<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付对账_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
   $(function(){
	   
	   var checkDate=$("#checkDate1").val();
	   $("#checkDateSpan").html(checkDate);
	   /*
	   $("#ecpsCheck").attr("href","${base}/payment/check/downFile.do?fileName=payRecord"+checkDate+".xls&checkDate="+checkDate);
	   $("#ldysCheck").attr("href","${base}/payment/check/downFile.do?fileName=2_"+checkDate+".txt&checkDate="+checkDate);
	   $("#payDiff").attr("href","${base}/payment/check/downFile.do?fileName=payDiff"+checkDate+".xls&checkDate="+checkDate);
	   $("#refunDiff").attr("href","${base}/payment/check/downFile.do?fileName=refundDiff"+checkDate+".xls&checkDate="+checkDate);
	   $("#allFile").attr("href","${base}/payment/check/downFile.do?fileName=allFile_"+checkDate+".zip&checkDate="+checkDate);
	   */
	   $("#ecpsCheck").click(function(){
		   window.location.href = "${base}/payment/check/downFile.do?fileName=payRecord"+checkDate+".xls&checkDate="+checkDate;
	   });
	   $("#ldysCheck").click(function(){
		   window.location.href = "${base}/payment/check/downFile.do?fileName=3718_"+checkDate+".txt&checkDate="+checkDate;
	   });
	   $("#tenpayCheck").click(function(){
		   window.location.href = "${base}/payment/check/downFile.do?fileName=tenpay_"+checkDate+".txt&checkDate="+checkDate;
	   });
	   $("#payDiff").click(function(){
		   window.location.href = "${base}/payment/check/downFile.do?fileName=payDiff"+checkDate+".xls&checkDate="+checkDate;
	   });
	   $("#refunDiff").click(function(){
		   window.location.href = "${base}/payment/check/downFile.do?fileName=refundDiff"+checkDate+".xls&checkDate="+checkDate;
	   });
	   $("#allFile").click(function(){
		   window.location.href = "${base}/payment/check/downFile.do?fileName=allFile_"+checkDate+".zip&checkDate="+checkDate;
	   });
	   $("#query").click(function(){
		   var checkDate=$("#checkDate").val();
		   if(checkDate==null||checkDate==''){
			   alert("请选择对账日期");
			   return;
		   }
		   var currentDate=new Date();
		   var tempStrArr=checkDate.split("-");
		   var yearInput=parseInt(tempStrArr[0]);
		   var monthInput=parseInt(tempStrArr[1]);
		   var dayInput=parseInt(tempStrArr[2]);
		   //if(yearInput<=currentDate.getFullYear()&&monthInput<=currentDate.getMonth()+1&&dayInput<=currentDate.getDate()-1){
			   $("#form1").submit();
		   //}else{
			//   alert("只能查询当前日期的前一天及之前的数据");
			 //  return;
		   //}
		  
	   });
	   
	   /*
	   $("#cannotDownload a").click(function(){
		   alert("对不起，没有文件可以下载");
	   });
	   */
	   $("#reCheck").click(function(){
		   var checkDate=$("#checkDate").val();
		   if(checkDate==null||checkDate==''){
			   alert("请选择重新对账日期");
			   return;
		   }
		   var currentDate=new Date();
		   var tempStrArr=checkDate.split("-");
		   var yearInput=parseInt(tempStrArr[0]);
		   var monthInput=parseInt(tempStrArr[1]);
		   var dayInput=parseInt(tempStrArr[2]);
		   //if(yearInput<=currentDate.getFullYear()&&monthInput<=currentDate.getMonth()+1&&dayInput<=currentDate.getDate()-1){
			   var form1=document.getElementById("form1");
			   
			   form1.action="${base}/payment/check/reCheckOperation.do";
			   
			   form1.submit();
		   //}else{
			//   alert("只能对当前日期的前一天及之前的数据进行重新对账");
			//   return;
		  // }
		  
	   });
	   
   });
</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<span class="gray">支付对账</span>
	    </div>
	    
		<form id="form1" name="form1" action="${base}/payment/check/listPayCheckTotal.do" method="post">
		   <input type="hidden"  id="checkDate1" value="${checkDate}"/>
			<div class="sch">
				<p>
					<span>
					     清算时间：<input type="text" id="checkDate" name="checkDate" dateFmt="yyyyMMdd" onfocus="WdatePicker({maxDate:'%y-%M-{%d-1}'})" class="text20 date" readonly="readonly"/>
					</span>
					<input type="button" id="query" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
					<input type="button" id="reCheck" class="hand btn60x20" value='重新对账'/>
				</p>
			</div>
	    	<div class="page_c">
		        <span class="l">对账日期：<span id="checkDateSpan"></span>
		        <c:if test="${reCheckResult!=null}">
		        <c:choose>
		           <c:when test="${reCheckResult=='success'}">
		                          对账状态：<span>对账成功</span>
		           </c:when>
		           <c:otherwise>
		                           对账状态：<span>对账失败 </span>  失败原因：<span><c:out value="${reCheckResult}"/></span>
		           </c:otherwise>
		        </c:choose>   
		        </c:if>
		        </span>
	  		</div>
	  		
			<table cellspacing="0" summary="" class="tab">
			  <tr>
			    <th rowspan="2" class="alg_c">机构名称</th>
			    <th rowspan="2" class="alg_c">对账状态</th>
			    <th colspan="5" class="alg_c">支付对账结果</th>
			    <th colspan="5" class="alg_c">退款对账结果</th>
			  </tr>
			  <tr>
			    <th>机构笔数</th>
			    <th>机构金额（元）</th>
			    <th>电商笔数</th>
			    <th>电商金额（元）</th>
			    <th>差额（元）</th>
			    <th>机构笔数</th>
			    <th>机构金额（元）</th>
			    <th>电商笔数</th>
			    <th>电商金额（元）</th>
			    <th>差额（元）</th>
			  </tr>
			  <c:forEach var="pt" items="${payTotalList}">
			   <tr>
			   <td class="alg_c">${pt.poName}</td>
			   <c:choose>
			      <c:when test="${pt.checkStatus=='1'}">
			         <td>对账成功</td>
			      </c:when>
			      <c:otherwise>
			         <td>对账失败</td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			      <c:when test="${pt.poPayTotal==null||pt.poPayTotal==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td>
			             ${pt.poPayTotal}
			         </td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			      <c:when test="${pt.poPayAmount==null||pt.poPayAmount==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td><fmt:formatNumber value="${pt.poPayAmount/100.00}" pattern="#0.00" /></td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${pt.ecPayTotal==null||pt.ecPayTotal==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td>${pt.ecPayTotal}</td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${pt.ecPayAmount==null||pt.ecPayAmount==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td><fmt:formatNumber value="${pt.ecPayAmount/100.00}" pattern="#0.00" /></td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${pt.payDiffAmount==null||pt.payDiffAmount==0}">
			         <td >0</td>
			      </c:when>
			      <c:when test="${pt.payDiffAmount>0}">
			         <td>+<fmt:formatNumber value="${pt.payDiffAmount/100.00}" pattern="#0.00" /></td>
			      </c:when>
			      <c:otherwise>
			          <td><fmt:formatNumber value="${pt.payDiffAmount/100.00}" pattern="#0.00" /></td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			      <c:when test="${pt.poRefundTotal==null||pt.poRefundTotal==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td>${pt.poRefundTotal}</td>
			      </c:otherwise>
			   </c:choose>
			    <c:choose>
			      <c:when test="${pt.poRefundAmount==null||pt.poRefundAmount==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td><fmt:formatNumber value="${pt.poRefundAmount/100.00}" pattern="#0.00" /></td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			      <c:when test="${pt.ecRefundTotal==null||pt.ecRefundTotal==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td>${pt.ecRefundTotal}</td>
			      </c:otherwise>
			   </c:choose>
			   <c:choose>
			      <c:when test="${pt.ecRefundAmount==null||pt.ecRefundAmount==0}">
			         <td >0</td>
			      </c:when>
			      <c:otherwise>
			         <td><fmt:formatNumber value="${pt.ecRefundAmount/100.00}" pattern="#0.00" /></td>
			      </c:otherwise>
			   </c:choose>
			   
			   <c:choose>
			      <c:when test="${pt.refundDiffAmount==null||pt.refundDiffAmount==0}">
			         <td >0</td>
			      </c:when>
			      <c:when test="${pt.refundDiffAmount>0}">
			         <td>+<fmt:formatNumber value="${pt.refundDiffAmount/100.00}" pattern="#0.00" /></td>
			      </c:when>
			      <c:otherwise>
			         <td><fmt:formatNumber value="${pt.refundDiffAmount/100.00}" pattern="#0.00" /></td>
			      </c:otherwise>
			   </c:choose>
			   </tr>
			 </c:forEach>
			 <tr class="bg_blue">
			   <td colspan="2" class="alg_c"><b>汇总</b></td>
			   <c:choose>
			     <c:when test="${payTotalSummary.poPayTotal==null||payTotalSummary.poPayTotal==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td>${payTotalSummary.poPayTotal}</td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.poPayAmount==null||payTotalSummary.poPayAmount==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td><fmt:formatNumber value="${payTotalSummary.poPayAmount/100.00}" pattern="#0.00"/></td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.ecPayTotal==null||payTotalSummary.ecPayTotal==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td>${payTotalSummary.ecPayTotal}</td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.ecPayAmount==null||payTotalSummary.ecPayAmount==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td><fmt:formatNumber value="${payTotalSummary.ecPayAmount/100.00}" pattern="#0.00"/></td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.payDiffAmount==null||payTotalSummary.payDiffAmount==0}">
			        <td>0</td>
			     </c:when>
			     <c:when test="${payTotalSummary.payDiffAmount>0}">
			         <td>+<fmt:formatNumber value="${payTotalSummary.payDiffAmount/100.00}" pattern="#0.00"/></td>
			     </c:when>
			     <c:otherwise>
			        <td><fmt:formatNumber value="${payTotalSummary.payDiffAmount/100.00}" pattern="#0.00"/></td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.poRefundTotal==null||payTotalSummary.poRefundTotal==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td>${payTotalSummary.poRefundTotal}</td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.poRefundAmount==null||payTotalSummary.poRefundAmount==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td><fmt:formatNumber value="${payTotalSummary.poRefundAmount/100.00}" pattern="#0.00"/></td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.ecRefundTotal==null||payTotalSummary.ecRefundTotal==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td>${payTotalSummary.ecRefundTotal}</td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.ecRefundAmount==null||payTotalSummary.ecRefundAmount==0}">
			        <td>0</td>
			     </c:when>
			     <c:otherwise>
			        <td><fmt:formatNumber value="${payTotalSummary.ecRefundAmount/100.00}" pattern="#0.00"/></td>
			     </c:otherwise>
			   </c:choose>
			   <c:choose>
			     <c:when test="${payTotalSummary.refundDiffAmount==null||payTotalSummary.refundDiffAmount==0}">
			        <td>0</td>
			     </c:when>
			     <c:when test="${payTotalSummary.refundDiffAmount>0}">
			        <td>+<fmt:formatNumber value="${payTotalSummary.refundDiffAmount/100.00}" pattern="#0.00"/></td>
			     </c:when>
			     <c:otherwise>
			        <td><fmt:formatNumber value="${payTotalSummary.refundDiffAmount/100.00}" pattern="#0.00"/></td>
			     </c:otherwise>
			   </c:choose>
			 </tr>

			</table>
		</form>
		
	<div class="page_c">
	   <c:choose>
	     <c:when test="${!checkFlag}">
	         <span class="l inb_a grey" id="cannotDownload">下载文件：<a href="javascript:void(0);" title="电商侧对账文件" id="ecpsCheck">电商侧对账文件</a>&nbsp;&nbsp;
	         														 <a href="javascript:void(0);" title="联动优势侧对账文件" id="ldysCheck">联动优势侧对账文件</a>&nbsp;&nbsp;
<!-- 	         														 <a href="javascript:void(0);" title="湖南手机支付对账文件" >湖南手机支付对账文件</a>&nbsp;&nbsp; -->
	         														 <a href="javascript:void(0);" title="财付通对账文件" id="tenpayCheck">财付通对账文件</a>&nbsp;&nbsp;
	         														 <a href="javascript:void(0);" title="支付单差异" id="payDiff">支付单差异</a>&nbsp;&nbsp;
	         														 <a href="javascript:void(0);" title="退款单差异" id="refunDiff">退款单差异</a>&nbsp;&nbsp;
	         														 <a href="javascript:void(0);" title="全部文件" id="allFile">全部文件</a></span>
	     </c:when>
	     <c:otherwise>
	        <span class="l inb_a">下载文件：<a href="javascript:void(0);" title="电商对账文件" id="ecpsCheck">电商对账文件</a>&nbsp;&nbsp;
	        								<a href="javascript:void(0);" title="联动优势对账文件" id="ldysCheck">联动优势对账文件</a>&nbsp;&nbsp;
	        								<a href="javascript:void(0);" title="财付通对账文件" id="tenpayCheck">财付通对账文件</a>&nbsp;&nbsp;
									        <a href="javascript:void(0);" title="支付单差异" id="payDiff">支付单差异</a>&nbsp;&nbsp;
									        <a href="javascript:void(0);" title="退款单差异" id="refunDiff">退款单差异</a>&nbsp;&nbsp;
									        <a href="javascript:void(0);" title="全部文件" id="allFile">全部文件</a></span>
	     </c:otherwise>
	   </c:choose>
		
	</div>
	
</div></div>
</body>