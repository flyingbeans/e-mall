<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>编辑附件设置_附件设置_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
    <script type="text/javascript" src="<c:url value='/res/js/pony.js'/>"></script>
    <script type="text/javascript">
    function attset(param) {
        var attconfig = document.getElementById('attconfig');
        if (param == "reset") {
            document.attconfig.action = "index.do";
            document.attconfig.submit();
        } else if (param == "update" && checkform(attconfig)) {
            document.attconfig.action = "att_update.do";
            document.attconfig.submit();
        }
    }

    function check(objects)
    {
      if(objects.value=="")
      {
        objects.focus();
        return false;
      }
      return true;
    }

    function checkform(obj)
    {
		/*
        if(!(parseInt(obj.attMarkPicQuality.value)>=0 && parseInt(obj.attMarkPicQuality.value) <=100))
        {
            alert("图片质量数值只能在0-100之内！");
            return false;
        }
        if(!(parseInt(obj.attMarkPicSizeWidth.value)>=120 && parseInt(obj.attMarkPicSizeHeigh.value) >=120))
        {
            alert("图片尺寸的高度和宽度不得小于120px！");
            return false;
        }
        if(!(parseInt(obj.attCutPicMinWidth.value)>=60 && parseInt(obj.attCutPicMinHeigh.value) >=60))
        {
            alert("图片裁剪尺寸的高度和宽度不得小于60px！");
            return false;
        }
        if(!(parseInt(obj.attMarkCharSize.value)>=1 && parseInt(obj.attMarkCharSize.value) <=5))
        {
            alert("文字大小数值只能在1-5之间！");
            return false;
        }
        if(!((obj.attMarkCharContent.value.length)>=1 && parseInt(obj.attMarkCharContent.value.length) <=10))
        {
            alert("文字内容长度只能在1-10之间！");
            return false;
        }
        if(!((obj.attMarkCharColor.value.length)>=1 && parseInt(obj.attMarkCharColor.value.length) <=7))
        {
            alert("文字颜色长度只能在1-7之间！");
            return false;
        }
        if(!(parseInt(obj.attMarkPicAlpha.value)>=0 && parseInt(obj.attMarkPicAlpha.value)<=100))
        {
            alert("水印透明度只能在0-100之间！");
            return false;
        }
        */
        if(parseInt(obj.attSize.value)<0 || parseInt(obj.attSize.value)>5120)
        {
            alert("附件大小范围必须在0-5120KB！");
            return false;
        }
        if(!(/* check(obj.attSize) && check(obj.attType) && check(obj.attMarkPicSizeWidth) && check(obj.attMarkPicSizeHeigh) &&
            check(obj.attCutPicMinWidth) && check(obj.attCutPicMinHeigh) &&
            check(obj.attMarkPicQuality) && check(obj.attMarkPicAlpha) && check(obj.attMarkCharContent) && check(obj.attMarkCharSize) &&
            check(obj.attMarkCharColor)) */
        	check(obj.attSize) && check(obj.attType)
        	))
        {
            alert('输入项不能为空，请重新输入！');
            return false;
        }
        if(!(checkType(obj.attType)) || obj.attType.value.length>200)
        {
            alert('输入格式必须为正确的后缀格式加分隔符 | ,如.docx|(长度不超过200)');
            return false;
        }
        /* if(!checkPicType(obj.userFile))
        {
            return false;
        } */
        return true;
    }

    function checkPicType(pic){
            var location=pic.value;
        if(location=="")
        {
            return true;
        }
        var point = location.lastIndexOf(".");
        var type = location.substr(point);
        if(type==".jpg"||type==".gif"||type==".JPG"||type==".GIF" || type == ".bmp" || type == ".BMP"
                || type == ".png" || type==".PNG" || type==".tiff" || type==".TIFF" || type==".pcx"
                || type==".PCX")
        {
            return true;
        }
        else
        {
           alert("只能输入[jpg|bmp|png|tiff|pcx]格式的图片");
           return false;
        }
    }

    function checkType(object){
        var string = object.value.split("|");
        var regTextUrl = /^\.[a-zA-Z0-9]+$/;
        for(var i=0;i<string.length;i++){
            var s = string[i];
            if(!regTextUrl.test(s))
            {
                return false;
            }
        }
        return true;
    }
    $(function(){
        $('#attMarkCharColor').colorPicker();
    })
    </script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>全局配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/system/att/index.do"/>" title="附件设置" >附件设置</a>&nbsp;&raquo;&nbsp;<span class="gray" title="编辑附件设置">编辑附件设置</span>
    <a href="<c:url value="/system/att/index.do"/>" title="返回附件设置" class="inb btn80x20">返回附件设置</a></div>

    <form id="attconfig" name="attconfig" action=${base}/system/att/att_update.do method="post">
    
    <div class="edit set">
        <h2 title="基本设置">基本设置</h2>
        <p><label for="sit"><samp>*</samp>允许后台上传附件大小：</label><input type="text" id="attSize" name="attSize"  class="text state" value="${attCfg_key.attSize}"
                                                                onkeyup="this.value=value.replace(/[^\d]/g,'')"
                                                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
        />&nbsp;KB</p>
        <p><label for="path"><samp>*</samp>允许后台上传附件类型：</label><input type="text" id="attType" name="attType" class="text state" value="${attCfg_key.attType}" /></p>
    </div>
	<%--
	<div class="loc">&nbsp;</div>
	
	<div id="attsSet" class="edit set">
		<h2 title="水印设置">水印设置</h2>
		<p id="picMark"><label for="ftp"><samp>*</samp>是否开启图片水印：</label>		
			<input type="radio" value="1" name="attMarkPicMode" <c:if test='${attCfg_key.attMarkPicMode==1}'>checked</c:if>/>是&nbsp;&nbsp;
			<input type="radio" value="0" name="attMarkPicMode" <c:if test='${attCfg_key.attMarkPicMode==0}'>checked</c:if>/>否		
		</p>
		<p id="charMark"><label for="ftp"><samp>*</samp>是否开启文字水印：</label>
			<input type="radio" value="1" name="attMarkCharMode" <c:if test='${attCfg_key.attMarkCharMode==1}'>checked</c:if>/>是&nbsp;&nbsp;
			<input type="radio" value="0" name="attMarkCharMode"<c:if test='${attCfg_key.attMarkCharMode==0}'>checked</c:if>/>否
		</p>
	</div>

    <div class="loc">&nbsp;</div>

	<div id="attsImgShow" class="edit set">
		<h2 title="图片水印">图片水印</h2>
		<p><label for="ftp">图片尺寸控制：</label>宽：<input type="text" id="attMarkPicSizeWidth" name="attMarkPicSizeWidth"  class="text small" value="${attCfg_key.attMarkPicSizeWidth}"
			   onkeyup="this.value=value.replace(/[^\d]/g,'')"
			   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>px&nbsp;&nbsp;高：<input type="text" id="attMarkPicSizeHeigh" name="attMarkPicSizeHeigh"  class="text small" value="${attCfg_key.attMarkPicSizeHeigh}"
			onkeyup="this.value=value.replace(/[^\d]/g,'')"
				   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>px<span class="inb gray">&nbsp;&nbsp;小于该尺寸的图片不添加水印</span></p>
		
		<p><label for="ftp">图片裁剪尺寸控制：</label>宽：<input type="text" id="attCutPicMinWidth" name="attCutPicMinWidth"  class="text small" value="${attCfg_key.attCutPicMinWidth}"
			   onkeyup="this.value=value.replace(/[^\d]/g,'')"
			   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>px&nbsp;&nbsp;高：<input type="text" id="attCutPicMinHeigh" name="attCutPicMinHeigh"  class="text small" value="${attCfg_key.attCutPicMinHeigh}"
			onkeyup="this.value=value.replace(/[^\d]/g,'')"
				   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>px<span class="inb gray">&nbsp;&nbsp;小于该尺寸的图片不裁剪</span></p>
		
			<p id="picReview"><label for="ftp" class="alg_t">图片预览：</label><img id="previewImg" src="${base}${attCfg_key.attMarkPicPath}" width="250" height="64" border="0" alt="" /></p>
			<input name="attMarkPicPath" id="attMarkPicPath" type="hidden" value="${attCfg_key.attMarkPicPath}" />
		<p><label for="ftp">图片路径：</label><input type="file" id="userFile" name="userFile" class="file" onchange="attset('upload');" size="29" vld="{required:true}" /></p>
		<p><label for="ftp">图片显示比例：</label><input type="text" id="attMarkPicQuality" name="attMarkPicQuality"  class="text state" value="${attCfg_key.attMarkPicQuality}"
			onkeyup="this.value=value.replace(/[^\d]/g,'')"
				   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/>&nbsp;%<span class="inb gray">&nbsp;&nbsp;该值决定背景图与水印图的显示关系，其值范围从1到100。</span></p>
		<p><label for="ftp">水印透明度：</label><input type="text" id="attMarkPicAlpha" name="attMarkPicAlpha"  class="text state" value="${attCfg_key.attMarkPicAlpha}"
			onkeyup="this.value=value.replace(/[^\d]/g,'')"
				   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
		/><span class="inb gray">该值决定图片水印清晰度，其值范围从0到100。</span></p>
	<div class="loc">&nbsp;</div>
	</div>
	<div id="attsWordShow" class="edit set">
			<h2 title="文字水印">文字水印</h2>
			<p><label>文字内容：</label><input type="text" id="attMarkCharContent" name="attMarkCharContent" class="text state" value="${attCfg_key.attMarkCharContent}"/></p>
			<p><label>文字大小：</label><input type="text" id="attMarkCharSize" name="attMarkCharSize" class="text state" value="${attCfg_key.attMarkCharSize}"
				onkeyup="this.value=value.replace(/[^\d]/g,'')"
					   onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
			/><span class="inb gray ">范围从1到5</span></p>
			<p><label>文字颜色：</label><input type="text" id="attMarkCharColor" name="attMarkCharColor" class="text state" value="${attCfg_key.attMarkCharColor}"/></p>
	</div>

    <div class="loc">&nbsp;</div>

	<div id="attsPosShow" class="edit set">
		<h2 title="水印位置">水印位置</h2>
		<table cellspacing="0" summary="" class="tab_pos">
		<tr>
		<td rowspan="3">
		<input type="radio" name="attMarkPosition" value='0' <c:if test='${attCfg_key.attMarkPosition==0}'>checked</c:if>/>
		随机
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='1' <c:if test='${attCfg_key.attMarkPosition==1}'>checked</c:if>/>
		顶部居左
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='2' <c:if test='${attCfg_key.attMarkPosition==2}'>checked</c:if>/>
		顶部居中
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='3' <c:if test='${attCfg_key.attMarkPosition==3}'>checked</c:if>/>
		顶部居右
		</td>
		</tr>
		<tr>
		<td>
		<input type="radio" name="attMarkPosition" value='4' <c:if test='${attCfg_key.attMarkPosition==4}'>checked</c:if>/>
		中部居左
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='5' <c:if test='${attCfg_key.attMarkPosition==5}'>checked</c:if>/>
		中部居中
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='6' <c:if test='${attCfg_key.attMarkPosition==6}'>checked</c:if>/>
		中部居右
		</td>
		</tr>
		<tr>
		<td>
		<input type="radio" name="attMarkPosition" value='7' <c:if test='${attCfg_key.attMarkPosition==7}'>checked</c:if>/>
		底部居左
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='8' <c:if test='${attCfg_key.attMarkPosition==8}'>checked</c:if>/>
		底部居中
		</td>
		<td>
		<input type="radio" name="attMarkPosition" value='9' <c:if test='${attCfg_key.attMarkPosition==9}'>checked</c:if> />
		底部居右
		</td>
		</tr>
		</table>
		<p><label>&nbsp;</label><input type="button" value="预览水印效果" class="hand btn102x26b" onclick="attset('preview')"/></p>
	</div>
	--%>
    <div class="loc">&nbsp;</div>

	<div class="edit set">
		<p>
			<label for="submit">&nbsp;</label><input type="button" value="恢复初始设置" onclick="attset('reset')" class="hand btn102x26" /><input type="button" value="保存当前设置" onclick="attset('update')" class="hand btn102x26b" />
		</p>

	</div>
	
</form>    

</div></div>
</body>