<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加关键词_关键词管理_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript">
$(document).ready(function(){
	$("#replaceType").change(function(){
		var value=$("#replaceType").val();
		if(value==0){
			$("#a1").show();
			$("#a2").hide();
		}else{
			//$("#a1").hide();
			$("#a2").show();
		}
	});

	$("#form111").submit(function(){
		var isSubmit = true;
		var replaceType=$("#replaceType").val();//判断是那种类型
		$(this).find("[reg],[url]").each(function(){
			
			if(typeof($(this).attr("reg")) != "undefined"){
				if(!clientValidate($(this))){
					//alert($(this).attr("tip"));
					//验证内容是否为空
					if($(this).attr("name")=="externalLink"){
						if(replaceType==1){
							isSubmit = false;
						}
					}else{
						isSubmit = false;
					}
					
				}

			}
			
		});
		return isSubmit;
	});
});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/systemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/contentset/keyword/listKeyWord.do"/>" title="关键词管理">关键词管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="添加关键词">添加关键词</span><a href="<c:url value="/contentset/keyword/listKeyWord.do"/>" title="返回关键词管理" class="inb btn120x20">返回关键词管理</a></div>
	<form id="form111" name="form111" action="${base}/contentset/keyword/addKeyWord.do" method="post">
         <div class="edit set">
            <p>
            	<label class="alg_t">关键词名称：</label>
            	<textarea rows="4" cols="21" name="keyWordName" class="are" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$" tip="必须是中英文或数字字符，长度1-20"></textarea>
            	<span><c:out value="${keyWordName}"/></span>
            </p>
            <p>
            	<label>替换类型：</label>
            	<select id="replaceType" name="replaceType" class="select">
                    <option value="0">文本</option>
                    <option value="1">链接</option>
                </select>
            </p>
            <p>
            	<label>状态：</label>
            	<input type="radio" name="status" value="1" checked />启用&nbsp;&nbsp;
            	<input type="radio" name="status" value="0"/>停用
            </p>
            <p id="a1">
            	<label>替换内容：</label>
            	<input type="text" name="replaceContent" class="text state" value="" reg="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$" tip="替换内容格式不正确，只能是中英文数字，长度1-20"/>
            	<span></span>
            </p>
            <p id="a2" style="display:none">
            	<label>外部连接：</label>
            	<input type="text" name="externalLink" class="text state" value="" reg="http(s)?://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?" tip="必须是合法url地址"/>
            	<span></span>
            </p>
            <p>
            	<label>&nbsp;</label>
            	<input type="submit" class="hand btn83x23" value="<fmt:message key='tag.confirm'/>" />
            	<input type="reset" class="hand btn83x23b" value='<fmt:message key="button.cancel"/>' />
            </p>
        </div>
	</form>
    <div class="loc">&nbsp;</div>

</div></div>
</body>
