function vaildSearch(a1,a2){
	if(!/^[0-9]*$/.test(a1)||a1.length>20){
		$("#orderNo").val("");
		alert("订单号只能为20个字符以内的数字");
		return false;
	}
	if(!(/^[0-9-]{0,20}$/.test(a2))||a2.length>20){
		$("#phone").val("");
		alert("电话号码只能为20个字符以内的数字及\"-\"");
		return false;
	}
	return true;
} 