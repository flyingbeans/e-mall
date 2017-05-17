<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../taglibs.jsp" %>
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
<title>填写核对订单信息_我的购物车_移动商城_中国移动通信</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="search" type="application/opensearchdescription+xml" href="../opensearch.xml" title="移动购物" />
<link rel="stylesheet" href="${path }/res/css/style.css" />
<script src="${path }/res/js/jquery.js"></script>
<script type="text/javascript">var path = "${path}";</script>
<script type="text/javascript" src="${path }/res/js/getUser.js"></script>
<script src="${path }/res/js/com.js"></script>
<script type="text/javascript">
$(function(){

	$("#loginAlertIs").click(function(){
		tipShow('#loginAlert');
	});

	$("#promptAlertIs").click(function(){
		tipShow('#promptAlert');
	});

	$("#transitAlertIs").click(function(){
		tipShow('#transitAlert');
	});

	$("input[name='distribution']").click(function(){
		$(this).parent().parent().find('dd').hide();
		$(this).parent().next().show();
	});

	$("input[name='invoiceBox']").click(function(){
		var sel = $(this).attr('checked');
		if(sel){
			$(this).parent().next().fadeIn('slow');
		}else{
			$(this).parent().next().fadeOut('slow');
		}
	});

	/*addree*/
	$("#adrList input").click(function(){
		var val = $(this).val();
		if(val == 'add'){
			$('#addAddress').fadeIn('slow');
		}
	});

	$('#adrList').find('tr').hover(function(){
		$(this).addClass('over');
	},function(){
		$(this).removeClass('over');
	});

	$("#openBank").toggle(function(){
		$(this).text('[-]请点击查看支持那些银行。');
		$("#openBankCont").fadeIn('slow');
	},function(){
		$(this).text('[+]请点击查看支持那些银行。');
		$("#openBankCont").fadeOut('slow');
	});
	
});

function modify(n){
	$('#addAddress').fadeIn('slow');
}

function del(e){
	$(e).parent().parent().remove();
}

function trueBuy(){
	window.location.href = "./confirmProductCase2.jsp";
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
		</ul>-->
	</li>
	</ul>
</div></div>

<div class="w header bor_h">
	<h1><a href="http://www.bj.10086.cn" title="中国移动通信">中国移动通信</a></h1>
	<div class="area">
		<dl>
			<dt>贵州</dt>
		</dl>
	</div>
	<p title="移动改变生活"><span>移动</span>改变生活<samp>&gt;&gt;</samp></p>
</div>

<ul class="ul step st3_2">
<li title="1.查看购物车">1.查看购物车</li>
<li title="2.填写核对订单信息" class="here">3.填写核对订单信息</li>
<li title="4.成功提交订单">4.成功提交订单</li>
</ul>

<div class="w ofc case">

	<h2 class="h2 h2_r"><em title="配送方式">配送方式</em><cite></cite></h2>
	<div class="box bg_white pb">
		
		<dl class="distr">
			<dt><input type="radio" value="1" name="distribution" checked="checked" />快递运输</dt>
			<dd class="box_d bg_gray2 ofc">
				<ul class="uls form">
				<li><label for="deliveryTime">送货时间：</label><input type="radio" name="deliveryTime" checked="checked" />只工作日送货（双休日，节假日不送）</li>
				<li><label>&nbsp;</label><input type="radio" name="deliveryTime" />工作日，双休日，假日均可送货</li>
				<li><label>&nbsp;</label><input type="radio" name="deliveryTime" />只双休日，假日送货</li>
				<li><label>送货前电话确认：</label><input type="radio" name="telConfirm" />是&nbsp;&nbsp;<input type="radio" name="telConfirm" checked="checked" />否</li>
				<li id="modeLi02" style="display:none"><label>付款方式：</label><input type="checkbox" name="operating" />现金&nbsp;&nbsp;<input type="checkbox" name="operating" />POS刷卡&nbsp;&nbsp;<input type="checkbox" name="operating" />支票</li>
				</ul>
			</dd>
			<dt><input type="radio" value="3" name="distribution" />营业厅自取</dd>
			<dd style="display:none">
				<h3 title="请选择自提点">请选择自提点</h3>
				<h4 class="h4_ch"><a href="javascript:void(0);" rel="#distributionTab1" title="贵阳" class="here">贵阳</a><a href="javascript:void(0);" rel="#distributionTab2" title="都匀">都匀</a><a href="javascript:void(0);" rel="#distributionTab3" title="毕节">毕节</a><a href="javascript:void(0);" rel="#distributionTab4" title="六盘水">六盘水</a><a href="javascript:void(0);" rel="#distributionTab5" title="凯里">凯里</a><a href="javascript:void(0);" rel="#distributionTab6" title="遵义">遵义</a><a href="javascript:void(0);" rel="#distributionTab7" title="兴义">兴义</a><a href="javascript:void(0);" rel="#distributionTab8" title="铜仁">铜仁</a><a href="javascript:void(0);" rel="#distributionTab9" title="安顺">安顺</a></h4>
				<div class="box_d bg_gray2 ofc" style="width:926px">
					<table cellspacing="0" summary="" id="distributionTab1" class="tab">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅1</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>

					<table cellspacing="0" summary="" id="distributionTab2" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅2</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab3" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅3</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab4" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅4</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab5" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅5</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab6" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅6</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab7" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅7</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab8" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅8</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
					<table cellspacing="0" summary="" id="distributionTab9" class="tab" style="display:none">
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅9</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />水和平客车站瑞星营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州省罗甸县龙坪镇解放东路干河路口 0989-90896787</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />贵州西岗营业厅</td>
							<td class="gray">地址：贵州市西岗区北岗街北岗新居小区民开巷36号楼1单元1楼1号 0411-82104985</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />都匀动感营业厅</td>
							<td class="gray">地址：贵州省都匀市斗篷山路黔南师院0900号 0123-09890989</td>
						</tr>
						<tr>
							<td><input type="radio" name="operating" />瓮安胜隆华庭小区瑞星营业厅</td>
							<td class="gray">地址：贵州省三都县都江镇下街汽车旁1号 0411-82104985</td>
						</tr>
					</table>
				</div>
			</dd>
		</dl>
		
			
	</div>

	<h2 class="h2 h2_r mt"><em title="收货人信息">收货人信息</em><cite></cite></h2>
	<div class="box bg_white">
		
		<dl class="distr">
		<dd>
			<h3 title="常用地址">常用地址</h3>
			<div class="box_d bg_gray2 ofc">
				<table cellspacing="0" summary="" id="adrList" class="tab">
				<tr>
				<td><input type="radio" value="1" name="address" checked="checked" />陈军1</td>
				<td class="nwp wp">北京海淀区三环以内中关村南大街6号中电信息大厦7层705&nbsp;&nbsp;13500000000</td>
				<td class="def"><a href="javascript:void(0);" title="设为默认" class="blue">设为默认</a></td>
				<td><a href="javascript:void(0);" title="修改" onclick="modify('1')" class="blue">[修改]</a><a href="javascript:void(0);" title="删除" onclick="del(this)" class="blue">[删除]</a></td>
				</tr>
				<tr>
				<td><input type="radio" value="2" name="address" />陈军2</td>
				<td class="nwp wp">北京海淀区三环以内中关村南大街6号中电信息大厦7层705&nbsp;&nbsp;13500000000</td>
				<td class="def"><a href="javascript:void(0);" title="设为默认" class="blue">设为默认</a></td>
				<td><a href="javascript:void(0);" title="修改" onclick="modify('2')" class="blue">[修改]</a><a href="javascript:void(0);" title="删除" onclick="del(this)" class="blue">[删除]</a></td>
				</tr>
				<tr class="here">
				<td><input type="radio" value="3" name="address" />陈军3</td>
				<td class="nwp wp">北京海淀区三环以内中关村南大街6号中电信息大厦7层705&nbsp;&nbsp;13500000000</td>
				<td class="def"><a href="javascript:void(0);" title="设为默认" class="blue">设为默认</a></td>
				<td><a href="javascript:void(0);" title="修改" onclick="modify('3')" class="blue">[修改]</a><a href="javascript:void(0);" title="删除" onclick="del(this)" class="blue">[删除]</a></td>
				</tr>
				<tr>
				<td><input type="radio" value="4" name="address" />陈军4</td>
				<td class="nwp wp">北京海淀区三环以内中关村南大街6号中电信息大厦7层705&nbsp;&nbsp;13500000000</td>
				<td class="def"><a href="javascript:void(0);" title="设为默认" class="blue">设为默认</a></td>
				<td><a href="javascript:void(0);" title="修改" onclick="modify('4')" class="blue">[修改]</a><a href="javascript:void(0);" title="删除" onclick="del(this)" class="blue">[删除]</a></td>
				</tr>
				<tr>
				<td><input type="radio" value="5" name="address" />陈军5</td>
				<td class="nwp wp">北京海淀区三环以内中关村南大街6号中电信息大厦7层705&nbsp;&nbsp;13500000000</td>
				<td class="def"><a href="javascript:void(0);" title="设为默认" class="blue">设为默认</a></td>
				<td><a href="javascript:void(0);" title="修改" onclick="modify('5')" class="blue">[修改]</a><a href="javascript:void(0);" title="删除" onclick="del(this)" class="blue">[删除]</a></td>
				</tr>
				<tr>
				<td colspan="4"><input type="radio" value="add" name="address" />新增收货地址</td>
				</tr>
				</table>
			</div>
		</dd>
		</dl>
		
		<ul id="addAddress" class="uls form" style="display:none">
		<li><label for="username">收货人姓名：</label>
			<span class="bg_text"><input type="text" id="username" name="username" vld="{required:true}" maxLength="100" class="txt" /></span>
			<span class="pos"><span class="tip okTip">&nbsp;</span></span>
		</li>
		<li><label for="residence">地　　址：</label><select name="operating">
			<option value="" selected>省/直辖市</option>
			<option value=""></option>
		</select><select name="operating">
			<option value="" selected>城市</option>
			<option value=""></option>
		</select><select name="operating">
			<option value="" selected>县/区</option>
			<option value=""></option>
		</select></li>
		<li><label for="nick">街道地址：</label>
			<span class="bg_text"><input type="text" id="nick" name="nick" maxLength="32" vld="{required:true}" class="txt" /></span>
			<span class="pos"><span class="tip errorTip">用户名为4-20位字母、数字或中文组成，字母区分大小写。</span></span></li>
		<li><label for="zipCode">邮政编码：</label>
			<span class="bg_text"><input type="text" id="zipCode" name="zipCode" maxLength="32" vld="{required:true}" class="txt" /></span>
		</li>
		<li><label for="telphone">联系电话：</label>
			<span class="bg_text"><input type="text" id="telphone" name="telphone" maxLength="32" vld="{required:true}" class="txt gray" value="请输入手机号码或者固定电话" /></span>
			<span class="pos"><span class="tip warningTip">用户名为4-20位字母、数字或中文组成，字母区分大小写。</span></span>
		</li>
		<li><label for="statusAddr">&nbsp;</label><input type="checkbox" name="statusAddr" />设为默认收货地址</li>
		<li><label>&nbsp;</label><input type="button" id="addreeSubmit" class="hand btn120x30a" value="保存收货地址"><a href="javascript:void(0);" title="取消" class="gray">取消</a></li>
		</ul>

	</div>

	<h2 class="h2 h2_r mt"><em title="支付方式">支付方式</em><cite></cite></h2>
	<div class="box bg_white pb">

		<dl class="distr">
		<dd>
			<table cellspacing="0" summary="" class="tab">
				<tr>
					<th><b>支付方式</b></th>
					<th class="wp"><b>备注</b></th>
				</tr>
				<tr>
					<td><input type="radio" name="onlinePay" checked="checked" />在线支付</td>
					<td class="gray">即时到帐，支持绝大数银行借记卡及部分银行信用卡；<samp id="openBank" title="请点击查看支持那些银行。" class="default">[+]请点击查看支持那些银行。</samp></td>
				</tr>
			</table>
			<div id="openBankCont" class="box_d bg_gray2 pb ofc" style="display:none">
				<h3>支持以下网银：</h3>
				<ul class="ul x4_153x44">
					<li><span class="inb n01" title="中国工商银行">中国工商银行</span></li>
					<li><span class="inb n02" title="中国建设银行">中国建设银行</span></li>
					<li><span class="inb n03" title="招商银行">招商银行</span></li>
					<li><span class="inb n04" title="交通银行">交通银行</span></li>
					<li><span class="inb n05" title="广发银行">广发银行</span></li>
					<li><span class="inb n06" title="中国农业银行">中国农业银行</span></li>
					<li><span class="inb n07" title="中国邮政银行">中国邮政银行</span></li>
					<li><span class="inb n08" title="深圳发展银行">深圳发展银行</span></li>
					<li><span class="inb n09" title="渤海银行">渤海银行</span></li>
					<li><span class="inb n10" title="中信银行">中信银行</span></li>
				</ul>
				<h3>支持以下支付平台：</h3>
				<ul class="ul x4_153x44">
					<li><span class="inb n11" title="联动优势">联动优势</span></li>
					<li><span class="inb n12" title="中国移动手机支付">中国移动手机支付</span></li>
				</ul>
			</div>
		</dd>
		</dl>

	</div>

	<h2 class="h2 h2_r mt"><em title="发票信息">发票信息</em><cite></cite></h2>
	<div class="box bg_white pb">
		
		<dl class="distr">
			<dt><input type="checkbox" name="invoiceBox" />需要打印发票</dt>
			<dd class="box_d bg_gray2 ofc" style="display:none">
				<ul class="uls form">
				<li><label for="">发票类型：</label><input type="radio" value="1" name="invoice" checked="checked" />个人&nbsp;&nbsp;<input type="radio" value="2" name="invoice" />单位</li>
				<li><label for="">发票抬头：</label><span class="bg_text"><input type="text" id="invoiceNick" name="invoiceNick" maxLength="32" vld="{required:true}" class="txt" value="亚信联创科技(中国)有限公司" /></span></li>
				<li><label>发票内容：</label><select name="invoiceClass"><option value="" selected>食品</option><option value="">办公用品</option></select></li>
				</ul>
			</dd>
		</dl>

	</div>

	<h2 class="h2 h2_r mt"><em title="商品清单">商品清单</em><cite></cite></h2>
	<div class="box bg_white pb">
		
		<table cellspacing="0" summary="" class="tab tab4">
		<thead>
		<tr>
		<th>商品编号</th>
		<th class="wp">商品名称</th>
		<th>套卡价格（元）</th>
		<th>预存话费（元）</th>
		<th>小计（元）</th>
		</tr>                                                                                           
		</thead>
		<tbody>
		<tr>
		<td>201209087833</td>
		<td class="img48x20">
			<span class="inb"><img src="../../res/img/pic/n01.gif" alt="全球通" /></span>
			<a href="#" title="1381050188" class="b f20">1381050188</a>
		</td>
		<td>￥30.00</td>
		<td>￥3768.00</td>
		<td class="orange">￥3798.00</td>
		</tr>
		<tr>
			<th colspan="5" class="alg_r">
				<b>金额总计：</b><var class="orange">￥3700</var>
			</th>
		</tr>
		</tbody>
		</table>

	</div>

	 <div class="confirm mt">
		<div class="tl"></div><div class="tr"></div>
		<div class="ofc">
			<div class="l">
				<h3><em>订单备注：</em><span>限制160字以内</span></h3>
				<textarea id="explainAre" name="notes" rows="5" cols="40" class="are gray">发票内容不支持修改；收货人、配送方式、支付方式等以上述选定值为准，在此备注无效</textarea>
			</div>
			<div class="r">
				<input type="hidden" name="buyType" value="${buyType }"/>
				<c:if test="${temp==null }">
					<input id="d1" type="hidden" name="d1" value="1"/>
				</c:if>
				<dl class="total">
					<dt>最终订单金额：<cite>(共<var id="totalNum"><c:out value="${totalItemNum }"/></var>个商品)</cite></dt>
					<dd><em class="l">商品金额：</em>￥<var><fmt:formatNumber value="${totalMoney/100}" pattern="#0.00"/></var></dd>
					<dd><em class="l">运费：</em>￥<var><c:out value="0.00"/></var></dd>
					<dd class="orange"><em class="l">应付总额：</em>￥<var id="totalMoney"><fmt:formatNumber value="${totalMoney/100}" pattern="#0.00"/></var></dd>
					<dd class="alg_c"><input id="submitOrderID" type="button" value="结 算" class="hand btn136x36a" onclick="trueBuy();"/></dd>
				</dl>
			</div>
		</div>
		<div class="fl"></div><div class="fr"></div>
    </div>

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
			<img alt="换一张" id="loginCaptchaCode" class="code" onclick="this.src='/ecps-portal/captcha.svl?d='+new Date().getTime();" src="../../res/img/pic/code.png" /><a href="#" onclick="document.getElementById('loginCaptchaCode').src='/ecps-portal/captcha.svl?d='+new Date().getTime();" title="换一张">换一张</a>
		</li>
		<li class="gray"><label>&nbsp;</label><input type="checkbox" name="operating">记住我的手机号码</li>
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