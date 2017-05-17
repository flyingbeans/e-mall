function updateList() {
	
	var filePath = $("#imgsPre input[name^='imgsFilePath']");
	var fileRelativePath = $("#imgsPre input=[name^='imgsFileRelativePath']");
	var fileDesc = $("#imgsPre input[name^='imgsFileDesc']");
	var fileIndex = $("#imgsPre input[name^='imgsFileIndex']");
	var imgsDesc = $("#imgsPre input[name^='imgsDesc']");

	var dataList = new Array();
    if(filePath.length==0) return false;
	for(var i = 0; i < filePath.length; i++) {
		if (filePath[i].value == "") {
			return false;
		}
	    dataList.push('{"filePath":"'+filePath[i].value+'","fileRelativePath":"'+fileRelativePath[i].value+'","fileDesc":"'+imgsDesc[i].value+'","fileIndex":"'+fileIndex[i].value+'"}');
	}
	if (dataList.length>0) {
		$('#imgs').val("["+dataList+"]");
	} else {
		$('#imgs').val("");
	}
	return true;
}

function checkFileType(type) {
	var allowFileTypes = new Array(/^\.(g|G)(i|I)(f|F)$/,/^\.(j|J)(p|P)(g|G)$/);
	
	for(var i=0;i<allowFileTypes.length;i++) {
		if (allowFileTypes[i].test(type)) {
			return true;
		}
	}
	return false;
}

function checkFileTypeNoJpg(type) {
	var allowFileTypes = new Array(/^\.(g|G)(i|I)(f|F)$/,/^\.(p|P)(n|N)(g|G)$/);
	
	for(var i=0;i<allowFileTypes.length;i++) {
		if (allowFileTypes[i].test(type)) {
			return true;
		}
	}
	return false;
}
function submitUploads(imgsIndex) {
	alert('dddfff');
	var path = $('#imgs'+imgsIndex+'File').val();
	if (path == "") {
		return;
	}
	var point = path.lastIndexOf(".");
	var type = path.substr(point);
	
	if (!checkFileType(type)) {
		alert("只允许上传格式为gif、jpg的图片");
		return;
	}
	
	var uploadUrl = $('#imgsUploadAction').val();
	
	var options = {
			beforeSubmit: showUploadsRequest,
			success:      showUploadsResponse,
			error:		  function(){
				showUploadsResponse_error(imgsIndex);
			},
			type:         'post',
			dataType:     "script",
			data:{
				'fileObjName':'imgs',
				'index':imgsIndex
			},
			url:          uploadUrl
	};
	$('#myForm').ajaxSubmit(options);
}

function showUploadsRequest(formData, jqForm, options) {
	return true;
}

function showUploadsResponse(responseText, statusText, xhr, $form) {
	responseText = $.parseJSON(responseText);
	
	var index = responseText[0].index;
	var filePath = responseText[0].filePath;
	var relativePath = responseText[0].relativePath;
	$('#imgsFilePath'+index).attr("value", filePath);
	$('#imgsFileRelativePath'+index).attr("value", relativePath);
	$('#imgs'+index+'Img').attr("src", filePath+"?t="+(new Date()).getTime());
	//added by Fengxq 20121101
	$("#addPicSpan").html("请上传图片的大小不超过3MB");
}
//added by Fengxq 20121101上传图片超过规定的大小以后把提示信息用红色字体显示
function showUploadsResponse_error(imgsIndex){
	var index = imgsIndex;
	var imgsBlankValue = $("#imgsBlank").val();
	$('#imgsFilePath'+index).attr("value", "");
	$('#imgsFileRelativePath'+index).attr("value", "");
	$('#imgs'+index+'Img').attr("src", imgsBlankValue);
	$("#addPicSpan").html("<font color='red'>请上传图片的大小不超过3MB</font>");
}
function deleteUploads(filePath) {
	var deleteUrl = $('#imgsDeleteAction').val();
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
