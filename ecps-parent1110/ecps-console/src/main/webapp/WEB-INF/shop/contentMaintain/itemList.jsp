<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>内容维护_查看商品</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
<script type="text/javascript"
	src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	var obj=null;
	var saleSku=null;
	$("a[group]").click(function(){
		$("#errorInfoSaleSku").html("<label>&nbsp;</label>");
		tipShow('#addSaleSku');
		obj=$(this);
		var value=obj.attr("group").split("\;")[0];
		saleSku=obj.attr("group").split("\;")[1];
		$("#saleSku").val(saleSku);
	});
	
	$("#addSaleSkuConfirm").click(function(){
		
		if(obj==null){
			return;
		}
		var value=obj.attr("group").split("\;")[0];
		var itemId=value.split(",")[0];
		var slotId=value.split(",")[1];
		var newSaleSku=$("#saleSku").val();
		var saleArray=newSaleSku.split(",");
		if(saleArray.length>3){
			tipShow("#errorInfoSaleSku");
			$("#errorInfoSaleSku").html("<label>&nbsp;</label>数据格式有误");
			return;
		}
		if(saleArray.length>1){
			for(var i=0;i<saleArray.length;i++){
				if(saleArray[i].replace(/[^\x00-\xff]/g, "xx").length<1 || saleArray[i].replace(/[^\x00-\xff]/g, "xx").length>22){
					tipShow("#errorInfoSaleSku");
					$("#errorInfoSaleSku").html("<label>&nbsp;</label>数据格式有误");
					return;
				}
			}
		}
		

		var ajaxData="itemId="+itemId+"&slotId="+slotId+"&saleSku="+newSaleSku;
		$.ajax({
        	type:"post",
         	url:"${path}/contentMaintain/changeSaleSku.do",
         	data:(ajaxData),
         	success:function(responseText){
            	var result=eval("("+responseText+")");
             	if(result._status=="true"){
             		alert("操作成功");
             	}else{
             		alert(result._mes);
             	}
             	obj.attr("group",itemId+","+slotId+";"+newSaleSku);
             	tipHide('#addSaleSku');
        	}
        });
	});
});
	$(document).ready(function() {
		$("input[group='number']").blur(function(){
			var value=$(this).val();
			checkNumber(value);
		});	
		
		$("#sortaction").click(function(){
			var result=true;
			var content="";
			$("input[group='number']").each(function(index){
				var value=$(this).val();
				var itemId=$(this).attr("gid");
				result=checkNumber(value);
				if(result){
					if(content!=""){
						content+="|";
					}
					if(value==""){
						value="null";
					}
					content+=itemId+","+value;
				}else{
					return false;
				}
				
	    	});
			if(!result){
				return;
			}
			if(content==""){
				alert("排序数据为空");
				return;
			}
			$("#sortAndItem").val(content);
    		$("#form111").ajaxSubmit({ 
    	    	beforeSubmit:  validateData,  	 
           	 	success:  showResponse
       		});
    		return false;
    	});
    	function validateData(formData, jqForm, options){
    		return true;
    	}
    	function showResponse(responseText, statusText){
        	var obj=eval("("+responseText+")");
        	alert(obj[0].message);
        	if(obj[0].result=="true"){
        		document.location.href="${path}/contentMaintain/ItemList.do?slotId=${slot.slotId }";
        	}
    		
    	}
		
		
	});
	function checkNumber(value){
		var reg = new RegExp("^[1-9][0-9]{0,3}$");
		if(typeof(value)!="undefined" && value != ""){
			if(!reg.test(value)){
				alert("请输入1-4位数的正整数");
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
	<jsp:include page="/${system}/common/contentMaintainMenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp>
		<fmt:message key='menu.current.loc'/>：内容维护&nbsp;&raquo;&nbsp;<a href="${base}/contentMaintain/ItemList.do?slotId=${slotId}" title="查看商品">查看商品</a>&nbsp;&raquo;&nbsp;<span class="gray">商品列表：${slot.areaName }${slot.slotName }</span>
	<span class="r inb_a"> 
		<a href="${base}/contentMaintain/conditonSearch.do" class="btn80x20" title="返回版位列表">返回版位列表</a>
	</span>
	</div>

	<form id="form111" name="form111" action="${base}/contentMaintain/sortItemOfSlot.do" method="post">

		
		<div class="page_c">
		<span class="l inb_a">
			<ui:permTag src="/${system}/contentMaintain/changeSaleSku.do">
        	<a href="javascript:void(0);" id="sortaction" class="btn80x20" title="排序">排序</a>
        	</ui:permTag>
    				</span>
			<span class="r inb_a"> 
				<a href="${base}/contentMaintain/listEntity.do?slotId=${slot.slotId}" class="btn80x20" title="添加商品">添加商品</a>
			</span>
		</div>

		<table cellspacing="0" summary="" class="tab" id="myTable">
			<thead>
				<th><input type="checkbox" id="all"
					onclick="checkAll(this, 'ids')" name="all"
					title="<fmt:message key="tag.selected.allORcancel"/>" /></th>
				<th><fmt:message key='menu.rightItem.itemNo' />
						<samp class="inb t14"></samp></a></th>
				<th><fmt:message key='menu.rightItem.itemName' />
						<samp class="inb t14"></samp></a></th>
				<th>促销语</th>
				<th>商城价<samp class="inb t14"></samp></a></th>
				<th><fmt:message key='menu.rightItem.feature1' /></th>
				<th><fmt:message key='menu.rightItem.feature2' /></th>
				<th><fmt:message key='menu.rightItem.feature3' /></th>
				<!-- <th>特价</th> -->
				<th><fmt:message key='menu.rightItem.stock' />
						<samp class="inb t14"></samp></a></th>
				<th>状态</th>
				<th>排序</th>
				<th><fmt:message key='tag.column.operation' /></th>
			</thead>
			<tbody>
				<c:forEach items='${pagination.list}' var="item">
					<tr>
						<td><input type="hidden" id="marketPrice"
							name="marketPrice" value="${item.marketPrice}" /> <input
							type="checkbox" name="ids" value="${item.itemId}" /></td>
						<td><c:out value='${item.itemNo}' /></td>
						<td class="nwp"><c:out value='${item.itemName}'
								escapeXml="false" /></td>
						<td class="nwp"><c:out value='${item.promotion}' /></td>
						<td>
							<var><fmt:formatNumber type="number" value="${item.marketPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>元起
						</td>
						<td><c:choose>
								<c:when test="${item.isNew == 1}">
									<span class="is"></span>
								</c:when>
								<c:otherwise>
									<span class="not"></span>
								</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${item.isGood == 1}">
									<span class="is"></span>
								</c:when>
								<c:otherwise>
									<span class="not"></span>
								</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${item.isHot == 1}">
									<span class="is"></span>
								</c:when>
								<c:otherwise>
									<span class="not"></span>
								</c:otherwise>
							</c:choose></td>
						<%-- <td><c:choose>
								<c:when test="${item.isDiscount == 1}">
									<span class="is"></span>
								</c:when>
								<c:otherwise>
									<span class="not"></span>
								</c:otherwise>
							</c:choose></td> --%>
						<td>${item.stock}</td>
 		<td>
 			<c:choose>
			<c:when test="${item.showStatus==0}">
			<span class="green"><c:out value="已上架"/></span>
			</c:when>
			<c:otherwise>
			<span class="red"><c:out value="下架"/></span>
			</c:otherwise>
		  	<%-- <c:otherwise>
		  		<c:choose>
			  		<c:when test="${item.auditStatus==0}">
			  			<c:out value="待审核"/>
			  		</c:when>
			  		<c:when test="${item.auditStatus==1}">
			  			<c:out value="已审核"/>
			  		</c:when>
			  		<c:otherwise>
			  			<c:out value="审核不通过"/>
			  		</c:otherwise>
		  		</c:choose>
		  	</c:otherwise> --%>
		</c:choose>
             </td>
            
            					<td>
            					<ui:permTag src="/${system}/contentMaintain/changeSaleSku.do">
            						<c:set var="sorter" value="1" />
            						<input type="text" id="sort" name="sort" group="number" gid="${item.itemId }" value="${item.skuSort}"/>
            					</ui:permTag>
            					<c:if test="${sorter!=1 }">
            						${item.skuSort}
            					</c:if>
            					</td>

						<td>
							<a href="${base}/item/checkItem.do?slot=slot&itemId=${item.itemId}&slotId=${slotId}">查看</a>
							<a href="${base}/contentMaintain/removeItemFromSlot.do?slotId=${slot.slotId }&itemId=${item.itemId}">移除</a>
							<!-- <a href="javascript:void(0);" group="${item.itemId},${slot.slotId};${item.saleSku}">编辑</a> -->
							
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tr>
				<td colspan="12" align="right"><fmt:message key='tag.select' />：<a
					href="javascript:void(0);"
					title="<fmt:message key='tag.selected.all'/>"
					onclick="checkAllIds();"><fmt:message key='tag.selected.all' /></a>
					<samp>-</samp> <a href="javascript:void(0);"
					title="<fmt:message key='tag.selected.cancel'/>"
					onclick="uncheckAllIds();"><fmt:message
							key='tag.selected.cancel' /></a></td>
			</tr>
		</table>
		<input type="hidden" name="slotId"  value="${slot.slotId }">
		<input type="hidden" id="sortAndItem" name="sortAndItem" value="">				
	</form>
	
</div></div>
</body>