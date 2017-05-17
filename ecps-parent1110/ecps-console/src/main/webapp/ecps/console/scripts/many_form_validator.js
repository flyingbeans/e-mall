/*
	Copyright (C) 2011 - 2020
	Author:		fanhongen
*/
$(document).ready(function(){
	$("[reg],[url]").blur(function(){
		var isContinue=true;
		if(typeof($(this).attr("reg")) != "undefined"){
			isContinue=clientValidate($(this));
		}
		if(isContinue){
			if(typeof($(this).attr("url")) != "undefined"){
				isContinue=serverValidate($(this));
			}
		}
		if(isContinue){
			$(this).siblings("span").html("");
		}
		
	});
	
});

$(document).ready(function(){
	$("#form1").submit(function(){
		var isSubmit = true;
		$(this).find("[reg],[url]").each(function(){
			
			if(typeof($(this).attr("reg")) != "undefined"){
				if(!clientValidate($(this))){
					//alert($(this).attr("tip"));
					isSubmit = false;
				}

			}
			
		});
		return isSubmit;
	});
	
	$("#form2").submit(function(){
		var isSubmit = true;
		$(this).find("[reg],[url]").each(function(){
			
			if(typeof($(this).attr("reg")) != "undefined"){
				if(!clientValidate($(this))){
					//alert($(this).attr("tip"));
					isSubmit = false;
				}

			}
			
		});
		return isSubmit;
	});
	
	$("#form3").submit(function(){
		var isSubmit = true;
		$(this).find("[reg],[url]").each(function(){
			
			if(typeof($(this).attr("reg")) != "undefined"){
				if(!clientValidate($(this))){
					//alert($(this).attr("tip"));
					isSubmit = false;
				}

			}
			
		});
		return isSubmit;
	});
	
});

function clientValidate(obj){
	var reg = new RegExp(obj.attr("reg"));
	var objValue = obj.attr("value");
	if(!reg.test(objValue)){
		//alert(obj.attr("tip"));obj.after("<b>"+obj.attr("tip")+"</b>");
		//obj.siblings("span").html("<b>"+obj.attr("tip")+"</b>");
		obj.siblings("span").addClass("err").html(obj.attr("tip"));
		return false;
	}
	return true;
}

function serverValidate(obj){
	var url_str = obj.attr("url");
	if(url_str.indexOf("?") != -1){
		url_str = url_str+"&"+obj.attr("name")+"="+obj.attr("value");
	}else{
		url_str = url_str+"?"+obj.attr("name")+"="+obj.attr("value");
	}
	url_str=encodeURI(url_str);//不加的话中文会乱码
	var response = $.ajax({url: url_str,cache: false,async: false}).responseText;
	response = response.replace(/(^\s*)|(\s*$)/g, "");
	var json=eval("("+response+")");
	if(json.state== 'success'){
		return true;
	}else{
		//alert(obj.attr("tip"));obj.after("<b>"+json.info+"</b>");
		//obj.siblings("span").html("<b>"+json.info+"</b>");
		obj.siblings("span").addClass("err").html(json.info);
		return false;
	}
	
}

function judgeWetherCanSubmit(){
	var isSubmit = true;
	$(document).find("[reg],[url]").each(function(){
		if(typeof($(this).attr("reg")) != "undefined"){
			if(!clientValidate($(this))){
				//alert($(this).attr("tip"));
				isSubmit = false;
			}

		}
		
	});
	return isSubmit;
}

