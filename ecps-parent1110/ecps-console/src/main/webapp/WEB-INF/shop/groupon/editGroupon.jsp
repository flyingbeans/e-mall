<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑团购_促销活动</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="GrouponMenu"/>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/uploads.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	//查询商品信息
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
	//初始化团购商品名称value
	$("#itemName").val("${ebSkuList[0].itemName}");
	//添加商品
	$("#newaddID").click(function(){
		tipShow('#addItemID');
	});
	//点击选择sku
	$("input[name='ids']").live("click", function(){
		processSelect(this);
	});
	
	function processSelect(obj){
		var tempValue=$(obj).attr("tempValue");
		//-----xuchen
		var record=eval("("+tempValue+")");
        var size     =$("#tr"+record.skuId).length;
        var itemStatus = record.itemStatus;
        var itemStr='';
        if(itemStatus==1){itemStr='<span class="red">（下架）</span>';}
        var skuStatus = record.skuStatus;
        var skuStr='';
        if(skuStatus==1){skuStr='<span class="red">（下架）</span>';}
        var content  = "";
      //判断商品信息是否选中第二种商品
        var isDoubleItem = false;
        for(var i=0;i<$("#itemName").length;i++){
        	if($("#itemName").val() != record.itemName){
        		isDoubleItem = true;
        	}
        }
        if(!judageSkuAvaliable(record.skuId)){
        	return false;
        }else if(isDoubleItem){
        	alert("只能选择同一种商品信息");
        }else if(size == 0){
        	content+="<tr id='tr"+record.skuId+"'>";
            content+="<td><input type='text' id='orderNo"+record.skuId+"' name='orderNo' class='text20' size='5'maxlength='11'/></td>";
            content+="<td class='nwp' id='itemName' value='"+record.itemName+"'>"+record.itemName+itemStr+"</td>";
            content+="<td>"+record.specValues+skuStr+"</td>";
            content+="<td>"+record.skuPrice+"</td>";
            
            content+="<td><input type='text' id='grouponPrice"+record.skuId+"' name='grouponPrice' class='text20' size='5' maxlength='5'/></td>";
            content+="<td><input type='text' id='skuUpperLimit"+record.skuId+"' name='skuUpperLimit'  class='text20' size='5' maxlength='5'/></td>";
            content+="<td><input type='hidden' id='skuId"+record.skuId+"' name='skuID' checked='checked' value='"+record.skuId+"' /></td>";
       		content+="<td><a href='###' onclick='deleteSku(\""+record.skuId+"\")' >删除</a></td>";
            content+="</tr>";
            
            $("#tbodyItem").append(content);
            $("#itemName").val(record.itemName);
        }else{
        	alert("该SKU已经加入了活动！");
        }
	}
	//判断此sku是否可用
	function judageSkuAvaliable(skuId){
		var judageSkuTag = true;
		$.ajax({
			type:"POST",
			async:false,
			url:"${base}/groupon/judageSkuAvaliable.do",
			data:"skuId="+skuId,
			success:function(responseText){
				if(responseText[0]._success == "false"){
					judageSkuTag = false;
					alert(responseText[0]._message);
				}
			}
		});
		if(!judageSkuTag){
			return false;
		}else{
			return true;
		}
	}
});

function viewData(data){
	var pagination = eval("("+data.responseText+")");
	viewTable(pagination);
	viewPage(pagination);
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
	page+="<input type='hidden' name='pageNo' id='pageNo' value="+pagination.pageNo+" />";
	page+="</span>";
	$("#pageID").html(page);
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
       //判断商品包含商品规格的个数
       var temp_rows = 0;
       var temp_specValues="";
       for(var j=0;j<rows;j++){
    	   pagination.list[i].listsku[j]
    	   for(var jj=0;jj<pagination.list[i].listsku[j].ebSV.length;jj++){
    		   temp_specValues+=pagination.list[i].listsku[j].ebSV[jj].specValue;
           }
    	   if(temp_specValues != ''){
    		   temp_rows += 1;
    	   }
       }
       
       if(itemStatus==1){itemStr='<span class="red">（下架）</span>';}
       for(var ii=0;ii<rows;ii++){
           var skuId   =pagination.list[i].listsku[ii].skuId;
           var skuPrice=pagination.list[i].listsku[ii].skuPrice/100;
           var stockInventory=pagination.list[i].listsku[ii].stockInventory;
           var grouponPrice =pagination.list[i].listsku[ii].grouponPrice/100;
           var skuStatus =pagination.list[i].listsku[ii].showStatus;
           var skuStr='';
           
           if(skuStatus==1){skuStr='<span class="red">（下架）</span>';}
           
           var specValues="";
           for(var iii=0;iii<pagination.list[i].listsku[ii].ebSV.length;iii++){
               specValues+=pagination.list[i].listsku[ii].ebSV[iii].specValue;
           }
           
         //商品规格为空过滤  added by fengxq 20120924
           if(specValues != '' || true){
               content+="<tr";
               if(ii == 0){content+=" id='itemIdTip"+itemId+"'";}
               content+=">";
               if(ii == 0){
                   content+="<td"
                   if(temp_rows > 1){content+=" rowspan='"+temp_rows+"'";}
                   content+=">"+itemNo+"</td>";
                   content+="<td"
                   if(temp_rows > 1){content+=" rowspan='"+temp_rows+"'";}
                   content+=" class='nwp'>"+itemName+itemStr+"</td>";
               }
               content+="<td class='nwp'>";
               
            	   content+=specValues+skuStr;
                   content+="</td>";
                   content+="<td>"+skuPrice+"元</td>";
                   content+="<td>"+stockInventory+"</td>";
                   
                  // if(discoutPrice == undefined){discoutPrice = '';}
                 //-------xuchen
                   var tempValue='{"itemId":"'+itemId+'","itemNo":"'+itemNo+'","itemName":"'+itemName+'","skuId":"'+skuId+
                   '","specValues":"'+specValues+'","skuPrice":"'+skuPrice+'","grouponPrice":"'+grouponPrice+'","itemStatus":"'+itemStatus+'","skuStatus":"'+skuStatus+'"}'
                   
                  /*  var tempValue=itemId+","+itemNo+","+itemName+","+skuId+","+specValues+","+skuPrice+","+stockInventory+","+discoutPrice+","+itemStatus+","+skuStatus; */
                  if(specValues != '') {
                	  content+="<td><input type='button' name='ids' class='hand btn60x20' value='选择' tempValue='"+tempValue+"'/></td>";
                  }else{
                	  content +="<td>不能添加</td>";
                  }
                   content+="</tr>";
			}
           
		}
	}
	$("#viewID").html(content);
}
//得到赋值
function getData(){
    var catId=$("#catId").val();
	var brandId=$("#brandId").val();
	var minPrice=$("#minPrice").val();
	var maxPrice=$("#maxPrice").val();
	var keyword=$("#keyword").val();
	var pageNo=$("#pageNo").val();
	$.ajax({
		type:"post",
		url:"${base}/activity/findItemForPromotion.do",
		data:{catId:catId,brandId:brandId,minPrice:minPrice,maxPrice:maxPrice,keyword:keyword,pageNo:pageNo},
		complete:viewData
	});
}
//页面跳转函数,wenxian
function gotoPage(pageNo){
	$("#pageNo").val(pageNo);
	getData();
}

//删除一个sku
function deleteSku(tempValue){
	$("#tr"+tempValue).remove();
}
function backList(url){
	document.location=url;
}



function checkFileType(type) {
	var allowFileTypes = new Array(".jpg",".gif",".JPG",".GIF",".png",".PNG");
	
	for(var i=0;i<allowFileTypes.length;i++) {
		if (allowFileTypes[i] == type) {
			return true;
		}
	}
	return false;
}

function submitUpload(componentName) {
	var path = $('#'+componentName+'File').val();
	if (path == "") {
		return;
	}
	var point = path.lastIndexOf(".");
	var type = path.substr(point);
	
	if (!checkFileType(type)) {
		alert("只允许上传格式为gif、jpg 或png的图片");
		return;
	}
	
	var uploadUrl = $('#'+componentName+'Action').val();
	var options = {
			beforeSubmit: showUploadRequest,
			success:      showUploadResponse,
			error:		  showUploadResponse_error,
			type:         'post',
			dataType:     "script",
			data:{
				'fileObjName':componentName
			},
			url:          uploadUrl
	};
	$('#form111').ajaxSubmit(options);
}

function showUploadRequest(formData, jqForm, options) {
	return true;
}

function showUploadResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	var componentName = responseText[0].componentName;
	var filePath = responseText[0].filePath;
	var relativePath = responseText[0].relativePath;
	$('#grouponImg').attr("value", relativePath);
	$('#grouponImgImgSrc').attr("src", filePath+"?t="+(new Date()).getTime());
	//added by Fengxq 20121101
	$("#grouponImgFileSpan").html("请上传格式为jpg、gif或png的图片且大小不超过3MB");
	$("#isGrouponImgSuccess").val("ok");
}
//added by Fengxq 20121101上传图片超过规定的大小以后把提示信息用红色字体显示
function showUploadResponse_error(){
	$("#isGrouponImgSuccess").val("error");
	$("#grouponImgFileSpan").html("<font color='red'>请上传图片的大小不超过3MB</font>");
}
//验证表单数据
function validateData(formData, jqForm, options){
	//验证适用商品的序号和团购价
	var orderNoTag = true;
	$("input").each(function(){
		if($(this).attr("name") == "orderNo"){
			var temp_orderNo = $(this).val();
			var reg_orderNo = new RegExp("^[0-9]{0,11}$");
			if(!reg_orderNo.test(temp_orderNo)){
				alert("适用商品的序号必须为1-11位数字");
				orderNoTag = false;
				return orderNoTag;
			}
		}
	});
	if(!orderNoTag){
		return false;
	}
	var grouponPriceTag = true;
	$("input").each(function(){
		if($(this).attr("name") == "grouponPrice"){
			var temp_grouponPrice = $(this).val();
			var reg_grouponPrice = new RegExp("^[0-9]{0,5}$");
			if(!reg_grouponPrice.test(temp_grouponPrice)){
				alert("适用商品的团购价必须为1-11位数字");
				grouponPriceTag = false;
				return grouponPriceTag;
			}
		}
	});
	
	if(!grouponPriceTag){
		return false;
	}
	
	//验证团购的购买上限
	var skuUpperLimitTag = true;
	$("input").each(function(){
		if($(this).attr("name") == "skuUpperLimit"){
			var temp_skuUpperLimit = $(this).val();
			var reg_skuUpperLimit = new RegExp("^[0-9]{0,5}$");
			if(temp_skuUpperLimit != "" && temp_skuUpperLimit !=null){
				if(!reg_skuUpperLimit.test(temp_skuUpperLimit) || $(this).val()==0){
					alert("适用商品的购买上限必须为1-5位的正整数");
					skuUpperLimitTag = false;
					return skuUpperLimitTag;
				}
			}
		}
	});
	if (!skuUpperLimitTag) {
		return false;
	}
	
	//reg验证
	$("#form111").find("[reg1],[desc]").each(function(){
	var a=$(this);
	var reg = new RegExp(a.attr("reg1"));
	var objValue = a.val();
	if(!reg.test(objValue)){
		    if(a.next("span").length ==0){
			a.after("<span>"+a.attr("desc")+"</span>");
		    }
				return false;
			}
		});
	//适用商品
	var itemName = $("#itemName");
	if(itemName =='' || itemName.length == 0){
		alert("适用商品不能为空");
		return false;
	}
	//团购标题
	var grouponTitle = $('#grouponTitle').val();
	if($.trim(grouponTitle) == '' || $.trim(grouponTitle).length >= 180){
		alert("团购标题不能为空,且小于180个字符!");
		return false;
	}
	//验证图片
 	var path = $('#grouponImg').val();
 	var isHasGrouponImg = $("#isGrouponImgSuccess").val();
	if(isHasGrouponImg=="error"){
		alert("请上传图片的大小不超过3MB!");
		return false;
	}
 	/** 去掉图片验证  
	if (path == "") {
		alert("必须上传图片");
		return false;
	}
	**/
	
	//得到促销活动归属地信息
	<%--var cityAreaIdArra = [];
	$("input[name='cityAreaId']").each(function(){
		if($(this).attr("checked") == 'checked'){
			cityAreaIdArra.push($(this).val());
		}
	});
	
	if(cityAreaIdArra.length == 0){
		$("#cityAreaIdErr").addClass("err").html("适用地市不能为空");
		return false;
	}else{
		$("#cityAreaIdErr").addClass("err").html("");
	}
	--%>
	//判定团购价格
	var priceFlag = true; 
	$("input[name='grouponPrice']").each(function(){
		var t = $(this);
		var grouponPrice = t.val();
		if(grouponPrice == null || grouponPrice == ""){
			priceFlag = false;
		}
	});
	if(priceFlag == false){
		alert("请填写团购价格");
		return false;
	}
	//判断排序
	var grouponOrder = $("#grouponOrder").val();
	if(grouponOrder != ''){
		var reg_grouponOrder = new RegExp("^[0-9]{0,3}$");
		if(!reg_grouponOrder.test(grouponOrder)){
			$("#grouponOrderErr").html("必须是1-3位数字");
			return false;
		}else{
			$("#grouponOrderErr").html("");
		}
	}
	//判断虚拟购买
	var virtualSales = $("#virtualSales").val();
	if(virtualSales != ''){
		var reg_virtualSales = new RegExp("^[0-9]{0,5}$");
		if(!reg_virtualSales.test(virtualSales)){
			$("#virtualSalesErr").html("必须是1-5位数字");
			return false;
		}else{
			$("#grouponOrderErr").html("");
		}
	}
	//验证有效时间
	if(!validateDate()){
		isSubmit = false;
		return false;
	}
	return true;
}
//验证时间
function validateDate(){
	var begin=$("#startTime").val();
	var end=$("#endTime").val();
	if(typeof(begin)=="undefined"|| begin==""){
		result = false;
		alert("请填写有效时间起");
		return false;
	}
	if(typeof(end)=="undefined"|| end==""){
		result = false;
		alert("请填写有效时间止");
		return false;
	}
	var beginTime=new Date(Date.parse(begin.replace(/(-)/g,"/")));
	var endTime=new Date(Date.parse(end.replace(/(-)/g,"/")));
	var timeSpan=endTime-beginTime;
	if(timeSpan<0){
		result = false;
		alert("有效时间起不能大于有效时间止");
		return false;
	}else{
		return true;
	}
}

function showResponse(responseText, statusText){ 
	return ture;
}

function clientValidate1(obj){
	var reg = new RegExp(obj.attr("reg1"));
	var objValue = obj.attr("value");
	if($.trim(objValue) != ""){
		if(!reg.test(objValue)){
			obj.siblings("span").addClass("err").html(obj.attr("tip1"));
			return false;
		}
	}
	
	return true;
}

//提交表单
function  beforeSubmitForm(){
	//根据重新设定的时间查看sku是否发生冲突
	if( !checkSkuBeforeSubmit()){
		return false;
	}
	$("[reg1]").blur(function(){
		var isContinue=true;
		if(typeof($(this).attr("reg1")) != "undefined"){
			isContinue=clientValidate1($(this));
		}
		if(isContinue){
			$(this).siblings("span").html("");
		}
	});
	
	if(!validateData()){
		return false;
	}
	$("#form111").submit(function(){
		//$("#button1").attr("disabled","disabled");
		//添加的sku信息
		var content ="";
            var errSkuId = "";
            var errType = "";
            $("input[name='skuID']").each(function(index){
	    		
	    		if(content.length>0){
	    			content+="|";
	    		}
	    		var skuId=$(this).val();
	    		var grouponPrice=$("#grouponPrice"+skuId+"").val();
	    		if(typeof(grouponPrice)=="undefined" || grouponPrice==""){
	    			grouponPrice=0;
	    		}
	    		var skuUpperLimit = $("#skuUpperLimit"+skuId+"").val();
	    		if(typeof(skuUpperLimit)=="undefined" || skuUpperLimit==""){
	    			skuUpperLimit=100000000;
	    		}
	    		var orderNo=$("#orderNo"+skuId+"").val();
	    		if(typeof(orderNo)=="undefined" || orderNo==""){
	    			orderNo = 0;
	    		}
	    		
	    		content+=orderNo+","+skuId+","+grouponPrice+","+skuUpperLimit;
	    	});
	    	$("#grouponSku").val(content);
	    	//验证sku是否已经被其它团购使用
	});
	
}
$(document).ready(function(){
	
	 $("#button1").click(beforeSubmitForm);

}); 
//赋值
$(document).ready(function(){
	//首页推荐============
	var isRecommend =  ${ebGroupon.isRecommend};
	if(isRecommend != null && isRecommend == 1){
		$("#isRecommend").attr("checked",true);
		$("#isRecommend").val(1);
	}else{
		$("#isRecommend").attr("checked",false);
		$("#isRecommend").val(0);
	}
	//选中地市信息============
	<%--$("input[name='cityAreaId']").each(function(){
		
		var value = $(this).val();
		<c:forEach items='${ebCityAreaList }' var="tempCityArea">
		if('${tempCityArea.areaId}' == value ){
			$(this).attr("checked",true);
		}
	    </c:forEach>
	});--%>
	//温馨提示============
		
	
});

function checkNumber(value){
	var reg = new RegExp("^[1-9][0-9]{0,2}$");
	if(typeof(value)!="undefined" && value != ""){
		if(!reg.test(value)){
			alert("排序只能输入1-3位数的正整数");
			return false;
		}
	}
	return true;
}
function onClickRecommend(){
	//首页推荐设置
	var tempTag = $("#isRecommend").attr("checked");
	if(!tempTag){
		$("#isRecommend").val(0);
	}else{
		$("#isRecommend").val(1);
	}
}

function judageSkuByTime(skuIds){
	var judageSkuTag = true;
	$.ajax({
		type:"POST",
		async:false,
		url:"${base}/groupon/judageSkuByTime.do",
		data:"skuIds="+skuIds+"&grouponId="+$("#grouponId").val()+"&endTime="+$("#endTime").val(),
		success:function(responseText){
			if(responseText[0]._success == "false"){
				judageSkuTag = false;
				alert(responseText[0]._message);
			}
		}
	});
	if(!judageSkuTag){
		return false;
	}else{
		return true;
	}
}

function checkSkuBeforeSubmit(){
	var skuIds = '';
	$("input[name='skuID']").each(function(){
		var skuId = $(this).val();
		skuIds += skuId.toString();
		skuIds +=',';
	});
	return judageSkuByTime(skuIds);
}
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/promotionmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：促销活动&nbsp;&raquo;&nbsp;<span class="gray">编辑团购项目</span>
    </div>
	<form id="form111" name="form111" action="${base}/groupon/editGroupon.do" method="post" enctype="multipart/form-data">
		<input type="hidden" id="grouponId" name="grouponId" value="${ebGroupon.grouponId }"/>
		<div class="edit set">
			<p><label><samp>*</samp>活动类型：</label>
				<select id="activityType" name="activityType">
					<option value="0">手机团购</option>
				</select>
			</p>
			<div class="wp92"><label><samp>*</samp>适用商品：</label>
				 <div class="edit set up_box pre">
		            <table class="tab3" cellspacing="0" summary="">
		                <thead>
		                <th>序号</th>
		                <th class="wp">商品名称</th>
		                <th>规格</th>
		                <th>商城价</th>
		                <th>团购价</th>
		                <th>购买上限</th>
		                <th>&nbsp;</th>
		                <th>操作</th>
		                </thead>
		                <tbody id="tbodyItem">
		                    <c:forEach items="${ebSkuList }" var="sku" varStatus="skuIdx">
		                        <tr id="tr${sku.skuId }"> 
		                        	<td>
		                        		<input type="text" id="orderNo${sku.skuId }" name="orderNo" class="text20" size="5" value="${sku.orderNo }" maxlength='11'/>
		                        	</td>
		                        	<td class="nwp" id="itemName" value="${sku.itemName }">
		                        		<c:out value="${sku.itemName }" escapeXml='true'></c:out>
		                        	</td>
		                        	<td>
		                        		<c:forEach items="${sku.ebSV }" var="ebSV">
		                        			<c:if test="${ebSV.specValue != '' }">
		                        				<c:out value="${ebSV.specValue }"></c:out>
		                        			</c:if>
		                        		</c:forEach>
		                        	</td>
		                        	<td><c:out value="${sku.skuPrice/100 }"></c:out></td>
		                        	<td>
		                        		<input type="text" id="grouponPrice${sku.skuId }" name="grouponPrice" class="text20" size="5" value="<fmt:formatNumber type="number" value="${sku.grouponPrice/100}" pattern="#.##" />" maxlength='5'/>
		                        	</td>
		                        	<td>
		                        		<input type="text" id="skuUpperLimit${sku.skuId }" <c:if test="${sku.skuUpperLimit == 100000000 }">value=""</c:if> <c:if test="${sku.skuUpperLimit != 100000000 }">value="${sku.skuUpperLimit }"</c:if>  name="skuUpperLimit"  class="text20" size="5" maxlength="5"/>
		                        	</td>
		                        	<td></td>
		                        	<td>
		                        		<input type="hidden" id="skuId${sku.skuId }" name="skuID" checked="checked"  value="${sku.skuId }"/>
		                        		<a href="###" onclick="deleteSku('${sku.skuId}')">删除</a>
		                        	</td>
		                        </tr>
		                        
		                    </c:forEach>
		                </tbody>
		            </table>
		            <div class="page_c"><span class="r"><input type="button" id="newaddID" name="newaddID" class="hand btn80x20" value="新增商品" /></span></div>
		
		        </div>
			</div>
			<p><label><samp>*</samp>团购标题：</label><input type="text" id="grouponTitle" name="grouponTitle" maxlength="180" class="text state" 
			reg1="^(.{1,180})$" desc="180以内任意字符"  value="<c:out value='${ebGroupon.grouponTitle }' escapeXml='true'/>"/>
			</p>
            <p><label class="alg_t">团购图片：</label><img id="grouponImgImgSrc" src="${rsImgUrlInternal}${ebGroupon.grouponImg }" onerror="this.src='${path}/res/imgs/deflaut.jpg'" height="100" width="100" /></p>
            <p><label></label><input type='file' size='27' id='grouponImgFile' name='grouponImgFile' class="file" onchange='submitUpload("grouponImg")'/><span class="pos" id="grouponImgFileSpan">请上传格式为jpg、gif或png的图片且大小不超过3MB</span>
            <input type='hidden' id='grouponImgAction' name='grouponImgAction' value='${base}/uploads/upload_pics.do' />
            <input type='hidden' id='grouponImg' name='grouponImg' value="${ebGroupon.grouponImg }"/>
            <input type="hidden" id="isGrouponImgSuccess" value=""/>
            </p>
			<p><label>赠品信息：</label><input type="text" id="giftInfo" name="giftInfo" class="text state" maxlength="50"  reg1="^(.{1,180})$" desc="180以内任意字符" value="<c:out value='${ebGroupon.giftInfo }' escapeXml='true'/>"/>
				<span class="pos">&nbsp;</span>
			</p>
			<%-- <div><label><samp>*</samp>适用地市：</label>
				<div class="pre">
					<c:forEach items="${cityAreaList}" var="cityArea" varStatus="status">
						<input type="checkbox" name="cityAreaId" value="${cityArea.areaId }"><c:out value="${cityArea.areaName }"></c:out>
						<c:if test="${status.count == 10 }"><br/></c:if>
					</c:forEach>
				</div>
				<div id="cityAreaIdErr" class="red"></div>
			</div>
			--%>
			<p><label>排序：</label><input type="text" id="grouponOrder" name="grouponOrder" class="text state" maxlength="3"  reg="^[0-9]{0,3}$" tip="必须是1-3位数字" value="${ebGroupon.grouponOrder }"/>
				<span class="pos" id="grouponOrderErr">&nbsp;</span>
			</p>
			<p><label>虚拟购买：</label><input type="text" id="virtualSales" name="virtualSales" class="text state" maxlength="5"  reg="^[0-9]{0,5}$" tip="必须是1-5位数字" value="${ebGroupon.virtualSales }"/>
				<span class="pos" id="virtualSalesErr">&nbsp;</span>
			</p>
			<p><label><samp>*</samp>有效时间：</label><input type="text" id="startTime" name="startTimeStr" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
			value="<fmt:formatDate value="${ebGroupon.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" />&nbsp;-&nbsp;
			<input type="text" id="endTime" name="endTimeStr" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
			value="<fmt:formatDate value="${ebGroupon.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>" class="text20 state date" reg="^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$" />
				<span class="validDateErr">&nbsp;</span>
			</p>
			<p><label>首页推荐：</label><input type="checkbox" name="isRecommend" id="isRecommend" onclick="javascript:onClickRecommend()" value="0"/>
				<span class="pos">&nbsp;</span>
			</p>
			<div class="wp92"><label class="alg_t">温馨提示：</label><div class="pre"><textarea name="info" id="info"><c:out value='${ebGroupon.info}' escapeXml='true'/></textarea></div>
				<script type="text/javascript">   
					var ${"info"} = new FCKeditor('info');
					${"info"}.BasePath = '${path }/res/plugins/fckeditor/';
					${"info"}.Config["CustomConfigurationsPath"] = "${path }/res/plugins/fckeditor/myconfig.js";
					${"info"}.Config["LinkBrowser"] = false;
					${"info"}.Config["ImageBrowser"] = false;
					${"info"}.Config["FlashBrowser"] = false;
					${"info"}.Config["MediaBrowser"] = false;
					${"info"}.Config["LinkUpload"] = true;
					${"info"}.Config["ImageUpload"] = true;
					${"info"}.Config["FlashUpload"] = true;
					${"info"}.Config["MediaUpload"] = true;
					${"info"}.Config["LinkUploadURL"] = "${path}/uploads/fckUpload.do";
					${"info"}.Config["ImageUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Image";
					${"info"}.Config["FlashUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Flash";
					${"info"}.Config["MediaUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Media";
					${"info"}.ToolbarSet = "My";
					${"info"}.Width = "80%";
					${"info"}.Height = "300";				
					${"info"}.ReplaceTextarea();
					//${name}.Value = "";
					//${name}.Create();
				</script>
			</div>
		</div>

			<div class="loc">&nbsp;</div>
			<div class="edit set">
				<input type="hidden" id="grouponSku" name="grouponSku"/>
	            <input type="hidden" id="offerType" name="offerType" value="3"/>
	            <input type="hidden" name="offerGroupId" value="${offerGroup.offerGroupId }">
				<p><label>&nbsp;</label><input id="button1" type="submit" value="提 交" class="hand btn83x23" />&nbsp;&nbsp;
	            <input type="button" class="hand btn83x23b" value="<fmt:message key='button.cancel'/>" onclick="history.back();"/>
	            </p>
			</div>
			</form>

</div></div>
</body>

