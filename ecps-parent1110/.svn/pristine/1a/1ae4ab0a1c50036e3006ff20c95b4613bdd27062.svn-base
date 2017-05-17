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
    	$("input[type='text'],textarea").live("blur", function(){
    		var obj = $(this);
    		$.ajax({
                 type:"POST",
                 async: false,
                 url:"${path }/item/validSen1.do",
                 dataType:'json',
                 data:{
                	 content:obj.val()
                 },
                 success:function(responseText){
                  alert('当前文本框不能含有敏感词:'+responseText.senkey);
                  obj.focus();
                  return false;
                }
            });
    	});
    	function showTip(txt){
			$('#tipText').html(txt);
			tipShow('#tipDiv');
		}
		var validsen = new Array();
    	$("input[type='text'],textarea").change(function(){
    		var obj = $(this);
    		var name = $(this).parent().children().first().html();
    		name = name.replace("<samp>*</samp>", "").replace(":", "");
    		if((name != "档次简称")&&(name != "套餐名称")){
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
            $("input[name='skuID']").each(function(index){
	    		if(!$(this).attr("checked")){return true;}
	    		if(content.length>0){
	    			content+=",";
	    		}
	    		var skuId=$(this).val();
	    		content+=skuId;
	    	});
	    	$("#skuIds").val(content);
	    	if(content==""){
	    		alert("请选择绑定商品！");
	    		return false;
	    	}
	        $("#form111").ajaxSubmit(options);
	        return false;
	    });
	    function validateData(formData, jqForm, options){
            var result=true,content='';
            $("[reg]").each(function(index){
                if(!clientValidate($(this))){
                    result=false;
                }
            });
			return result;
		}
		function showResponse(responseText, statusText){ 
			var obj=eval("("+responseText+")");
			alert(obj.message);
			if(obj.result=="success"){
                document.location.href="<c:url value='/ecps/console/activity/listoffer.do'/>?offerGroupId=${offerGroup.offerGroupId }&offerType=1";
			}
		}
	});
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
               
                var tempValue=itemId+","+itemNo+","+itemName+","+skuId+","+specValues+","+skuPrice+","+stockInventory+","+itemStatus+","+skuStatus;
                content+="<td><input type='button' name='ids' class='hand btn60x20' value='选择' tempValue='"+tempValue+"'/></td>";
                content+="</tr>";
			}
		}
		$("#viewID").html(content);
	}
    function processSelect(obj){
		var tempValue=$(obj).attr("tempValue");
		var array    =tempValue.split(",");
        var size     =$("#itemId"+array[0]).length;
        var itemStatus = array[7];
        var itemStr='';
        if(itemStatus==1){itemStr='<span class="red">（下架）</span>';}
        var skuStatus = array[8];
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
            content+="<td><input type='checkbox' id='skuId"+array[3]+"' name='skuID' checked='checked' value='"+array[3]+"' /></td>";
            content+="</tr>";
            $("#tbodyItem").append(content);
        }else{
            var skuIdNum=$("#skuId"+array[3]).length;
			if(skuIdNum>0){
				alert("该SKU已经加入了活动！");
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
                content+="<td><input type='checkbox' id='skuId"+array[3]+"' name='skuID' checked='checked' value='"+array[3]+"' /></td>";
                content+="</tr>";
                $("#itemId"+array[0]).after(content);
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

    <div class="loc icon"><samp class="t12"></samp>当前位置:商品管理&nbsp;&raquo;&nbsp;<a href="${base}/activity/listOfferGroup.do">营销案管理</a>&nbsp;&raquo;&nbsp;<a href="${base}/activity/listoffer.do?offerGroupId=${offerGroup.offerGroupId }&offerType=1" title="${offerGroup.offerGroupName }的活动档次">活动档次</a>&nbsp;&raquo;&nbsp;<span class="gray">添加档次</span><a href="${base}/activity/listoffer.do?offerGroupId=${offerGroup.offerGroupId }&offerType=1" class="inb btn80x20" title="返回${offerGroup.offerGroupName }的活动档次">返回活动档次</a></div>

    <form id="form111" name="form111" action="${base}/activity/addActivity.do" method="post">
         <div class="edit set">
            <h2>基本信息</h2>
            <p><label><samp>*</samp>活动名称:</label><c:out value="${offerGroup.offerGroupName }"/></p>
            <p><label><samp>*</samp>档次简称:</label><var><c:out value="${offerGroup.shortName }"/></var>&nbsp;<input type="text" name="shortName" class="text small" reg="^[1-9][0-9]{0,2}$" tip="只能是1-999的正整数" />
            <span class="pos"></span>
            </p>
            <p><label class="alg_t">套餐名称:</label>&nbsp;&nbsp;&nbsp;<textarea id="offerName" name="offerName" rows="4" cols="45" class="are" reg="^(.|\n){0,200}$" tip="必须是中英文或数字字符,可以输入英文逗号或回车，长度5-50"></textarea>
            <span class="pos"></span>
            </p>
         </div>

        <div class="loc">&nbsp;</div>

        <div class="edit set">
            <h2>绑定商品</h2>

            <table cellspacing="0" summary="" class="tab">
                <thead>
                <th>商品编号</th>
                <th class="wp">商品名称</th>
                <th>商品规格</th>
                <th>商城价（元）</th>
                <th>库存</th>
                <th>启用</th>
                </thead>
                <tbody id="tbodyItem">

                </tbody>
            </table>

            <div class="page_c"><span class="r"><input type="button" id="newaddID" name="newaddID" class="hand btn80x20" value="新增商品" /></span></div>

        </div>

        <div class="loc">&nbsp;</div>

		<div class="edit set">
            <input type="hidden" id="skuIds" name="skuIds" />
            <input type="hidden" id="offerType" name="offerType" value="1"/>
            <input type="hidden" name="offerGroupId" value="${offerGroup.offerGroupId }">
			<p><label>&nbsp;</label><input type="button" id="activityID" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="<fmt:message key='button.cancel'/>" onclick="history.back();"/>
            </p>
		</div>

	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>