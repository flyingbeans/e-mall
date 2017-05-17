<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="taglibs.jsp"%>
<script type="text/javascript">
$(function(){
	$("#selTime").change(function(){
		var checkText=$(this).find("option:selected").text();
		if(checkText == "自定义时间"){
			$("#selTimeTo").show();
		}else{
			$("#selTimeTo").hide();
			$("#begin").val("");
			$("#end").val("");
		}
	});
	
	$(".sub1").click(function(){
	var a=$("#form1");
    subVerify4Title($("#orderNo"));
    subVerify4Title($("#phone"));
    subVerify4Title($("#shipName"));
    subVerify4Title($("#userName"));
    
	var a1=$("#orderNo").val();
	var a2=$("#phone").val();
	
		if(vaildSearch(a1,a2)){
			a.submit();
			}else{
				recovery($("#orderNo"),$("#phone"),$("#shipName"),$("#userName"));
			}

	});	
	
	initInput($("#orderNo"));
	initInput($("#phone"));
	initInput($("#shipName"));
	initInput($("#userName"));

});

function gotoPage(pageNo){
    subVerify4Title($("#orderNo"));
    subVerify4Title($("#phone"));
    subVerify4Title($("#shipName"));
    subVerify4Title($("#userName"));
    
    var a1=$("#orderNo").val();
	var a2=$("#phone").val();
	
    if(pageNo!='jump'){
        $("#pageNo").val(pageNo);
    }else{
        var jumppage=$("#pageNo").val();
        var reg = new RegExp("^[0-9]+$");
        if(!reg.test(jumppage)){
            alert("请输入数字");
            $("#pageNo").val("");
            return;
        }
		if(vaildSearch(a1,a2)){
        var totalPage=<c:out value="${pagination.totalPage}"/>;
        if(jumppage>totalPage){
            $("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
        }
		}
    }
    var a=$("#form1");
    a.append('<input type="hidden" name="r" value="1"/>');
    a.submit();
}

function highSearch(){
	  
	  var highSearchText=$("#highSearchButton").html();
	  if(highSearchText=="高级搜索"){
		  $("#highSearchButton").html("收起");
		  $("#highSearch").show();
	  }else{
		  $("#highSearchButton").html("高级搜索");
		  $("#highSearch").hide(); 
	  }
}

$(function(){
	  var a2=$("#payment1").val();
	  var a3=$("#isPaid1").val();
	  var a4=$("#userId1").val(); 
	  var a5=$("#selTime1").val();
	  var a6=$("#shipName1").val();
	  var a7=$("#userName1").val();
	  if(a2!=""||a3!=""||a6!=""||a7!=""){
		  $("#highSearch").show();
		  $("#highSearchButton").html("收起");
	  }
	  if(a5 !=""){
		  $("#selTime").val(a5);
	  }
	  if(a2 !=""){
		  $("#payment").val(a2);
	  }
	  if(a3 !=""){
		  $("#isPaid").val(a3);
	  }
	  if(a4 !=""){
		  $("#userId").val(a4);
      } 
	  var a=$("#selTime").val();
		if(a==1){
			$("#selTimeTo").show();
		}
	  $("body").keypress(function(event){
		  if(event.keyCode==13) {
			  var jumppage=$("#pageNo").val();
		        var reg = new RegExp("^[0-9]+$");
		        if(!reg.test(jumppage)){
		            alert("请输入数字");
		            $("#pageNo").val("");
		            return;
		        }else{
			  $(".sub1").click();
		        }
		  }
		}); 
	});
	
function initInput(inputDom){
	var title=inputDom.attr("title");
	var inputValue=inputDom.val();
	if(inputValue==""){
		inputDom.val(title).addClass("gray");
	}	
	inputDom.focus(function(){
		var val=$(this).val();
		if(val==title){
			$(this).val("");$(this).removeClass("gray");
		}
	});
	inputDom.blur(function(){
		if($(this).val()==""){
			$(this).val(title).addClass("gray");
		}
	});
}
function recovery(){
	var args=recovery.arguments;
	for(var i=0;i<args.length;i++){
		var inputDom=args[i];
		var title=inputDom.attr("title");
		var inputValue=inputDom.val();
		if(inputValue==""){
			inputDom.val(title).addClass("gray");
		}	
	}
}
</script>
<select id="selTime" name="selTime">
<option value="0" selected>请选择下单时间</option>
<option value="1">自定义时间</option>
<option value="2">当天</option>
<option value="3">近一周</option>
<option value="4">近一月</option>
</select>
<span id="selTimeTo" style="display: none"><input type="text" id="begin" name="begin" onfocus="WdatePicker({alwaysUseStartDate:true,dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'end\')}'})" value="${begin}" class="text20 gray date" size="22" />至&nbsp;<input type="text" id="end" name="end" onfocus="WdatePicker({alwaysUseStartDate:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'begin\')}'})" value="${end}" class="text20 gray date" size="22" /></span>
<select id="areaName" name="areaName">
<option value="" selected>请选择归属地</option>
<option value="">全部</option>
<option value="240">贵阳</option>
<option value="410">都匀</option>
<option value="411">毕节</option>
<option value="412">六盘水</option>
<option value="413">凯里</option>
<option value="414">遵义</option>
<option value="415">兴义</option>
<option value="416">铜仁</option>
<option value="417">安顺</option>
</select>
<input type="text" id="orderNo" name="orderNo" title="请输入订单号" class="text20 medium gray" value="${orderNo}" /><input type="text" id="phone" name="phone" title="请输入联系电话" class="text20 medium gray" value="${phone}" /><input type="button" class="hand btn60x20 sub1" value="<fmt:message key="tag.search"/>" /><!-- <input type="reset" class="hand btn60x20" value="重置" /> -->&nbsp;&nbsp;<a id="highSearchButton" href="javascript:void(0);" onclick="highSearch()">高级搜索</a>
</p>
<div id="highSearch" style="display:none;">
<p class="mt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="payment" name="payment">
<option value="" selected>请选择支付方式</option>
<option value="">全部</option>
<option value="1">在线支付</option>
<option value="2">货到付款</option>
<option value="3">营业点自提</option>
</select><select id="isPaid" name="isPaid">
<option value="" selected>请选择支付状态</option>
<option value="">全部</option>
<option value="0">未付款</option>
<option value="1">已付款</option>
</select>
<input type="text" id="userName" name="userName" title="请输入下单用户" value="<c:out value="${userName}"/>" class="text20 medium gray" />
<input type="text" id="shipName" name="shipName" title="请输入收货人" value="<c:out value="${shipName}"/>" class="text20 medium gray" />
</p>
</div>
<input type="hidden" id="orderState" name="orderState" value="${orderState}" />
<input type="hidden" id="payment1" name="payment1" value="${payment}" />
<input type="hidden" id="isPaid1" name="isPaid1" value="${isPaid}" />
<input type="hidden" id="areaName1" name="areaName1" value="${areaName}" />
<input type="hidden" id="userName1" name="userName1" value="${userName}"/>
<input type="hidden" id="shipName1" name="shipName1" value="${shipName}"/>
<input type="hidden" id="userId1" name="userId1" value="${userId}" />
<input type="hidden" id="selTime1" name="selTime1" value="${selTime}" />

