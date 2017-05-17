<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../taglibs.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../taglibs.jsp"%>
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

	$("input[name='isPrint']").click(function(){
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
			$('#addAddress').show(500);
		}else{
			$('#addAddress').hide(500);
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
<form action="${path }/order/submitOrder.do" method="post">


<div class="w ofc case">

	<h2 class="h2 h2_r"><em title="配送方式">配送方式</em><cite></cite></h2>
	<div class="box bg_white pb">
		
		<dl class="distr">
			<dt><input type="radio" value="1" name="deliveryMethod" checked="checked" />快递运输</dt>
			<dd class="box_d bg_gray2 ofc">
				<ul class="uls form">
				<li><label for="deliveryTime">送货时间：</label><input type="radio" name="delivery" value="3" checked="checked" />只工作日送货（双休日，节假日不送）</li>
				<li><label>&nbsp;</label><input type="radio" name="delivery" value="1"/>工作日，双休日，假日均可送货</li>
				<li><label>&nbsp;</label><input type="radio" name="delivery" value="2"/>只双休日，假日送货</li>
				<li><label>送货前电话确认：</label><input type="radio" name="isConfirm" value="1"/>是&nbsp;&nbsp;<input type="radio" name="isConfirm" checked="checked" value="0"/>否</li>
				<li id="modeLi02" style="display:none"><label>付款方式：</label><input type="checkbox" name="paymentCash" value="1"/>现金&nbsp;&nbsp;<input type="checkbox" name="paymentCash" value="2"/>POS刷卡&nbsp;&nbsp;<input type="checkbox" name="paymentCash" value="3"/>支票</li>
				</ul>
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
				<c:forEach items="${addrList }" var="addr">
					<tr>
						<td colspan="4"><input type="radio" value="${addr.shipAddrId }"
						<c:if test="${addr.defaultAddr == 1 }">checked</c:if>
						 name="address" />
						${addr.province }&nbsp;${addr.city }&nbsp;${addr.district }&nbsp;${addr.addr }&nbsp;${addr.zipCode }
						&nbsp;${addr.phone }&nbsp;${addr.shipName}
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="4"><input type="radio" value="add" name="address" />新增收货地址</td>
				</tr>
				</table>
			</div>
		</dd>
		</dl>
		
		<ul id="addAddress" class="uls form" style="display:none">
		<li><label for="username">收货人姓名：</label>
			<span class="bg_text"><input type="text" id="username" name="shipName" vld="{required:true}" maxLength="100" class="txt" /></span>
			<span class="pos"><span class="tip okTip">&nbsp;</span></span>
		</li>
		<li><label for="residence">地　　址：</label><select name="province">
			<option value="广西" selected>广西壮族自治区</option>
			
		</select><select name="city">
			<option value="南宁" selected>南宁</option>
			<option value="桂林" selected>桂林</option>
		</select><select name="district">
			<option value="青秀区" selected>青秀区</option>
		</select></li>
		<li><label for="nick">街道地址：</label>
			<span class="bg_text"><input type="text" id="nick" name="addr" maxLength="32" vld="{required:true}" class="txt" /></span>
			<span class="pos"><span class="tip errorTip">用户名为4-20位字母、数字或中文组成，字母区分大小写。</span></span></li>
		<li><label for="zipCode">邮政编码：</label>
			<span class="bg_text"><input type="text" id="zipCode" name="zipCode" maxLength="32" vld="{required:true}" class="txt" /></span>
		</li>
		<li><label for="telphone">联系电话：</label>
			<span class="bg_text"><input type="text" id="telphone" name="phone" maxLength="32" vld="{required:true}" class="txt gray" value="请输入手机号码或者固定电话" /></span>
			<span class="pos"><span class="tip warningTip">用户名为4-20位字母、数字或中文组成，字母区分大小写。</span></span>
		</li>
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
					<td><input type="radio" name="payment" checked="checked" value="1"/>在线支付</td>
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
			<dt><input type="checkbox" name="isPrint" value="1"/>需要打印发票</dt>
			<dd class="box_d bg_gray2 ofc" style="display:none">
				<ul class="uls form">
				<li><label for="">发票类型：</label><input type="radio" value="1" name="payable" checked="checked" />个人&nbsp;&nbsp;<input type="radio" value="2" name="payable" />单位</li>
				<li><label for="">发票抬头：</label><span class="bg_text"><input type="text" id="invoiceNick" name="company" maxLength="32" vld="{required:true}" class="txt" value="亚信联创科技(中国)有限公司" /></span></li>
				<li><label>发票内容：</label><select name="contents"><option value="1" selected>明细</option><option value="2">办公用品</option></select></li>
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
		<th>商品名称</th>
		<th>规格</th>
		<th>商品价格（元）</th>
		<th>数量</th>
		<th>小计（元）</th>
		</tr>                                                                                           
		</thead>
		<tbody>
		<c:forEach items="${cartList }" var="cart">
					<tr>
						<td>${cart.sku.item.itemNo }</td>
						<td class="nwp pic">
							<ul class="uls">
								<li>
									<a href="#" title="摩托罗拉ME525" class="pic"><img src="${file_path }${cart.sku.item.imgs }"  /></a>
									<dl>
										<dt><a href="#" title="摩托罗拉ME525">${cart.sku.item.itemName }</a></dt>
									</dl>
								</li>
								
							</ul>
						</td>
						<td>
							<c:forEach items="${cart.sku.specList }" var="spec">
								${spec.specValue }
							</c:forEach>
						</td>
						<td>￥${cart.sku.skuPrice }</td>
						<td>
							${cart.quantity }
						</td>
						<td>￥${cart.sku.skuPrice*cart.quantity }</td>
					</tr> 
				</c:forEach>
		<tr>
			<th colspan="6" class="alg_r">
				<b>金额总计：</b><var class="orange">￥${totalPrice }</var>
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
				<input name="orderSum" value="${totalPrice }" type="hidden">
				<dl class="total">
					
					<dt>最终订单金额：<cite>(共<var id="totalNum"><c:out value="${itemNum }"/></var>个商品)</cite></dt>
					<dd><em class="l">商品金额：</em>￥<var><fmt:formatNumber value="${totalPrice}" pattern="#0.00"/></var></dd>
					<dd><em class="l">运费：</em>￥<var><c:out value="0.00"/></var></dd>
					<dd class="orange"><em class="l">应付总额：</em>￥<var id="totalMoney"><fmt:formatNumber value="${totalPrice }" pattern="#0.00"/></var></dd>
					<dd class="alg_c"><input id="submitOrderID" type="submit" value="结 算" class="hand btn136x36a" "/></dd>
				</dl>
			</div>
		</div>
		<div class="fl"></div><div class="fr"></div>
    </div>

</div>
</form>
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