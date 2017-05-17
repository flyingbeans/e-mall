<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="author" content="http://www.asiainfo-linkage.com/" />
<meta name="copyright" content="asiainfo-linkage.com 版权所有，未经授权禁止链接、复制或建立镜像。" />
<meta name="description" content="中国移动通信 name.com"/>
<meta name="keywords" content="中国移动通信 name.com"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes" />


<title>手机商城_移动商城_中国移动通信</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="search" type="application/opensearchdescription+xml" href="../opensearch.xml" title="移动购物" />
<link rel="stylesheet" href="${path }/res/css/style.css" />
<script src="${path }/res/js/jquery.js"></script>
<script src="${path }/res/js/com.js"></script>
<script type="text/javascript">

</script>
</head>
<body>




	<div class="bg_gray mt ofc">

			<div class="page pb pt">
				<span class="l">
					<!-- sales sales_down sales_up price price_down price_up time time_down time_up-->
					<div class="sort_type">
						<a href="javascript:void(0);" title="销量" class="sales">销量</a>
						<a href="javascript:void(0);" title="价格" class="price">价格</a>
						<a href="javascript:void(0);" title="上架时间" class="time">上架时间</a>
					</div>
				</span>
				<span class="r inb_a page_b">
					共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页"><samp>&lt;&lt;</samp>上一页</span><a href="javascript:void(0);" id="previous" title="上一页" style="display:none"><samp>&lt;&lt;</samp>上一页</a><span id="nextNo" class="inb" title="下一页" style="display:none">下一页<samp>&gt;&gt;</samp></span><a href="javascript:void(0);" id="next" title="下一页">下一页<samp>&gt;&gt;</samp></a>
				</span>
			</div>

			<ul class="uls i_150x150 x4_150x150b">
				<c:if test="${itemList == null}">
					对不起，暂无此商品，敬请关注
				</c:if>
				<c:forEach items="${itemList }" var="item">
				<li>
					<a href="${path }/item/toProductDetail.do?itemId=${item.itemId}" title="张同来" target="_blank" class="pic"><img src="${file_path }${item.imgs}" alt="${item.itemName }" /></a>
					<dl>
						<!-- dt 10个文字+... -->
						<dt><a href="${path }/item/toProductDetail.do?itemId=${item.itemId}" title="摩托罗拉XT319" target="_blank">${item.itemName }</a></dt>
						<!-- dt 25个文字+... -->
						<dd class="h40">${item.promotion }</dd>
						<dd class="orange">￥${item.skuPrice }</dd>
						<dd><a href="${path }/item/toProductDetail.do?itemId=${item.itemId}" title="购买裸机" class="inb btn70x21 mr">购买裸机</a><a href="${path }/item/toProductDetail.do?itemId=${item.itemId}" title="优惠购机" class="inb btn70x21">优惠购机</a></dd>
					</dl>
					<c:if test="${item.isHot == 1 }">
						<img src="../res/img/pic/hot.gif" alt="热门" class="type" />
					</c:if>
				</li>
				</c:forEach>
			</ul>

			<div class="page pb15"><span class="r inb_a page_b">
				<span id="previousNo" class="inb" title="上一页"><samp>&lt;&lt;</samp>上一页</span><a href="javascript:void(0);" id="previous" title="上一页" style="display:none"><samp>&lt;&lt;</samp>上一页</a><span title="第1页" class="inb current">1</span><!--a href="#" title="第1页">1</a--><a href="#" title="第2页">2</a><a href="#" title="第3页">3</a><a href="#" title="第4页">4</a><a href="#" title="第5页">5</a><span class="break">...</span><a href="#" title="第16页">16</a><span id="nextNo" class="inb" title="下一页" style="display:none">下一页<samp>&gt;&gt;</samp></span><a href="javascript:void(0);" id="next" title="下一页">下一页<samp>&gt;&gt;</samp></a>共<var id="pageTotal" class="orange">0</var>页 到第<input type="text" id="number" name="number" class="txts" size="3" />页 <input type="button" id="skip" class="hand btn60x20" value='确定' />
			</span></div>

		</div>

</body>
</html>

