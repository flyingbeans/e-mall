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
	var jumppage=$.trim($('#number1').val());
	if(jumppage == ''|| jumppage == 0){jumppage = 1};
    var reg = new RegExp("^[0-9]*$");
    
    if (!reg.test(jumppage)) {
        alert("请输入正整数！");
        return;
    } else {
    	var total = parseInt($('#paginationTotal').val());
    	if(jumppage>total){$("#pageNo").val(total);}else{$("#pageNo").val(jumppage);}
    }
    
    subVerify4Title($("#orderNo"));
    subVerify4Title($("#phone"));
    subVerify4Title($("#shipName"));
    subVerify4Title($("#userName"));
   	var a1=$("#orderNo").val();
	a1 = $.trim(a1);
	var a2=$("#phone").val();
	a2 = $.trim(a2);
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

	$("#number1").keypress(function(){
        if(event.keyCode==13){return false;}
    });
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
        var jumppage=$.trim($('#number1').val());
    	if(jumppage == ''|| jumppage == 0){jumppage = 1};
        var reg = new RegExp("^[0-9]*$");
        
        if (!reg.test(jumppage)) {
            alert("请输入正整数！");
            return;
        } else {
        	var total = parseInt($('#paginationTotal').val());
        	if(jumppage>total){$("#pageNo").val(total);}else{$("#pageNo").val(jumppage);}
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
	  var a5=$("#selTime1").val();
	  var a6=$("#shipName1").val();
	  var a7=$("#userName1").val();
	  var a8=$("#areaName1").val();
	  if(a2!=""||a3!=""||a6!=""||a7!=""){
		  $("#highSearch").show();
		  $("#highSearchButton").html("收起");
	  }
	  if(a5 !=""){
		  $("#selTime").val(a5);
	  }
	  if(a8 !=""){
		  $("#areaName").val(a8);
	  }
	  if(a2 !=""){
		  $("#payment").val(a2);
	  }
	  if(a3 !=""){
		  $("#isPaid").val(a3);
	  }
	  var a=$("#selTime").val();
		if(a==1){
			$("#selTimeTo").show();
		}
	  $("body").keypress(function(event){
		  if(event.keyCode==13) {
			  $(".sub1").click();
		  }
		}); 
	});
	
function subVerify4Title(verifyDom){
	var title=verifyDom.attr("title");
	var value=verifyDom.val();
	if(title==value){
		verifyDom.val("");
	}
}

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