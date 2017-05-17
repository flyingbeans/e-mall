<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>支付方式_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
function rightMove(opt){
	if(opt=='org'){      //网银机构移动
	$("#brand_selorg option").each(function(){  
    	var choose_sel = document.getElementById("choose_selorg"); 
    	var s = choose_sel.options.length; 
        var option= $(this);  
        if(option.attr("selected")){
        	var oEL = new Option(option.text(), option.attr("value"));
        	choose_sel.options[s++] = oEL;
        	//$(oEL).dblclick(function(){leftMove()});
            option.remove();  
        }
        
    }); 
	}else{
		$("#brand_sel option").each(function(){  
	        var brand_sel = document.getElementById("choose_sel"); 
	    	var s = brand_sel.options.length; 
	        var option= $(this);  
	        if(option.attr("selected")){  
	        	var oER = new Option(option.text(), option.attr("value"));
	            brand_sel.options[s++]=oER;
	            //$(oER).dblclick(function(){rightMove()});
	            option.remove();  
	        }  
	    });  
	}
}  
function leftMove(opt){ 
	if(opt=='org'){      //网银机构左移
    $("#choose_selorg option").each(function(){  
        var brand_sel = document.getElementById("brand_selorg"); 
    	var s = brand_sel.options.length; 
        var option= $(this);  
        if(option.attr("selected")){  
        	var oER = new Option(option.text(), option.attr("value"));
            brand_sel.options[s++]=oER;
            //$(oER).dblclick(function(){rightMove()});
            option.remove();  
        }  
    });  
	}else{
		$("#choose_sel option").each(function(){  
	        var brand_sel = document.getElementById("brand_sel"); 
	    	var s = brand_sel.options.length; 
	        var option= $(this);  
	        if(option.attr("selected")){  
	        	var oER = new Option(option.text(), option.attr("value"));
	            brand_sel.options[s++]=oER;
	            //$(oER).dblclick(function(){rightMove()});
	            option.remove();  
	        }  
	    });  
	}
}  
   
//提交表单
function formSubmit(){
	var a1=new Array;
	var a2=new Array;
	$("#choose_selorg option").each(function(){
        a1.push(this.value);
		});
	$("#choose_sel option").each(function(){
		a2.push(this.value);
		});
	window.location.href="${base}/payment/updatepaymenttool.do?orgIds="+a1+"&bankIds="+a2;
}
//点击取消
function cancle(){
	//window.location.href = "/ecps-console/ecps/console/payment/listpaymenttool.do";
	window.history.back();
}

//下移

	function downlevel(opt) {
		if (opt == 'bank') {
			var index1 = $("#choose_sel").get(0).selectedIndex + 1;
			$("#choose_sel option").filter(':eq(' + index1 + ')').after(
					$("#choose_sel option:selected"));
		} else {
			var index1 = $("#choose_selorg").get(0).selectedIndex + 1;
			$("#choose_selorg option").filter(':eq(' + index1 + ')').after(
					$("#choose_selorg option:selected"));
		}

	}
	//上移new
	function uplevel(opt) {
		if (opt == 'bank') {
			uplevelExchange("#choose_sel");
		} else {
			uplevelExchange("#choose_selorg");
		}
	}
	function uplevelExchange(selectObj) {
		var orgOptionSize = $(selectObj + " option").size();
		var optionSelected = $(selectObj + " option:selected");
		var select = $(selectObj).get(0);
		if (orgOptionSize == 1) {
			select.selectedIndex = 0;
		} else if (orgOptionSize >= 2) {
			if(select.selectedIndex >0){
			var exchange2 = optionSelected.html();
			var exchange2Val = optionSelected.val();
			optionSelected.html(optionSelected.prev().html());
			optionSelected.val(optionSelected.prev().val());
			optionSelected.prev().html(exchange2);
			optionSelected.prev().val(exchange2Val);
			if (select.selectedIndex > 0)
				select.selectedIndex--;
			}

		} else {
			alert("请选择内容");
		}

	}
</script>

</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/paymentmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp>支付管理 &gt;&gt;支付工具管理&nbsp;&raquo;&nbsp;<span class="gray" title="支付工具编辑">支付工具编辑</span>
     </div>
	
	<form name="myForm" id="myForm" action="">
		
		<h2 class="h2">机构排序：</h2>
		<table cellspacing="0" summary="" class="tab4">
			<thead>
			<tr>
			<th width="40%"><b>待选</b></th>
			<th>&nbsp;</th>
			<th width="40%"><b class="l">启用</b>
			<span class="r"><a id="down1" href="javascript:void(0);" onclick="downlevel('org');">降序↓</a>&nbsp;&nbsp;<a id="update1" href="javascript:void(0);" onclick="uplevel('org');">升序↑</a></span>


			</th>
			</tr>
			</thead>
			<tr>
			<td>
				<c:forEach items="${orgnList}" var="org">
				<input type="hidden" id="${org.poId}" value="${org.poName}" />
				</c:forEach>
				<select id="brand_selorg" size="14" multiple="true" ondblclick="rightMove('org');" style="width:300px;vertical-align: middle">
				<c:forEach items="${orgnList}" var="org">
				<option value="${org.poId}" > ${org.poName}</option>
				</c:forEach>
				</select>
			</td>
			<td class="td_c">
				<input type="button" class="hand btn83x23b" value="&gt;" onclick="rightMove('org');" />
				<p>&nbsp;</p>
				<input type="button" class="hand btn83x23b" value="&lt;" onclick="leftMove('org');" />
			</td>
			<td>
				<c:forEach items="${orgyList}" var="org">
				<input type="hidden" id="${org.poId}" value="${org.poName}" />
				</c:forEach>
				<select id="choose_selorg" size="14" multiple="true" ondblclick="leftMove('org');" style="width:300px;vertical-align: middle">
				<c:forEach items="${orgyList}" var="org">
				<option value="${org.poId}" > ${org.poName}</option>
				</c:forEach>
				</select>
			</td>
			</tr>

		</table>
		
		<h2 class="h2">网银排序：</h2>
		<table cellspacing="0" summary="" class="tab4">
			<thead>
			<tr>
			<th width="40%"><b>待选</b>
			</th>
			<th>&nbsp;</th>
			<th width="40%"><b class="l">启用</b>
			<span class="r"><a id="down2" href="javascript:void(0);" onclick="downlevel('bank');">降序↓</a>&nbsp;&nbsp;<a id="update2" href="javascript:void(0);" onclick="uplevel('bank');">升序↑</a></span>


			</th>
			</tr>
			</thead>
			<tr> 
			<td>
				<c:forEach items="${banknList}" var="bank">
				<input type="hidden" id="${bank.olbankId}" value="${bank.olbankName}" />
				</c:forEach>
				<select id="brand_sel" size="14" multiple="true" ondblclick="rightMove('bank');" style="width:300px;vertical-align: middle">
				<c:forEach items="${banknList}" var="bank">
				<option value="${bank.olbankId}">${bank.olbankName}&gt;&gt;${bank.poName}</option>
				</c:forEach>
				</select>
			</td>
			<td class="td_c">
				<input type="button" class="hand btn83x23b" value="&gt;" onclick="rightMove('bank');" />
				<p>&nbsp;</p>
				<input type="button" class="hand btn83x23b" value="&lt;" onclick="leftMove('bank');" />
			</td>
			<td>
				<c:forEach items="${bankyList}" var="bank">
				<input type="hidden" id="${bank.olbankId}" value="${bank.olbankName}" />
				</c:forEach>
				<select id="choose_sel" size="14" multiple="true" ondblclick="leftMove('bank');" style="width:300px;vertical-align: middle">
				<c:forEach items="${bankyList}" var="bank">
				<option value="${bank.olbankId}">${bank.olbankName}&gt;&gt;${bank.poName}</option>
				</c:forEach>
				</select>
			</td>
			</tr>

		</table>
		
		<p class="alg_c mt"><input id="button1" type="button" value="提 交" class="hand btn83x23" onclick="formSubmit();"/>&nbsp;&nbsp;<input type="button" id="button2" value="取消" class="hand btn83x23b" onclick=" cancle();"/></p>
	
	</form>
	  
</div></div>
</body>