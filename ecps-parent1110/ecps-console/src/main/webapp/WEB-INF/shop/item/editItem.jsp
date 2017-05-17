<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑商品_实体商品_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/uploads.js'/>"></script>
<script language="javascript" type="text/javascript">

//==================================================================================================================
	$(document).ready(function(){
	
		
	
	var tagImgValue=$("input[name='tagImg']:checked").val();
	if(tagImgValue==2){
		$("#tagId").show();
	}else{
		$("#tagId").hide();
	}
	$("input[name='tagImg']").click(function(){
		var value=$(this).val();
     	if(value==2){
     		$("#tagId").show();
        }else{
        	$("#tagId").hide();
        }
    });
	
	$("input[name='tagImgID']").live("click",function(){
		var imgObj=$(this).next();
		var src=imgObj.attr("src");
		$("#upshow").attr("src",src);
    });
	//删除图标
	$("a[d]").live("click",function(){
		var value=$(this).attr("d");
		$.ajax({
            type:"post",
            url:"${path }/item/delTagImg.do",
            data:"tagImgId="+value,
            success:function(data){
            	var result=eval("("+data+")");
            	alert(result._mes);
             	if(result._status=="true"){
             		loadTagImg();
                }
           	}  
		});
    });
	
	//新增图标
	$("input[name='upload444']").click(function(){ 
		var options = {
			beforeSubmit: validateImg,
			success: handleResponse,
			dataType: "script",
			data:{"fileObjName":"tagImg"},
			url:"${path}/uploads/upload_pic.do",
			type:"post"
		};
	    $("#myForm").ajaxSubmit(options);
	    return false; 
	});
	//运营范围
	$("input[name='businessScope']").each(function(){
		var value = $(this).val();
		//商品运营范围选中
		<c:forEach items='${itemBusinessScopeList}' var="itemBusinessScope">
			if('${itemBusinessScope.businessScopeId}' == value){
				$(this).attr("checked",true);
			}
	    </c:forEach>
	    //权限运营范围控制
	    var findFlag = false;
		<c:forEach items='${existBusinessScopeIdSet}' var="existBusinessScopeId">
			if('${existBusinessScopeId}' == value){
				findFlag = true;
			}
	    </c:forEach>
	    if(findFlag){
	    	$(this).attr("disabled",false);
	    }else{
	    	$(this).attr("disabled",true);
	    }
	});
	function validateImg(formData, jqForm, options){
		var path=$("#tagImgFile").val();
		if(path==""){
			alert("请上传图片");
			return false;
		}
		var point = path.lastIndexOf(".");
		var type = path.substr(point);
		if (!checkFileTypeNoJpg(type)) {
			alert("只允许上传格式为gif、png的图片");
			return false;
		}
		return true;
	}
	function handleResponse(responseText, statusText){
		responseText = $.parseJSON(responseText);
		var filePath = responseText[0].filePath;
		var relativePath = responseText[0].relativePath;
		//===保存图标
		$.ajax({
            type:"post",
            url:"${path }/item/saveTagImg.do",
            data:"tagImgUrl="+relativePath,
            success:function(data){
            	var result=eval("("+data+")");
            	alert(result._mes);
             	if(result._status=="true"){
             		loadTagImg();
                	
                }
           	}  
		});
	}
	//=====加载数据
	function loadTagImg(){
		var listtag=null;
		$.ajax({
            type:"post",
            async:false,
            url:"${path }/item/findTagImg.do",
            success:function(data){
            	var result=eval("("+data+")");
             	if(result[0]._status=="true"){
             		listtag=result[0].list;
                }else{
                	alert(result[0]._mes);
                }
           	}  
		});
		if(listtag==null){
			return;
		}
		var content="";
		var length=listtag.length;
		for(var index=1;index<=length;index++){
			var tagImg=listtag[index-1];
			content+="<span>";
			content+="<input type='radio' name='tagImgID' value='"+tagImg.tagImgID+"'/>";
			var onerror="this.src='${base}/res/imgs/deflaut.jpg'"
			content+="<img src='${rsImgUrlInternal}"+tagImg.tagImgUrl+"' onerror="+onerror+" width='50' height='30'>";
			content+="<a href='javascript:void(0);' d='"+tagImg.tagImgID+"'>删除</a>";
			content+="</span>";
		}
		$("#tags").html(content);
		if(length<20){
			$("input[name='upload444']").removeAttr("disabled");
			$("#infotip").hide();
		}else{
			$("input[name='upload444']").attr("disabled","disabled");
			$("#infotip").show();
		}
	}
	
	
});
//==================================================================================================================

function swapNode(node1,node2)
{
var _parent=node1.parentNode;
var _t1=node1.nextSibling;
var _t2=node2.nextSibling;
if(_t1)
_parent.insertBefore(node2,_t1);
else
_parent.appendChild(node2);
if(_t2)
_parent.insertBefore(node1,_t2);
else
_parent.appendChild(node1);
}

function swap(index1,index2){
swapNode(document.getElementById(index1),document.getElementById(index2));
}

function up(index){
   var _element=document.getElementById("imgs"+index+"Img");
    var _element1=document.getElementById("imgs"+(index-1)+"Img");
    if(_element1!=null){
        var imagTemp=_element.getAttribute("src");
        var imagTemp1=_element1.getAttribute("src");
         $("#imgs"+index+"Img").attr("src",imagTemp1);
        $("#imgs"+(index-1)+"Img").attr("src",imagTemp);

         var fileTemp=$("#imgsFilePath"+index).val();
         var fileTemp1=$("#imgsFilePath"+(index-1)).val();
           $("#imgsFilePath"+index).val(fileTemp1);
           $("#imgsFilePath"+(index-1)).val(fileTemp);
    }
}
function down(index){
   var _element=document.getElementById("imgs"+index+"Img");
    var _element1=document.getElementById("imgs"+(index+1)+"Img");
    if(_element1!=null){
        var imagTemp=_element.getAttribute("src");
        var imagTemp1=_element1.getAttribute("src");
         $("#imgs"+index+"Img").attr("src",imagTemp1);
        $("#imgs"+(index+1)+"Img").attr("src",imagTemp);

         var fileTemp=$("#imgsFilePath"+index).val();
         var fileTemp1=$("#imgsFilePath"+(index+1)).val();
           $("#imgsFilePath"+index).val(fileTemp1);
           $("#imgsFilePath"+(index+1)).val(fileTemp);
    }
}

function checkRadio(obj){
    var checks = document.getElementsByName("tagImg");
   if(obj.checked)
   {for(var i=0;i<checks.length;i++){
           checks[i].checked = false; }
       obj.checked = true;
   }else
   {
       for(var i=0;i<checks.length;i++){
           checks[i].checked = false;
       }
   }
}

$(function(){
	var divNum=1;
	var tObj;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var rel = $(this).attr("rel");
            var rev = $(this).attr("rev");
			var rel_t = tObj.attr("rel");
			tObj.attr("class","nor");
			$(this).attr("class","here");
            if($(rev).length){$(rev).show();}else{$('#submitDis').hide();}
			$(rel_t).hide();
			$(rel).show();
			tObj = $(this);
			if(rel == '#tab_2'){
				FCKeditorAPI.GetInstance('itemDesc').Focus();
				//FCKeditorAPI.GetInstance('itemDesc').EditorDocument.body.innerHTML = '12123123';
			}
		});
	});
	$("input[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			if(a.next("span").length ==0){
			a.after("<span>"+a.attr("desc")+"</span>");
			}
		}else{
			a.next("span").remove();
			}
		});
	//实现页面规格的自动增加和删除
	$("#button2").click(function(){
		var d=(divNum++);
		$("#button2").before("<div class='sp_0' id='sp_"+d+"'>"+$("#sp_0").html().replace(/specradio/g,d+"specradio")+"</div>");
		$("#button3").removeAttr("disabled");
		});
	$("#button3").click(function(){
		$("#button2").prev("div").remove();
		divNum--;
		var i=$("div[id*='sp']");
		if(i.length==1){
			$("#button3").attr("disabled","disabled");
			}
		});
	$("#button1").click(function(){
		//90*150图片验证
		var redFont = $("#redFont").attr("color");
		if(redFont == 'red'){
			alert("保存失败，请检查必填项是否正确");
			return false;
		}
        if (!updateList()) {
        	$("#uploadImgTip").html("请上传图片!注:第一张上传图为默认图。");
            alert("保存失败，请检查必填项是否正确");
            return false;
		}
        
        var businessScopeArr = [];
		$("input[name='businessScope']").each(function(){
			if($(this).attr("checked") == 'checked'){
				businessScopeArr.push($(this).val());
			}
		});
		if(businessScopeArr.length == 0){
			alert("请选择商品的运营范围");
			return;
		}
        
      //检查赠品信息
        var phoneVal = $("#phone").attr("value");
        var offerVal = $("#offer").attr("value");
        if (phoneVal == "1" || offerVal == "1") {
        	var gDesc = $("#giftDesc").val();
        	if (gDesc == "") {
        		alert("您已经选择赠品，请填写赠品描述信息。");
        		return false;
        	}
        }
      	
        //检查商品90x150图片
        var imgSize1Val = $("#imgSize1").val();
        if (imgSize1Val == "") {
        	$("#uploadImgTip1").html("请上传图片!注:该尺寸图片必须为90x150。");
        	alert("保存失败，请检查必填项是否正确");
        	return false;
        }
        
        var s=true;
		$("#myForm").find("[reg1],[desc]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			    if(a.next("span").length ==0){
				a.after("<span>"+a.attr("desc")+"</span>");
			    }
					s=false;
					return;
				}
			});
		
        if(s){
        	
        	if($("#itemName").val()!="${ebItem.itemName}") {
                  //重命名
	      		var rename=true;
	      		$.ajax({
	                   type:"POST",
	                   async: false,
	                   url:"${path }/item/validJSONName.do",
	                   data:"itemName="+$("#itemName").val(),
	                   success:function(data){
	                       if(data == "false"){
	                       		rename=false;
	                       }
	                  }
	      		});
	      		if(!rename){
	      			if($("#itemName").next("span").length ==0){
	      				$("#itemName").after("<span>商品名称重复</span>");
	      			}
	                return;
      	   		}
        	}
                 //敏感词
        var sensitivity=true;
       var content = FCKeditorAPI.GetInstance("itemDesc").GetXHTML(true);
       var packingList = FCKeditorAPI.GetInstance("packingList").GetXHTML(true);
          $.ajax({
             type:"POST",
             async: false,
             url:"${path }/item/validSen.do",
             data:"itemName="+$("#itemName").val()+"&promotion="+$("#promotion").val()+"&keywords="+$("#keywords").val()+"&pageDesc="+$("#pageDesc").val()+"&itemDesc="+content+"&packingList="+packingList,
             success:function(responseText){
               var dataObj=eval("("+responseText+")");
               if(dataObj[0]._success=="false"){
                  alert(dataObj[0]._message);
                   sensitivity=false;
               }else if(dataObj[0]._success=="true"){
                 sensitivity=true;
               }
            }
            });
        if(!sensitivity){
          return;
       }
		var iNum=0;
		$("#tab_3").each(function(){
             $(this).find(".paraValue4").each(function(){
                    var a=$(this);
                    var pKey=a.val();
                    var pType=a.next();
                    var pVal="";
                    if(pType.attr("g") == "g"){
                       pVal=pType.val();
                     }
                    if(pType.attr("type") == "text"){
                       pVal=a.next(".paraValue").val();
                     }
                    if(pType.attr("type") == "radio"){
                       pVal=a.next("input:checked").val();
                    }
                    if(pType.attr("type") == "checkbox"){
                    	 var b=a.nextAll("input:checked");
                         for(var jj=0;jj<b.length;jj++){
                        	 pVal=pVal+b.eq(jj).val()+"/r/n";  
                         }
                    }
                    if(pVal != "" && typeof(pVal) !="undefined"){
                        var paraVal=pKey+"|"+pVal;
                    $("#myForm").append("<input type='hidden' name='paraValue' id='paraValue' value='"+paraVal+"'/>");
                        }
                 });
			});
		$("input[name=businessScope]").each(function(){$(this).attr("disabled",false)});
		$("#myForm").submit();
        }
		});

	$("#showStatus3").click(function(){
		var a=$("#auditStatus1").attr("checked");
		if("checked" != a){
			alert("必须得审核通过后，才能上架");
			$("#showStatus4").attr("checked",true);
		}
	});
	 $("#auditStatus0").click(function(){
	    	$("#showStatus4").attr("checked",true);
	    	$("#showStatus1").attr("value","1");
	        });
	    $("#auditStatus2").click(function(){
	    	$("#showStatus4").attr("checked",true);
	    	$("#showStatus1").attr("value","1");
	    });
	    $("#showStatus4").click(function(){
	    	 $("#showStatus1").attr("value","1");
	        });
});

function addPic() {
	var imgsCount = $("#imgsCount").val();
	var imgsIndex = $("#imgsIndex").val();
	if (imgsCount < 5) {
		var imgsBlankValue = $("#imgsBlank").val();
		var oneTr = '<tr id="imgsTr'+imgsIndex+'">'+
			'<td>'+
			'<span class="pic"><img id="imgs'+imgsIndex+'Img" name="imgs'+imgsIndex+'Img" src="'+imgsBlankValue+'" width="100" height="100" /></span>'+
			'<input type="file" id="imgs'+imgsIndex+'File" name="imgs'+imgsIndex+'File" class="file" onchange="submitUploads(\''+imgsIndex+'\')" />'+
			'<input type="hidden" id="imgsFilePath'+imgsIndex+'" name="imgsFilePath'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileRelativePath'+imgsIndex+'" name="imgsFileRelativePath'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileDesc'+imgsIndex+'" name="imgsFileDesc'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileIndex'+imgsIndex+'" name="imgsFileIndex'+imgsIndex+'" value="'+imgsIndex+'" />'+
			'</td>'+
			'<td class="nwp">'+
			'<input type="text" reg1="^(.{0,40})$" desc="40个任意字符以内" id="imgsDesc'+imgsIndex+'" name="imgsDesc'+imgsIndex+'" class="text 10" />'+
			'</td>'+
			'<td>'+
			/* '<input class="hand btn60x20" onclick="up(\''+imgsIndex+'\')" type="button" value="上 移" /><br />'+
			'<input class="hand btn60x20" onclick="down(\''+imgsIndex+'\')" type="button" value="下 移" /><br />'+ */
			'<input class="hand btn60x20" onclick="delPic(\''+imgsIndex+'\')" type="button" value="删 除" />'+
			'</td>'+
			'</tr>';
		$("#imgsPre tr").last().prev().after(oneTr);
		imgsCount++;
		imgsIndex++;
		$("#imgsCount").val(imgsCount);
		$("#imgsIndex").val(imgsIndex);
	} else {
		alert("只能添加5个图片，图片已达到上限！");
	}
}

function delPic(imgsIndex) {
	var a=window.confirm("确定是否删除?");
	if(!a){
		return;
		}
	var filePath = $("#imgsFilePath"+imgsIndex).val();
	if (filePath != "") {
		deleteUploads(filePath);
	}
	
	var imgsCount = $("#imgsCount").val();
	imgsCount--;
	$("#imgsCount").val(imgsCount);
	$("#imgsTr"+imgsIndex).remove();
}

function submitImgSize1Upload(componentName) {
	var path = $('#'+componentName+'File').val();
	if (path == "") {
		return;
	}
	var point = path.lastIndexOf(".");
	var type = path.substr(point);
	
	if (!checkFileType(type)) {
		alert("只允许上传格式为gif、jpg的图片");
		return;
	}
	
	var uploadUrl = $('#'+componentName+'Action').val();
	var options = {
			beforeSubmit: showUploadImgSize1Request,
			success:      showUploadImgSize1Response,
			error:		  function(){
				showUploadImgSize1Response_error(componentName);
			},
			type:         'post',
			dataType:     "script",
			data:{
				'fileObjName':componentName
			},
			url:          uploadUrl
	};
	$('#myForm').ajaxSubmit(options);
}

function showUploadImgSize1Request(formData, jqForm, options) {
	return true;
}

function showUploadImgSize1Response(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	var componentName = responseText[0].componentName;
	var filePath = responseText[0].filePath;
	var relativePath = responseText[0].relativePath;
	$('#'+componentName).attr("value", relativePath);
	$('#'+componentName+'ImgSrc').attr("src", filePath+"?t="+(new Date()).getTime());
	//added by Fengxq 20121101
	$("#imgSize1FileSpan").html("请上传图片的大小不超过3MB");
}
//added by Fengxq 20121101上传图片超过规定的大小以后把提示信息用红色字体显示
function showUploadImgSize1Response_error(imgsIndex){
	var imgsBlankValue = $("#imgsBlank").val();
	$('#'+imgsIndex+'Path').attr("value", "");
	$('#'+imgsIndex+'RelativePath').attr("value", "");
	$('#'+imgsIndex+'ImgSrc').attr("src", imgsBlankValue);
	$("#imgSize1FileSpan").html("<font id='redFont' color='red'>请上传图片的大小不超过3MB</font>");
}
function submitGiftUpload(componentName) {
	var path = $('#'+componentName+'File').val();
	if (path == "") {
		return;
	}
	var point = path.lastIndexOf(".");
	var type = path.substr(point);
	
	if (!checkFileType(type)) {
		alert("只允许上传格式为gif、jpg的图片");
		return;
	}
	
	var uploadUrl = $('#'+componentName+'Action').val();
	var options = {
			beforeSubmit: showUploadGiftRequest,
			success:      showUploadGiftResponse,
			error:		  showUploadGiftResponse_error,
			type:         'post',
			dataType:     "script",
			data:{
				'fileObjName':componentName
			},
			url:          uploadUrl
	};
	$('#myForm').ajaxSubmit(options);
}

function showUploadGiftRequest(formData, jqForm, options) {
	return true;
}

function showUploadGiftResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	var componentName = responseText[0].componentName;
	var filePath = responseText[0].filePath;
	var relativePath = responseText[0].relativePath;
	$('#'+componentName).attr("value", relativePath);
	$('#'+componentName+'ImgSrc').attr("src", filePath+"?t="+(new Date()).getTime());
	//added by Fengxq 20121101
	$("#giftImgFileSpan").html("请上传图片的大小不超过3MB");
}
//added by Fengxq 20121101上传图片超过规定的大小以后把提示信息用红色字体显示
function showUploadGiftResponse_error(){
	$("#giftImgFileSpan").html("<font color='red'>请上传图片的大小不超过3MB</font>");
}
function setGiftShowType(id) {
	if ($("#"+id).attr("checked") == "checked") {
		$("#"+id).attr("value", "1");
	} else {
		$("#"+id).attr("value", "0");
	}
}

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system }/common/itemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>:<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/listEntity.do"/>" title="实体商品">实体商品</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑商品</span>
    <a href="<c:url value="/${system }/item/listEntity.do"/>" title="返回实体商品" class="inb btn80x20">返回实体商品</a>
</div>
<form action="${path}/item/editSaveItem.do?" name="myForm" id="myForm" method="post">
<h2 class="h2_ch"><span id="tabs" class="l">
<a href="javascript:void(0);" rel="#tab_1" rev="#submitDis" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" rel="#tab_2" rev="#submitDis" title="商品描述" class="nor">商品描述</a>
<a href="javascript:void(0);" rel="#tab_3" rev="#submitDis" title="商品参数" class="nor">商品参数</a>
<a href="javascript:void(0);" rel="#tab_4" title="商品规格" class="nor">商品规格</a>
<a href="javascript:void(0);" rel="#tab_5" rev="#submitDis" title="包装清单" class="nor">包装清单</a>
</span></h2>
<div id="tab_1" class="edit set">
	<input type="hidden" name="itemId" id="itemId" value="${ebItem.itemId}"/>
	<p><label>商品编号:</label>${ebItem.itemNo}
	   <input type="hidden" id="itemNo" name="itemNo" value="${ebItem.itemNo}">
	</p>
    <p><label><samp>*</samp>商品名称:</label><input type="text" reg1="^^(.{1,100})$" desc="100以内任意字符" id="itemName" name="itemName" class="text state" value="${ebItem.itemName}" escapeXml="false" />
	</p>
	<p><label><samp>*</samp>商品分类:</label>${ebCat.catName}
        <input type="hidden" id="catId" name="catId" value="${ebCat.catId}" class="txt" />
	</p>
	<p><label>商品品牌:</label>
	<select  id="brandId" name="brandId" >
	<option<c:if test="${ebItem.brandId==-1}"> selected</c:if> value="-1">请选择商品品牌</option>
    <c:forEach items="${blist}" var="b">
    <option<c:if test="${b.brandId == ebItem.brandId}"> selected</c:if> value="${b.brandId}">${b.brandName}</option>
    </c:forEach>
	</select></p>
	<p><label><samp>*</samp>运营范围:</label>
		<c:forEach items="${businessScopeList}" var="businessScope">
			<input name="businessScope" type="checkbox"  value="${businessScope.businessScopeId}"/><c:out value="${businessScope.businessScopeName}"></c:out>&nbsp;&nbsp;
		</c:forEach>
	</p>
	<p><label>赠品信息:</label>
		<c:if test="${phone!=''}">
			<c:if test="${phone=='0'}">
				<input id="phone" name="phone" type="checkbox"  value="${phone}" onclick="setGiftShowType('phone');" />裸机送&nbsp;&nbsp;
			</c:if>
			<c:if test="${phone=='1'}">
				<input id="phone" name="phone" type="checkbox"  value="${phone}" checked onclick="setGiftShowType('phone');" />裸机送&nbsp;&nbsp;
			</c:if>
		</c:if>
		<c:if test="${phone==''}">
			<input id="phone" name="phone" type="checkbox"  value="0" onclick="setGiftShowType('phone');" />裸机送&nbsp;&nbsp;
		</c:if>
		<c:if test="${offer!=''}">
			<c:if test="${offer=='0'}">
				<input id="offer" name="offer" type="checkbox" value="${offer}" onclick="setGiftShowType('offer');" />营销案送&nbsp;&nbsp;
			</c:if>
			<c:if test="${offer=='1'}">
				<input id="offer" name="offer" type="checkbox" value="${offer}" checked onclick="setGiftShowType('offer');" />营销案送&nbsp;&nbsp;
			</c:if>
		</c:if>
		<c:if test="${offer==''}">
			<input id="offer" name="offer" type="checkbox" value="0" onclick="setGiftShowType('offer');" />营销案送&nbsp;&nbsp;
		</c:if>
    	<%-- <c:if test="${groupon!=''}">
    		<c:if test="${groupon=='0'}">
    			<input id="groupon" name="groupon" type="checkbox" value="${groupon}" onclick="setGiftShowType('groupon');" />促销活动送
    		</c:if>
    		<c:if test="${groupon=='1'}">
    			<input id="groupon" name="groupon" type="checkbox" value="${groupon}" checked onclick="setGiftShowType('groupon');" />促销活动送
    		</c:if>
    	</c:if>
    	<c:if test="${groupon==''}">
    		<input id="groupon" name="groupon" type="checkbox" value="0" onclick="setGiftShowType('groupon');" />促销活动送
		</c:if> --%>
    	<!-- <input type='hidden' id='giftShowType' name='giftShowType' value='' /> -->
	</p>
	<p><label></label>
		<!-- <img id='giftImgImgSrc' src='${rsImgUrlInternal}${ebItem.giftImg}' onerror="this.src='${base}/res/imgs/deflaut.jpg'" height="100" width="100" /> -->
		<input type="text" reg1="^(.{0,100})$" desc="100以内任意字符" id="giftDesc" name="giftDesc" class="text state" value="${ebItem.giftDesc}"  maxlength="100"/>
	</p>
	<!-- 
	<p><label></label>
		<input type='file' size='27' id='giftImgFile' name='giftImgFile' class="file" onchange='submitGiftUpload("giftImg")' /><span class="pos" id="giftImgFileSpan">请上传图片的大小不超过3MB</span>
		<input type='hidden' id='giftImgAction' name='giftImgAction' value='${path}/uploads/upload_pic.do' />
        <input type='hidden' id='giftImg' name='giftImg' value='${ebItem.giftImg}' reg="^.+$" tip="亲！您忘记上传图片了。" />
    </p>
     -->
    <p><label>标签图:</label>
    	<input type="radio" <c:if test="${ebItem.tagImg ==1}"> checked</c:if> name="tagImg" value="1" class="txt"/>无&nbsp;&nbsp;
        <input type="radio"<c:if test="${ebItem.tagImg ==2}"> checked</c:if>  name="tagImg" value="2" class="txt"/>有
	</p>
	
	<div id="tagId" class="up_box" style="display:none">
	
		<div class="addTagPic">
			<div>
				<img src="${base }/res/imgs/p225x290.jpg" />
				<img id="upshow" src="${rsImgUrlInternal}${itemTagImg.tagImgUrl }" onerror="this.src='${base}/res/imgs/deflaut.jpg'" class="hotPic" />
				<p class="alg_c orange">注:请选择小于底图的标签图。</p>
			</div>
			
			<dl>
				<dt id="tags">
					<c:set var="size" value="${fn:length(listTagImg)}"/>
					<c:forEach items="${listTagImg }" var="tagImg" varStatus="index">
						 <span>
						 	<input type="radio" <c:if test="${ebItem.tagImgID == tagImg.tagImgID}"> checked</c:if> name="tagImgID" value="${tagImg.tagImgID }"/> <img src="${rsImgUrlInternal}${tagImg.tagImgUrl }" onerror="this.src='${base}/res/imgs/deflaut.jpg'" /><a href="javascript:void(0);" d="${tagImg.tagImgID }" class="inb btn60x20">删除</a>  						 	
						 </span>
					</c:forEach> 										
				</dt>
				<dd><b>新增标签图:</b><input type="file" id="tagImgFile" name="tagImgFile" class="file"/><input type="button" name="upload444" value="上传" class="hand btn83x23"<c:if test="${size>=20 }"> disabled</c:if> /></dd>
				<dd id="infotip" <c:if test="${size<20 }">style="display:none"</c:if>><span class="orange">标签图总数已达到系统上限，请删除后添加。</span></dd>
			</dl>
		</div>
		
	</div>
	
   	<p><label>促销语:</label><input type="text" reg1="^(.{0,100})$" desc="100以内任意字符" id="promotion" name="promotion" class="text state" value="${ebItem.promotion}" />
   	</p>
    <p><label>状态:</label>
    	<input<c:if test="${ebItem.isNew==1 }"> checked</c:if>  name="isNew" type="checkbox" value="1" />新品&nbsp;&nbsp;
    	<input<c:if test="${ebItem.isGood==1 }"> checked</c:if>  name="isGood" type="checkbox" value="1" />推荐&nbsp;&nbsp;
    	<input<c:if test="${ebItem.isHot==1 }"> checked</c:if>  name="isHot" type="checkbox" value="1" />特价
    </p>
    <a name="uploadImgs" id="uploadImgs"></a>
    
    <p><label><samp>*</samp>上传商品图片(90x150尺寸):</label><span id="uploadImgTip1" class="orange">注:该尺寸图片必须为90x150。</span></p>
    <p><label></label>
		<img id='imgSize1ImgSrc' src='${rsImgUrlInternal}${ebItem.imgSize1}' onerror="this.src='${base}/res/imgs/deflaut.jpg'" height="100" width="100" />
		<input type='file' id='imgSize1File' name='imgSize1File' class="file" onchange='submitImgSize1Upload("imgSize1")' /><span class="pos" id="imgSize1FileSpan">请上传图片的大小不超过3MB</span>
		<input type='hidden' id='imgSize1Action' name='imgSize1Action' value='${path}/uploads/upload_pic.do' />
        <input type='hidden' id='imgSize1' name='imgSize1' value='${ebItem.imgSize1}' reg="^.+$" tip="亲！您忘记上传图片了。" />
	</p>
    
	<p><label><samp>*</samp>上传商品图片(正方形尺寸):</label><span id="uploadImgTip" class="orange">注:建议上传800*800大小的图片，否则可能会影响前台缩略图显示效果(第一张上传图为默认图)。</span></p>

    <div id="imgsPre" class="up_box">
        <table cellspacing="0" summary="上传图片" class="tab2">
            <tr id="imgsTitle">
                <th>上传图片</th>
                <th class="wp">图片描述</th>
                <th>操作</th>
            </tr>
            <c:forEach items='${imageList}' var="item" varStatus="count">
                <tr id="imgsTr${count.index}" >
                    <td>
                        <span class="pic">
                      <%--<c:if test="${count.index=='0'}"><samp class="is" title="默认图片"></samp></c:if>--%>
                        <img id="imgs${count.index}Img" name="imgs${count.index}Img" src="${rsImgUrlInternal}${item.fileRelativePath}" onerror="this.src='${path}/res/imgs/deflaut.jpg'" width="100" height="100" /></span>
                        <input type="file" id="imgs${count.index}File" name="imgs${count.index}File" class="file" onchange="submitUploads('${count.index}')" />
                        <input type="hidden" id="imgsFilePath${count.index}" name="imgsFilePath${count.index}" value="${item.filePath}" />
                        <input type="hidden" id="imgsFileRelativePath${count.index}" name="imgsFileRelativePath${count.index}" value="${item.fileRelativePath}" />
                        <input type="hidden" id="imgsFileDesc${count.index}" name="imgsFileDesc${count.index}" value="${item.fileDesc}" />
                        <input type="hidden" id="imgsFileIndex${count.index}" name="imgsFileIndex${count.index}" value="${count.index}" />
                    </td>
                    <td class="nwp">
                        <input type="text" id="imgsDesc${count.index}" name="imgsDesc${count.index}" reg1="^(.{0,40})$" desc="40个任意字符以内" value="${item.fileDesc}" class="text 10" />
                    </td>
                    <td>
<%--                         <input class="hand btn60x20" onclick="up(${count.index})" type="button" value="上 移" /><br />
                        <input class="hand btn60x20" onclick="down(${count.index})" type="button" value="下 移" /><br /> --%>
                        <input class="hand btn60x20" onclick="delPic('${count.index}')" type="button" value="删 除" />
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="alg_r" colspan="3">
                	<span id="addPicSpan" class="l">请上传图片的大小不超过3MB</span>
                    <input class="hand btn83x23b" id="picturesButton" onclick="addPic()" type="button" value="增加图片" />
                    <!-- <a href="#uploadImgs" onclick="updateList()">test</a> -->
                    <input type='hidden' id='imgs' name='imgs' value='' />
                    <input type="hidden" id="imgsCount" name="imgsCount" value="${fn:length(imageList)}"/>
                    <input type="hidden" id="imgsIndex" name="imgsIndex" value="${fn:length(imageList)}"/>
                    <input type='hidden' id='imgsUploadAction' name='imgsUploadAction' value='${path}/uploads/upload_pics.do' />
                    <input type='hidden' id='imgsDeleteAction' name='imgsDeleteAction' value='${path}/uploads/upload_delete.do' />
                    <input type='hidden' id='imgsBlank' name='imgsBlank' value='<c:url value='/${system }/images/logo266x64.png'/>' />
                </td>
            </tr>
        </table>
    </div>

	<p><label>页面关键词:</label><input type="text" reg1="^.{0,50}$" desc="50个字符以内" id="keywords" name="keywords" class="text state" value="${ebItem.keywords}" />
	</p>
	<p><label class="alg_t">页面描述:</label><textarea id="pageDesc" reg1="^(.|\n){0,130}$" desc="130个以内的任意字符" escapexml="false" name="pageDesc" class="are" rows="6" cols="45">${ebItem.pageDesc}</textarea>
	</p>
	<input type="hidden" name="auditStatus" value="${ebItem.auditStatus }">
	<input type="hidden" name="showStatus" value="1">
</div>

<div id="tab_2" class="edit" style="display: none">
<textarea name="itemDesc" id="itemDesc">${ebItem.itemDesc}</textarea>
<script type="text/javascript">   
	var ${"itemDesc"} = new FCKeditor('itemDesc');
	${"itemDesc"}.BasePath = '${path}/res/plugins/fckeditor/';
	${"itemDesc"}.Config["CustomConfigurationsPath"] = "${path}/res/plugins/fckeditor/myconfig.js";
	${"itemDesc"}.Config["LinkBrowser"] = false;
	${"itemDesc"}.Config["ImageBrowser"] = false;
	${"itemDesc"}.Config["FlashBrowser"] = false;
	${"itemDesc"}.Config["MediaBrowser"] = false;
	${"itemDesc"}.Config["LinkUpload"] = true;
	${"itemDesc"}.Config["ImageUpload"] = true;
	${"itemDesc"}.Config["FlashUpload"] = true;
	${"itemDesc"}.Config["MediaUpload"] = true;
	${"itemDesc"}.Config["LinkUploadURL"] = "${path}/uploads/fckUpload.do";
	${"itemDesc"}.Config["ImageUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Image";
	${"itemDesc"}.Config["FlashUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Flash";
	${"itemDesc"}.Config["MediaUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Media";
	${"itemDesc"}.ToolbarSet = "My";
	${"itemDesc"}.Width = "100%";
	${"itemDesc"}.Height = "400";				
	${"itemDesc"}.ReplaceTextarea();
	//${name}.Value = "";
	//${name}.Create();
</script>
</div>

<div id="tab_3" class="edit set" style="display: none">
    <c:if test="${fn:length(list1) == 0}">
    <p><label></label>无属性</p>
    </c:if>
    <c:forEach items="${list1}" var="f" varStatus="status">
        <c:set var="e" value="" scope="page"></c:set>
        <c:forEach items="${ebPVs}" var="ebPV">
        <c:if test="${ebPV.featureId == f.featureId}">
        <c:set var="e" value="${ebPV.paraValue}" scope="page"></c:set>
        </c:if>
        </c:forEach>
        <p><label>${f.featureName}:</label>
        <c:if test="${f.inputType == 1}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <select class="paraValue" g="g">
            <option value="">请选择</option>
            <c:forEach items="${f.selectValues}" var="f1">
            	<option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option> 
            </c:forEach>
            </select>
        </c:if>
        <c:if test="${f.inputType == 2}">
        	<input type="radio" name="pradio${status.index}" class="paraValue" value="" <c:if test="${empty e}"> checked</c:if> />无&nbsp;
            <c:forEach items="${f.selectValues}" var="f2" varStatus="s">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input<c:if test="${e == f2}"> checked</c:if> type="radio" class="paraValue" id="pradio${s.index}" name="pradio${status.index}" value="${f2}" />${f2}&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 3}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <c:forEach items="${f.selectValues}" var="f3" varStatus="s">
                <input<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> type="checkbox" class="paraValue" id="pcheck${s.index}" name="pcheck${status.index}" value="${f3}" />${f3}&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 4}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input type="text" class="text state paraValue" value="${e}" maxlength="100"/>
        </c:if>
        </p>
    </c:forEach>
</div>

<div id="tab_4" style="display: none">
<c:forEach items="${ebSkus}" var="ebSku" varStatus="st">
    <div id="sp_0" class="sp_0">
		 <table cellspacing="0" summary="" class="tab3">
            <c:if test="${fn:length(list2) == 0}">
            <tr><th colspan="2" class="gray">&nbsp;&nbsp;<b>默认</b></th></tr>
            </c:if>
            <c:forEach items="${list2}" var="f" varStatus="status">
                <c:forEach items="${ebSku.ebSV}" var="ebSV">
                <c:if test="${ebSV.featureId == f.featureId}">
                <c:set var="e" value="${ebSV.specValue}" scope="page"></c:set>
                </c:if>
                </c:forEach>
			    <tr><th>&nbsp;&nbsp;${f.featureName}:</th><th class="wp nwp">
                <c:if test="${f.inputType == 1}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <select class="specValue1" disabled>
                    <c:forEach items="${f.selectValues}" var="f1">
                        <option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option>
                    </c:forEach>
                    </select>
                </c:if>
                <c:if test="${f.inputType == 2}">
                    <input  type="hidden" class="specValue4" value="${f.featureId}" />
                    <c:forEach items="${f.selectValues}" var="f2" varStatus="idx">
                    <input disabled<c:if test="${e == f2}"> checked</c:if> id="radio${status.index}" type="radio" class="specValue1" name="${st.index}specradio${status.index}" value="${f2}" />${f2}&nbsp;&nbsp;
                    </c:forEach>
                </c:if>
                <c:if test="${f.inputType == 3}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <c:forEach items="${f.selectValues}" var="f3" varStatus="idx">
                    <input disabled<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> id="check${status.index}" name="${st.index}speccheck${status.index}" type="checkbox" class="specValue1" value="${f3}" />${f3}&nbsp;&nbsp;
                    </c:forEach>
                </c:if>
                <c:if test="${f.inputType == 4}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <input readonly type="text" class="text20 state specValue1" value="${e}" maxlength="100"/>
                </c:if>
			</th></tr>
		</c:forEach>
        <tr><td colspan="2">
            <table cellspacing="0">
                <tr>
                    <th>排序</th>
                    <th>商城价</th>
                    <th>市场价</th>
                    <th>库存</th>
                    <th>购买上限</th>
                    <th>货号</th>
                    <th>货位</th>
                    <th>上下架</th>
                    <th>类型</th>
                </tr>
                <tr>
                    <td width="10%" class="nwp"><var>${ebSku.skuSort}</var></td>
                    <td width="12%" class="nwp"><samp class="red">*</samp> <var><fmt:formatNumber type="number" value="${ebSku.skuPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var></td>
                    <td width="12%" class="nwp"><var>
                    	<c:if test="${ebSku.marketPrice!=null }">
                    	<fmt:formatNumber type="number" value="${ebSku.marketPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber>
                    	</c:if>
                    </var></td>
                    <td width="12%" class="nwp"><samp class="red">*</samp> <var>${ebSku.stockInventory}</var></td>
                    <td width="12%" class="nwp"><var>${ebSku.skuUpperLimit}</var></td>
                    <td width="12%" class="nwp"><var>${ebSku.sku}</var></td>
                    <td width="12%" class="nwp"><var>${ebSku.location}</var></td>
                    <td>
	                    <select id="showStatus1" name="showStatus1" disabled>
		                    <option<c:if test="${ebSku.showStatus == 0}"> selected </c:if> value="0">上架 </option>
		                    <option<c:if test="${ebSku.showStatus == 1}"> selected </c:if> value="1">下架</option>
	                    </select>
                    </td>
                    <td>
                         <select id="skuType" name="skuType" disabled>
                         	<!--option<c:if test="${ebSku.skuType == 0}"> selected </c:if> value="0">赠品 </option -->
		                    <option<c:if test="${ebSku.skuType == 1}"> selected </c:if> value="1">普通</option>
                        </select>
                    </td>
                </tr>
            </table>
            </td></tr>
        </table>
    </div>
</c:forEach>
</div>

<div id="tab_5" class="edit" style="display: none">
<textarea name="packingList" id="packingList">${ebItem.packingList}</textarea>
<script type="text/javascript">   
	var ${"packingList"} = new FCKeditor('packingList');
	${"packingList"}.BasePath = '${path }/res/plugins/fckeditor/';
	${"packingList"}.Config["CustomConfigurationsPath"] = "${path }/res/plugins/fckeditor/myconfig.js";
	${"packingList"}.Config["LinkBrowser"] = false;
	${"packingList"}.Config["ImageBrowser"] = false;
	${"packingList"}.Config["FlashBrowser"] = false;
	${"packingList"}.Config["MediaBrowser"] = false;
	${"packingList"}.Config["LinkUpload"] = true;
	${"packingList"}.Config["ImageUpload"] = true;
	${"packingList"}.Config["FlashUpload"] = true;
	${"packingList"}.Config["MediaUpload"] = true;
	${"packingList"}.Config["LinkUploadURL"] = "${path}/uploads/fckUpload.do";
	${"packingList"}.Config["ImageUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Image";
	${"packingList"}.Config["FlashUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Flash";
	${"packingList"}.Config["MediaUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Media";
	${"packingList"}.ToolbarSet = "My";
	${"packingList"}.Width = "100%";
	${"packingList"}.Height = "400";				
	${"packingList"}.ReplaceTextarea();
	//${name}.Value = "";
	//${name}.Create();
</script>
</div>

<div id="submitDis">

    <div class="loc">&nbsp;</div>

    <div class="edit set">
    <p><label class="alg_t">操作备注:</label><textarea id="logNotes" name="logNotes" class="are arew" style="width:50%;" rows="6" cols="80" reg1="^(.|\n){0,90}$" desc="请限制在90个字符以内"></textarea>
        <input type="hidden" name="oldAuditStatus" id="oldAuditStatus" value="${ebItem.auditStatus }" >
    </p>
    <p><label>&nbsp;</label><input id="button1"
        type="button" value="提 交" class="hand btn83x23" />&nbsp;&nbsp; <input
        type="button" value="取消" onclick="javascript:;history.back();" class="hand btn83x23b" /></p>
    </div>

</div>

</form>
<div class="loc">&nbsp;</div>

<div class="edit set"><h2>操作记录</h2></div>
<iframe src="<c:url value='/${system }/consolelog/top10.do?entityId=${ebItem.itemId}&tableName=EB_ITEM&isCard=n'/>" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>

</div></div>
</body>
