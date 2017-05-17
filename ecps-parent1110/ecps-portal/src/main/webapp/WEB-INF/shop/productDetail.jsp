<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="author" content="http://www.asiainfo-linkage.com/" />
<meta name="copyright" content="asiainfo-linkage.com 版权所有，未经授权禁止链接、复制或建立镜像。" />
<meta name="description" content="中国移动通信 name.com"/>
<meta name="keywords" content="中国移动通信 name.com"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10" />
<title>商品详细_移动商城_中国移动通信</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="search" type="application/opensearchdescription+xml" href="../opensearch.xml" title="移动购物" />
<link rel="stylesheet" href="${path }/res/css/style.css" />
<script src="${path }/res/js/jquery.js"></script>
<script src="${path }/res/js/com.js"></script>
<script type="text/javascript">
$(function(){
	
	$(".spec a").click(function(){
		$(".spec a").each(function(){
			$(this).removeAttr("class");
		});
		$(this).attr("class","here");
		//获得skuId
		var skuId = $(this).attr("skuId");
		$.ajax({
			url:"${path}/item/getSkuById.do",
			type:"post",
			dataType:"text",
			data:{
				skuId:skuId
			},
			success:function(responseText){
				var jsonObj = $.parseJSON(responseText);
				$("#skuPrice").html("￥"+jsonObj.sku.skuPrice);
				$("#marketPrice").html("￥"+jsonObj.sku.marketPrice);
				if(jsonObj.sku.stockInventory > 0){
					$("#stockState").html("有货");
					$("#buyNow").show();
					$("#addMyCart").show();
				}else{
					$("#stockState").html("无货");
					$("#buyNow").hide();
					$("#addMyCart").hide();
				}
			},
			error:function(){
				alert("系统错误");
			}
		})
	});
	
	//必须放在事件定义的下面来使用
	$(".spec a:first").trigger("click");
	
	$("#loginAlertIs").click(function(){
		tipShow('#loginAlert');
	});

	$("#promptAlertIs").click(function(){
		tipShow('#promptAlert');
	});

	$("#transitAlertIs").click(function(){
		tipShow('#transitAlert');
	});

	var $smallList = $(".smallList"),
		$smallL = $(".smallL"),
		$smallR = $(".smallR"),
		smallLen = $(".smallList a").length,
		smallNum = 0;
	$smallList.css("width",(smallLen*60));
	$smallL.live("click",function(){
		if(smallNum > 0){
			$smallList.stop(true,true).animate({
				"left":"+="+60
			},400);
			smallNum--;
		}
	});
	$smallR.live("click",function(){
		if(smallNum <= (smallLen-5)){
			$smallList.stop(true,true).animate({
				"left":"-="+60
			},400);
			smallNum++;
		}
	});

	$('#ecpsShareIcon a').click(function(){
		
		var type   = $(this).attr('class');
		
		var title  = document.title;
		var url    = window.location.href;
		var imgUrl = '';
		var href   = '';

		var share  = [
			{id:'0',type:'sinawb',name:'分享到新浪微博', href: ['http://v.t.sina.com.cn/share/share.php?url=',  encodeURIComponent(url), '&title=', encodeURIComponent(title)].join(''), bp: '0px 0px'},
			{id:'1',type:'qqwb',name: '分享到腾讯微博', href: ['http://v.t.qq.com/share/share.php?url=',  encodeURIComponent(url), '&title=', encodeURIComponent(title)].join(''), bp: '0px -16px'},
			{id:'2',type:'renren',name: '分享到人人网', href: ['http://www.connect.renren.com/share/sharer?url=',  encodeURIComponent(url), '&title=', encodeURIComponent(title)].join(''), bp: '0px -32px'},
			{id:'3',type:'qqzone',name: '分享到QQ空间', href: ['http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=',  encodeURIComponent(url), '&title=', encodeURIComponent(title)].join(''), bp: '0px -48px'},
			{id:'4',type:'sohuwb',name: '分享到搜狐微博', href: ['http://t.sohu.com/third/post.jsp?content=utf-8&url=',  encodeURIComponent(url), '&title=', encodeURIComponent(title)].join(''), bp: '0px -64px'},
			{id:'5',type:'',name: '分享到开心网', href: ['http://www.kaixin001.com/repaste/bshare.php?rurl=',  encodeURIComponent(url), '&rtitle=', encodeURIComponent(title)].join(''), bp: '0px -80px'},
			{id:'6',type:'',name: '分享到51社区', href: ['http://share.51.com/share/outSiteShare.php?uri=' , encodeURIComponent(url) ,'&title=' ,encodeURIComponent(title)].join(''), bp: '0px -96px'}
		];

		for(var i=0; i<share.length; i++){
			if(type == share[i].type){
				href = share[i].href;
			};
		}

		if(type == 'copy'){

			var copyText = url.replace(/[.]{1}\d[.]{1}/gi, ".");
			copyText = copyText.replace(/\.+u+\d+\.+html/,".html");
			copyText = title + "\r\n" + copyText + "\r\n";
			if (window.clipboardData){
				window.clipboardData.setData("Text", copyText);
				alert('复制成功！');
			}
		}else{
			$(this).attr('href',href);
		}

	});

	$('.sub').mousedown(function(){
		var num = $('.num').val();
		--num;
		if(num == 0){
			$('#sub_add_msg').html('您填写的数字超过购买下限，单次购买下限为<var>1</var>件。');
			$('#sub_add_msg').show();
			return;
		}else{
			$('#sub_add_msg').hide();	
		}
		$('.num').val(num);
		
	});

	$('.add').mousedown(function(){
		var num = $('.num').val();
		++num;
		if(num == 6){
			$('#sub_add_msg').html('您填写的数字超过购买上限，单次购买上限为<var>5</var>件。');
			$('#sub_add_msg').show();
			return;
		}else{
			$('#sub_add_msg').hide();
		}
		$('.num').val(num);
	});
	
});
function buy(){
	window.location.href = "./shop/confirmProductCase.jsp";
}

function addCart(){
	var skuId = null;
	$(".spec a").each(function(){
	  var clazz = $(this).attr("class");
	  if(clazz == "here"){
		  skuId = $(this).attr("skuId");
	  }
	});
	var quantity = $("#quantity").val();
	var stockResult = validStock(skuId, quantity);
	if(stockResult == "no"){
		alert("库存不足");
		return;
	}
	var cookieResult = validCookie();
	if(cookieResult == "no"){
		alert("cookie被禁用，请开启后加入购物车");
		return;
	}
	$.ajax({
		url:"${path}/cart/addCart.do",
		type:"post",
		dataType:"text",
		data:{
			skuId:skuId,
			quantity:quantity
		},
		success:function(responseText){
			if(responseText == "success"){
				alert("添加购物车成功");
			}
		},
		error:function(){
			alert("系统错误");
		}
	})
}


function validStock(skuId, quantity){
	var result = "yes";//yes为库存足够
	$.ajax({
		type:"post",
		dataType:"text",
		async:false,
		url:"${path}/cart/validStock.do",
		data:{
			skuId:skuId,
			quantity:quantity
		},
		success:function(responseText){
			if(responseText == "no"){
				result = "no";
			}
		},
		error:function(){
			alert("系统错误");
		}
	});
	return result;
}

function validCookie(){
	var result = "yes";//yes为cookie可用
	$.ajax({
		type:"post",
		dataType:"text",
		url:"${path}/cart/validCookie.do",
		async:false,
		success:function(responseText){
			if(responseText == "no"){
				result = "no";
			}else {
				result = "yes";
			}
		},
		error:function(){
			alert("系统错误");
		}
	});
	return result;
}
</script>
</head>
<body>
<div id="tipAlert" class="w tips">
	<p class="l">本网站将于4月11日12:00进行系统维护，维护期间，本站将暂停业务办理等相关业务，敬请见谅。</p>
	<p class="r"><a href="javascript:void(0);" title="关闭" onclick="$('#tipAlert').hide();"></a></p>
</div>

<div class="bar"><div class="bar_w">
	<p class="l">
		<!-- 未登录 -->
		<b class="l">
			<a href="#" title="个人客户" class="here">个人客户</a>
			<a href="#" title="企业客户">企业客户</a>
		</b>
		<span class="l">
			欢迎来到中国移动！<a href="javascript:void(0);" title="登录" id="loginAlertIs" class="orange"><samp>[</samp>请登录<samp>]</samp></a>&nbsp;<a href="passport/register.html" title="免费注册">免费注册</a>
			<a href="javascript:void(0);" id="promptAlertIs" title="promptAlert">promptAlert</a>
			<a href="javascript:void(0);" id="transitAlertIs" title="transitAlert">transitAlert</a>
		</span>
		<!-- 登录后
		<span class="l">
			您好，<a href="passport/personalInfo.html" title="13717782727">13717782727</a>！&nbsp;&nbsp;&nbsp;<a href="#" title="我的账户" class="blue">我的账户</a>&nbsp;&nbsp;&nbsp;<a href="#" title="我要办理" class="blue">我要办理</a>&nbsp;&nbsp;<a href="passport/loginOut.html" title="退出" class="orange"><samp>[</samp>退出<samp>]</samp></a>
		</span>
		-->
	</p>
	<ul class="r uls">
	<!--
	<li class="dev"><a href="#" title="我的订单">我的订单</a></li>
	<li class="dev"><a href="#" title="我的收藏">我的收藏</a></li>
	<li class="dev"><a href="#" title="帮助中心">帮助中心</a></li>
	-->
	<li class="dev"><a href="#" title="在线客服">在线客服</a></li>
	<li class="dev"><a href="#" title="关于中国移动">关于中国移动</a></li>
	<li class="dev after"><a href="#" title="English">English</a></li>
	<!--
		<li class="dev"><a href="#" title="购物车2件" class="icon_car">购物车<var>2</var>件</a></li>
		<li class="dev"><a href="javascript:void(0)" id="addFavorite">加入收藏夹</a></li>
		<li class="dev"><a href="javascript:void(0)" id="setHome">设为首页</a></li>

		<li class="sit"><a href="javascript:void(0);" title="网站群链接" class="sel">网站群链接<cite class="inb"></cite></a>
		<ul class="ul bx_bottom" style="display:none">
		<li><a href="http://www.ah.10086.cn" title="安徽公司">安徽公司</a></li>
		<li><a href="http://www.bj.10086.cn" title="北京公司">北京公司</a></li>
		<li><a href="http://www.cq.10086.cn" title="重庆公司">重庆公司</a></li>
		<li><a href="http://www.fj.10086.cn" title="福建公司">福建公司</a></li>
		<li><a href="http://www.gs.10086.cn" title="甘肃公司">甘肃公司</a></li>
		<li><a href="http://www.gd.10086.cn" title="广东公司">广东公司</a></li>
		<li><a href="http://www.gx.10086.cn" title="广西公司">广西公司</a></li>
		<li><a href="http://www.gz.10086.cn" title="贵州公司">贵州公司</a></li>
		<li><a href="http://www.hi.10086.cn" title="海南公司">海南公司</a></li>
		<li><a href="http://www.he.10086.cn" title="河北公司">河北公司</a></li>
		<li><a href="http://www.ha.10086.cn" title="河南公司">河南公司</a></li>
		<li><a href="http://www.hl.10086.cn" title="黑龙江公司">黑龙江公司</a></li>
		<li><a href="http://www.hb.10086.cn" title="湖北公司">湖北公司</a></li>
		<li><a href="http://www.hn.10086.cn" title="湖南公司">湖南公司</a></li>
		<li><a href="http://www.js.10086.cn" title="江苏公司">江苏公司</a></li>
		<li><a href="http://www.jx.10086.cn" title="江西公司">江西公司</a></li>
		<li><a href="http://www.jl.10086.cn" title="吉林公司">吉林公司</a></li>
		<li><a href="http://www.ln.10086.cn" title="辽宁公司">辽宁公司</a></li>
		<li><a href="http://www.nm.10086.cn" title="内蒙古公司">内蒙古公司</a></li>
		<li><a href="http://www.nx.10086.cn" title="宁夏公司">宁夏公司</a></li>
		<li><a href="http://www.qh.10086.cn" title="青海公司">青海公司</a></li>
		<li><a href="http://www.sd.10086.cn" title="山东公司">山东公司</a></li>
		<li><a href="http://www.sn.10086.cn" title="陕西公司">陕西公司</a></li>
		<li><a href="http://www.sx.10086.cn" title="山西公司">山西公司</a></li>
		<li><a href="http://www.sh.10086.cn" title="上海公司">上海公司</a></li>
		<li><a href="http://www.sc.10086.cn" title="四川公司">四川公司</a></li>
		<li><a href="http://www.tj.10086.cn" title="天津公司">天津公司</a></li>
		<li><a href="http://www.xj.10086.cn" title="新疆公司">新疆公司</a></li>
		<li><a href="http://www.xz.10086.cn" title="西藏公司">西藏公司</a></li>
		<li><a href="http://www.yn.10086.cn" title="云南公司">云南公司</a></li>
		<li><a href="http://www.zj.10086.cn" title="浙江公司">浙江公司</a></li>
		<li class="clr"><a href="http://www.chinamobileltd.com" title="chinamobileltd">chinamobileltd</a></li>
		<li class="clr"><a href="http://www.cmdi.10086.cn" title="中国移动设计院">中国移动设计院</a></li>
		<li class="clr"><a href="http://labs.10086.cn" title="中国移动研究院">中国移动研究院</a></li>
		</ul></li>-->
	</ul>
</div></div>

<div class="w header">
	<h1><a href="http://www.bj.10086.cn" title="中国移动通信">中国移动通信</a></h1>
	<div class="area">
		<dl id="city">
			<dt><a href="javascript:void(0);" title="贵州">贵州<samp class="inb"></samp></a></dt>
			<dd class="bx hidden">
				<div class="tl"></div><div class="tr"></div>
				<ul class="ul">
				<li><a href="http://www.bj.10086.cn" title="北京">北京</a></li>
				<li><a href="http://www.gd.10086.cn" title="广东">广东</a></li>
				<li><a href="http://www.sh.10086.cn" title="上海">上海</a></li>
				<li><a href="http://www.tj.10086.cn" title="天津">天津</a></li>
				<li><a href="http://www.cq.10086.cn" title="重庆">重庆</a></li>
				<li><a href="http://www.ln.10086.cn" title="辽宁">辽宁</a></li>
				<li><a href="http://www.js.10086.cn" title="江苏">江苏</a></li>
				<li><a href="http://www.he.10086.cn" title="河北">河北</a></li>
				<li><a href="http://www.sc.10086.cn" title="四川">四川</a></li>
				<li><a href="http://www.sn.10086.cn" title="陕西">陕西</a></li>
				<li><a href="http://www.sx.10086.cn" title="山西">山西</a></li>
				<li><a href="http://www.ha.10086.cn" title="河南">河南</a></li>
				<li><a href="http://www.jl.10086.cn" title="吉林">吉林</a></li>
				<li><a href="http://www.sd.10086.cn" title="山东">山东</a></li>
				<li><a href="http://www.ah.10086.cn" title="安徽">安徽</a></li>
				<li><a href="http://www.hn.10086.cn" title="湖南">湖南</a></li>
				<li><a href="http://www.gx.10086.cn" title="广西">广西</a></li>
				<li><a href="http://www.jx.10086.cn" title="江西">江西</a></li>
				<li><a href="http://www.gz.10086.cn" title="贵州">贵州</a></li>
				<li><a href="http://www.yn.10086.cn" title="云南">云南</a></li>
				<li><a href="http://www.xz.10086.cn" title="西藏">西藏</a></li>
				<li><a href="http://www.gs.10086.cn" title="甘肃">甘肃</a></li>
				<li><a href="http://www.zj.10086.cn" title="浙江">浙江</a></li>
				<li><a href="http://www.fj.10086.cn" title="福建">福建</a></li>
				<li><a href="http://www.hi.10086.cn" title="海南">海南</a></li>
				<li><a href="http://www.hb.10086.cn" title="湖北">湖北</a></li>
				<li><a href="http://www.nx.10086.cn" title="宁夏">宁夏</a></li>
				<li><a href="http://www.qh.10086.cn" title="青海">青海</a></li>
				<li><a href="http://www.xj.10086.cn" title="新疆">新疆</a></li>
				<li><a href="http://www.hl.10086.cn" title="黑龙江">黑龙江</a></li>
				<li class="col6"><a href="http://www.nm.10086.cn" title="内蒙古">内蒙古</a></li>
				<li class="col3"><a href="http://www.chinamobileltd.com" title="China Mobile Ltd">China Mobile Ltd</a></li>
				<li class="col3"><a href="http://labs.10086.cn" title="中国移动研究院">中国移动研究院</a></li>
				<li class="col3"><a href="http://www.cmdi.10086.cn" title="中国移动设计院">中国移动设计院</a></li>
				</ul>
				<div class="fl"></div><div class="fr"></div>
			</dd>
		</dl>
	</div>
	<p title="移动改变生活"><span>移动</span>改变生活<samp>&gt;&gt;</samp></p>
</div>

<div class="w nav">
	<ul class="uls">
	<li><a href="#" title="服务与支持" class="a"><b>服务与支持</b></a></li>
	<li id="shop" class="here"><a href="#" title="网上营业厅" class="a"><b>网上营业厅</b></a>
		<div class="col4 hidden">
			<dl class="col">
				<dt title="手机商城">手机商城</dt>
				<dd><a href="#" title="诺基亚">诺基亚</a></dd>
				<dd><a href="#" title="华为">华为</a></dd>
				<dd><a href="#" title="三星">三星</a></dd>
				<dd><a href="#" title="最新优惠">中兴</a></dd>
			</dl>
			<dl class="col2">
				<dt title="网上选号">网上选号</dt>
				<dd><a href="#" title="全球通">全球通</a></dd>
				<dd><a href="#" title="动感地带">动感地带</a></dd>
				<dd><a href="#" title="神州行">神州行</a></dd>
			</dl>
			<dl class="col3">
				<dt title="优惠活动">优惠活动</dt>
				<dd><a href="#" title="购机返话费">购机返话费</a></dd>
				<dd><a href="#" title="优惠购机">优惠购机</a></dd>
			</dl>
			<span></span>
		</div>
	</li>
	<li id="my"><a href="#" title="我的移动" class="a"><b>我的移动</b></a>
		<div class="col2 hidden">
			<dl class="col">
				<dt title="我的账户">我的账户</dt>
				<dd><a href="#" title="套餐余量查询">套餐余量查询</a></dd>
				<dd><a href="#" title="积分查询">积分查询</a></dd>
				<dd><a href="#" title="业务状态查询">业务状态查询</a></dd>
				<dd><a href="#" title="充值缴费" class="red">充值缴费</a></dd>
				<dd><a href="#" title="详单查询">详单查询</a></dd>
				<dd><a href="#" title="余额查询">余额查询</a></dd>
				<dd><a href="#" title="账单查询">账单查询</a></dd>
			</dl>
			<dl class="col2">
				<dt title="我要办理">我要办理</dt>
				<dd><a href="#" title="快速查找">快速查找</a></dd>
				<dd><a href="#" title="产品推荐">产品推荐</a></dd>
				<dd><a href="#" title="生活配对">生活配对</a></dd>
				<dd><a href="#" title="最新优惠">最新优惠</a></dd>
			</dl>
			<dl class="col3">
				<dt title="移动生活">移动生活</dt>
				<dd><a href="#" title="手机阅读">手机阅读</a></dd>
				<dd><a href="#" title="无线音乐俱乐部">无线音乐俱乐部</a></dd>
				<dd><a href="#" title="手机游戏">手机游戏</a></dd>
			</dl>
			<span></span>
		</div>
	</li>
	<li><a href="#" title="首页" class="a"><b>首页</b></a></li>
	</ul>
</div>

<div class="w sch">
	<div class="l">
		<dl class="goto">
			<dt title="快捷办理通道">快捷办理通道<i class="inb"></i></dt>
			<dd class="hidden">
				<a href="#" target="_blank" title="移动数据流量详单">移动数据流量详单</a>
				<a href="#" target="_blank" title="家庭亲情网">家庭亲情网</a>
				<a href="#" target="_blank" title="虚拟网业务">虚拟网业务</a>
				<a href="#" target="_blank" title="全球通商旅套餐">全球通商旅套餐</a>
				<a href="#" target="_blank" title="短信业务">短信业务</a>
				<a href="#" target="_blank" title="彩铃业务">彩铃业务</a>
				<a href="#" target="_blank" title="WLAN业务(含校园版)">WLAN业务(含校园版)</a>
				<a href="#" target="_blank" title="G3可视电话">G3可视电话</a>
				<a href="#" target="_blank" title="全球通上网套餐">全球通上网套餐</a>
				<a href="#" target="_blank" title="飞信业务">飞信业务</a>
			</dd>
		</dl>
		<p><a href="#" title="购机选号">购机选号</a><samp>|</samp><a href="#" title="网上交费">网上交费</a><samp>|</samp><a href="#" title="积分商城">积分商城</a><samp>|</samp><a href="http://www.gz.10086.cn/zf/" target="_blank">资费专区</a></p>
	</div>

	<form method="post" action="" name="" class="r">
		热门搜索：<a href="#" title="GPRS">GPRS</a><samp>|</samp><a href="#" title="全球通新88套餐">全球通新88套餐</a>
		<select name="screahType" id="screahType">
			<option>商城</option>
			<option>号卡</option>
			<option>门户</option>
		</select><input type="text" class="txt_sch gray" id="screahWord" name="screahWord" onfocus="if(this.value=='请输入商品名称关键字'){this.value='';this.className='txt_sch'}" onblur="if(this.value==''){this.value='请输入商品名称关键字';this.className='txt_sch gray'}" value="请输入商品名称关键字" /><input type="submit" value="搜索" class="hand btn60x26" /></form>
</div>

<div class="w loc">
	
	<p class="l"><a href="#" title="商城首页">商城首页</a><samp>|</samp><a href="#" title="我的商城">我的商城</a></p>

	<dl id="cart" class="cart l">
		<dt><a href="${path }/cart/listCart.do" title="结算">结算</a>购物车:<b id="">123</b>件</dt>
		<dd class="hidden">
			<p class="alg_c hidden">购物车中还没有商品，赶紧选购吧！</p>
			<h3 title="最新加入的商品">最新加入的商品</h3>
			<ul class="uls">
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="../res/img/pic/p50x50.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="../res/img/pic/p50x50b.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="../res/img/pic/p50x50c.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="../res/img/pic/p50x50.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
			</ul>
			<div>
				<p>共<b>4</b>件商品&nbsp;&nbsp;&nbsp;&nbsp;共计<b class="f20">¥3599.00</b></p>
				<a href="#" title="去购物车结算" class="inb btn120x30c">去购物车结算</a>
			</div>
		</dd>
	</dl>

	<p class="r"><a href="index.html" title="商城首页">商城首页</a><samp>&gt;</samp><a href="#" title="手机商城">手机商城</a><samp>&gt;</samp><a href="#" title="HTC">HTC</a><samp>&gt;</samp><span class="gray">HTC A6390</span></p>

</div>

<div class="w ofc mt"> 
	<div class="l wl">

		<h2 class="h2 h2_l"><em title="商品分类">商品分类</em><cite></cite></h2>
		<div class="box bg_gray">
			<ul class="ul left_nav">
				<li><a href="#" title="网上选号"><img src="../res/img/gray/ln01.gif" alt="网上选号" />网上选号</a></li>
				<li><a href="#" title="手机商城"><img src="../res/img/gray/ln02.gif" alt="手机商城" />手机商城</a></li>
				<li><a href="#" title="优惠活动"><img src="../res/img/gray/ln03.gif" alt="优惠活动" />优惠活动</a></li>
			</ul>
		</div>

		<h2 class="h2 h2_l mt"><em title="销量排行榜">销量排行榜</em><cite></cite></h2>
		<div class="box bg_white">
			<ul class="uls x_150x150">
				<li class="here">
					<var class="sfont">1.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<!-- dt 11个文字+... -->
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉摩托罗拉托罗拉...</a></dt>
						<!-- dd 23个文字+... -->
						<dd class="h40">摩托罗拉摩托罗拉托罗拉拉摩托罗拉摩托罗拉托罗罗...</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">2.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">3.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">4.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">5.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">6.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">7.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">8.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">9.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
				<li>
					<var class="sfont">10.</var>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="h40">3G手机（黑）WCDMA/GSM 新品上市！！下单就返</dd>
						<dd><span class="gray">抢购价：</span><var class="red b f14">￥3599</var></dd>
					</dl>
				</li>
			</ul>
			<script language="javascript" type="text/javascript">
			$('.x_150x150').each(function(i, items_list){ 
				$(items_list).find('li').hover(function(){
					$(items_list).find('li').each(function(j, li){
						$(li).removeClass('here');
					});
					$(this).addClass('here');
				},function(){});
			});
			</script>
		</div>

		<h2 class="h2 h2_l mt"><em title="我的浏览记录">我的浏览记录</em><cite></cite></h2>
		<div class="box bg_white">
			<ul class="uls x_50x50">
				<li>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<!-- dt 8个文字+... -->
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉摩托罗拉拉...</a></dt>
						<dd class="orange">￥3599 ~ ￥4599</dd>
					</dl>
				</li>
				<li>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="orange">￥3599 ~ ￥4599</dd>
					</dl>
				</li>
				<li>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="orange">￥3599 ~ ￥4599</dd>
					</dl>
				</li>
				<li>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="orange">￥3599 ~ ￥4599</dd>
					</dl>
				</li>
				<li>
					<a href="#" title="张同来" target="_blank" class="pic"><img src="../res/img/pic/p140X140b.png" alt="摩托罗拉XT319" /></a>
					<dl>
						<dt><a href="#" title="摩托罗拉XT319" target="_blank">摩托罗拉XT319</a></dt>
						<dd class="orange">￥3599 ~ ￥4599</dd>
					</dl>
				</li>
			</ul>
		</div>

		<div class="ad200x75 mt"><img src="../res/img/pic/ad200x75.jpg" alt="" /></div>

		<div class="ad200x169 mt"><img src="../res/img/pic/ad200x169.jpg" alt="" /></div>

		<div class="ad200x244 mt"><img src="../res/img/pic/ad200x244.jpg" alt="" /></div>

	</div>
	<div class="r wr">
		
		<div class="product">
        	<h2>${item.itemName }<span class="gray f14">${item.promotion }</span></h2>
			<div class="showPro">
				<div class="big"><a id="showImg" class="cloud-zoom" href="${file_path }${item.imgs}" rel="adjustX:10,adjustY:-1"><img title="optional title display" alt="" src="../res/img/pic/smallimage.jpg"></a></div>
				<!-- <div class="big_type">团购中...</div> -->
				<div class="small">
					<span class="smallL" title="向左">&nbsp</span>
					<div class="smallBox">
						<div class="smallList">
							<a class="cloud-zoom-gallery here" title="red" href="../res/img/pic/bigimage00.jpg" rel="useZoom: 'showImg', smallImage: '../res/img/pic/smallimage.jpg'"><img alt="thumbnail 1" src="../res/img/pic/tinyimage.jpg"></a>
							<a class="cloud-zoom-gallery" title="blue" href="../res/img/pic/bigimage01.jpg" rel="useZoom: 'showImg', smallImage: '../res/img/pic/smallimage-1.jpg'"><img alt="thumbnail 2" src="../res/img/pic/tinyimage-1.jpg"></a>
							<a class="cloud-zoom-gallery" title="blue" href="../res/img/pic/bigimage02.jpg" rel="useZoom: 'showImg', smallImage: '../res/img/pic/smallimage-2.jpg'"><img alt="thumbnail 3" src="../res/img/pic/tinyimage-2.jpg"></a>
							<a class="cloud-zoom-gallery" title="blue" href="../res/img/pic/bigimage03.jpg" rel="useZoom: 'showImg', smallImage: '../res/img/pic/smallimage-3.jpg'"><img alt="thumbnail 4" src="../res/img/pic/tinyimage-3.jpg"></a>
							<a class="cloud-zoom-gallery" title="blue" href="../res/img/pic/bigimage04.jpg" rel="useZoom: 'showImg', smallImage: '../res/img/pic/smallimage-4.jpg'"><img alt="thumbnail 5" src="../res/img/pic/tinyimage-4.jpg"></a>
						</div>
					</div>
					<span class="smallR" title="向右">&nbsp</span>
				</div>

				<div class="share mt">
	
					<div id="ecpsShareIcon">
						<div class="iconSmall iconRight">
							<span>分享到：</span><a href="javascript:void(0);" target="_blank" class="sinawb" title="分享到新浪微博"></a><a href="javascript:void(0);" target="_blank" class="qqwb" title="分享到腾讯微博"></a><a href="javascript:void(0);" target="_blank" class="renren" title="分享到人人网"></a><a href="javascript:void(0);" target="_blank" class="qqzone" title="分享到QQ空间"></a><a href="javascript:void(0);" target="_blank" class="sohuwb" title="分享到搜狐微博"></a><a href="javascript:void(0);" class="copy" title="复制链接">复制链接</a>
						</div>
					</div>

				</div>

			</div>
			
			<form method="post" action="" name="" class="infor">
				<ul class="uls form">
				<!-- <li class="p34x34">
					<span><img title="Android" alt="Android" src="../res/img/gray/Android.gif" />Android</span>
					<span><img title="蓝牙" alt="蓝牙" src="../res/img/gray/Bluetooth.gif" />蓝牙</span>
					<span><img title="CPU双核" alt="CPU双核" src="../res/img/gray/CPU-Dual-core.gif" />CPU双核</span>
					<span><img title="双摄像头" alt="双摄像头" src="../res/img/gray/Dual-cameras.gif" />双摄像头</span>
					<span><img title="翻盖" alt="翻盖" src="../res/img/gray/Flip.gif" />翻盖</span>
					<span><img title="GPS" alt="GPS" src="../res/img/gray/GPS.gif" />GPS</span>
					<span><img title="塞班" alt="塞班" src="../res/img/gray/Saipan.gif" />塞班系统</span>
					<span><img title="滑盖" alt="滑盖" src="../res/img/gray/Slide.gif" />滑盖</span>
					<span><img title="侧滑盖" alt="侧滑盖" src="../res/img/gray/Sliding-cover.gif" />侧滑盖</span>
					<span><img title="直板" alt="直板" src="../res/img/gray/Straight.gif" />直板</span>
					<span><img title="Wifi" alt="Wifi" src="../res/img/gray/Wifi.gif" />Wifi</span>
					<span><img title="Window7" alt="Window7" src="../res/img/gray/Window7.gif" />Window7</span>
				</li> -->
				<li><label>移 动 价：</label><span class="word"><b id="skuPrice" class="f14 red mr">￥3999.00</b>(市场价:<del id="marketPrice">￥5789.00</del>)</span></li>
				<li><label>商品编号：</label><span class="word">${item.itemNo }</span></li>
				<li><label>商品评价：</label><span class="word"><span class="val_no val3d4" title="4分">4分</span><var class="blue">(已有17人评价)</var></span></li>
				<li><label>运　　费：</label><span class="word">包邮&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" class="blue">配送区域</a></span></li>
				<li><label>库　　存：</label><span id="stockState" class="word">有货</span></li>
				<li><label>支付方式：</label><div class="pre word p16x16">
					<span title="网银支付" class="bank">网银支付</span>
					<span title="支付宝" class="pay">支付宝</span>
					<span title="手机支付" class="moblie">手机支付</span>
				</div></li>
				</ul>
				<div class="box_blue">
					<ul class="uls form pb16">
					<li><label class="b">赠　　品：</label><div class="pre">诺基亚（NOKIA）BH-21 NFC技术 连接两台手机 白色 <samp>X 1</samp><br />诺基亚（NOKIA）BH-21 NFC技术 连接两台手机 白色 <samp>X 1</samp></div></li>
					</ul>
				</div>
				<div class="box_orange">
					<ul class="uls form">
					<li><label>规　　格：</label><div class="pre spec">
					<c:forEach items="${item.skuList }" var="sku" varStatus="state">
							<c:choose>
								<c:when test="${state.index == 0 }">
									<a href="javascript:void(0);" class="here" skuId="${sku.skuId }">
										<c:forEach items="${sku.specList }" var="spec">
											${spec.specValue }
										</c:forEach>
									</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:void(0);" skuId="${sku.skuId }">
										<c:forEach items="${sku.specList }" var="spec">
											${spec.specValue }
										</c:forEach>
									</a>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
						
					</div></li>
					<li><label>我 要 买：</label><a href="javascript:void(0);" class="inb sub"></a><input readonly type="text" name="" id="quantity" value="1" class="num" size="3" /><a href="javascript:void(0);" class="inb add"></a><em id="sub_add_msg" class="red"></em></li>
					<li class="submit"><input type="button" value="" class="hand btn138x40" onclick="buy();"/><input type="button" value="" class="hand btn138x40b" onclick="addCart()"/><a href="#" title="加入收藏" class="inb fav">加入收藏</a></li>
					
					
					</ul>
				</div>

			<!-- 	<dl class="box_orange msg">
                    <dt class="failMsg">该商品已下架或未参加活动！</dt>
                    <dd>你可以：<p>1、联系客服电话&nbsp;<var>10086</var>；<br>2、返回&nbsp;<a href="${siteBaseDN}index.html" title="商城首页">商城首页<samp>&gt;&gt;</samp>。</a></p></dd>
				</dl>

				<dl class="box_orange msg">
                    <dt class="failMsg">该商品已下架或未参加活动</dt>
                    <dd>你可以：<p>1、联系客服电话&nbsp;<var>10086</var>；<br>2、返回&nbsp;<a href="${siteBaseDN}index.html" title="商城首页">商城首页<samp>&gt;&gt;</samp>。</a></p></dd>
				</dl> -->

			</form>

		</div>

		<div class="confirm mt">
			<div class="tl"></div><div class="tr"></div>
			<div class="ofc">

				<dl class="dl_msg">
				<dt><b class="f14 blue">营销活动</b><span class="gray">选择营销活动以获得更多优惠。</span></dt>
				<dd>1、全球通50优惠购机 <a href="#" title="title">[查看详情]</a></dd>
				<dd>2、畅想计划 <a href="#" title="title">[查看详情]</a></dd>
				<dd>3、2011全球通88套餐终端营销活动 <a href="#" title="title">[查看详情]</a></dd>
				</dl>

			</div>
			<div class="fl"></div><div class="fr"></div>
		</div>

		<h2 class="h2 h2_ch mt"><em>
			<a href="javascript:void(0);" title="商品描述" rel="#detailTab1" class="here">商品描述</a>
			<a href="javascript:void(0);" title="规格参数" rel="#detailTab2">规格参数</a>
			<a href="javascript:void(0);" title="包装信息" rel="#detailTab3">包装信息</a></em><cite></cite></h2>
		<div class="box bg_white ofc">
		
			<div id="detailTab1" class="detail">

				${item.itemClob.itemDesc }

			</div>
			
			<div id="detailTab2" style="display:none">
						
				<table cellspacing="0" summary="" class="tab tab7">
				<thead>
				<tr>
				<th colspan="2">基本参数</th>
				</tr>     
				</thead>
				<tbody>
				<c:forEach items="${item.paraList }" var="para">
					<tr>
					<th width="15%" class="alg_r">${para.featureName }</th>
					<td>${para.paraValue }</td>
					</tr> 
				</c:forEach>
				</tbody>
				</table>

			</div>

			<div id="detailTab3" class="detail" style="display:none">

	<pre class="f14">
	商品标配请您以包装清单为准：
	iPhone 4s *1，
	带遥控功能和麦克风的 Apple 耳机 *1，
	Dock Connector to USB 线缆 *1，
	USB 电源转换器 *1，
	SIM 弹出工具 *1，
	包装、说明书、保修卡*1，
	</pre>

			</div>

			<dl class="dl_help">
				<dd>
					本产品全国联保，享受三包服务，质保期为：一年质保<br />
					如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！<br />
					售后服务电话：<var class="blue">400-830-8300</var><br />
					品牌官方网站：<var class="blue">http://www.huawei.com/cn/</var>
				</dd>
				<dt>服务承诺：</dt>
				<dd>
					中国移动手机购商城向您保证所售商品均为正品行货，自带机打发票，与商品一起寄送。凭质保证书及中国移动手机购商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。<br />
					中国移动手机购商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！（钟表除外）<br />
					<span class="blue"><b>注：</b>因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！</span><br />
				</dd>
				<dt class="red">权利声明：</dt>
				<dd>中国移动手机购商城上的所有商品信息、客户评价、商品咨询、网友讨论等内容，是中国移动手机购商城重要的经营资源，未经许可，禁止非法转载使用。</dd>
			</dl>

		</div>

	</div>
</div>

<div class="mode">
	<div class="tl"></div><div class="tr"></div>
	<ul class="uls">
		<li class="first">
			<span class="guide"></span>
			<dl>
			<dt title="购物指南">购物指南</dt>
			<dd><a href="#" title="在线购机/预约购机流程">在线购机/预约购机流程</a></dd>
			<dd><a href="#" target="_blank" title="预约选号流程">预约选号流程</a></dd>
			</dl>
		</li>
		<li>
			<span class="way"></span>
			<dl>
			<dt title="支付方式">支付方式</dt>
			<dd><a href="#" title="在线支付">在线支付</a></dd>
			<dd><a href="#" title="退款周期">退款周期</a></dd>
			</dl>
		</li>
		<li>
			<span class="help"></span>
			<dl>
			<dt title="配送方式">配送方式</dt>
			<dd><a href="#" title="配送说明">配送说明</a></dd>
			<dd><a href="#" title="配送时间">配送时间</a></dd>
			<dd><a href="#" title="配送费用">配送费用</a></dd>
			<dd><a href="#" title="货品签收">货品签收</a></dd>
			</dl>
		</li>
		<li>
			<span class="service"></span>
			<dl>
			<dt title="售后服务">售后服务</dt>
			<dd><a href="#" target="_blank" title="退换货流程">退换货流程</a></dd>
			<dd><a href="#" target="_blank" title="售后服务点">售后服务点</a></dd>
			</dl>
		</li>
		<li>
			<span class="problem"></span>
			<dl>
			<dt title="常见问题">常见问题</dt>
			<dd><a href="#" target="_blank" title="配送时限是几天？">配送时限是几天？</a></dd>
			<dd><a href="#" target="_blank"title="付款方式有哪些？">付款方式有哪些？</a></dd>
			<dd><a href="#" target="_blank"title="如何签收商品？">如何签收商品？</a></dd>
			<dd><a href="#" target="_blank"title="是否提供三包售后？">是否提供三包售后？</a></dd>
			</dl>
		</li>
	</ul>
</div>

<div class="w footer">
	<p><a href="#" title="新闻公告">新闻公告</a><samp>|</samp><a href="#" title="法律声明">法律声明</a><samp>|</samp><a href="#" title="诚招英才">诚招英才</a><samp>|</samp><a href="#" title="联系我们">联系我们</a><samp>|</samp><a href="#" title="采购信息">采购信息</a><samp>|</samp><a href="#" title="企业合作">企业合作</a><samp>|</samp><a href="#" title="站点导航">站点导航</a><samp>|</samp><a href="#" title="网站地图">网站地图</a></p>
	<p>掌上营业厅：<a href="#" title="掌上营业厅：wap.10086.cn">wap.10086.cn</a>&nbsp;&nbsp;语音自助服务：10086&nbsp;&nbsp;短信营业厅：10086&nbsp;&nbsp;<a href="http://www.bj.10086.cn/index/10086/channel/index.shtml">自助终端网点查询</a>&nbsp;&nbsp;<a href="http://www.bj.10086.cn/index/10086/channel/index.shtml">满意100营业厅网点查询</a>&nbsp;&nbsp;<a href="http://www.bj.10086.cn/index/10086/download/index.shtml">手机客户端下载</a></p>
	<p><a href="#" title="京ICP备05002571" class="inb i18x22"></a>&nbsp;京ICP备05002571<samp>|</samp>中国移动通信集团&nbsp;版权所有</p>
</div>

<div id="loginAlert" class="alt login" style="display:none">
	<h2 class="h2"><em title="登录">登录</em><cite></cite></h2>
	<a href="javascript:void(0);" id="loginAlertClose" class="close" title="关闭"></a>
	<div class="cont">
		<ul class="uls form">
		<li id="loginAlertError" class="errorTip" style="display:none"></li>
		<li>
			<label>帐号类型：</label>
			<dl class="bg_text" style="z-index:3">
				<dd class="hidden">
					<a href="javascript:void(0);" title="手机号码">手机号码</a>
					<a href="javascript:void(0);" title="用户名">用户名</a>
				</dd>
				<dt title="请选择帐号类型">请选择帐号类型</dt>
			</dl>
		</li>
		<li>
			<label>手机号码：</label>
			<span class="bg_text">
				<input type="text" maxlength="50" vld="{required:true}" name="loginUserName" id="loginUserName" reg1="^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$" desc="用户名长度不超过50个，必须是邮箱格式！" />
				<em id="userNameLabel" class="def">请输入手机号码</em>
			</span>
			<span class="word"><a title="免费注册" href="/ecps-portal/ecps/portal/register.do">免费注册</a></span>
		</li>
		<li>
			<label>登录模式：</label>
			<dl class="bg_text" style="z-index:2">
				<dd class="hidden">
					<a href="javascript:void(0);" title="服务密码">服务密码</a>
					<a href="javascript:void(0);" title="网站密码">网站密码</a>
				</dd>
				<dt title="请选择帐号类型">请选择登录模式</dt>
			</dl>
		</li>
		<li><label>服务密码：</label>
			<span class="bg_text"><input type="password" vld="{required:true}" maxlength="20" name="loginPassword" id="loginPassword" value="" reg1="^.{6,20}$" desc="密码长度范围为6-20，允许为中英文、数字或特殊字符！" /></span>
		</li>
		<li>
			<label for="captcha">验 证 码：</label>
			<span class="bg_text small"><input type="text" vld="{required:true}" maxlength="7" name="loginCaptcha" id="loginCaptcha" value="" reg1="^\w{6}$" desc="验证码不正确" /></span>
			<img alt="换一张" id="loginCaptchaCode" class="code" onclick="this.src='/ecps-portal/captcha.svl?d='+new Date().getTime();" src="../res/img/pic/code.png" /><a href="#" onclick="document.getElementById('loginCaptchaCode').src='/ecps-portal/captcha.svl?d='+new Date().getTime();" title="换一张">换一张</a>
		</li>
		<li class="gray"><label>&nbsp;</label><input type="checkbox" name="">记住我的手机号码</li>
		<li><label>&nbsp;</label><input type="button" id="loginSubmit" class="hand btn66x23" value="登 录" onclick="loginAjax('/ecps-portal/ecps/portal/item/landingAjax.do');" ><a title="忘记密码？" href="/ecps-portal/ecps/portal/getpwd/getpwd1.do">忘记密码？</a></li>
		<!--li class="alg_c dev gray">还不是移动商城会员？<a title="免费注册" href="/ecps-portal/ecps/portal/register.do">免费注册</a></li-->
		</ul>
	</div>
</div>

<div id="promptAlert" class="alt prompt" style="display:none">
	<h2 class="h2"><em title="提示">提示</em><cite></cite></h2>
	<a href="javascript:void(0);" id="promptAlertClose" class="close" title="关闭"></a>
	<div class="cont">
		<dl class="dl_msg">
			<dt>请在新页面完成支付！</dt>
			<dd>支付完成前请不要关闭此窗口，<br />完成支付后请根据您的情况点击下面的按钮。</dd>
			<dd><a href="#" title="遇到付款问题" class="inb btn96x23 mr20">遇到付款问题</a><a href="#" title="已完成支付" class="inb btn96x23">已完成支付</a></dd>
			<dd class="alg_r"><a href="#" title="返回选择其他支付方式">返回选择其他支付方式&gt;&gt;</a></dd>
		</dl>
	</div>
</div>

<div id="transitAlert" class="alt transit" style="display:none">
	<h2 class="h2"><em title="提示">提示</em><cite></cite></h2>
	<a href="javascript:void(0);" id="transitAlertClose" class="close" title="关闭"></a>
	<div class="cont">
		<div class="warningMsg">
			<p class="indent">您即将访问的网站不属于中国移动通信集团公司门户网站站群范围，任何通过使用中国移动通信集团公司门户网站站群链接到的第三方页面均系第三方平台制作或提供，您可能从该第三方网页上获得资讯及享用服务，中国移动通信集团公司对其合法性概不负责，也不承担任何法律责任。</p>
			<p class="alg_c"><input type="button" class="hand btn66x23" value="确 定" /></p>
		</div>
	</div>
</div>

</body>
</html>
