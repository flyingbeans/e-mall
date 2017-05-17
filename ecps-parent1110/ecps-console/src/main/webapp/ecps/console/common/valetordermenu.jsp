<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ include file="taglibs.jsp"%>

<h2 title="代客下单"><samp class="t03"></samp>代客下单</h2>
<ul class="ul">
<ui:permTag src="/ecps/console/valetOrder/chiefRecommd.do">
<li><a href="${base}/valetOrder/chiefRecommd.do"><samp class="t05"></samp>主推机型</a></li>
</ui:permTag>
<ui:permTag src="/ecps/console/valetOrder/guestOrder.do">
<li><a href="${base}/valetOrder/guestOrder.do"><samp class="t05"></samp>选机中心</a></li>
</ui:permTag>
<ui:permTag src="/ecps/console/order/listGuestOrder.do">
<li><a href="${base}/order/listGuestOrder.do"><samp class="t05"></samp>查询/修改订单</a></li>
</ui:permTag>
<ui:permTag src="/ecps/console/valetOrder/configRecomm.do">
<li><a href="${base}/valetOrder/configRecomm.do"><samp class="t05"></samp>主推机型配置</a></li>
</ui:permTag>
<ui:permTag src="/ecps/console/valetOrder/initConfigNote.do">
<li><a href="${base}/valetOrder/initConfigNote.do"><samp class="t05"></samp>注意事项配置</a></li>
</ui:permTag>
</ul>