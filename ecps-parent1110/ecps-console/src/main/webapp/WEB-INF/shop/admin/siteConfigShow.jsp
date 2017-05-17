<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="siteConfigsList.title"/></title>
    <meta name="heading" content="<fmt:message key='siteConfigsList.heading'/>"/>
    <meta name="menu" content="AdminMenu"/>
</head>
<body id="main">

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key="siteConfigsList.heading"/></div>

    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="<c:url value="/siteConfigForm?method=Add&from=list"/>" title="<fmt:message key="button.edit"/>" class="btn80x20"><fmt:message key="button.edit"/></a>
            <a href="<c:url value="/user"/>" title="<fmt:message key="button.done"/>" class="btn80x20"><fmt:message key="button.done"/></a>
        </span>
    </div>

    <div class="edit set">
	<h2 title="siteConfig.baseInfo"><fmt:message key="siteConfig.baseInfo"/></h2>
	<p><label for="sit">站点域名：</label></p>
	<p><label for="path">路径：</label></p>
	<p><label for="path_option">是否相对路径：</label></p>
	<p><label for="pre_address">预发布测试地址：</label></p>
	<p><label for="mail_address">系统管理员邮箱：</label></p>
	<p><label for="phone">系统管理员座机：</label><span class="inb gray">(例如：区号-座机号-分机号。)</span></p>
</div>

<div class="loc">&nbsp;</div>

    <div class="loc">&nbsp;</div>

    <div class="edit set">
        <h2 title="FTP信息">FTP信息</h2>
        <p><label for="ftp_host">FTP服务器地址：</label></p>
        <p><label for="ftp_port">FTP端口：</label></p>
    </div>

    <div class="loc">&nbsp;</div>

    <div class="edit set" style="display:none">
        <h2 title="存放路径信息">存放路径信息</h2>
        <p><label for="storage_html">文档HTML保存路径：</label></p>
        <p><label for="storage_res">图片/附件保存路径：</label></p>
    </div>

    <div class="loc" style="display:none">&nbsp;</div>

    <div class="edit set">
        <h2 title="SEO设置">SEO设置</h2>
        <p><label for="title">站点标题：</label><span class="inb gray">&nbsp;&nbsp;(最多60个字符。)</span></p>
        <p><label for="keywords">站点关键字：</label><span class="inb gray">&nbsp;&nbsp;(最多5个词组，词组之间用空格分隔。)</span></p>
        <p><label for="description" class="alg_t">站点描述：</label><span class="inb gray">&nbsp;&nbsp;(最多160个字符。)</span></p>
    </div>

    <div class="loc">&nbsp;</div>

    <div class="edit set">
        <h2 title="回收站设置">回收站设置</h2>
        <p><label for="title">是否开启回收站：</label></p>
    </div>

    <div class="loc">&nbsp;</div>

    <div class="loc">&nbsp;</div>

</div></div>
</body>
