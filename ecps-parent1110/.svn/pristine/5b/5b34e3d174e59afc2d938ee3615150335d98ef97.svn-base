<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加广告_广告管理_广告管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="AdvertisementMenu"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/uploads.js'/>"></script>
<script language="javascript" type="text/javascript">
function submitUploadFlash(componentName) {
	//上传Flash
	function checkFileTypeForFlash(type) {
		var allowFileTypes = new Array(/^\.(s|S)(w|W)(f|F)$/);
		for(var i=0;i<allowFileTypes.length;i++) {
			if (allowFileTypes[i].test(type)) {
				return true;
			}
		}
		return false;
	}
	var path=$('#'+componentName+'File').val();
	if(path==""){
		return;
	}
	var point=path.lastIndexOf(".");
	var type=path.substr(point);
	if(!checkFileTypeForFlash(type)){
		alert("只允许上传格式为swf的文件");
		return;
	}
	var uploadUrl = $('#'+componentName+'Action').val();
	var options = {
		beforeSubmit: showUploadRequest,
		success:      showUploadResponseFlash,
		type:         'post',
		dataType:     "script",
		data:{
			'fileObjName':componentName
		},
		url:          uploadUrl
	};
	$('#myForm').ajaxSubmit(options);
}
function showUploadResponseFlash(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	var componentName = responseText[0].componentName;
	var filePath = responseText[0].filePath;
	var relativePath = responseText[0].relativePath;
	$('#'+componentName).attr("value", relativePath);
	$('#FlashDiv').html("<object id='flashObject' name='flashObject' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' "
			+"codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0'"
			+"style='width:300px;height:300px' align='middle'>"
			+"<param name='allowScriptAccess' value='sameDomain' /><param name='movie' value='"+filePath+"'>"
			+"<param name='quality' value='high' /><param name='wmode' value='transparent' /><param name='menu' value='false' />"
			+"<embed id='homeFlashad2' name='homeFlashAd2' src='"+filePath+"' quality='high' wmode='transparent' style='width:300px;height:300px'"
			+" align=' middle'allowScriptAccess='sameDomain' pluginspage='http://www.macromedia.com/go/getflashplayer'"
			+"type='application/x-shockwave-flash'></embed>"
			+"</object>");
	$("#FlashDiv").show();
}
function submitUpload(componentName) {
	//上传图片
	function checkFileType(type) {
		var allowFileTypes = new Array(/^\.(g|G)(i|I)(f|F)$/,/^\.(p|P)(n|N)(g|G)$/,/^\.(j|J)(p|P)(g|G)$/);
		for(var i=0;i<allowFileTypes.length;i++) {
			if (allowFileTypes[i].test(type)) {
				return true;
			}
		}
		return false;
	}
	var path=$('#'+componentName+'File').val();
	if(path==""){
		return;
	}
	var point=path.lastIndexOf(".");
	var type=path.substr(point);
	if(!checkFileType(type)){
		alert("只允许上传格式为gif、png、jpg的图片");
		return;
	}
	var uploadUrl = $('#'+componentName+'Action').val();
	var options = {
		beforeSubmit: showUploadRequest,
		success:      showUploadResponse,
		type:         'post',
		dataType:     "script",
		data:{
			'fileObjName':componentName
		},
		url:          uploadUrl
	};
	$('#myForm').ajaxSubmit(options);
}
function showUploadRequest(formData, jqForm, options) {
	return true;
}
function showUploadResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	var componentName = responseText[0].componentName;
	var filePath = responseText[0].filePath;
	var relativePath = responseText[0].relativePath;
	$('#'+componentName).attr("value", relativePath);
	$('#'+componentName+'ImgSrc').attr("src", filePath+"?t="+(new Date()).getTime());
}
//图片集
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
			'<input type="text" reg1="^(.{0,40})$" desc="40个任意字符以内"  id="imgsDesc'+imgsIndex+'" name="imgsDesc'+imgsIndex+'" class="text 10" />'+
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
	var filePath = $("#imgsFilePath"+imgsIndex).val();
	if (filePath != "") {
		deleteUploads(filePath);
	}
	
	var imgsCount = $("#imgsCount").val();
	imgsCount--;
	$("#imgsCount").val(imgsCount);
	$("#imgsTr"+imgsIndex).remove();
}
//目标广告位
var check = new Array();
var validsen = new Array();
$(function(){
	
	$("input[type='text'],textarea").change(function(){
		var obj = $(this);
		var name = $(this).prev().html();
		name = name.replace("<samp>*</samp>", "").replace(":", "");
		name = name.replace("<SAMP>*</SAMP>", "");
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
	
	$("#selectSite").click(function() {
		$(".siteId").each(function() {
			for ( var k = 0; k < check.length; k++) {
				if ($(this).val() == check[k]) {
					$(this).attr("checked", true);
					break;
				} else {
					$(this).attr("checked", false);
				}
			}
		});
		tipShow("#targetTip");
	});
	$("#targetTipC").click(function() {
		check=[];
		var siteHtml = "";
		var flag =true;
		if(flag){
			$("#selectSite").html("重新选择");
			$(".siteId").filter(":checked").each(function() {
				check.push($(this).val());
			})
			var sizeArray = new Array();
			
			
			$(".siteTr").each(function(){
				if($(this).find(":checkbox").attr("checked")=="checked"){
					sizeArray.push($(this).find("td.advertisementsize").html());
					var sizeOut = null;
					for(var i = 0; i < sizeArray.length; i++){
						sizeOut = sizeArray[i];
						var sizeInner = null;
						for(var j = 0; j < sizeArray.length; j++){
							sizeInner = sizeArray[j];
							if(i != j && sizeOut != sizeInner){
								alert("广告位尺寸必须相同");
								sizeArray.clean();
								return;
							}
							
						}
					}
					siteHtml+="<tr><td>"+$(this).find("td.nwp").html()+"</td>"+"<td>"+$(this).find("td.advertisementsize").html()+"</td></tr>";
				}
			});
			localIdsString = check.join(",");
			$("#localIdsString").val(localIdsString);
			$("#siteList").html("<table cellspacing='0' summary='' class='tab2'><tr><th class='wp'>广告位名称</th><th>尺寸</th></tr>"+siteHtml+"</table>");
			$("#siteList").show();
			if(check.length==0){
				$("#selectSite").html("选择");
			}
			tipHide("#targetTip");
		}
	});
	function hideOption(){
		$("#settledFlash").hide();
		$("#settledWord").hide();
		$("#settledImage").hide();
		$("#ordinalImage").hide();
		$("#settledWord").hide();
		$("#ordinal").hide();
		$("#settled").hide();
		$("#ordinalTime").hide();
		$("#linkAdd").hide();
	}
	//<option value='0'>文字</option><option value='2'>Flash</option>
	$("#adType").html("<option value='4' selected>请选择广告类型</option><option value='1'>固定图片</option><option value='3' >轮播图片</option>");
	$("#adType").change(function(){
		var checkText=$(this).find("option:selected").text();
		hideOption();
		if(checkText == "文字"){
			$("#linkAdd").show();
			$("#settled").show();
			$("#settledWord").show();
		}else if(checkText == "Flash"){
			$("#linkAdd").show();
			$("#settled").show();
			$("#settledFlash").show();
		}else if(checkText == "固定图片"){
			$("#linkAdd").show();
			$("#settled").show();
			$("#settledImage").show();
		}else if(checkText == "轮播图片"){
			$("#ordinal").show();
			$("#ordinalImage").show();
			$("#ordinalTime").show();
		}
	});
	$("#sub").click(function() {
		var options = {
			beforeSubmit : function() {
				
				var t = $("#adCarouseltime").val();
				var r = /^\d+$/;
				if($("#adType").val()==0){
					var info = "";
					for(var i = 0;i < validsen.length; i++){
            	        var reg1 = new RegExp("轮播间隔");
            	        if(reg1.test(validsen[i])){
         
            	        	continue ;
            	        }
            	        info += (validsen[i]+"<br/>");
            		}
					if(info != ""){
						showTip(info);
						return false;
					}
				}
				if(($("#adType").val()==1)||($("#adType").val()==2)){
					var info = "";
					for(var i = 0;i < validsen.length; i++){
            			var reg = new RegExp("广告文字");
            	        if(reg.test(validsen[i])){
            	        	
            	        	continue ;
            	        }
            	        var reg1 = new RegExp("轮播间隔");
            	        if(reg1.test(validsen[i])){
            	        	
            	        	continue ;
            	        }
            	        info += (validsen[i]+"<br/>");
            		}
					if(info != ""){
						showTip(info);
						return false;
					}
				}
				if($("#adType").val()==3){
					var info = "";
					for(var i = 0;i < validsen.length; i++){
            			var reg = new RegExp("广告文字");
            	        if(reg.test(validsen[i])){
            	        	
            	        	continue ;
            	        }
            	        var reg1 = new RegExp("链接地址");
            	        if(reg1.test(validsen[i])){
            	        	
            	        	continue ;
            	        }
            	        info += (validsen[i]+"<br/>");
            		}
					if(info != ""){
						showTip(info);
						return false;
					}
					if(!r.test(t)){
						$(".msg").html("轮播时间请输入1-10的正整数");
						tipShow("#tip");
						return false;
					}
					updateList();
					var imgsDesc = $("#imgsPre input[name^='imgsDesc']");
					var reg = new RegExp("^http://(.)*");
					for(var i = 0; i < imgsDesc.length; i++){
						if(!reg.test(imgsDesc[i].value)){
							showTip("请填写轮播图的链接地址并以http://开头");
							return false;
						}
					}
					$("#adPictures").val($("#imgs").val());
				}
				
			},
			type : 'post',
			dataType : 'json',
			url : "${base}/advertisement/saveAdvertisement.do",
			success : submitFormResponse
		};
		$("#myForm").ajaxSubmit(options);
		function submitFormResponse(data, statusText, xhr, $form) {
			if (data[0].result != "success") {
				$("#tipText").html(data[0].message);
				tipShow("#tipDiv");
			} else {
				window.location.href='${base}/advertisement/advertisement.do';
			}
		}
	});
	function showTip(txt){
		$('#tipText').html(txt);
		tipShow('#tipDiv');
	}
});
function deleteUpload() {
	var filePath = $('#adImgImgSrc').val();
	var deleteUrl = $('#adFlashDeleteAction').val();
	$.ajax({
		type:"post",
		url:deleteUrl,
		dataType:"json",
        data: {
        	'filePath':filePath
        },
		complete:function(data){
			
		}
	});
}
function success(){
	window.location.href='${base}/adlocal/adlocal.do';
}
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
	<jsp:include page="/${system}/common/advertisementmenu.jsp"/>
</div></div>
	
<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>:广告管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/advertisement/advertisement.do"/>" title="广告管理">广告管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加广告">添加广告</span><a href="<c:url value="/${system}/advertisement/advertisement.do"/>" title="返回广告" class="inb btn120x20">返回广告</a></div>

	<form id="myForm" name="myForm" action="" method="post" class="edit set">
		<p><label for="">目标广告位:</label><a class="u" id="selectSite" title="选择" href="javascript:void(0);">选择</a></p>
		<div id="siteList" class="up_box" style="display:none"></div>
		<p><label for=""><samp>*</samp>广告名称:</label><input type="text" id="adName" name="adName" class="txt" />
		   <input type="hidden" value="" id="localIdsString" name="localIdsString"/><span class="gray">请输入4~16位的中英文或数字</span>
		</p>
		<p><label class="alg_t">广告描述:</label><textarea  cols="70" rows="4" name="adDescription"></textarea><span class="gray">请输入140个字符内的广告描述</span></p>
		<p><label for=""><samp>*</samp>广告类型:</label><select name="adType" id="adType"></select></p>
		<p><label>温馨提示：</label><var class="orange">广告类型应与所关联广告位类型一致，否则显示异常</var></p>
		<span id="settled" style="display:none">
			<span id="settledImage" style="display:none">
				<p><label><samp>*</samp>上传图片:</label><img id="adImgImgSrc" src="<c:url value='/ecps/console/images/logo266x64.png'/>" height="100" width="100" /></p>
            	<p><label></label><input type='file' size='27' id='adImgFile' name='adImgFile' class="file" onchange='submitUpload("adImg")' />
            		<input type='hidden' id='adImgAction' name='adImgAction' value='${base}/uploads/upload_pic.do' />
            		<input type='hidden' id='adImg' name='adImg' /></p>
				<p><label></label><var class="orange">请上传jpg、png、gif格式的图片</var></p>
			</span>
			<span id="settledWord" style="display:none">
				<p><label class="alg_t"><samp>*</samp>广告文字:</label><textarea cols="70" name="adWords" rows="4"></textarea></p>
				<p><label></label><var class="orange">超出广告位的文字将被隐藏，请注意广告字数。</var></p>
			</span>
			<span id="settledFlash" style="display:none">
				<label></label><span id="FlashDiv" style="display:none">
					
						
						
					
				</span>
				<p><label><samp>*</samp>上传FLASH:</label>
				<!-- Flash -->
            	<input type='file' size='27' id='adFlashFile' name='adFlashFile' class="file" onchange='submitUploadFlash("adFlash")' />
            	<input type='hidden' id='adFlashAction' name='adFlashAction' value='${base}/uploads/upload_pic.do' />
            	<input type='hidden' id='adFlash' name='adFlash' /></p>
            	<p><label></label><var class="orange">请上传swf格式的附件</var></p>
			</span>
			<span id="linkAdd" style="display:none">
				<p><label for=""><samp>*</samp>链接地址:</label><input type="text" id="" name="adLink" size="80" class="txt" /><span class="gray">请以http://开头</span></p>
		    </span>
		</span>
		<span id="ordinal" style="display:none">
			<span id="ordinalImage" style="display:none">
				<p><label><samp>*</samp>上传附件:</label></p>
				<div id="imgsPre" class="up_box">
			        <table cellspacing="0" summary="上传图片" class="tab2">
			            <tr id="imgsTitle">
			                <th>上传图片<var class="orange">(请上传jpg、png、gif格式的图片)</var></th>
			                <th class="wp">链接地址<var class="orange">(请以http://开头)</var></th>
			                <th>操作</th>
			            </tr>
			            <tr>
			                <td class="alg_r" colspan="3">
			                    <input class="hand btn83x23b" id="picturesButton" onclick="addPic()" type="button" value="增加图片" />
			                    <!-- <a href="#uploadImgs" onclick="updateList()">test</a> -->
			                    <input type='hidden' id='adPictures' name='adPictures' value='' />
			                    <input type='hidden' id='imgs' name='imgs' value='' />
			                    <input type="hidden" id="imgsCount" name="imgsCount" value="0"/>
			                    <input type="hidden" id="imgsIndex" name="imgsIndex" value="0"/>
			                    <input type='hidden' id='imgsUploadAction' name='imgsUploadAction' value='${path}/uploads/upload_pics.do' />
			                    <input type='hidden' id='imgsDeleteAction' name='imgsDeleteAction' value='${path}/uploads/upload_delete.do' />
			                    <input type='hidden' id='imgsBlank' name='imgsBlank' value='<c:url value='/${system }/images/logo266x64.png'/>' />
			                </td>
			            </tr>
			        </table>
			    </div>
			</span>
			<span id="ordinalTime" style="display:none">
				<p><label for=""><samp>*</samp>轮播间隔:</label><input type="text" id="adCarouseltime" name="adCarouseltime"  class="txt" /><span class="gray">轮播时间为1-10的整数</span></p>
			</span>
		</span>
		<p><label for="submit">&nbsp;</label><input type="button" value="提 交" id="sub" class="hand btn83x23" />&nbsp;&nbsp;<input type="button" value="重 置" onclick="location='${base}/advertisement/addAdvertisement.do'"class="hand btn83x23b" /></p>
	</form>

	<div class="loc">&nbsp;</div>
    
</form>
</div></div>
</body>