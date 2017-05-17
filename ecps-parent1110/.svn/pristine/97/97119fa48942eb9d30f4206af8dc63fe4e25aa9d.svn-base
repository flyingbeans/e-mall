<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>编辑全局设置_全局设置_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
    <script type="text/javascript">
    function checkURL(strValue)
    {
        var regTextUrl = /^(file|http|https|ftp|mms|telnet|news|wais|mailto):\/\/(.+)$/;
        return regTextUrl.test(strValue);
    }

    function checkEmail(strValue){
        var regTextUrl = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        return regTextUrl.test(strValue);
    }

    function checkPhone(strValue){
        var regTextUrl = /^[0-9]+(\-[0-9]+)*$/;
        return regTextUrl.test(strValue);
    }

    function checkPath(strPath)
    {
        var regPath = /^\/[a-zA-Z0-9\/]*$/;
        return regPath.test(strPath);
    }

    function site(param) {
        var siteconfig = document.getElementById('siteconfig');
        if (param == "reset") {
            document.siteconfig.action = "index.do";
            document.siteconfig.submit();
        }
        else if (param == "update" && checkform(siteconfig)) {
            document.siteconfig.action = "site_update.do";
            document.siteconfig.submit();
        }
    }
    function checkStr(str)
    {
        for(i=0;i<str.length;i++)
        {
            var word=str[i];
            if(word.length>20)
            {
                return false;
            }
        }
        return true;
    }
    function check(object)
    {
      if(object.value =="")
      {
        object.focus();
        return false;
      }
      return true;
    }

    function checkform(obj)
    {
        var str_seo_key=obj.siteSeoKeyword.value.split(' ');
        if(obj.siteSeoTitle.value.length>60)
        {
            alert("站点标题不能超过60个字符！");
            obj.siteSeoTitle.focus();
            return false;
        }
        if(obj.siteSeoDescription.value.length>160)
        {
            alert("站点描述不能超过160个字符！");
            obj.siteSeoDescription.focus();
            return false;
        }
        if(str_seo_key.length>5)
        {
            alert("站点关键字最多5个词组!");
            return false;
        }
        if(!checkStr(str_seo_key))
        {
            alert("站点关键词每组最多输入20个汉字或者20个西文字符！");
            return false;
        }
        /* if(!checkEmail(obj.mail_address.value) || obj.mail_address.value.length>50)
        {
            alert("请输入正确的email地址，如：example@example.com(长度不超过50)");
            return false;
        } */
        /* if(!checkPhone(obj.phone_number.value) || obj.phone_number.value.length>20)
        {
            alert("请输入正确的电话号码，如：区号-主机号-分机号(长度不超过20)");
            return false;
        } */
        /*
        if(!checkURL(obj.siteBasicPreAddress.value) || obj.siteBasicPreAddress.value.length>50)
        {
            alert("请输入合法的预发布地址!如 http://preview.asiainfo-linkage.com(长度不超过50)");
            return false;
        }
        */
        if(!(
             /* check(obj.siteSeoTitle) && check(obj.siteSeoKeyword) && check(obj.siteSeoDescription) && check(obj.siteBasicPreAddress) */
        	check(obj.siteSeoTitle) && check(obj.siteSeoKeyword) && check(obj.siteSeoDescription)
            ))
        {
            alert("输入项不能为空，请重新输入！");
            return false;
        }
        return true;
    }

    </script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/system/site/index.do"/>" title="全局设置">全局设置</a>&nbsp;&raquo;&nbsp;<span class="gray" title="编辑全局设置">编辑全局设置</span>
    <a href="<c:url value="/${system}/system/site/index.do"/>" title="返回全局设置" class="inb btn80x20">返回全局设置</a></div>

    <form id="siteconfig" name="siteconfig" action="${base}/system/site/site_update.do" method="post">
	<%--  
    <div class="edit set">
	<h2 title="基本信息">基本信息</h2>
	<p><label for="site domain">站点域名：</label>${site_key.siteBasicDomain}
	<input type="hidden" name="siteBasicDomain" value="${site_key.siteBasicDomain}" />
	</p>
	<p><label for="path">路径：</label>${site_key.siteBasicPath}
	<input type="hidden" name="siteBasicPath" value="${site_key.siteBasicPath}" />
	</p>
	<p><label for="path_option">是否相对路径：</label>
	<c:choose>
   	<c:when test="$(site_key.siteBasicOption == 0)"> 是
   	</c:when> 	
   	<c:otherwise> 否
    </c:otherwise>
    </c:choose>
	<input type="hidden" name="siteBasicOption" value="${site_key.siteBasicOption}" />
	</p>
	<p><label for="pre_release_path"><samp>*</samp>预发布测试地址：</label><input type="text" id="pre_release_path" name="siteBasicPreAddress" class="text state" value="${site_key.siteBasicPreAddress}"/><span class="inb gray">请注意必须输入实际存在的地址。</span></p>
	<p><label for="mail_address"><samp>*</samp>系统管理员邮箱：</label><input type="text" id="mail_address" name="siteBasicMailAddress" class="text state" value="${site_key.siteBasicMailAddress}"/><span class="inb gray">例如：majun6@asiainfo-linkage.com</span></p>
	<p><label for="phone_number"><samp>*</samp>系统管理员座机：</label><input type="text" id="phone_number" name="siteBasicPhone" class="text state" value="${site_key.siteBasicPhone}"/><span class="inb gray">例如：区号-座机号-分机号。</span></p>
	</div>
	
	<div class="loc">&nbsp;</div>
	
	<div class="edit set">
		<h2 title="FTP信息">FTP信息</h2>
        <p><label for="ftp_host">FTP服务器地址：</label>${site_key.siteFtpHost}
        <input type="hidden" name="siteFtpHost" value="${site_key.siteFtpHost}" />
        </p>
        <p><label for="ftp_port">FTP端口：</label>${site_key.siteFtpPort}
        <input type="hidden" name="siteFtpPort" value="${site_key.siteFtpPort}" />
        </p>
	</div>
	
	<div class="loc">&nbsp;</div>
	
	<div class="edit set" style="display:none">
		<h2 title="存放路径信息">存放路径信息</h2>
        <p><label for="storage_html">文档HTML保存路径：</label>${site_key.sitePathHtml}
        <input type="hidden" name="sitePathHtml" value="${site_key.sitePathHtml}" />
        </p>
        <p><label for="storage_res">图片/附件保存路径：</label>${site_key.sitePathResource}
        <input type="hidden" name="sitePathResource" value="${site_key.sitePathResource}" />
        </p>
	</div>
	
	<div class="loc" style="display:none">&nbsp;</div>
	
	--%>
	<div class="edit set">
		<h2 title="site_seo_config">SEO设置</h2>
        <ul class="uls">
		<li><label for="site_config_seo_title"><samp>*</samp>站点标题：</label><input type="text" id="siteSeoTitle" name="siteSeoTitle" class="text state" value="${site_key.siteSeoTitle}"/><span class="inb gray">最多60个字符。</span></li>
		<li><label for="site_config_seo_keywords"><samp>*</samp>站点关键字：</label><input type="text" id="siteSeoKeyword" name="siteSeoKeyword" class="text state" value="${site_key.siteSeoKeyword}"/><span class="inb gray">最多5个词组，词组之间用空格分隔。</span></li>
		<li><label for="site_config_seo_description" class="alg_t"><samp>*</samp>站点描述：</label><textarea id="siteSeoDescription" name="siteSeoDescription"rows="4" cols="21" class="are">${site_key.siteSeoDescription}</textarea><span class="inb gray">&nbsp;&nbsp;最多160个字符。</span></li>
		<li class="orange"><label for="explain">&nbsp;</label><span class="inb">注：1. 站点标题决定了站点首页显示的标题以及后台导航的站点名称。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. 重新生成静态页后，相关seo设置更改才会生效。</span></li>
	    </ul>
    </div>
	
	<div class="loc">&nbsp;</div>
	
	<div class="edit set">
	<p><label>&nbsp;</label><input type="button" id="site_reset" name="site_reset" onclick="site('reset')" value="恢复初始设置" class="hand btn102x26" />&nbsp;&nbsp;<input type="button" id="site_save" name="site_save" onclick="site('update')" value="保存当前设置" class="hand btn102x26b" /></p>
	</div>
	
    </form>

</div></div>
</body>