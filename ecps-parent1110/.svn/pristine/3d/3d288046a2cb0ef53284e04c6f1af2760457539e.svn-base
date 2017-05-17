function checkFileType(type) {
	var allowFileTypes = new Array(/^\.(g|G)(i|I)(f|F)$/,/^\.(p|P)(n|N)(g|G)$/,/^\.(j|J)(p|P)(g|G)$/);
	
	for(var i=0;i<allowFileTypes.length;i++) {
		if (allowFileTypes[i].test(type)) {
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
	var base = responseText[0].base;
	var filePath = base + filePath;
	$('#'+componentName).attr("value",filePath);
	$('#'+componentName+'ImgSrc').attr("src",filePath+"?t="+(new Date()).getTime());
}