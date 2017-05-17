<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="taglibs.jsp"%>
<select id="selTime" name="selTime">
<option value="0" selected>请选择下单时间</option>
<option value="1">自定义时间</option>
<option value="2">当天</option>
<option value="3">近一周</option>
<option value="4">近一月</option>
<option value="5">下单超2小时</option>
</select><span id="selTimeTo" style="display: none">
<input type="text" id="begin" name="begin" onfocus="WdatePicker({alwaysUseStartDate:true,dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'end\')}'})" value="${begin}" class="text20 gray date" size="22" />至&nbsp;<input type="text" id="end" name="end" onfocus="WdatePicker({alwaysUseStartDate:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'begin\')}'})" value="${end}" class="text20 gray date" size="22" /></span>
<select id="areaName" name="areaName">
	<option value="" selected>请选择归属地</option>
	<option value="沈阳">沈阳</option>
	<option value="大连">大连</option>
	<option value="鞍山">鞍山</option>
	<option value="抚顺">抚顺</option>
	<option value="本溪">本溪</option>
	<option value="丹东">丹东</option>
	<option value="锦州">锦州</option>
	<option value="营口">营口</option>
	<option value="阜新">阜新</option>
	<option value="辽阳">辽阳</option>
	<option value="朝阳">朝阳</option>
	<option value="盘锦">盘锦</option>
	<option value="葫芦岛">葫芦岛</option>
	<option value="铁岭">铁岭</option>
</select><input type="text" id="orderNo" name="orderNo" title="请输入订单号" class="text20 medium gray" value="${orderNo}" /><input type="text" id="phone" name="phone" title="请输入联系电话" class="text20 medium gray" value="${phone}" /><input type="button" class="hand btn60x20 sub1" value="<fmt:message key="tag.search"/>" /><!-- <input type="reset" class="hand btn60x20" value="重置" /> -->&nbsp;&nbsp;<a id="highSearchButton" href="javascript:void(0);" onclick="highSearch()">高级搜索</a>
</p>
<div id="highSearch" style="display:none;">
<p class="mt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="payment" name="payment">
<option value="" selected>请选择支付方式</option>
<option value="1">在线支付</option>
<option value="2">货到付款</option>
<!-- <option value="3">营业点自提</option> -->
</select><select id="isPaid" name="isPaid">
<option value="" selected>请选择支付状态</option>
<option value="0">未付款</option>
<option value="1">已付款</option>
<option value="2">待退款</option>
<option value="3">退款成功</option>
<option value="4">退款失败</option>
<option value="7">关闭</option>
</select><input type="text" id="userName" name="userName" title="请输入下单用户" value="<c:out value="${userName}"/>" class="text20 medium gray" />
<input type="text" id="shipName" name="shipName" title="请输入收货人" value="<c:out value="${shipName}"/>" class="text20 medium gray" />
</p>
</div>
<input type="hidden" id="orderState" name="orderState" value="${orderState}" />
<input type="hidden" id="payment1" name="payment1" value="${payment}" />
<input type="hidden" id="isPaid1" name="isPaid1" value="${isPaid}" />
<input type="hidden" id="userName1" name="userName1" value="${userName}"/>
<input type="hidden" id="shipName1" name="shipName1" value="${shipName}"/>
<input type="hidden" id="userId" name="userId" value="${userId}" />
<input type="hidden" id="selTime1" name="selTime1" value="${selTime}" />
<input type="hidden" id="areaName1" name="areaName1" value="${areaName}" />

