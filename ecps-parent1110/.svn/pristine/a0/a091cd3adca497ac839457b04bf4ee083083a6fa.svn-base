<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加档次_营销案档次_营销案管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		searchText('#searchText','#keyword',40);
	});
	$(document).ready(function(){
		function showTip(txt){
			$('#tipText').html(txt);
			tipShow('#tipDiv');
		}
		var validsen = new Array();
    	$("input[type='text'],textarea").change(function(){
    		var obj = $(this);
    		var idName = $(this).attr('id');
    		var name = "";
    		if (idName == "notes"){
    			name = "备注";
    		}else {
    			return ;
    		}
    		$.ajax({
                 type:"POST",
                 async: false,
                 url:"${path }/item/validSen1.do",
                 dataType:'json',
                 data:{
                	 content:obj.val()
                 },
                 complete:function(data){
                	 var a = eval("("+data.responseText+")");
                	if((a[0].senkey != null )&&(a[0].senkey != "" )){
                		showTip("'"+name+"'不能含有敏感词:"+a[0].senkey);
                		for(var i = 0;i < validsen.length; i++){
                			var reg = new RegExp(name);
                	        if(reg.test(validsen[i])){
                	        	validsen.splice(i,1);
                	        	break ;
                	        }
                		}
                		validsen.push("'"+name+"'不能含有敏感词:"+a[0].senkey);
                	} else {
                		for(var i = 0;i < validsen.length; i++){
                			var reg = new RegExp(name);
                	        if(reg.test(validsen[i])){
                	        	validsen.splice(i,1);
                	        	break ;
                	        }
                		}
                	}
                	
                 	
                 	obj.focus();
                 	return false;
                }
            });
    	});
		
		$("#query").click(function(){
			var minPrice=$('#minPrice').val();
			var maxPrice=$('#maxPrice').val();
			var reg = new RegExp("^[\\d]*$");
			if(!reg.test(minPrice)||!reg.test(maxPrice)){
				alert("价格范围请输入数字字符信息");
               	return;
			}
            submitText('#searchText','#keyword',40);
			getData();
		});
		$("#newaddID").click(function(){
			tipShow('#addItemID');
		});
        $("input[name='ids']").live("click", function(){
			processSelect(this);
		});
        $("input[name='discoutPrice']").live("blur", function(){
			var value=$(this).val();
			if(!checkNumber(value)){
				$(this).val("");
			}
		});
        $("input[name='purchasePrice']").live("blur", function(){
			var value=$(this).val();
			if(!checkNumber(value)){
				$(this).val("");
			}
		});
        $("input[name='paymentPrice']").live("blur", function(){
			var value=$(this).val();
			if(!checkNumber(value)){
				$(this).val("");
			}
		});
		$("input[group='number']").blur(function(){
			var value=$(this).val();
			checkNumber(value);
		});
		 $("#offerTerm").blur(function(){
				var value=$(this).val();
				var reg = new RegExp("^([1-9][0-9]{0,1})$");
				if(typeof(value)!="undefined" && value != ""){
					if(!reg.test(value)){
						alert("只能输入1-99间的正整数");
						return false;
					}
				}
				return true;
			});
	    var options = { 
	    	beforeSubmit:  validateData,  	
	        	 success:  showResponse 	 
	    }; 
	    $("#activityID").click(function(){
	    	
	    	var info = "";
			for(var i = 0;i < validsen.length; i++){
		        info += (validsen[i]+"<br/>");
			}
			if(info != ""){
				showTip(info);
				return false;
			}
	    	
	    	var content ="";
	    	var errSkuId = "";
            var errType = "";
            $("input[name='skuID']").each(function(index){
	    		if(!$(this).attr("checked")){
	    			return true;
	    		}
	    		if(content.length>0){
	    			content+="|";
	    		}
	    		var skuId=$(this).val();
	    		var discountPrice=$("#discoutPrice"+skuId+"").val();
	    		if(typeof(discountPrice)=="undefined" || discountPrice==""){
	    			discountPrice=0;
	    		}
	    		var purchasePrice=$("#purchasePrice"+skuId+"").val();
	    		if(typeof(purchasePrice)=="undefined" || purchasePrice==""){
	    			errSkuId = skuId;
	    			errType = 1;
	    		}
	    		var paymentPrice=$("#paymentPrice"+skuId+"").val();
	    		if(typeof(paymentPrice)=="undefined" || paymentPrice==""){
	    			errSkuId = skuId;
	    			errType = 2;
	    		}
	    		var productId=$("#productId"+skuId+"").val();
	    		if(typeof(paymentPrice)=="undefined" || paymentPrice==""){
	    			errSkuId = skuId;
	    			errType = 3;
	    		}
	    		content+=skuId+","+discountPrice+","+purchasePrice+","+paymentPrice+","+productId;
	    	});
	    	$("#skuIds").val(content);
	    	/*edited by Fengxq 20120803
            if(errSkuId!=""&&errType==1){
    			$("#purchasePrice"+errSkuId+"").focus();
    			alert("请补全购机价");
    			return false;
            }
	    	*/
            if(errSkuId!=""&&errType==2){
    			$("#paymentPrice"+errSkuId+"").focus();
    			alert("请补全实付价");
    			return false;
            }
           /* if(errSkuId!=""&&errType==3){
    			$("#productId"+errSkuId+"").focus();
    			alert("请补全产品编码");
    			return false;
            } */
	    	if(content==""){
	    		alert("请选择绑定商品！");
	    		return false;
	    	}
	        $("#form111").ajaxSubmit(options);
	        return false; 
	    });
	    function validateData(formData, jqForm, options){
	    	var result=true;
	    	var begin=$("#validBeginStr").val();
	    	var end=$("#validEndStr").val();
	    	if(typeof(begin)=="undefined"|| begin==""){
	    		result = false;
	    		alert("请填写开始日期！")
	    		return false;
	    	}
	    	if(typeof(end)=="undefined"|| end==""){
	    		result = false;
	    		alert("请填写结束日期！");
	    		return false;
	    	}
	    	var beginTime=new Date(Date.parse(begin.replace(/(-)/g,"/")));
	    	var endTime=new Date(Date.parse(end.replace(/(-)/g,"/")));
	    	var timeSpan=endTime-beginTime;
	    	if(timeSpan<0){
	    		result = false;
	    		alert("结束日期不能早于开始日期！");
	    		return false;
	    	}
	    	var OTvalue = $("#offerTerm").val();
			var OTinfo = $("#offerTerm").attr("info");
			var OTreg = new RegExp("^([1-9][0-9]{0,1})$"); 
			if(!OTreg.test(OTvalue) && OTvalue != ""){
				result = false;
				alert(OTinfo);
				return false;
			} else if (OTvalue==""){
				result = false;
				alert($("#offerTerm").attr("emptyTip"));
				return false;
			}
			$("input[group='number']").each(function(index){
				var value=$(this).val();
				var info=$(this).attr("info");
				var reg = new RegExp("^([1-9][0-9]{0,3}|[0])$");
				if($(this).attr("name")=="commitMonthly"){
					if(!reg.test(value) && value != ""){
						result = false;
						alert(info);
						return false;
					}else if(value==""){
						result = false;
						alert($(this).attr("emptyTip"));
						return false;
					}
					
				}
				if(typeof(value)!="undefined" && value != ""){
					if(!reg.test(value)){
						alert(info);
						result=false;
						return false;
					}
				}
	    	});
			$("[reg]").each(function(index){
				if(!clientValidate($(this))){
					result=false;
					$(this).focus();
				}
			});
			var notes=$("#notes").val();
			if(notes!="" && notes.length>200){
				alert("业务说明最多200个字符");
				return false;
			}
			return result;
		}
		function showResponse(responseText, statusText){ 
			var obj=eval("("+responseText+")");
			alert(obj.message);
			if(obj.result=="success"){
				document.location.href="<c:url value='/ecps/console/activity/listoffer.do'/>?offerGroupId=${offerGroup.offerGroupId }&offerType=3";
			}
		}
	});
	function checkNumber(value){
		var reg = new RegExp("^([1-9][0-9]{0,3}|[0])$");
		if(typeof(value)!="undefined" && value != ""){
			if(!reg.test(value)){
				alert("只能输入1-4位数的正整数或者0");
				return false;
			}
		}
		return true;
	}
	function gotoPage(pageNo){
		$("#pageNo").val(pageNo);
		getData();
	}
	function getData(){
        var catId=$("#catId").val();
		var brandId=$("#brandId").val();
		var minPrice=$("#minPrice").val();
		var maxPrice=$("#maxPrice").val();
		var keyword=$("#keyword").val();
		var pageNo=$("#pageNo").val();
		$.ajax({
			type:"post",
			url:"${base}/activity/findItemForActivity.do",
			data:{catId:catId,brandId:brandId,minPrice:minPrice,maxPrice:maxPrice,keyword:keyword,pageNo:pageNo},
			complete:viewData
		});
	}
	function viewData(data){
		var pagination = eval("("+data.responseText+")");
		viewTable(pagination);
		viewPage(pagination);
	}
	function viewTable(pagination){
		 var content="";
        var len = pagination.list.length;
        for(var i=0;i<len;i++){
			var rows =pagination.list[i].listsku.length;
            var itemId  =pagination.list[i].itemId;
            var itemNo  =pagination.list[i].itemNo;
            var itemName =pagination.list[i].itemName;
            var itemStatus =pagination.list[i].showStatus;
            var itemStr='';
            if(itemStatus==1){itemStr='<span class="red">（下架）</span>';}
            for(var ii=0;ii<rows;ii++){
                var skuId   =pagination.list[i].listsku[ii].skuId;
                var skuPrice=pagination.list[i].listsku[ii].skuPrice/100;
                var discoutPrice=pagination.list[i].listsku[ii].discoutPrice;
                var stockInventory=pagination.list[i].listsku[ii].stockInventory;
                var skuStatus =pagination.list[i].listsku[ii].showStatus;
                var skuStr='';
                if(skuStatus==1){skuStr='<span class="red">（下架）</span>';}
                content+="<tr";
                if(ii == 0){content+=" id='itemIdTip"+itemId+"'";}
                content+=">";
                if(ii == 0){
                    content+="<td"
                    if(rows > 1){content+=" rowspan='"+rows+"'";}
                    content+=">"+itemNo+"</td>";
                    content+="<td"
                    if(rows > 1){content+=" rowspan='"+rows+"'";}
                    content+=" class='nwp'>"+itemName+itemStr+"</td>";
                }
                content+="<td class='nwp'>";
                var specValues="";
                for(var iii=0;iii<pagination.list[i].listsku[ii].ebSV.length;iii++){
                    specValues+=pagination.list[i].listsku[ii].ebSV[iii].specValue;
                }
                if(specValues == ''){specValues='&nbsp;'}
                content+=specValues+skuStr;
                content+="</td>";
                content+="<td>"+skuPrice+"元</td>";
                content+="<td>"+stockInventory+"</td>";
                
                if(discoutPrice == undefined){discoutPrice = '';}
              //-------xuchen
                var tempValue='{"itemId":"'+itemId+'","itemNo":"'+itemNo+'","itemName":"'+itemName+'","skuId":"'+skuId+
                '","specValues":"'+specValues+'","skuPrice":"'+skuPrice+'","stockInventory":"'+stockInventory+'","discoutPrice":"'+discoutPrice+'","itemStatus":"'+itemStatus+'","skuStatus":"'+skuStatus+'"}'
                
               /*  var tempValue=itemId+","+itemNo+","+itemName+","+skuId+","+specValues+","+skuPrice+","+stockInventory+","+discoutPrice+","+itemStatus+","+skuStatus; */
                content+="<td><input type='button' name='ids' class='hand btn60x20' value='选择' tempValue='"+tempValue+"'/></td>";
                content+="</tr>";
			}
		}
		$("#viewID").html(content);
	}
    function processSelect(obj){
		var tempValue=$(obj).attr("tempValue");
		//-----xuchen
		var record=eval("("+tempValue+")");
/* 		var array    =tempValue.split(",");
        var size     =$("#itemId"+array[0]).length;
        var itemStatus = array[8];
        var itemStr='';
        if(itemStatus==1){itemStr='<span class="red">（下架）</span>';}
        var skuStatus = array[9];
        var skuStr='';
        if(skuStatus==1){skuStr='<span class="red">（下架）</span>';}
        var content  = "";
        if(size==0){
            content+="<tr id='itemId"+array[0]+"'>";
            content+="<td id='itemTd1"+array[0]+"'>"+array[1]+"</td>";
            content+="<td id='itemTd2"+array[0]+"' class='nwp'>"+array[2]+itemStr+"</td>";
            content+="<td>"+array[4]+skuStr+"</td>";
            content+="<td>"+array[5]+"</td>";
            content+="<td>"+array[6]+"</td>";
            content+="<td><input type='text' id='discoutPrice"+array[3]+"' name='discoutPrice' value='"+array[7]+"' class='text20' size='5' /></td>";
            content+="<td><input type='checkbox' id='skuId"+array[3]+"' name='skuID' checked='checked' value='"+array[3]+"' /></td>";
            content+="</tr>";
            $("#tbodyItem").append(content);
        }else{
            var skuIdNum=$("#skuId"+array[3]).length;
			if(skuIdNum>0){
				alert("该SKU已经加入了营销案！");
			}else{
                var rows =  $("#itemTd1"+array[0]).attr('rowspan');
                if(rows == ''|| rows== undefined){rows = 1;}
                ++rows;
                $("#itemTd1"+array[0]).attr('rowspan',rows);
                $("#itemTd2"+array[0]).attr('rowspan',rows);
                content="";
                content+="<tr>";
                content+="<td>"+array[4]+skuStr+"</td>";
                content+="<td>"+array[5]+"</td>";
                content+="<td>"+array[6]+"</td>";
                content+="<td><input type='text' id='discoutPrice"+array[3]+"' name='discoutPrice' value='"+array[7]+"' class='text20' size='5' /></td>";
                content+="<td><input type='checkbox' id='skuId"+array[3]+"' name='skuID' checked='checked' value='"+array[3]+"' /></td>";
                content+="</tr>";
                $("#itemId"+array[0]).after(content);
			}
        } */
        var size     =$("#itemId"+record.itemId).length;
        var itemStatus = record.itemStatus;
        var itemStr='';
        if(itemStatus==1){itemStr='<span class="red">（下架）</span>';}
        var skuStatus = record.skuStatus;
        var skuStr='';
        if(skuStatus==1){skuStr='<span class="red">（下架）</span>';}
        var content  = "";
        if(size==0){
            content+="<tr id='itemId"+record.itemId+"'>";
            content+="<td id='itemTd1"+record.itemId+"'>"+record.itemNo+"</td>";
            content+="<td id='itemTd2"+record.itemId+"' class='nwp'>"+record.itemName+itemStr+"</td>";
            content+="<td>"+record.specValues+skuStr+"</td>";
            content+="<td>"+record.skuPrice+"</td>";
            content+="<td>"+record.stockInventory+"</td>";
            
            content+="<td><input type='text' id='discoutPrice"+record.skuId+"' name='discoutPrice' value='"+record.discoutPrice+"' class='text20' size='5' /></td>";
            content+="<td><input type='text' id='purchasePrice"+record.skuId+"' name='purchasePrice' class='text20' size='5' /></td>";
            content+="<td><input type='text' id='paymentPrice"+record.skuId+"' name='paymentPrice' class='text20' size='5' /></td>";
            /* content+="<td><input type='text' id='productId"+record.skuId+"' name='productId' class='text20' size='20' /></td>"; */
            content+="<td><input type='checkbox' id='skuId"+record.skuId+"' name='skuID' checked='checked' value='"+record.skuId+"' /></td>";
            content+="</tr>";
            $("#tbodyItem").append(content);
        }else{
            var skuIdNum=$("#skuId"+record.skuId).length;
			if(skuIdNum>0){
				alert("该SKU已经加入了营销案！");
			}else{
                var rows =  $("#itemTd1"+record.itemId).attr('rowspan');
                if(rows == ''|| rows== undefined){rows = 1;}
                ++rows;
                $("#itemTd1"+record.itemId).attr('rowspan',rows);
                $("#itemTd2"+record.itemId).attr('rowspan',rows);
                content="";
                content+="<tr>";
                content+="<td>"+record.specValues+skuStr+"</td>";
                content+="<td>"+record.skuPrice+"</td>";
                content+="<td>"+record.stockInventory+"</td>";
                
                content+="<td><input type='text' id='discoutPrice"+record.skuId+"' name='discoutPrice' value='"+record.discoutPrice+"' class='text20' size='5' /></td>";
                content+="<td><input type='text' id='purchasePrice"+record.skuId+"' name='purchasePrice' class='text20' size='5' /></td>";
                content+="<td><input type='text' id='paymentPrice"+record.skuId+"' name='paymentPrice' class='text20' size='5' /></td>";
                /* content+="<td><input type='text' id='productId"+record.skuId+"' name='productId' class='text20' size='20' /></td>"; */
                content+="<td><input type='checkbox' id='skuId"+record.skuId+"' name='skuID' checked='checked' value='"+record.skuId+"' /></td>";
                content+="</tr>";
                $("#itemId"+record.itemId).after(content);
			}
        }
	}
	function viewPage(pagination){
		var page="";
		page+="<span class='r page inb_a'>";
		//page+="<var>"+pagination.pageNo+"/"+pagination.totalPage+"</var>";
		if(pagination.pageNo==1){
			page+="<fmt:message key='tag.page.previous'/>&nbsp;";
		}else{
			page+="<a href='javascript:void(0);' onclick='gotoPage("+pagination.prePage+")'><fmt:message key='tag.page.previous'/></a>";
		}
		if(pagination.totalPage<=pagination.pageNo){
			page+="<fmt:message key='tag.page.next'/>&nbsp;";
		}else{
			page+="<a href='javascript:void(0);' onclick='gotoPage("+pagination.nextPage+")'><fmt:message key='tag.page.next'/></a>";
		}
		//page+="<input type='text' name='pageNo' id='pageNo' class='txts' value="+pagination.pageNo+" size='7'/>";
		//page+="<input type='button' onclick='gotoPage(jump)' value="+"<fmt:message key='tag.page.jump'/>"+" class='hand' />";
		page+="</span>";
		$("#pageID").html(page);
	}
	
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>当前位置:商品管理&nbsp;&raquo;&nbsp;<a href="${base}/activity/listOfferGroup.do">营销案管理</a>&nbsp;&raquo;&nbsp;<a href="${base}/activity/listoffer.do?offerGroupId=${offerGroup.offerGroupId }&offerType=3" title="${offerGroup.offerGroupName }的营销案档次">营销案档次</a>&nbsp;&raquo;&nbsp;<span class="gray">添加档次</span><a href="${base}/activity/listoffer.do?offerGroupId=${offerGroup.offerGroupId }&offerType=3" class="inb btn120x20" title="返回${offerGroup.offerGroupName }的营销案档次">返回营销案档次</a></div>

    <form id="form111" name="form111" action="${base}/activity/addActivity.do" method="post">
        <div class="edit set">
         	<p><label><samp>*</samp>营销案名称:</label><c:out value="${offerGroup.offerGroupName }"/></p>
            <p><label><samp>*</samp>档次简称:</label><var><c:out value="${offerGroup.shortName }"/></var>&nbsp;<input type="text" name="shortName" class="text state" reg="^[1-9][0-9]{0,2}$" tip="只能是1-999的正整数"  />
            	<span class="pos"></span>
            </p>
            <p><label><samp>*</samp>档次编号:</label>&nbsp;&nbsp;&nbsp;<input type="text" name="condId" value="${offer.condId }" reg="^[0-9a-zA-Z]+$" tip="档次编号只能输入字母和数字" /><span></span></p>
            <p><label><samp>*</samp>开始日期:</label>&nbsp;&nbsp;&nbsp;<input type="text" id="validBeginStr" name="validBeginStr" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" tip="请选择开始日期"/>
            	<span class="pos"></span>
            </p>
            <p><label><samp>*</samp>结束日期:</label>&nbsp;&nbsp;&nbsp;<input type="text" id="validEndStr" name="validEndStr" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" tip="请选择结束日期"/>
               <span class="pos"></span>
            </p>
			<p><label class="alg_t">套餐名称:</label>&nbsp;&nbsp;&nbsp;<textarea id="offerName" name="offerName" rows="4" cols="45" class="are" reg="^[a-zA-Z0-9\u4e00-\u9fa5,\r\n]{0,50}$" tip="必须是中英文或数字字符,可以输入英文逗号或回车，长度5-50"></textarea>
            	<span class="pos"></span>
            </p>
         </div>

        <div class="loc">&nbsp;</div>

        <div class="edit set">
            <h2>业务绑定</h2>
            <table cellspacing="0" summary="" class="tab">
                <thead><th>业务协议期（月）</th><th>月承诺话费（元）</th><th><select id="schemeType" name="schemeType"><option value="1">预存话费（元）</option><option value="2">赠送话费（元）</option></select></th><th>返还期（月）</th><th>月返还话费（元）</th><th>首月返还话费（元）</th><th>末月返还话费（元）</th><th class="wp">备注</th></thead>
                <tbody>
                    <tr>
                        <td>
                        	<samp>*</samp><input type="text" name="offerTerm" id="offerTerm" class="text20" maxlength="2" size="5" info="业务协议期格式不正确" emptyTip="业务协议期不能为空"/>
                        </td>
                        <td><samp>*</samp><input type="text" name="commitMonthly" class="text20" size="5" group="number" info="月承诺话费格式不正确" emptyTip="月承诺话费不能为空"/></td>
                        <td><input type="text" name="prepaid" class="text20" size="5" group="number" info="预存/赠送话费格式不正确" emptyTip="预存/赠送话费不能为空"/></td>
                        <td>
                            <input type="text" name="period" id="period" class="text20" size="5" maxlength="2" info="返还期格式不正确" emptyTip="返还期不能为空"/>
                            <%--
                            <select name="period">
                            <option value="">请选择</option>
                            <option value="0">立即到账</option>
                            <option value="3">3个月</option>
                            <option value="6">6个月</option>
                            <option value="12">12个月</option>
                            <option value="18">18个月</option>
                            <option value="24">24个月</option>
                            </select>
                             --%>
                        </td>
                        <td><input type="text" name="refundMonthly" class="text20" size="5" group="number" info="月返还话费格式不正确" emptyTip="月返还话费不能为空"/></td>
                        <td><input type="text" name="refund1stmonth" class="text20" size="5" group="number" info="首月返还话费格式不正确" emptyTip="首月返还话费不能为空"/></td>
                        <td><input type="text" name="refundLastMonth" class="text20" size="5" group="number" info="月末返还话费格式不正确" emptyTip="月末返还话费不能为空"/></td>
                        <td><textarea id="notes" name="notes" rows="2" cols="30" class="are"></textarea></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="edit set">
            <h2>绑定商品</h2>
            <table cellspacing="0" summary="" class="tab">
                <thead>
                <th>商品编号</th>
                <th class="wp">商品名称</th>
                <th>商品规格</th>
                <th>商城价（元）</th>
                <th>库存</th>
                <th>优惠价格</th>
                <th>购机价</th>
                <th>实付价</th>
                <!-- <th>产品编码</th> -->
                <th>启用</th>
                </thead>
                <tbody id="tbodyItem">

                </tbody>
            </table>

            <div class="page_c"><span class="r"><input type="button" id="newaddID" name="newaddID" class="hand btn80x20" value="新增商品" /></span></div>

        </div>

        <div class="loc">&nbsp;</div>

		<div class="edit set">
            <input type="hidden" id="skuIds" name="skuIds"/>
            <input type="hidden" id="offerType" name="offerType" value="3"/>
            <input type="hidden" name="offerGroupId" value="${offerGroup.offerGroupId }">
			<p><label>&nbsp;</label><input type="button" id="activityID" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            <input type="button" class="hand btn83x23b" value="<fmt:message key='button.cancel'/>" onclick="history.back();"/>
            </p>
		</div>

	</form>
    <div class="loc">&nbsp;</div>
    
</div></div>
</body>