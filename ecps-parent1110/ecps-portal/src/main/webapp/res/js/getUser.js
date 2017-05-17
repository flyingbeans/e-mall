$.ajax({
		url:path+"/user/getUser.do",
		type:"post",
		dataType:"text",
		success:function(responseText){
			var userStr = $.parseJSON(responseText);
			$("#loginAlertIs").html(userStr.user.username);
		},
		error:function(){
			alert("系统错误");
		}
		
	});