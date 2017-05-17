<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>附件设置_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="附件设置">附件设置</span>
    <c:url value="/system/att/att_edit.do" var="showattconfig">
        <c:param name="url" value="system/editsiteconfig"/>
    </c:url>
    <a href="${showattconfig}" title="编辑附件设置" class="inb btn80x20">编辑附件设置</a></div>

	<div class="edit set">
		<h2 title="基本设置">基本设置</h2>
		<p><label>允许后台上传附件大小：</label><var>${attCfg_key.attSize}</var>&nbsp;KB</p>
		<p><label>允许后台上传附件类型：</label>${attCfg_key.attType}</p>
	</div>

	<div class="loc">&nbsp;</div>
	<!--  
	<div class="edit set">
		<h2 title="水印设置">水印设置</h2>
		<p><label>是否开启图片水印：</label>
		<c:if test='${attCfg_key.attMarkPicMode==1}'>是</c:if>
		<c:if test='${attCfg_key.attMarkPicMode==0}'>否</c:if>
		</p>
		<p><label>是否开启文字水印：</label>
		<c:if test='${attCfg_key.attMarkCharMode==1}'>是</c:if>
		<c:if test='${attCfg_key.attMarkCharMode==0}'>否</c:if>
		</p>
	</div>
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="图片水印">图片水印</h2>
		<p><label>图片尺寸控制：</label>宽：<var>${attCfg_key.attMarkPicSizeWidth}</var>&nbsp;px&nbsp;&nbsp;高：<var>${attCfg_key.attMarkPicSizeHeigh}</var>&nbsp;px<span class="inb gray">&nbsp;&nbsp;(小于该尺寸的图片不添加水印。)</span></p>
		<p><label>图片裁剪尺寸控制：</label>宽：<var>${attCfg_key.attCutPicMinWidth}</var>&nbsp;px&nbsp;&nbsp;高：<var>${attCfg_key.attCutPicMinHeigh}</var>&nbsp;px<span class="inb gray">&nbsp;&nbsp;(小于该尺寸的图片不裁剪。)</span></p>
		<p><label class="alg_t">图片预览：</label><img id="previewImg" src="${base}${attCfgPic_key}" width="250" height="64" border="0" alt="" /></p>
		<p><label>图片显示比例：</label><var>${attCfg_key.attMarkPicQuality}</var>%<span class="inb gray">&nbsp;&nbsp;(该值决定背景图与水印图的显示关系，其值范围从1到100。)</span></p>
		<p><label>水印透明度：</label><var>${attCfg_key.attMarkPicAlpha}</var><span class="inb gray">&nbsp;&nbsp;(该值决定图片水印清晰度，其值范围从0到100。)</span></p>
	</div>
	
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="文字水印">文字水印</h2>
		<p><label>文字内容：</label>${attCfg_key.attMarkCharContent}</p>
		<p><label>文字大小：</label><var>${attCfg_key.attMarkCharSize}</var><span class="inb gray">(范围从1到5)</span></p>
		<p><label>文字颜色：</label>${attCfg_key.attMarkCharColor}</p>
	</div>
	
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="水印位置">水印位置</h2>
		<table cellspacing="0" summary="" class="tab_pos">
		<tr>
		<td rowspan="3">
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==0}'>checked</c:if> />
		随机
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==1}'>checked</c:if> />
		顶部居左
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==2}'>checked</c:if> />
		顶部居中
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==3}'>checked</c:if> />
		顶部居右
		</td>
		</tr>
		<tr>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==4}'>checked</c:if> />
		中部居左
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==5}'>checked</c:if> />
		中部居中
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==6}'>checked</c:if> />
		中部居右
		</td>
		</tr>
		<tr>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==7}'>checked</c:if> />
		底部居左
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==8}'>checked</c:if> />
		底部居中
		</td>
		<td>
		<input type="radio" name="attMarkPosition" <c:if test='${attCfg_key.attMarkPosition==9}'>checked</c:if> />
		底部居右
		</td>
		</tr>
		</table>
	</div>
  	-->

    <div class="loc">&nbsp;</div>

</div></div>
</body>