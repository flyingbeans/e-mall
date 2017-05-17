<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/uploads.js'/>"></script>
<title>秒杀列表</title>
<script type="text/javascript">
	
$(function(){
    pageInitialize('#form1');
});
	
$(document).ready(function(){
	searchText('#secKillId','#labelName',40);
	searchText('#goodName','#labelName',40);
	var all = $("#all");
	all.click(function(){
     	if(all.attr("checked")){
        	$("input[name='ids']").attr("checked", true);
        }else{
        	$("input[name='ids']").attr("checked", false);
        }
    });
	$("#checkall").click(function(){
		$("input[name='ids']").attr("checked", true);
		all.attr("checked",true)
	});
	$("#cancelall").click(function(value){
		$("input[name='ids']").attr("checked", false);
		all.attr("checked",false)
	});
	$("#form1").submit(function(){
		var a = $("#secKillId");
		var b = $("#goodName");
		if(a.val() == a.attr("title")){
			a.val('');
		}
		if(b.val() == b.attr("title")){
			b.val('');
		}
	});
	<c:if test="${message!=null }">
		alert('<c:out value="${message }"/>');
	</c:if>
});

//判断秒杀活动是否已生成订单，如果已有订单则不能删除
function isHaveOrders(secKillId){
	var ishasOrders=false;
	$.ajax({
		type:"POST",
		async: false,
		url:"${base}/secKill/isHaveOrdersAjax.do",
		data:"secKillId="+secKillId,
		success:function(responseText){
			if(responseText[0].result=="success"){
				ishasOrders = true;
			}
		}
	})
	if (ishasOrders) {
		return true;
	}else{
		return false;
	}
}

function deleteById(secKillId){
	//isHaveOrders(secKillId);
	if (isHaveOrders(secKillId)) {
		tipShow('#confirmDiv');
		$("input[id='confirmDivOk']").click(function(){
			$("#form1").attr("action","${base }/secKill/deleteSecKillById.do?dSecKillId="+secKillId);
			$("#form1").submit();
		});
	}else{
		alert("该秒杀活动已经有订单，不能删除！");
	}
}

<%--排序，item为1：表示根据秒杀ID排序，为2：表示根据时间排序，为3：表示根据销量排序。value:为1表示升序，为2表示降序--%>
function changOrder(item){
	var a = $("#order");
	if(item == 1){
		if("${idOrder}" == "1"){
			a.html("<input type='hidden' name='idOrder' id='idOrder' value='0'/>");
		}else{
			a.html("<input type='hidden' name='idOrder' id='idOrder' value='1'/>");
		}
	}else if(item == 2){
		if("${timeOrder}" == "1"){
			a.html("<input type='hidden' name='timeOrder' id='timeOrder' value='0'/>");
		}else{
			a.html("<input type='hidden' name='timeOrder' id='timeOrder' value='1'/>");
		}
	}else{
		if("${salesOrder}" == "1"){
			a.html("<input type='hidden' name='salesOrder' id='salesOrder' value='0'/>");
		}else{
			a.html("<input type='hidden' name='salesOrder' id='salesOrder' value='1'/>");
		}
	}
	$("#form1").submit();
}

</script>
</head>
<body id="main">
	<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/promotionmenu.jsp"/>
	</div></div>
	<div class="frameR"><div class="content">
	<div class="loc icon"><samp class="t12"></samp>促销活动 - 秒杀列表
		<div style="float:right;top:10px;">
		<img src="${base}/images/orange.gif"/>&nbsp;即将开始&nbsp;&nbsp;&nbsp;
		<img src="${base}/images/green.gif"/>&nbsp;正在进行&nbsp;&nbsp;&nbsp;
		<img src="${base}/images/gray.gif"/>&nbsp;时间截止
		</div>
	</div>
	<form name="form1" id="form1" action="${base}/secKill/listSecKill.do" method="post">
	<%--添加 --%>
	<div class="page_c">
		<span class="r inb_a">
            <a href="${base}/secKill/preAddSecKill.do"  class="btn80x20">添加秒杀</a>
    	</span>
   	</div>
	<%--查询 --%>
	<div class="sch">
		&nbsp;
		查询：
		<%--取消按照归属地查询 --%>
		<%-- <select id="city" name="city">
			<option value="0">请选择地市</option>
			<c:forEach items="${ cityList}" var="c">
				<c:if test="${ city == c.areaId }">
					<option value="${c.areaId }" selected><c:out value="${c.areaName }"/></option>
				</c:if>
				<c:if test="${ city != c.areaId }">
					<option value="${c.areaId }" ><c:out value="${c.areaName }"/></option>
				</c:if>
			</c:forEach>
		</select>--%>
		<select id="timeStatus" name="timeStatus" >
			<c:if test="${timeStatus == 0 }">
				<option value="0" selected>请选择时效范围</option>
			</c:if>
			<c:if test="${timeStatus != 0 }">
				<option value="0">请选择时效范围</option>
			</c:if>
			<c:if test="${timeStatus==1 }">
				<option value="1" selected>即将开始</option>
			</c:if>
			<c:if test="${timeStatus != 1 }">
				<option value="1">即将开始</option>
			</c:if>
			<c:if test="${timeStatus==2 }">
				<option value="2" selected>正在进行</option>
			</c:if>
			<c:if test="${timeStatus != 2 }">
				<option value="2">正在进行</option>
			</c:if><c:if test="${timeStatus==3 }">
				<option value="3" selected>时间截止</option>
			</c:if>
			<c:if test="${timeStatus != 3 }">
				<option value="3">时间截止</option>
			</c:if>
		</select>
		<input type="text"  id="secKillId"  name="secKillId"  value="<c:out value='${secKillId}' escapeXml='true'/>"  title="请输入活动编号"  class="text20 medium gray"  />
		<input type="text"  id="goodName"  name="goodName"  value="<c:out value='${goodName}' escapeXml='true'/>"  title="请输入商品名称"  class="text20 medium gray"  />
		<input type="submit" id="goSearch" class="hand btn60x20" value="查询"  />
	</div>
	<div style="display:none;" id="order">
		<c:if test="${idOrder != null }"><input type='hidden' name='idOrder' id='idOrder' value='${idOrder }'/></c:if>
		<c:if test="${timeOrder != null }"><input type='hidden' name='timeOrder' id='timeOrder' value='${timeOrder }'/></c:if>
		<c:if test="${salesOrder != null }"><input type='hidden' name='salesOrder' id='salesOrder' value='${salesOrder }'/></c:if>
	</div>
   	<%--列表 --%>
	<table cellspacing="0" summary="" class="tab">
		<thead>
		<%-- 
			<th><input type="checkbox" name="all" id="all" title="全选/取消" /></th>
		--%>
			<th onclick="changOrder(1)">
				<a href="javascript:void(0);">活动编号</a> 
				<c:if test="${ idOrder == null || idOrder == 0 }">
					<img src="${base}/images/asc.gif"/>
				</c:if>
				<c:if test="${ idOrder != null && idOrder == 1 }">
					<img src="${base}/images/desc.gif"/>
				</c:if>
			</th>
			<%-- <th>适用地</th>--%>
			<th>秒杀标题</th>
			<th>商品名称</th>
			<th onclick="changOrder(2)">
				<a href="javascript:void(0);">活动时间</a>  
					<c:if test="${ timeOrder == null || timeOrder == 0 }">
					<img src="${base}/images/asc.gif"/>
				</c:if>
				<c:if test="${ timeOrder != null && timeOrder == 1 }">
					<img src="${base}/images/desc.gif"/>
				</c:if>
			</th>
			<th>活动价</th>
			<th onclick="changOrder(3)">
				<a href="javascript:void(0);">成交量</a>  
				<c:if test="${ salesOrder == null || salesOrder == 0 }">
					<img src="${base}/images/asc.gif"/>
				</c:if>
				<c:if test="${ salesOrder != null && salesOrder == 1 }">
					<img src="${base}/images/desc.gif"/>
				</c:if>
			</th>
			<th>排序</th>
			<th>时效</th>
			<%--<th>预告中</th>--%>
			<th>操作</th>
		</thead>
		<c:forEach items="${pagination.list }" var = "secKill">
				<tr>
					<%-- 
					<td><input type="checkbox" name="ids"  value="" /></td>
					--%>
					<td><c:out value="${secKill.secKillId }"/></td>
					<%--取消适用地字段 --%>
					<%-- <td class="nwp">
						<c:set var="listArea" value="${secKill.areaList}"></c:set> 
						<c:set var="listAreaLen" value="${fn:length(secKill.areaList)}"></c:set>
						<c:forEach items="${listArea }" var="area" varStatus="p">
							<c:out value="${area.areaName}"/>
							<c:if test="${p.count != listAreaLen }">|</c:if>
						</c:forEach>
					</td>--%>
					<td class="nwp"><c:out value="${secKill.secKillTitle}"/></td>
					<td class="nwp"><c:out value="${secKill.skuList[0].itemName }"/></td>
					<td>
						 <fmt:formatDate pattern="yyyy/MM/dd HH时" value="${secKill.startTime}" type="both"/>-
					 	 <fmt:formatDate pattern="yyyy/MM/dd HH时" value="${secKill.endTime}" type="both"/>
					 </td>
					<td>
					<c:set var="size" value="${fn:length(secKill.skuList)}"></c:set>
					<c:if test="${size>1}">
						<c:if test="${secKill.skuList[0].secKillPrice==secKill.skuList[size-1].secKillPrice}">
							<fmt:formatNumber value='${secKill.skuList[0].secKillPrice/100 }' pattern="#0.00"></fmt:formatNumber>
						</c:if>
						<c:if test="${secKill.skuList[0].secKillPrice!=secKill.skuList[size-1].secKillPrice }">
							<fmt:formatNumber value='${secKill.skuList[0].secKillPrice/100 }' pattern="#0.00"></fmt:formatNumber>&nbsp;-
							<fmt:formatNumber value='${secKill.skuList[size-1].secKillPrice/100 }' pattern="#0.00"></fmt:formatNumber>
						</c:if>
					</c:if>
					<c:if test="${size<=1 }">
					<fmt:formatNumber value='${secKill.skuList[0].secKillPrice/100}' pattern="#0.00"></fmt:formatNumber>
					</c:if>
					</td>
					<td><c:out value="${secKill.sales }"/></td>
					<td><c:out value="${secKill.secKillOrder}"/></td>
					<td>
						<c:if test="${now >= secKill.endTime }">
							<img src="${base}/images/gray.gif"/>
						</c:if>
						<c:if test="${now < secKill.startTime }">
							<img src="${base}/images/orange.gif"/>
						</c:if>
						<c:if test="${now >= secKill.startTime  && now < secKill.endTime}">
							<img src="${base}/images/green.gif"/>
						</c:if>
					</td>
					<%-- <td>
						<c:if test="${secKill.isRecommend == 0}">---</c:if>
						<c:if test="${secKill.isRecommend == 1}"><img src="${base}/images/yes.gif"/></c:if>
					</td>--%>
					<td>
						<a href="${base}/secKill/preEditSecKill.do?secKillId=${secKill.secKillId}" >编辑</a>&nbsp;&nbsp;
						<a id="delete" onclick="deleteById(${secKill.secKillId})" href="javascript:void(0);">删除</a>
					</td>
				</tr>
			</c:forEach>
			<%-- 
			<tr>
				<td colspan="6">
                	选择： <a id="checkall" href="javascript:void(0);" >全选</a> <samp>-</samp>
                		  <a id="cancelall" href="javascript:void(0);" >取消</a>
				</td>
			</tr>
			--%>
	</table>
	<%--分页 --%>
    <div class="page_c">
        <span class="l inb_a">
            
        </span>
        <span class="r page">
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
            共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
        </span>
    </div>
	</form>
	</div></div>
</body>
</html>