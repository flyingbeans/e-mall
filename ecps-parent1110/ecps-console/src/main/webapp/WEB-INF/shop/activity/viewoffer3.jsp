<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>档次审核_活动档次管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){ 
	    var options = { 
	    	beforeSubmit:  validateData,  	//pre-submit callback 
	        	 success:  showResponse 	//post-submit callback 
	    }; 
	    $("#activityID").click(function(){ 
	        $("#form111").ajaxSubmit(options); 
	        return false; 
	    });
	    function validateData(formData, jqForm, options){
			return true;
		}
		function showResponse(responseText, statusText){ 
			var obj=eval("("+responseText+")");
			alert(obj.message);
			if(obj.result=="success"){
				document.location=url="<c:url value='/activity/listoffer.do'/>";	
			}
		}
    
	}); 
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/activity/listoffer.do"/>">活动档次管理</a>&nbsp;&raquo;&nbsp;<span class="gray">档次审核</span><a href="<c:url value="/activity/listoffer.do"/>" class="inb btn120x20">返回活动档次</a></div>
	<form id="form111" name="form111" action="${path}/activity/updateOfferStatus.do" method="post">
         <div class="edit set">
         	<p>
         		基础信息<hr/>
         	</p>
         	<p>
            	<label class="alg_t">活动名称：</label>
            	<span><c:out value="${offer.offerGroup.offerGroupName }"/></span>
            </p>
         	<p>
            	<label class="alg_t">档次简称：</label><span>${offer.offerGroup.shortName }${offer.shortName }</span>
            </p>
            <p>
            	<label class="alg_t">简称：</label><span>${offer.offerName }</span>
            </p>
            <p>
            	业务绑定<hr/>
            </p>
            <p>
            	<table>
            		<thead>
            			<tr>
            				<th>业务协议期</th>
            				<th>月承诺话费</th>
            				<th>预存花费</th>
            				<th>返还期</th>
            				<th>月返还</th>
            				<th>首月返还</th>
            				<th>月末返还</th>
            				<th>备注</th>
            			</tr>
            		</thead>
            		<tbody>
            			<tr>
            				<td>
            					<select name="offerTerm" disabled>
				                    <option value="3" <c:if test='${offer.offerTerm==3 }'>selected</c:if>>3个月</option>
				                    <option value="6" <c:if test='${offer.offerTerm==6 }'>selected</c:if>>6个月</option>
				                    <option value="12" <c:if test='${offer.offerTerm==12 }'>selected</c:if>>12个月</option>
				                    <option value="18" <c:if test='${offer.offerTerm==18 }'>selected</c:if>>18个月</option>
				                    <option value="24" <c:if test='${offer.offerTerm==24 }'>selected</c:if>>24个月</option>
				                </select>
            				</td>
            				<td>
            					<input type="text" name="commitMonthly" size="5" value="${offer.commitMonthly }" disabled/>
            				</td>
            				<td>
            					<input type="text" name="prepaid" size="5" value="${offer.prepaid }" disabled/>
            				</td>
            				<td>
            					<select name="refundPeriod" disabled>
				                    <option value="3" <c:if test='${offer.refundPeriod==3 }'>selected</c:if>>3个月</option>
				                    <option value="6" <c:if test='${offer.refundPeriod==6 }'>selected</c:if>>6个月</option>
				                    <option value="12" <c:if test='${offer.refundPeriod==12 }'>selected</c:if>>12个月</option>
				                    <option value="18" <c:if test='${offer.refundPeriod==18 }'>selected</c:if>>18个月</option>
				                    <option value="24" <c:if test='${offer.refundPeriod==24 }'>selected</c:if>>24个月</option>
				                </select>
            				</td>
            				<td>
            					<input type="text" name="refundMonthly" size="5" value="${offer.refundMonthly }" disabled/>
            				</td>
            				<td>
            					<input type="text" name="refund1stmonth" size="5" value="${offer.refund1stmonth }" disabled/>
            				</td>
            				<td>
            					<input type="text" name="refundLastMonth" size="5" value="${offer.refundLastMonth }" disabled/>
            				</td>
            				<td>
            					<input type="text" name="notes" value="${offer.notes }" disabled/>
            				</td>
            			</tr>
            		</tbody>
            	</table>
            </p>
            <p>绑定商品<hr/></p>
          	<p>
           		<table cellspacing="0" summary="">
           			<thead>
           				<tr>
            				<th>商品名称</th><th>商品规格</th>
           				</tr>
           			</thead>
           			<tbody id="tbodyItem">
           				<c:forEach items="${offer.listItem }" var="item">
           				<tr id="itemId${item.itemId }">
           					<td><c:out value="${item.itemName }"/></td>
           					<td>
           						<table>
           							<tbody id="skuIds${item.itemId }">
           							<c:forEach items="${item.listsku }" var="sku">
           							<tr id="skuId${sku.skuId }">
           								<td>
											<c:forEach items="${sku.ebSV }" var="ebSpecValue">
											<c:out value="${ebSpecValue.specValue }"/>
											</c:forEach>
										</td>
										<td><c:out value="${sku.skuPrice }"/>元</td>
										<td><input type="checkbox" id="ids" name="ids" value="${sku.skuId }" checked="checked" disabled></td>
           							</tr>
           							</c:forEach>
           							</tbody>
           						</table>
           					</td>
           				</tr>
           				</c:forEach>
           			</tbody>	
           		</table>
          	</p>
          	<p>审核上下架<hr/></p>
          	<p>
          		<input type="radio" name="auditStatus" value="0" <c:if test='${offer.auditStatus==0 }'>checked</c:if>>待审核
          		<input type="radio" name="auditStatus" value="1" <c:if test='${offer.auditStatus==1 }'>checked</c:if>>通过
          		<input type="radio" name="auditStatus" value="2" <c:if test='${offer.auditStatus==2 }'>checked</c:if>>拒审
          	</p>
          	<p>
          		<input type="radio" name="showStatus" value="0" <c:if test='${offer.showStatus==0 }'>checked</c:if>>上架
          		<input type="radio" name="showStatus" value="1" <c:if test='${offer.showStatus==1 }'>checked</c:if>>下架
          	</p>
            <p>
            	<label>&nbsp;</label>
            	<input type="hidden" name="offerId" value="${offer.offerId }">
            	<input type="hidden" id="offerType" name="offerType" value="3"/>
            	<input type="button" id="activityID" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="<fmt:message key='button.cancel'/>" onclick="history.back();"/>
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>