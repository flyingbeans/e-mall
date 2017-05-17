<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>代客下单详情页</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="relpaceGuestSubmitOrder"/>

<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/ecps/console/res/css/style.css'/>" />
<link rel="stylesheet" type="text/css" media="print" href="<c:url value='/ecps/console/res/css/print.css'/>" />
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/district.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.js'/>"></script>
<script language="javascript" type="text/javascript">
// window.onbeforeprint=beforePrint;
// window.onafterprint=afterPrint;

function getDistrict(city) {
	//alert(city);
	$("#area").empty();
	var dis = dis12;
	if (city == '大连') {
		dis = dis1;
	} else if (city == '鞍山') {
		dis = dis2;
	} else if (city == '抚顺') {
		dis = dis3;
	} else if (city == '本溪') {
		dis = dis4;
	} else if (city == '丹东') {
		dis = dis5;
	} else if (city == '锦州') {
		dis = dis6;
	} else if (city == '营口') {
		dis = dis7;
	} else if (city == '阜新') {
		dis = dis8;
	} else if (city == '辽阳') {
		dis = dis9;
	} else if (city == '盘锦') {
		dis = dis10;
	} else if (city == '葫芦岛') {
		dis = dis11;
	} else if (city == '沈阳') {
		dis = dis12;
	} else if (city == '铁岭') {
		dis = dis13;
	} else if (city == '朝阳') {
		dis = dis14;
	} else {
		dis = dis1;
	}
	var str = "";
	for (var i = 0; i < dis.length; i++) {
		str = "<option value='" + dis[i] + "'";
		if ("${ebco.ebOrder.district}" == dis[i]) {
			str += "selected ";
		}
		str += ">" + dis[i] + "</option>";
		//alert(str);
		$("#area").append(str);
		str = "";
	}

}

function beforePrint()
{
hd.style.display='none';
}

$(function(){
	getDistrict("沈阳");
	
	$("a[show='tabshow']").click(function(){
		$("#offerItem").html('');
		$("#itemMoneyTotal").html('');
		$("a[show='tabshow']").removeClass("here");
		$(this).addClass("here");
		var offerGroupId = $(this).attr("offerGroupId");
		var skuIds = $(this).attr("skuIds")
		$("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li[show='tabshow']").hide();
		
		$("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li[offerGroupId="+offerGroupId+"]").show();
		if(offerGroupId =="aaaaaa")
		{
			$("li[show='tabshow']").hide();
			$("#luojicontent").show();
			$("#luojirec").show();
			$("#offerrec").hide();
			listCartFunc();
		}
		else
		{
			$("#offerspec").html($("input[name='choosespec'][checked]").attr("specval"));
			$("#luojicontent").hide();
			$("#luojirec").hide();
			$("#offerrec").show();
			$("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li[offerGroupId="+offerGroupId+"]").show();
			var skuOfferObj = $("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li[offerGroupId="+offerGroupId+"]").find("input[name='skuOfferId']");
			$(skuOfferObj).each(function(i){
				var obj = $(this).attr("disabled");
				if(obj==undefined){
					$(this).attr('checked','checked');
					$(this).click();
					return;
				}
			});
		}
		//$("offerspec").html($("input[show='radioshow']").eq(0).attr("specval") );

		//设置商品金额合计
		//var totalmoney = $("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li[offerGroupId="+offerGroupId+"]").find("#totalmoney var").html();
		//$("#itemMoneyTotal").html(totalmoney);
		if($("input[name='skuOfferId']:not(:hidden)").length <1){
			$("#ulItemMoneyTotal").hide();
			$("#luojiTotal").show();
		}else{
			$("#ulItemMoneyTotal").show();
			$("#luojiTotal").hide();
		}
		
		
		
	});
	
	$("input[show='radioshow']").eq(0).click();
	$("input[name='skuOfferId']").eq(0).click();
	
	$("#company").hide();
	$("#companycon").hide();
	$("#a1").click(function(){
		$("#company").hide();
		$("#companycon").hide();
    });

    $("#a2").click(function(){
    	$("#company").show();
    	$("#companycon").show();
    });

	$("#submitOrderID").click(function(){
		var userNametest = /^\s*[a-zA-Z0-9\u4e00-\u9fa5]{1,20}\s*$/;
		if($("a[show='tabshow'][class='here']").attr("offerGroupId")!="aaaaaa")
	   	{
			if($("input:[name='skuOfferId'][checked]").val()==undefined)
			{
				alert("请选择合约计划后再提交订单！");
				return false;
			}
	   	}
		else
		{
			if($("#luojiNumTotal").html()==0)
			{
				alert("请将裸机加入购物清单后再提交订单！");
				return false;
			}
		}
		
		if(!userNametest.test($("#userName").val())){
			alert("收货人不能为空、只允许1-20个中英文数字字符");
			return false;
		}
		
		var telephonetest = /^\s*[0-9]{11,11}\s*$/;
		if(!telephonetest.test($("#telephone").val())){
			alert("联系电话只允许输入11位手机号码！");
			return false;
		}
		
		var postalCodetest = /^\s*[0-9]{6,6}\s*$/;
		if($("#postalCode").val()!='')
		{
			if(!postalCodetest.test($("#postalCode").val())){
				alert("邮政编码只能为6位数字！");
				return false;
			}
		}
		
		var streettest = /^\s*[a-zA-Z0-9\u4e00-\u9fa5]{1,200}\s*$/;
		if(!streettest.test($("#street").val())){
			alert("街道地址不能存在空格、特殊字符等，只能为1-200个中英文数字字符！");
			return false;
		}
		
		var notestest = /^.{0,200}$/;
		if(!notestest.test($("#notes").val())){
			alert("用户备注不允许超过200个字符！");
			return false;
		}
		
		var companytest = /^.{1,60}$/;
		if($("#a2").attr("checked") == 'checked'){
			if(!companytest.test($("#company").val())){
				alert("单位名称不能为空、只能为1-60个字符！！");
				return false;
			}
		}
		if(confirm("确认提交订单")){
				var form = document.getElementById("form111");
			   	if($("a[show='tabshow'][class='here']").attr("offerGroupId")=="aaaaaa")
			   	{
			   		$("input[name='skuOfferId']").attr("disabled",true);
				   	form.action ='${path}/valetOrder/submitOrder.do';
			   	}
			   	else
			   	{
				   	form.action ='${path}/offer/submitOrder.do';
			   	}
			   	form.submit();
		}
	});
	
	
});

function afterPrint()
{
hd.style.display='';
}
function selspec(skuIds,spec,stock,hasLuoji,luojiSkuId,price)
{

	$("ul[show='offerGroupShow']").hide();
	$("ul[show='offerGroupShow'][skuId='"+skuIds+"']").show();
	
	$("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li").eq(0).find("a").eq(0).click();

	/*
	if(hasLuoji == '1')
	{
		
	}
	else
	{
		$("ul[show='offerGroupShow'][skuId='"+skuIds+"']").find("li").eq(0).find("a[offerGroupId='aaaaaa']").hide();
		$("#luojicontent").hide();
		$("#luojirec").hide();
		$("#luojiTotal").hide();
	}
	*/
	$("#luojispec").html(spec);
	$("#luojiprice").html(toDecimal2(price));
	$("#luojistock").html(stock);
	$("#luojiSkuId").val(luojiSkuId);

}
function setItemMoneyTotal(btn){
	var totalmoney = $(btn).parent().parent().find("#totalmoney var").html();
	//设置商品金额合计
	var trHtml = $(btn).parent().parent().html();
	
	var idxSecondTd = trHtml.toUpperCase().indexOf("</TD>");
	var outHtml = '<tr><td><p style="color:#0066FF;">${item.itemName}</p></td><td>'+$("input[name=choosespec][checked]").attr("specval")+'</td>'+trHtml.substring(idxSecondTd+5)+'<td>1个</td></tr>';
	$("#offerItem").html(outHtml);
	$("#itemMoneyTotal").html(totalmoney);
}

function addCartFunc(itemId)
{
	var buyNum = $("#buyNum").val();
	var skuId = $("#luojiSkuId").val();
	
	var reg = new RegExp("^([1-9][0-9]{0,5})$");
	if(!reg.test(buyNum)){
			alert("只能输入1-1000000之间的正整数");
			return false;
	}
	var hasNum = $("span[show='showquantity'][skuId='"+skuId+"']").attr("quantity");
	if(hasNum != undefined)
	{
		if(parseInt(hasNum)+parseInt(buyNum)>$("#luojistock").html())
		{
			alert("库存不足，无法加入！")
			return false;
		}
	}
	
	var url = "${path}/item/addItemToCart.do?phoneId="+${phoneId}+"&itemId="+itemId+"&buyNum="+buyNum+"&skuId="+skuId;
	$.ajax({
	    type:"post",
		dataType: 'json',
		url:url,
		complete:function(data){
			var msg=eval("("+data.responseText+")");
			if (msg.result == "error") {
				alert(msg.message);
			} else {
				alert("加入购物车成功！");
				listCartFunc();
			}
		}
  	});
}

function toDecimal2(x) {  
    var f = parseFloat(x);  
    if (isNaN(f)) {  
        return false;  
    }  
    var f = Math.round(x*100)/10000;  
    var s = f.toString();  
    var rs = s.indexOf('.');  
    if (rs < 0) {  
        rs = s.length;  
        s += '.';  
    }  
    while (s.length <= rs + 2) {  
        s += '0';  
    }  
    return s;  
}  

function listCartFunc()
{
	var phone = ${phoneId};
	var url = "${path}/item/listItemOfCart.do?phoneId="+phone;
	$.ajax({
	    type:"post",
		dataType: 'json',
		url:url,
		complete:function(data,textStatus){
			if(textStatus=='success')
			{
				var msg=eval("("+data.responseText+")");
				var replaceStr ="";
				var luojiMoneyTotal = 0;
				var luojiNumTotal = 0;
				for(var i=0;i<msg.length;i++)
				{
					replaceStr = replaceStr+"<tr><td><p style='color:#0066FF;'>"
					
					var itemName = msg[i].itemName;
					replaceStr = replaceStr+itemName;
					replaceStr = replaceStr+"</td><td>";
					//var spec = eval("("+msg[i].skuSpec+")");
					var str=msg[i].skuSpec;
					/*
					for(k in spec)
					{
						str=str+spec[k]+" ";
					}
					*/
					replaceStr = replaceStr+str;
					replaceStr = replaceStr+"</td><td>"
					
					var price = msg[i].price;
					replaceStr = replaceStr+toDecimal2(price);
					replaceStr = replaceStr+"</td><td>"
					
					var quantity = msg[i].quantity;
					replaceStr = replaceStr+quantity;
					luojiNumTotal = luojiNumTotal + quantity;
					luojiMoneyTotal = luojiMoneyTotal + price*quantity;
					replaceStr = replaceStr+"</td><td  width='10%'><input class='hand btn83x23'  name='deleteCart' type='button' onclick=\"deleteCartFunc('"+msg[i].cartSkuId +"');\" value='删除'/>";
					replaceStr = replaceStr+"<input type='hidden' name='skuIds' value='"+msg[i].cartSkuId+"|"+msg[i].skuId+"|"+msg[i].quantity+"|"+msg[i].price+ "'/><span show='showquantity' skuId='"+msg[i].skuId+"' quantity='"+msg[i].quantity+"'></span></td></tr>";
				}
				$("#trItem").html(replaceStr);
				
				$("#luojiMoneyTotal").html(toDecimal2(luojiMoneyTotal));
				$("#luojiNumTotal").html(luojiNumTotal);
			}
			else
			{
				alert("查询购物车数据请求异常，请重新刷新该页面！");
			}
		}
  	});
}

function deleteCartFunc(cartSkuId)
{
	var url = "${path}/item/delItemOfCart.do?phoneId="+${phoneId}+"&cartSkuId="+cartSkuId;
	$.ajax({
	    type:"post",
		dataType: 'json',
		url:url,
		complete:function(data,textStatus){
			var msg=eval("("+data.responseText+")");
			if (msg.result == "error") {
				alert(msg[0].message);
			} else {
				alert("删除购物车记录成功！");
				listCartFunc();
			}
		}
  	});
}

</script>
</head>
<body id="main" style="overflow:auto">
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);
%>

<div class="frameR" style="left:0;margin-left:0;overflow:auto"><div class="box"><div class="content">

	<h2 class="h2" title="订购人手机号：">订购人手机号：${phoneId} </h2>

	<table cellspacing="0" summary="" class="tab3">
	<tr>
		<th width="20%">商品编号</th>
		<th width="40%">商品</th>
		<th width="40%">手机规格(可购买数量)</th>
	</tr>
	<tr>
	 <td>${item.itemNo}</td>
	 <td class="nwp">
	 <div style="float: left;">
		<c:forEach
			items='${item.pictureSet}' var="pic" varStatus="status">
			<c:if test='${status.index==0}'>
				<img src="${resourcePath}${pic.fileRelativePath}-50x50"
					alt="${item.itemName}" />
			</c:if>
		</c:forEach>
		</div>			 
	 <p style="color:#0066FF;">${item.itemName}</p>
	 ${item.promotion}
	</td>
	
	<td class="nwp">
	<c:forEach items="${skugrouplist}" var="skugroup" varStatus="skugroupIdx">
			<c:forEach items="${skugroup.specValueList}" var="specvalue" varStatus="specIdx">
				<c:choose>
			      <c:when test="${specIdx.index == 0}">
			        	<c:set var="str" value="${specvalue.specValue}" />
			      </c:when>
			      <c:otherwise>
			        	<c:set var="str" value="${str};${specvalue.specValue}" /> 
			      </c:otherwise>
	   			</c:choose>
			</c:forEach>
			<c:set var="hasLuoji" value="0" />
			<c:forEach items="${skugroup.skuList}" var="skuitem">
			      <%-- <c:if test="${skuitem.location!=null && skuitem.location=='1' }">
			        	
			      </c:if> --%>
			      <c:set var="hasLuoji" value="1" /> 
		        	<c:set var="luojiStock" value="${skuitem.stockInventory}" /> 
		        	<c:set var="luojiSkuId" value="${skuitem.skuId}" /> 
		        	<c:set var="luojiPrice" value="${skuitem.skuPrice}" /> 
			</c:forEach>
			<input type="radio" show="radioshow" name="choosespec" value="${skugroup.skuIds}" specval='${str}' onclick="selspec('${skugroup.skuIds}','${str}','${luojiStock}','${hasLuoji}','${luojiSkuId}','${luojiPrice}');">${str}(${skugroup.skuStockInventorys })</input>
	</c:forEach> 
				</td>
			</tr>
	</table>


<form id="form111" name="form111" action="" method="post">
<input type="hidden" value="${orderNumPass}" id="orderNumPass" name="orderNumPass" />
<input type="hidden" value="${taskIdPass}" id="taskIdPass" name="taskIdPass" />
<input type="hidden" id="selfCollectSite" name="selfCollectSite" value="${user.username}" />

	<h2 class="h2" title="选择合约计划：">选择裸机：</h2>

	<c:forEach items="${offgrouplist}" var="skugroup">
	<ul class="ul h2_ch" show="offerGroupShow" skuId="${skugroup.skuIds}">
		<c:set var="offergrouplist" value="${skugroup.offerGroupList}"/>
					<li>
						<%-- <c:forEach items="${offergrouplist}" var="offerGroup" varStatus="offerGroupIdx">
							<a href="javascript:void(0);" show="tabshow" title="${offerGroup.offerGroupName}" offerGroupId="${offerGroup.offerGroupId}" skuIds="${skugroup.skuIds}" rel="#detailTab${offerGroupIdx.index}">${offerGroup.offerGroupName}</a>
						</c:forEach> --%>
							<a href="javascript:void(0);" show="tabshow" title="裸   机" offerGroupId="aaaaaa" rel="#detailTab999999">裸   机</a>
					</li>

					<%-- <c:forEach items="${offergrouplist}" var="offerGroup" varStatus="offerGroupIdx">					
					 <c:if test="${offerGroup.merchantId != 0}">
					<li style="clear:both;color:blue;" show="tabshow" offerGroupId="${offerGroup.offerGroupId}">
					<h2 class="h2"><label>有效时间：</label><var class="f14 blue b"><fmt:formatDate value="${offerGroup.validBegin}" pattern="yyyy年MM月dd日"/>——<fmt:formatDate value="${offerGroup.validEnd}" pattern="yyyy年MM月dd日"/></var></h2>
					</li>
					</c:if>
					<li  style="clear:both;" show="tabshow" offerGroupId="${offerGroup.offerGroupId}">
					</li>
					<c:set var="constrlist" value="${offerGroup.listConstr}"/>
					<li  style="clear:both;" show="tabshow" offerGroupId="${offerGroup.offerGroupId}">
						<label>适用品牌：</label>
						<c:forEach items="${constrlist}" var="constr">
						<c:choose> 
						<c:when test='${constr.constrName == "全球通"}'>
							<img alt="全球通" src="${path}/images/quanqiutong.gif"  />
						</c:when>
						<c:when test='${constr.constrName == "动感地带"}'>
							<img alt="动感地带" src="${path}/images/donggandidai.gif"  />
						</c:when>
						<c:otherwise>
							<img alt="神州行" src="${path}/images/shenzhouxing.gif"  />
						</c:otherwise>
						</c:choose>
						</c:forEach>
					</li>
					<li show="tabshow" offerGroupId="${offerGroup.offerGroupId}">
						<table cellspacing="0" summary="" class="tab3"  style="width:100%">
							<tr>
							<th>选择</th>
							<th>套餐</th>
				            <th>话费承诺</th>
				            <th>活动期限</th>
				            <th>购机价(元)</th>
				            <th>预存话费(元)</th>
							<th>赠送话费(元)</th>
				            <th width="30%">备注</th>
				            <th>实付(元)</th>
							</tr>
								<c:set var="offerlist" value="${offerGroup.listOffer}"/>
									<c:forEach items="${offerlist}" var="offer">	
										<c:set var="skuofferlist" value="${offer.listskuOffer}"/>
											<c:forEach items="${skuofferlist}" var="skuoffer" varStatus="skuofferIdx">				
										<tr>
										<td class="alg_c">
			                               <input type="radio" name="skuOfferId" value="${skuoffer.skuOfferId}" onclick="setItemMoneyTotal(this);" <c:if test="${skuoffer.ebSku.stockInventory<=0}">disabled='disabled'</c:if> ></input>
										</td>
											<td class="nwp orange">${offer.offerName}</td>
											<td>
											<c:if test="${offer.commitMonthly != null}">  <var><fmt:formatNumber type="number" value="${offer.commitMonthly/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>元</c:if>											
											<samp>/</samp>月</td>
								            <td>${offer.offerTerm}个月</td>
						<td>
						 <c:choose>
					      <c:when test="${skuoffer.skuDiscount == 0||skuoffer.skuDiscount == null}">
					        	<var><fmt:formatNumber type="number" value="${skuoffer.ebSku.skuPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>
					      </c:when>
					      <c:when test="${(skuoffer.ebSku.skuPrice-skuoffer.skuDiscount)>0}">
					        	<var><fmt:formatNumber type="number" value="${(skuoffer.ebSku.skuPrice-skuoffer.skuDiscount)/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>
					      </c:when>
					      <c:otherwise>
					        	0.00
					      </c:otherwise>
			   			</c:choose>
            </td>
            <c:choose>
		      <c:when test="${offer.schemeType == 1}">
		      <td><c:if test="${offer.prepaid!=null}"><var><fmt:formatNumber type="number" value="${offer.prepaid/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var> </c:if></td>
				<td>0</td>
		      </c:when>
		      <c:otherwise>
		        <td>0</td>	
		        <td><c:if test="${offer.prepaid!=null}"><var><fmt:formatNumber type="number" value="${offer.prepaid/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var> </c:if></td>
		      </c:otherwise>
			</c:choose>
			
            <td class="nwp">
            ${offer.notes}
            </td>
            <td class="red">
            	<div id="totalmoney">
            <c:choose>
            	<c:when test="${(skuoffer.skuDiscount != 0) && (skuoffer.skuDiscount != null)}">
					        	<c:choose>
							      <c:when test="${(skuoffer.ebSku.skuPrice-skuoffer.skuDiscount)>0}">
							      		<c:choose>
									      <c:when test="${(offer.prepaid!=null)&&(offer.schemeType==1)}">
												<var><fmt:formatNumber type="number" value="${(skuoffer.ebSku.skuPrice-skuoffer.skuDiscount+offer.prepaid)/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>
									      </c:when>
									      <c:otherwise>
									        	<var><fmt:formatNumber type="number" value="${(skuoffer.ebSku.skuPrice-skuoffer.skuDiscount)/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>									        
									      </c:otherwise>
										</c:choose>
							      </c:when>			      
							      <c:when test="${offer.prepaid!=null}">
							      	<var><fmt:formatNumber type="number" value="${offer.prepaid/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>
							      </c:when>			      
							      <c:otherwise>
							        <var>0.00</var>
							      </c:otherwise>
								</c:choose>					        	
					      </c:when>      
					      <c:when test="${(offer.prepaid!=null)&&(offer.schemeType==1)}">
					        	<var><fmt:formatNumber type="number" value="${(skuoffer.ebSku.skuPrice+offer.prepaid)/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>
					      </c:when>					      
					      <c:otherwise>
					        	<var><fmt:formatNumber type="number" value="${skuoffer.ebSku.skuPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var>
					      </c:otherwise>
			   			</c:choose>
			   	</div>		
            </td>
			
			</tr>
				</c:forEach>
			</c:forEach>
			</table> 
			</li>
					</c:forEach> --%>
	</ul>
	</c:forEach> 

	<table cellspacing="0" summary="" class="tab3" id="luojicontent">
		<tr>
		<th>商品</th>
		<th>手机规格</th>
		<th>单价(元)</th>
	          <th>可购买数量(裸机)</th>
	          <th>数量</th>
	          <th></th>
		</tr>
		<tr>
		<td><div style="float: left;">
				<c:forEach
					items='${item.pictureSet}' var="pic" varStatus="status">
					<c:if test='${status.index==0}'>
						<img src="${resourcePath}${pic.fileRelativePath}-50x50"
							alt="${item.itemName}" />
					</c:if>
				</c:forEach>
		</div><p style="color:#0066FF;">${item.itemName}</p>
						${item.promotion}</td>
		<td><span id="luojispec"></span></td>
		<td><span id="luojiprice"></span></td>
	          <td><span id="luojistock"></span></td>
	          <td><INPUT id='luojiSkuId' name='luojiSkuId' type='hidden' value=''/>
	          <INPUT id='buyNum'  maxLength='32' name='buyNum' type='text' value=""></td>
	          <td>
			<input class="hand btn83x23"  id="addCart" type="button" onclick="addCartFunc('${item.itemId}')" value="加入购物清单"/>
		</td>
		</tr>
	</table>

	<div id="offerrec">
		<h2 class="h2" title="确认购物清单">确认购物清单：</h2>
		<table cellspacing="0" summary="" align="center" class="tab3">
			<tr style="background:#e5e5e5;">
			<td><b>手机型号</b></td>
			<td><b>手机规格</b></td>
	           <td><b>套餐</b></td>
	           <td><b>话费承诺</b></td>
	           <td><b>活动期限</b></td>
	           <td><b>购机价(元)</b></td>
	           <td><b>预存话费(元)</b></td>
			<td><b>赠送话费(元)</b></td>
	           <td><b>备注</b></td>
	           <td><b>实付(元)</b></td>
	           <td><b>数量</b></td>
			</tr>
			<tbody  id="offerItem">
			</tbody>
		</table>
	</div>

<div id="luojirec">
	<h2 class="h2" title="确认购物清单">确认购物清单：</h2>
	<table cellspacing="0" summary="" align="center" class="tab3">
		<tr style="background:#e5e5e5;">
		<td><b>商品名称</b></td>
		<td><b>手机规格</b></td>
           <td><b>单价(元)</b></td>
           <td><b>数量(个)</b></td>
           <td><b>操作</b></td>
		</tr>
		<tbody id="trItem"></tbody>
	</table>
</div>

	<h2 class="h2" id="ulItemMoneyTotal"><div style="float: right;">合计金额：<font color="red" id="itemMoneyTotal"></font></div></h2>

	<h2 class="h2" id="luojiTotal"><div style="float: right;">合计数量：<font color="red" id="luojiNumTotal"></font>&nbsp;&nbsp;合计金额：<font color="red" id="luojiMoneyTotal"></font></div></h2>

	<h2 class="h2" title="收货信息">收货信息</h2>
	
	<input type="hidden" id="orderPhone" name="orderPhone" value="${phoneId }"/>
	<input type="hidden" id="serType" name="serType" value='4'/>
	<input type="hidden" id="payway" name="payway" value='1'/>
	<table cellspacing="0" summary="" class="tab3">
		<tr>
			<th width="12%"><SAMP style="color:red;">*</SAMP>收货人：</th>
			<td width="21%" class="nwp"><input type="text" name="userName" id="userName" group="address" reg="^\s*[a-zA-Z0-9\u4e00-\u9fa5]{1,20}\s*$" tip="只允许1-20个中英文数字字符" maxLength="100" /></td>
			<th width="12%"><SAMP style="color:red;">*</SAMP>联系电话：</th>
			<td class="nwp"><INPUT id='telephone'  maxLength='32' name='telephone' tip="联系电话只能为11位数字以内！" reg="^\s*[0-9]{0,11}\s*$" value="${phoneId}"></td>
			<th width="12%">邮编：</th>
			<td class="nwp"><INPUT id=postalCode class=txt maxLength=32 name=postalCode tip="邮政编码只能为6位数字！" reg="^\s*[0-9]{6,6}\s*$" group="address" ></td>
		<tr>
			<th>收货地址：<br></th>
			<td class="nwp" colspan="3">
									<select id="provice" name="provice">
										<option value="辽宁省" selected>辽宁省</option>
									</select>
									<select id="city" name="city" onchange="getDistrict(this.value)">
										<option value="沈阳">沈阳</option>
										<option value="大连">大连</option>
										<option value="鞍山">鞍山</option>
										<option value="抚顺">抚顺</option>
										<option value="本溪">本溪</option>
										<option value="丹东">丹东</option>
										<option value="锦州">锦州</option>
										<option value="营口">营口</option>
										<option value="阜新">阜新</option>
										<option value="辽阳">辽阳</option>
										<option value="朝阳">朝阳</option>
										<option value="盘锦">盘锦</option>
										<option value="葫芦岛">葫芦岛</option>
										
										<option value="铁岭">铁岭</option>
									</select>
									<select id="area" name="area"></select>
									<br>
			</td>
			<th width="12%"><SAMP style="color:red;">*</SAMP>街道地址：</th>
			<td class="nwp"><input id="street" name="street" type="text" value="" size="40" /></td>
		</tr>
		
		<tr>
			<th>支付方式：</th>
			<td><input name="payment" id="payment" type="radio" value="2" checked/>货到付款</td>
			<th>送货时间：</th>
			<td> 
			<select id="delivery" name="delivery">
				<option value="1" selected >只工作日送货（双休日，节假日不送）</option>
				<option value="2" >工作日，双休日，假日均可送货</option>
				<option value="3" >只双休日，假日送货</option>
			</select>
			</td>
			<th>送货前电话确认：</th>
			<td><INPUT value=1 type=radio name=isConfirm>是 <INPUT value=0 CHECKED type=radio name=isConfirm>否</td>
		</tr>
		
		<tr>
			<th>发票抬头：</th>
			<td class="nwp">
			<INPUT id=a1 value=1 type=radio name=payable CHECKED>个人
			<INPUT id=a2 value=2  type=radio name=payable >单位
			</td>
			<th width="12%">发票内容：</th>
			<td class="nwp">
			<INPUT value=1 CHECKED type=radio name=contents checked>明细
			</td>
			<th><div id="companycon"><SAMP style="color:red;">*</SAMP>单位名称:</div></th>
			<td width="21%" class="nwp"><input type="text" name="company" id="company" group="payable" reg="^.{1,60}$" tip="只允许1-60个字符" class="txt"/></td>
		</tr>
		<tr>
			<th>用户备注：</th>
			<td class="nwp" colspan="5">
			<TEXTAREA id='explainAre'  rows='5' cols='100' name="notes" reg="^.{1,200}$" tip="只允许1-200个字符"></TEXTAREA>
			</td>
		</tr>
	</table>
	
	<c:if test="${ note!=null && note!=''}">
		<h2 class="h2" title="注意事项">注意事项:</h2>
		<h2 class="h2"><c:out value="${note }" escapeXml="true"></c:out></h2>	
	</c:if>

	<div class="mt">
		<input class="hand btn83x23"  style="float: right;margin-right:30px" id="submitOrderID" type="button"  value="提交订单"/>
	</div>

</form>


</div></div></div>
</body>
