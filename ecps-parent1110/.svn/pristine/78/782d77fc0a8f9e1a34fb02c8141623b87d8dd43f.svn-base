<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>${ad.adName}</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-language" content="utf-8" />
<meta name="robots" content="all" />
<meta name="author" content="<fmt:message key="company.name"/>" />
<meta name="copyright" content="<fmt:message key="company.url"/>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<!--[if gt IE 7]>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<![endif]-->
<meta http-equiv="Cache-Control" content="no-store"/>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
<meta http-equiv="Expires" content="0" />
<link rel="icon" href="<c:url value="/res/imgs/favicon.ico"/>" type="image/x-icon" />
<link rel="shortcut icon" href="<c:url value="/res/imgs/favicon.ico"/>" type="image/x-icon" />
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="AdvertisementMenu"/>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/com.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/many_form_validator.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.md5.js'/>"></script>
<script language="JavaScript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.flexslider-min.js'/>"></script>
<style type="text/css">

/*
 * jQuery FlexSlider v1.7
 * http://flex.madebymufffin.com
 *
 * Copyright 2011, Tyler Smith
 * Free to use under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 */
 
/* Browser Resets */
.flex-container a:active,
.flexslider a:active {outline: none;}
.slides,
.flex-control-nav,
.flex-direction-nav {margin: 0; padding: 0; list-style: none;} 

/* FlexSlider Necessary Styles
*********************************/ 
.flexslider {width:90%;margin:10px auto 0;padding:8px 1%}
.flexslider .slides > li {display: none;} /* Hide the slides before the JS is loaded. Avoids image jumping */
.flexslider .slides img {max-width: 100%; display: block;}
.flex-pauseplay span {text-transform: capitalize;}

/* Clearfix for the .slides element */
.slides:after {content: "."; display: block; clear: both; visibility: hidden; line-height: 0; height: 0;} 
html[xmlns] .slides {display: block;} 
* html .slides {height: 1%;}

/* No JavaScript Fallback */
/* If you are not using another script, such as Modernizr, make sure you
 * include js that eliminates this class on page load */
.no-js .slides > li:first-child {display: block;}


/* FlexSlider Default Theme
*********************************/
.flexslider {background: #fff; border: 4px solid #fff; position: relative; -webkit-border-radius: 5px; -moz-border-radius: 5px; -o-border-radius: 5px; border-radius: 5px; zoom: 1;}
.flexslider .slides {zoom: 1;}
.flexslider .slides > li {position: relative;text-align:center}
/* Suggested container for "Slide" animation setups. Can replace this with your own, if you wish */
.flex-container {zoom: 1; position: relative;}

/* Caption style */
/* IE rgba() hack */
.flex-caption {background:none; -ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#4C000000,endColorstr=#4C000000);
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#4C000000,endColorstr=#4C000000); zoom: 1;}
.flex-caption {width: 100%; padding: 2% 0; text-indent:2%;position: absolute; left: 0; bottom: 0; background: rgba(0,0,0,.3); color: #fff; text-shadow: 0 -1px 0 rgba(0,0,0,.3); font-size: 14px; line-height: 18px;}

/* Direction Nav */
.flex-direction-nav li a {width: 30px; height: 30px; margin: -13px 0 0; display: block; background: url("../img/com/switch.gif") no-repeat 0 0; position: absolute; top: 45%; cursor: pointer; text-indent: -9999px;}
.flex-direction-nav li a.next {background-position: 0 -30px; right: -21px;}
.flex-direction-nav li a.prev {background-position: 0 0; left: -20px;}
.flex-direction-nav li a.disabled {opacity: .3; filter:alpha(opacity=30); cursor: default;}

/* Control Nav */
.flex-control-nav {width: 100%; position: absolute; bottom: 12px; text-align: center;}
.flex-control-nav li {margin: 0 0 0 5px; display: inline-block; zoom: 1; *display: inline;}
.flex-control-nav li:first-child {margin: 0;}
.flex-control-nav li a {width: 13px; height: 13px; display: block; background: url("../img/com/bg_control_nav.png") no-repeat 0 0; cursor: pointer; text-indent: -9999px;}
.flex-control-nav li a:hover {background-position: 0 -13px;}
.flex-control-nav li a.active {background-position: 0 -26px; cursor: default;}

#focus,#focus img{<#if width??>
						width:${width}px<#else>width:490px</#if> ;<#if height??> height:${height}px<#else> height:184px</#if> ;}
#focus .flexslider{<#if width??>
						width:${width}px<#else>width:490px</#if>;margin:0;padding:0;border:none}
#focus .flex-control-nav{text-align:right}
#focus .flex-control-nav li{margin:0 8px 0 0}
#focus .flex-control-nav a{width:18px;height:16px;line-height:16px;text-indent:0px;text-align:center;color:#fff;border:1px solid #333;background:#333 none}
#focus .flex-control-nav a:hover,#focus .flex-control-nav a.active{text-decoration:none;border-color:#fff;background-color:#005bac}

#flex-title{width:227px;height:184px;border-left:1px solid #9abfe1;background-color:#cacaca}
#flex-title li{float:left;width:100%;height:45px;line-height:45px;border-bottom:1px solid #b8b8b8}
#flex-title li.after{border-bottom-color:#cacaca}
#flex-title li a{display:block;color:#eee;text-align:center;font-size:14px;font-weight:bold}
#flex-title li a:hover,#flex-title li.active{text-decoration:none;color:#fff;background-color:#ffd041}
#flex-title li.active a{color:#fff}

#topics{background-color:#f5f5f5}
#topics img{width:950px;height:180px}
#topics p{width:98%;margin:10px auto;text-indent:2em}

/*focus*/
.x_738x230,.x_738x230 img{width:738px;height:230px}
</style>
<script type="text/javascript">
$(function(){
	$('.flexslider').flexslider({
		slideshowSpeed:${ad.adCarouseltime*1000},
		directionNav: false
	});
});
</script>
</head>
<body id="main"><div id="focus">
		<div class="flexslider x_738x230">
			<ul class="slides">
				<c:forEach items='${list}' var="list" varStatus="p">
					<c:if test="${p.count == 1 }">
						<li><img src="${rsImgUrlInternal}${list.fileRelativePath}" alt="" /> </li>
					</c:if>
					<c:if test="${p.count != 1 }">
						<li  style="display:none;"><img src="${rsImgUrlInternal}${list.fileRelativePath}" alt=""/> </li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	</body>

