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
<link rel="search" type="application/opensearchdescription+xml" href="${path}/opensearch.xml" title="移动购物" />
<link rel="stylesheet" href="${path}/res/css/style.css" />
<script src="${path}/res/js/jquery.js"></script> 
<!-- 解决在单独的js文件中不能访问path -->
<script type="text/javascript">var path = "${path}";</script>
<script type="text/javascript" src="${path}/res/js/getUser.js"></script>
<script src="${path}/res/js/com.js"></script>
<script type="text/javascript">
$(function(){

	$("#loginAlertIs").click(function(){
		window.location.href = "${path}/user/toLogin.do";
	});
	

	$("#promptAlertIs").click(function(){
		tipShow('#promptAlert');
	});

	$("#transitAlertIs").click(function(){
		tipShow('#transitAlert');
	});

	/*filter condition*/
	$('.btn80x22').toggle(
        function () {
            $(this).attr('title','收缩↑');
            $(this).attr('class','btn80x22 close');
            var len = $('.filter li').length;
            $('.filter li').slice(2,len-2).show();
        },
        function () {
            $(this).attr('title','展开↓');
            $(this).attr('class','btn80x22 open');
            var len = $('.filter li').length;
            $('.filter li').slice(2,len-2).hide();
        }
    );

	$('.filter li a').mousedown(function(){
    	var cln = $(this).attr("class");
		if(cln == undefined){
			$(this).attr("class",'');
			cln = $(this).attr("class");
		};
		if(cln.indexOf("btn80x22") == 0){
			return;
		}
		var type = $(this).parent().is("p");
		var obj;
		if(type){
			obj = $(this).parent().find('a');
		}else{
			obj = $(this).parent().parent().find('a');
		}
		obj.removeClass('here');
		$(this).addClass('here');
		var price = "";
		var brandId = "";
		var paraStr = "";
		$('.filter li a').each(function(){
			var clazz = $(this).attr("class");
			if(clazz == "here"){
				var fType = $(this).attr("fType");
				var fValue = $(this).attr("fValue");
				if(fType == "price"){
					price = fValue;
				}else if(fType == "brand"){
					brandId = fValue;
				}else if(fType == "feature" && fValue != ""){
					paraStr = paraStr + fValue + ",";
				}
			}
		});
		//alert(price + "------"+brandId+ "------"+paraStr);
		var iframePath = "${path}/item/listItem.do?price="+price+"&brandId="+brandId+"&paraStr="+paraStr;
		$("#itemListIframe").attr("src", iframePath);
    });

	$("#filterRest").click(function(){
		$('.filter li a').each(function(){
			$(this).removeClass('here');
		});
		$('.filter li').each(function(){
			$(this).find('a').eq(0).addClass('here');
		});
	});

	/* sales sales_down sales_up price price_down price_up time time_down time_up */
	$('.sort_type a').each(function(i, obj){
		$(obj).click(function(){
			var name = $(this).attr('class');
			$('.sort_type a').each(function(j, li){
				var tname = $(li).attr('class');
				if(j == 0&&tname!='sales'){$(li).attr('class','sales');}
				if(j == 1&&tname!='price'){$(li).attr('class','price');}
				if(j == 2&&tname!='time'){$(li).attr('class','time');}
			});
			if(name.indexOf('sales')>=0){
				if(name == 'sales'||name == 'sales_up'){
					$(this).attr('class','sales_down');
					$(this).attr('title','销量从高到低排序');
				}
				if(name == 'sales_down'){
					$(this).attr('class','sales_up');
					$(this).attr('title','销量从低到高排序');
				}
			};
			if(name.indexOf('price')>=0){
				if(name == 'price'||name == 'price_up'){
					$(this).attr('class','price_down');
					$(this).attr('title','点击按价格从高到低排序');
				}
				if(name == 'price_down'){
					$(this).attr('class','price_up');
					$(this).attr('title','点击按价格从低到高排序');
				}
			};
			if(name.indexOf('time')>=0){
				if(name == 'time'||name == 'time_up'){
					$(this).attr('class','time_down');
					$(this).attr('title','上架时间从近到远排序');
				}
				if(name == 'time_down'){
					$(this).attr('class','time_up');
					$(this).attr('title','上架时间从远到近排序');
				}
			};
		});
	});
	
});
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
	
	<p class="l"><a href="#" title="商城首页">商城首页</a><samp>|</samp><a href="${path }/user/login/toPersonal.do" title="我的商城">我的商城</a></p>

	<dl id="cart" class="cart l">
		<dt><a href="#" title="结算">结算</a>购物车:<b id="">123</b>件</dt>
		<dd class="hidden">
			<p class="alg_c hidden">购物车中还没有商品，赶紧选购吧！</p>
			<h3 title="最新加入的商品">最新加入的商品</h3>
			<ul class="uls">
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="${path}/res/img/pic/p50x50.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="${path}/res/img/pic/p50x50b.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="${path}/res/img/pic/p50x50c.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
					<p class="dt"><a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L">倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L</a></p>
					<p class="dd">
						<b><var>¥3599</var><span>x1</span></b>
						<a href="javascript:void(0);" title="删除" class="del">删除</a>
					</p>
				</li>
				<li>
					<a href="#" title="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L"><img src="${path}/res/img/pic/p50x50.jpg" alt="倍力通(Prestone)超级全合成机油5W-40 SM级 4L倍力通(Prestone)超级全合成机油5W-40 SM级 4L" /></a>
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

	<p class="r"><a href="index.html" title="商城首页">商城首页</a><samp>&gt;</samp><span class="gray">手机商城</span></p>

</div>

<div class="w ofc mt">
	<div class="l wl">
		
		<h2 class="h2 h2_l"><em title="商品分类">商品分类</em><cite></cite></h2>
		<div class="box bg_gray">
			<ul class="ul left_nav">
				<li><a href="#" title="网上选号"><img src="${path}/res/img/gray/ln01.gif" alt="网上选号" />网上选号</a></li>
				<li><a href="#" title="手机商城"><img src="${path}/res/img/gray/ln02.gif" alt="手机商城" />手机商城</a></li>
				<li><a href="#" title="优惠活动"><img src="${path}/res/img/gray/ln03.gif" alt="优惠活动" />优惠活动</a></li>
			</ul>
		</div>

		<h2 class="h2 h2_l mt"><em title="销量排行榜">销量排行榜</em><cite></cite></h2>
		<div class="box bg_white">
			<ul class="uls x_50x50">
				<c:forEach items="${itemList }" var="item">
				<li>
					<a href="./productDetail.jsp" title="张同来" target="_blank" class="pic"><img src="${file_path }${item.imgs}" alt="${item.itemName }" /></a>
					<dl>
						<!-- dt 10个文字+${path}. -->
						<dt><a href="/productDetail.jsp" title="摩托罗拉XT319" target="_blank">${item.itemName }</a></dt>
						<!-- dt 25个文字+${path}. -->
						<dd class="h40">${item.promotion }</dd>
						<dd class="orange">￥${item.skuPrice }</dd>
						<dd><a href="./productDetail.jsp" title="购买裸机" class="inb btn70x21 mr">购买裸机</a><a href="./productDetail.jsp" title="优惠购机" class="inb btn70x21">优惠购机</a></dd>
					</dl>
					<c:if test="${item.isHot == 1 }">
						<img src="${path}/res/img/pic/hot.gif" alt="热门" class="type" />
					</c:if>
				</li>
				</c:forEach>
				
			</ul>
		</div>

		<h2 class="h2 h2_l mt"><em title="我的浏览记录">我的浏览记录</em><cite></cite></h2>
		<div class="box bg_white">
			<ul class="uls x_50x50">
				<c:forEach items="${itemList }" var="item">
				<li>
					<a href="./productDetail.jsp" title="张同来" target="_blank" class="pic"><img src="${file_path }${item.imgs}" alt="${item.itemName }" /></a>
					<dl>
						<!-- dt 10个文字+${path}. -->
						<dt><a href="/productDetail.jsp" title="摩托罗拉XT319" target="_blank">${item.itemName }</a></dt>
						<!-- dt 25个文字+${path}. -->
						<dd class="h40">${item.promotion }</dd>
						<dd class="orange">￥${item.skuPrice }</dd>
						<dd><a href="./productDetail.jsp" title="购买裸机" class="inb btn70x21 mr">购买裸机</a><a href="./productDetail.jsp" title="优惠购机" class="inb btn70x21">优惠购机</a></dd>
					</dl>
					<c:if test="${item.isHot == 1 }">
						<img src="${path}/res/img/pic/hot.gif" alt="热门" class="type" />
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>

		<div class="ad200x75 mt"><img src="${path}/res/img/pic/ad200x75.jpg" alt="" /></div>

		<div class="ad200x169 mt"><img src="${path}/res/img/pic/ad200x169.jpg" alt="" /></div>

		<div class="ad200x244 mt"><img src="${path}/res/img/pic/ad200x244.jpg" alt="" /></div>

	</div>
	<div class="r wr">

		<h2 class="h2 h2_r rel"><samp></samp><em title="热卖手机">&nbsp;&nbsp;&nbsp;热卖手机</em><cite><a href="#" title="更多热卖手机" class="more">更多&gt;&gt;</a></cite></h2>
		<div class="box bg_white">
			<ul class="uls i_150x150 x4_150x150">
				<c:forEach items="${itemList }" var="item">
				<li>
					<a href="./productDetail.jsp" title="张同来" target="_blank" class="pic"><img src="${file_path }${item.imgs}" alt="${item.itemName }" /></a>
					<dl>
						<!-- dt 10个文字+${path}. -->
						<dt><a href="/productDetail.jsp" title="摩托罗拉XT319" target="_blank">${item.itemName }</a></dt>
						<!-- dt 25个文字+${path}. -->
						<dd class="h40">${item.promotion }</dd>
						<dd class="orange">￥${item.skuPrice }</dd>
						<dd><a href="./productDetail.jsp" title="购买裸机" class="inb btn70x21 mr">购买裸机</a><a href="./productDetail.jsp" title="优惠购机" class="inb btn70x21">优惠购机</a></dd>
					</dl>
					<c:if test="${item.isHot == 1 }">
						<img src="${path}/res/img/pic/hot.gif" alt="热门" class="type" />
					</c:if>
				</li>
				</c:forEach>
			</ul>
		</div>

		<h2 class="h2 h2_filter mt"><em title="手机商品筛选">手机&nbsp;-&nbsp;商品筛选</em><cite><a href="javascript:void(0);" id="filterRest" title="重置筛选条件">重置筛选条件</a></cite></h2>
		
			
			<ul class="uls filter">
				
				<li><b>价格：</b><p>
					<a href="javascript:void(0);" fType="price" fValue="" class="here">不限</a>
					<a href="javascript:void(0);" fType="price" fValue="1-499">1-499</a>
					<a href="javascript:void(0);" fType="price" fValue="500-999">500-999</a>
					<a href="javascript:void(0);" fType="price" fValue="1000-1999">1000-1999</a>
					<a href="javascript:void(0);" fType="price" fValue="2000-2999">2000-2999</a>
					<a href="javascript:void(0);" fType="price" fValue="3000-3999">3000-3999</a>
					<a href="javascript:void(0);" fType="price" fValue="4000-4999">4000-4999</a>
					<a href="javascript:void(0);" fType="price" fValue="5000-1000000">5000以上</a>
				</p></li>
				
				
				<li><b>品牌：</b><p>
					<a href="javascript:void(0);" fType="brand" fValue="" class="here">不限</a>
					<c:forEach items="${bList }" var="brand">
						<a href="javascript:void(0);" fType="brand" fValue="${brand.brandId }">${brand.brandName }</a>
					</c:forEach>
					
					
				</p></li>
				
				<c:forEach items="${fList }" var="feature">
					<li style="display:none"><b>${feature.featureName }：</b>
						<p>
							<a href="javascript:void(0);" fType="feature" fValue="" class="here">不限</a>
							<c:forEach items="${feature.selectValues }" var="val">
								<a href="javascript:void(0);" fType="feature" fValue="${val }">${val }</a>
							</c:forEach>
						</p>
					</li>
				</c:forEach>
				
				

				<li class="line"></li>
				<li class="alg_c after"><a href="javascript:void(0);" title="高级搜索" class="btn80x22 open">高级搜索</a></li>
			</ul>
			
		<iframe id="itemListIframe" src="${path }/item/listItem.do" frameBorder=0 scrolling=no width="100%" height="200%"  ></iframe>
		
			
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
			<img alt="换一张" id="loginCaptchaCode" class="code" onclick="this.src='/ecps-portal/captcha.svl?d='+new Date().getTime();" src="${path}/res/img/pic/code.png" /><a href="#" onclick="document.getElementById('loginCaptchaCode').src='/ecps-portal/captcha.svl?d='+new Date().getTime();" title="换一张">换一张</a>
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

