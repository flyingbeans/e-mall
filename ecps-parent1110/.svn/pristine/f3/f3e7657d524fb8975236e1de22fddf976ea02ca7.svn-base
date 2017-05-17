<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加用户_用户管理_用户管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/permissionmenu.jsp"/>
</div></div>

<script type="text/javascript">

 function backToList(inputname){
	 var backListUrl=$("#"+inputname).val();
	 window.location.href=backListUrl;
 }
 $(function(){
	 $("#btn").click(function(){
			var tmpPassword=$("#password").val();
			var ps="^[a-zA-Z0-9\u4e00-\u9fa5]{6,8}$";
			var vv=tmpPassword.match(ps);
			if(vv==null){
				alert("密码必须是中英文或数字字符，长度6-8");
				$("#password").val("");
				$("#password").focus();
				return ;
			}
			if(tmpPassword.length>0){
				var md5Password=$.md5(tmpPassword);
				$("#password").val(md5Password);
			}
			var email = document.getElementById('email').value;
			
			if ((email.length > 50)) {
				$('#spanEmail').html("email不能大于50个字符，并且需要输入正确的格式！");
				return false;
			} else
				$('#spanEmail').html('');
			if(!judgeWetherCanSubmit()){
				return false;
			}
			var isChecked = false;
			$("input[name='ids']").each(function(){
				var a = $(this);
				if(a.attr("checked")){
					isChecked = true;
				}
			});
			if(!isChecked){
				alert("请选择角色!");
				return false;
			}
			var table = document.getElementById("form22");
			table.submit();
		});
 });
 
 function checkEmail(tempEmail){
		if(!(/(^[a-zA-Z]|^[a-zA-Z][\w-_\.]*[a-zA-Z0-9])@(\w+\.)+\w+$/.test(tempEmail))){
			return false;
		} else {
			return true;
		}
	}
	function checkNoZh(word){
		if ((/^[^\u4e00-\u9fa5]*$/.test(word))) {
		return true;
	} else {
		return false;
	}
	}

</script>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：权限管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/permission/user/listUser.do"/>" title="用户管理">用户管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加用户">添加用户</span><a href="<c:url value="/${system}/permission/user/listUser.do"/>" title="返回用户管理" class="inb btn120x20">返回用户管理</a></div>
	<form id="form22" name="form1" action="${base}/permission/user/addUser.do" method="post">
		<ul class="uls edit set">
            <li>
            	<label class="alg_t"><span style="color:red">*</span> 登录名称：</label><input type="text" name="username" class="text state" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$" tip="必须是中英文或数字字符，长度2-20"/>
            	<span></span>
            </li>
            <li>
            	<label class="alg_t"><span style="color:red">*</span> 登录密码：</label><input type="password" id="password" name="password" class="text state"/>
				<span></span>
            </li>
            <li>
            	<label class="alg_t"><span style="color:red">*</span> 电子邮箱：</label><input type="text" id="email" name="email" class="text state" maxlength="50" value="" reg="^[a-zA-Z0-9]+[-_.a-zA-Z0-9]+@[-_a-zA-Z0-9]+(\.[-_a-zA-Z0-9]+)+$" tip="email不能大于50个字符，并且需要输入正确的格式！"/>
				<span id="spanEmail"></span>
            </li>
            <li>
            	<label class="alg_t"><span style="color:red">*</span> 真实姓名：</label><input type="text" name="fullName" class="text state" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$" tip="必须是中英文或数字字符，长度2-20"/>
				<span></span>
            </li>
            <li>
            	<label>性别：</label><input type="radio" name="gender" value="1" checked="checked" />男&nbsp;&nbsp;<input type="radio" name="gender" value="0" />女
            </li>
            <li>
            	<label>状态：</label><input type="radio" name="status" value="1" checked="checked" />启用&nbsp;&nbsp;<input type="radio" name="status" value="0" />停用
            </li>
            <li>
            	<label><span style="color:red">*</span>角色：</label>
            	<div class="pre">
	            	<c:forEach items='${listrole}' var="role">
		            	<div style="float:left;width:24%;padding-left:1%">
		            		<input type="checkbox" name="ids" value="${role.id }"/>${role.name }&nbsp;&nbsp;
		            	</div>
	            	</c:forEach>
                </div>
            </li>
            <li>
            	<label>&nbsp;</label><input type="button" id="btn" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="取消" onclick="backToList('userListUrl')" />
            </li>
        </ul>
	</form>
	<input type="hidden" id="userListUrl" name="userListUrl" value="${base}/permission/user/listUser.do" />
    <div class="loc">&nbsp;</div>

</div></div>
</body>

