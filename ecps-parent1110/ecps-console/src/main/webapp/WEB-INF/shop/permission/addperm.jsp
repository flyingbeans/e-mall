<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@taglib uri="/WEB-INF/html.tld" prefix="ui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>权限添加_用户管理_权限管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#addURL").click(function(){
		var num=$("input[name='recieveURL']").size();
		if(num>4){
			alert("最多添加5个相关的URL");
			return;
		}
		var content="";
		 	content+="<p>";
			content+="<label for=''>相关URL： </label>";
			content+="<input type='text' name='recieveURL' class='text state' size='50' reg='^[a-zA-Z0-9/._]{3,100}$' tip='必须是英文或数字字符，英文句号和斜杠和下划线，长度3-100'/> <a name='d' href='javascript:void(0);' target='_top' onclick='delURL(this)'>删除</a>";
			content+="<span></span>";
		    content+="</p>"; 
    		$(this).parent().before(content);
    });
	
	
});

function delURL(obj){
	if(confirm("确定要删除吗")){
		$(obj).parent().remove();	
	}
}

function backToList(inputname){
	 var backListUrl=$("#"+inputname).val();
	 window.location.href=backListUrl;
}

</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/permissionmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：权限管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/permission/perm/listPerm.do"/>" title="权限配置">权限配置</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加权限">添加权限</span><a href="<c:url value="/${system}/permission/perm/listPerm.do"/>" title="返回权限管理" class="inb btn120x20">返回权限管理</a></div>
	<form id="form1" name="form1" action="${base}/permission/perm/addPerm.do" method="post">
		<div class="edit set">
            <p>
            	<label class="alg_t"><samp>*</samp>所属功能：</label><ui:select name="permUpid" list="listperm" rootId="0" defaultvalue="0" defaulttext="电商系统"/>
            </p>
            <p>
            	<label class="alg_t"><samp>*</samp>功能名称：</label><input type="text" name="permName" class="text state" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{3,20}$" tip="必须是中英文或数字字符，长度3-20"/>
				<span><c:out value="${permname}"/></span>
            </p>
            <p>
            	<label class="alg_t"><samp>*</samp>功能URL：</label><input type="text" name="permUrl" class="text state" size="50" reg="^[a-zA-Z0-9/._]{3,100}$" tip="必须是英文或数字字符，英文句号和斜杠和'_'，长度3-100"/>
				<span></span>
            </p>
            <p>
            	<label><samp>*</samp>状态：</label><input type="radio" name="permUse" value="1" checked="checked"/>启用&nbsp;&nbsp;<input type="radio" name="permUse" value="0" />停用
            </p>
            <p>
            	<label class="alg_t">功能描述：</label><textarea rows="4" cols="50" class="are" name="permNote" reg="^((.|\n){4,99})?$" tip="5到100以内的任意字符"></textarea>
            	<span></span>
            </p>
            <p>
           		<label>&nbsp;</label><input type="button" class="hand btn83x23b" id="addURL" name="addURL" size="50" value="新增相关URL"  />
            </p>
            <p>
            	<label>&nbsp;</label><input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="button" class="hand btn83x23b" value="取消" onclick="backToList('permListUrl')" />
            </p>
        </div>
	</form>
	<input type="hidden" id="permListUrl" name="permListUrl" value="${base}/permission/perm/listPerm.do" />
    <div class="loc">&nbsp;</div>

</div></div>
</body>

