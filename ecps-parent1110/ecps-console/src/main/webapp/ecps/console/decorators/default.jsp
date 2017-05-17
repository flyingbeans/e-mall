<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/ecps/console/common/meta.jsp" %>
<title><decorator:title/>_电子商城平台</title>
<link rel="stylesheet" type="text/css" media="all" href="<c:url value='/ecps/console/res/css/style.css'/>" />
<link rel="stylesheet" type="text/css" media="print" href="<c:url value='/ecps/console/res/css/print.css'/>" />
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/com.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/many_form_validator.js'/>"></script>
<script language="javascript" type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.md5.js'/>"></script>
<decorator:head/>
<c:set var="staticPublishUrlPre" value="" scope="application"/>
</head>
<script type="text/javascript">
function onfocustxt(){
	if($("#searchText").val()=="请输入商品编号或商品名称"){
		$("#searchText").val("");
		$("#searchText").removeClass("gray");
	}
}

function onblurtxt(){
	if($("#searchText").val()==""){
		$("#searchText").val("请输入商品编号或商品名称");
		$("#searchText").addClass("gray");
	}else{
		$("#searchText").removeClass("gray");
	}
}
</script>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>

<div class="header">
	<jsp:include page="/ecps/console/common/header.jsp"/>
	<c:set var="currentMenu" scope="request"><decorator:getProperty property="meta.menu"/></c:set>
	<jsp:include page="/ecps/console/common/menu.jsp"/>
</div>

<div class="main">
    <c:if test="${currentMenu == 'AdminMenu'}">
        <div class="frameL"><div class="menu icon">
           <menu:useMenuDisplayer name="Velocity" config="cssVerticalMenu.vm" permissions="rolesAdapter">
           <menu:displayMenu name="AdminMenu"/></menu:useMenuDisplayer>
        </div></div>
    </c:if>
    <%@ include file="/ecps/console/common/messages.jsp" %>
    <decorator:body/>
</div>

<jsp:include page="/ecps/console/common/footer.jsp"/>

<%-- <c:if test="${ecopMode == 'true'}">
	<div class="mainGuiZhou">
	    <c:if test="${currentMenu == 'AdminMenu'}">
	        <div class="frameL"><div class="menu icon">
	           <menu:useMenuDisplayer name="Velocity" config="cssVerticalMenu.vm" permissions="rolesAdapter">
	           <menu:displayMenu name="AdminMenu"/></menu:useMenuDisplayer>
	        </div></div>
	    </c:if>
	    <%@ include file="/ecps/console/common/messages.jsp" %>
	    <decorator:body/>
	</div>
</c:if>

<c:if test="${ecopMode == 'false'}">
	<div class="header">
		<jsp:include page="/ecps/console/common/header.jsp"/>
		<c:set var="currentMenu" scope="request"><decorator:getProperty property="meta.menu"/></c:set>
		<jsp:include page="/ecps/console/common/menu.jsp"/>
	</div>
	
	<div class="main">
	    <c:if test="${currentMenu == 'AdminMenu'}">
	        <div class="frameL"><div class="menu icon">
	           <menu:useMenuDisplayer name="Velocity" config="cssVerticalMenu.vm" permissions="rolesAdapter">
	           <menu:displayMenu name="AdminMenu"/></menu:useMenuDisplayer>
	        </div></div>
	    </c:if>
	    <%@ include file="/ecps/console/common/messages.jsp" %>
	    <decorator:body/>
	</div>
	
	<jsp:include page="/ecps/console/common/footer.jsp"/>
</c:if> --%>

<div id="addItemID" class="alt alt2" style="display:none">
    <div class="t"></div>
    <div class="c set">
        <h2 title="商品列表">商品列表</h2>
        <div id="addItemIDClose" class="o" title="关闭"></div>
        <p style="margin-top:5px"><input type="hidden" id="pageNo" name="pageNo"/><input type="hidden" id="keyword" name="keyword" />
        <label>选择分类：</label><select name="catId"  id="catId">
        	<option value="-1">请选择分类</option>
        	<!-- comments by fengxq 为了共用permList 标签所以catList 值的类型是permList-->
        	<c:forEach items= "${catList }" var="cat">
        		<option value="${cat.permId }">${cat.permName }</option>
        	</c:forEach>
        </select><br />
        <label>选择品牌：</label><select id="brandId" name="brandId">
            <option value="-1">请选择品牌</option>
            <c:forEach items="${listbrand }" var="brand">
            <option value="${brand.brandId }">${brand.brandName }</option>
            </c:forEach>
            </select><br />
         <label>价格范围：</label><input type="text" id="minPrice" name="minPrice" class="text20" size="5" />--&nbsp;&nbsp;<input type="text" id="maxPrice" name="maxPrice" class="text20" size="5" />
            <input type="text" id="searchText" onFocus="onfocustxt();" onBlur="onblurtxt();" name="searchText" value="${userSearch}" title="请输入商品编号或商品名称" class="text20 medium gray" /><input type="button" id="query" name="query" class="hand btn83x23" value="查询" />
        </p>
        <div class="h200">
            <table cellspacing="0" summary="" class="tab">
            <thead>
            <th>商品编号</th>
            <th class="wp">商品名称</th>
            <th>商品规格</th>
            <th>商城价</th>
            <th>库存</th>
            <th>操作</th>
            </thead>
            <tbody id="viewID">

            </tbody>
            </table>
        </div>
        <div id="pageID" class="page_c"></div>
        <div class="alg_c orange">提示：点击“选择”按钮后，查看页面灰色透明下是否有变化。<br />也可滑动页面滚动条查看“新增商品”。</div>
    </div>
    <div class="f"></div>
</div>

<div id="editSimCardLabels" class="alt alt2" style="display:none">
    <div class="t"></div>
    <div class="c set">
        <h2 title="修改号码标签">修改号码标签</h2>
        <div id="editSimCardLabelsClose" class="o" title="关闭"></div>
        <p style="margin-top:5px"><input type="hidden" id="lblPageNo" name="lblPageNo"/><input type="hidden" id="lblkeyword" name="lblkeyword" />
        	<label>标签名称：</label><input type="text" id="lblSearchText" name="lblSearchText" value="${userSearch}" title="请输入标签名称" class="text20 medium gray" /><input type="button" id="lblQuery" name="lblQuery" class="hand btn83x23" value="查询" />
        </p>
        <div class="h200" style="height:290px">
            <table cellspacing="0" summary="" class="tab">
	            <thead>
		            <th>标签编号</td>
					<th>标签名称</td>
					<th class="wp">标签类别</td>
					<th>状态</td>
					<th>操作</td>
	            </thead>
	            
	            <tbody id="viewlblID">
	
	            </tbody>
            </table>
        </div>
        <div id="pagelblID" class="page_c"></div>
    </div>
    <div class="f"></div>
</div>

<div id="addItemNote" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 id="addItemNoteH2" title="">修改上下架</h2>
		<div id="addItemNoteClose" class="o" title="关闭"></div>
		<p id="errorInfoAdd" class="errorTip" style="display:none"><label>&nbsp;</label></p>
		<p id="pIMSI" style="display:none"><label><font color="red"><b>*</b></font><span id="sIMSI">IMSI：</span></label><input id="inputIMSI" name="inputIMSI" type="text" ></input></p>
		<p id="pICCID" style="display:none"><label><font color="red"><b>*</b></font>ICCID：</label><input id="inputICCID" name="inputICCID" type="text" ></input><a href="###" id="getIccidLink">白卡获取ICCID</a></p>
        <p><label>操作备注：</label><textarea id="itemNote" name="suitNote" rows="4" cols="21" value="" class="gray are"></textarea></p>
		<p><label>&nbsp;</label>
		<input type="button" value="确 认" id="addItemNoteConfirm" class="hand btn83x23"/>
		<input type="button" value="取 消" id="addItemNoteReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>
<div id="addItemNote5" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="上下架">修改上下架</h2>
		<div id="addItemNoteClose5" class="o" title="关闭"></div>
		<p id="errorInfoAdd5" class="errorTip" style="display:none"><label>&nbsp;</label></p>
        <p><label>操作备注：</label><textarea id="itemNote5" name="suitNote" rows="4" cols="21" value="" class="gray are"></textarea></p>
		<p><label>&nbsp;</label>
		<input type="button" value="确 认" id="addItemNoteConfirm5" class="hand btn83x23"/>
		<input type="button" value="取 消" id="addItemNoteReset5" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="deliverycall" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="配送">配送</h2>
		<div id="deliverycallClose" class="o" title="关闭"></div>
 		<p id="errorInfoAdd1" class="errorTip" style="display:none"><label>&nbsp;</label></p> 
        <p><textarea id="itemNote1" name="suitNote" rows="4" cols="35" value="" class="gray are"></textarea></p>
		<p>
		<input name="r" type="button" class="hand btn83x23 sub3" value="配送成功"/>
		<input name="r" type="button" class="hand btn83x23 sub3" value="配送失败" id="faultdis"/>
		<input name="r" type="button" class="hand btn83x23 sub3" value="推迟外呼"/></p>
	</div>
	<div class="f"></div>
</div>
<div id="jobNums" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="手动开通">手动开通</h2>
		<div id="jobNumClose" class="o" title="关闭"></div>
 		<p id="jobNum1" class="errorTip" style="display:none"><label>&nbsp;</label></p> 
 		<p><label><font color="red"><b>*</b></font>工单号：</label><input id="jobNum" name="jobNum" type="text"></input></p>
        <p><label>备注：</label><textarea id="jobNote" name="jobNote" rows="4" cols="21" value="" class="gray are"></textarea></p>
		<p><label>&nbsp;</label>
		<input name="r" type="button" class="hand btn83x23 sub3" value="手动开通"/>
		<input type="button" value="取 消" onclick="tipHide('#jobNums')" class="hand btn83x23b" />
		</p>
	</div>
	<div class="f"></div>
</div>

<div id="confirm" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div id="confirmClose" class="o" title="关闭"></div>
		<p class="alg_c">操作确认?</p>
		<p class="alg_c"><input type="button" id="confirmOk" onclick="d('dd');" value="确 定" class="hand btn83x23" /><input type="button" value="取 消" id="confirmReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="tipDiv" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
	<h2 id="tipDivH2" title="系统提示">系统提示</h2>
	<div id="tipDivClose" onclick="tipHide('#tipDiv')" class="o" title="关闭"></div>
	<p id="tipText" class="alg_c"></p>
	<p id="showButton" class="alg_r">
	<input id="tipDivOk" type="submit" value="确 认" onclick="tipHide('#tipDiv')" class="hand btn83x23" /></p>
	</div>
	<div class="f"></div>
</div>
<div id="confirmDiv" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div onclick="tipHide('#confirmDiv')" class="o" title="关闭"></div>
		<p id="confirmText" class="alg_c">操作确认?</p>
		<p class="alg_c"><input type="button" id="confirmDivOk" onclick="" value="确 定" class="hand btn83x23" /><input type="button" value="取 消" id="confirmReset" onclick="tipHide('#confirmDiv')" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="spqdDiv" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
	<h2 title="包装清单">包装清单</h2>
	<div onclick="tipHide('#spqdDiv')" class="o" title="关闭"></div>
	<p id="spqd" class="alg_c h200"></p>
	<p id="showButton" class="alg_c">
<!--  	<input type="submit" value="确 认" onclick="tipHide('#spqdDiv')" class="hand btn83x23" /> -->
 	</p> 
  </div>
	<div class="f"></div>
</div>
<div id="queryDiv" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
	<h2 title="CRM">CRM</h2>
	<div onclick="tipHide('#queryDiv')" class="o" title="关闭"></div>
	<p id="query11" class="alg_c h200"></p>
	<p id="showButton" class="alg_c">
	 		<input  type="button" class="hand btn83x23 "  id="but1" value="确定"/> 
	</p> 
  </div>
	<div class="f"></div>
</div>
<div id="queryDiv1" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
	<h2 title="串号查询">串号查询</h2>
	<div onclick="tipHide('#queryDiv1')" class="o" title="关闭"></div>
	<p id="query111" class="alg_c h200"></p>
	<p id="showButton" class="alg_c">
	 		<input name="r" type="button" class="hand btn83x23 sub2" id="but5" onclick="confirm1(this.value);" value="备货完成"/>  
	</p> 
  </div>
	<div class="f"></div>
</div>
<div id="staticLoadDiv" style="display:none">

	<img src="<c:url value='/ecps/console/res/imgs/loading.gif'/>" />发布中... ...
</div>

<div id="targetTip" class="alt2 alt" style="display:none">
  	<div class="t"></div>
	<div class="c set">
		<h2 title="选择广告位">选择广告位</h2>
		<div onclick="tipHide('#targetTip')" id="targetTipClose" class="o" title="关闭"></div>
		<div id="adSiteList" class="h270">
			<table cellspacing="0" summary="" class="tab">
				<tr>
					<th></th>
					<th class="wp">广告位名称</th>
					<th>尺寸</th>
				</tr>
				<c:forEach items='${location}' var="location">
				<tr class="siteTr">
					<td><input type="checkbox" name="site"  class="siteId"  value="${location.locationId}" /></td>
					<td class="nwp">${location.locationName}</td>
					<td class="advertisementsize">${location.locationWidth}*${location.locationHigh}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	<p class="alg_c orange" id="adSiteListMisTip"></p>
	<p class="alg_c"><input type="button" value="确 认" id="targetTipC" class="hand btn83x23" />&nbsp;&nbsp;<input type="button" value="取 消" id="targetTipReset" onclick="tipHide('#targetTip')"class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>
<div id="linkMsg" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div onclick="tipHide('#linkMsg');" class="o" title="关闭"></div>
		<span id="linkMsgtest">
		</span>
		<p id="showButton" class="alg_r"><input type="submit" value="确 认" onclick="tipHide('#linkMsg');" class="hand btn83x23" /></p>
	</div>
	<div class="f"></div>
</div>
<div id="description" class="alt" style="display:none">
	<div class="t"></div>
	<div class="c set">
	<h2 title="调用代码">调用代码</h2>
	  <p class="alg_c"><textarea  id="txt" rows="4" cols="46"  class="gray are"></textarea></p> 
	<div id="descriptionClose" class="o" onclick="tipHide('#description');" title="关闭"></div>
	<p id="setSuccess" class="orange alg_c" style="display:none">已成功复制到剪贴板</p>
	<p class="alg_r"><input type="button"  value="复制代码" onclick="setTxt();" class="hand btn83x23" /></p>

	</div>
	<div class="f"></div>   
</div>
<div id="tip" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div id="${id}Close" class="o" title="关闭" onclick="tipHide('#tip');"></div>
		<p class="alg_c msg"></p>
		<p class="alg_r"><input type="button" id="Ok2" value="确 定" onclick="tipHide('#tip');" class="hand btn83x23" /></p>
	</div>
	<div class="f"></div>
</div>

<!-- 删除单个广告位-->
<div id="singleFail" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div  onclick="tipHide('#singleFail');" class="o" title="关闭"></div>

		<p class="alg_c">
			删除广告位中【<span id="sadName"></span>】有关联广告，删除后广告与广告位的关联性将取消，您是否确认此操作？
		</p>
		<p class="alg_r">
		<input type="button" id="DeleteRolesButton" value="确 定" onclick="sdel()" class="hand btn83x23" /><input type="button" value="取 消" onclick="tipHide('#singleFail');" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>
<!-- 删除多个广告位-->
<div id="batFail" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div  onclick="tipHide('#batFail');" class="o" title="关闭"></div>
		<p class="alg_c">
			删除广告位中【<span id="adName"></span>】有关联广告，删除后广告与广告位的关联性将取消，您是否确认此操作？
		</p>
		<p class="alg_r">
		<input type="button" id="DeleteRolesButton" value="确 定" onclick="del()" class="hand btn83x23" /><input type="button" value="取 消" onclick="tipHide('#batFail');" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<!-- 支付管理，冲正、撤销、退款 -->
<div id="payRecordMemoDiv" class="alt" style="display:none">
	<div class="t"></div>
	<div class="c set">
		<div id="payRecordMemoClose" class="o" title="关闭"></div>
		<ul class="uls">
			<p id="payRecordMemoDivErr" class="errorTip" style="display:none"><label>&nbsp;</label></p>
			<li><label class="alg_t"><span class="red">*</span>备注：</label><textarea id="payRecordMemo" rows="7" cols="30"></textarea></li>
			<li style=" text-align:center;">
				<input type="button" id="payRecordMemoOk" value="确 定" class="hand btn83x23" />
			</li>
		</ul>
	</div>
	<div class="f"></div>
</div>

<div id="refundLoadDiv" class="alt" style="display:none">
	<div class="t"></div>
	<div class="c set">
		<ul class="uls">
			<li style="text-align:center;">
				<img src="<c:url value='/ecps/console/res/imgs/loading.gif'/>" />操作请求中... ...
			</li>
		</ul>
	</div>
	<div class="f"></div>
</div>
<div id="showMemoDiv" class="alt" style="display:none">
	<div class="t"></div>
	<div class="c set">
		<div id="showMemoClose" class="o" title="关闭"></div>
		<ul class="uls">
			<li><label class="alg_t">备注详细信息:</label><br>
			<textarea id="showMemoText" rows="7" cols="50" readonly="readonly"></textarea></li>
			<li style=" text-align:center;">
				<input type="button" id="showMemoOk" value="确 定" class="hand btn83x23" />
			</li>
		</ul>
	</div>
	<div class="f"></div>
</div>

<!-- 弹出促销规格层------------------------------------------------------------------------- -->
<div id="addSaleSku" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="编辑促销规格">促销规格</h2>
		<div id="addSaleSkuClose" class="o" title="关闭"></div>
		<p id="errorInfoSaleSku" class="errorTip" style="display:none"><label>&nbsp;</label></p>
        <p><label>促销规格：</label>
        <textarea id="saleSku" name="saleSku" rows="4" cols="22" value="" class="gray are"></textarea></p>
		<p><span class="orange"><label>&nbsp;</label>0到3个22个字符内的规格值，其间请以英文','分隔</span></p>
		<p><label>&nbsp;</label>
		<input type="button" value="确 认" id="addSaleSkuConfirm" class="hand btn83x23"/>
		<input type="button" value="取 消" id="addSaleSkuReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="confirmSaleSku" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div id="confirmClose" class="o" title="关闭"></div>
		<p class="alg_c">操作确认?</p>
		<p class="alg_c"><input type="button" id="confirmSaleSku" onclick="" value="确 定" class="hand btn83x23" /><input type="button" value="取 消" id="confirmReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="cardlblDiv" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
	<h2 title="号卡标签">号卡标签</h2>
	<div onclick="tipHide('#cardlblDiv')" class="o" title="关闭"></div>
	<p id="cardlbl" class="alg_c h200"></p>
	<p id="showButton" class="alg_c">
<!--  	<input type="submit" value="确 认" onclick="tipHide('#spqdDiv')" class="hand btn83x23" /> -->
 	</p> 
  </div>
	<div class="f"></div>
</div>

<div id="returnNoteDiv" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 id="returnNoteH2" title="系统提示">系统提示</h2>
		<div id="returnNoteClose" class="o" title="关闭"></div>
		<p id="returnNoteAdd" class="errorTip" style="display:none"><label>&nbsp;</label></p>
		<form id="attachFileForm" method="post">
		<p id="attachFileAttention"><label></label><span id="attachFileAttentionSpan" style="color:red">请上传小于5mb的文件</span></p>
		<p id="attachFileDisplay" style="display: none"><label>&nbsp;</label><span id="attachFileDisplayName"></span>&nbsp;<a href="###" id="attachFileDelete">删除</a></p>
		<p id="attachFileField"><label>质检报告：</label><input type="file" class="file" id="attachFile" name="attachFile"/></p>
		</form>
		<p id="pJobNum" style="display: none"><label><font style="color:red;"><b>*</b></font>工单号：</label><input type="text" id="iJobNum" name="iJobNum" value="" ></input></p>
        <p><label>操作备注：</label><textarea id="returnNote" name="returnNote" rows="4" cols="21" value="" class="gray are"></textarea></p>
		<p><label>&nbsp;</label>
		<input type="button" value="确 认" id="returnNoteConfirm" class="hand btn83x23"/>
		<input type="button" value="取 消" id="returnNoteReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="importLoadDiv" class="alt" style="display:none">
	<div class="t"></div>
	<div class="c set">
		<ul class="uls">
			<li style="text-align:center;">
				<img src="<c:url value='/ecps/console/res/imgs/loading.gif'/>" />可能需要花费几分钟时间，请耐心等待... ...
			</li>
		</ul>
	</div>
	<div class="f"></div>
</div>

<div id="importResultDiv" class="alt" style="display:none">
	<div class="t"></div>
	<div class="c set">
		<h2 id="importResultTitle" title="系统提示"></h2>
		<div id="importResultClose" class="o" title="关闭"></div>
		<ul class="uls">
			<p id="importResultText" class="alg_c">
			</p>
			<li style=" text-align:center;">
				<input type="button" id="importResultOk" value="确 定" class="hand btn83x23" />
			</li>
		</ul>
	</div>
	<div class="f"></div>
</div>

<!-- 导入号卡提示 -->
<div id="importSimcardTip" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="系统提示">系统提示</h2>
		<div id="importSimcardTipClose" class="o" title="关闭" onclick="tipHide('#importSimcardTip');"></div>
		<p class="alg_c msg">
			<label>请选择地市: </label>
			<select id="areaCodeId" name="areaCodeId">
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=851">
					<option value="851">贵阳</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=854">
					<option value="854">都匀</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=857">
					<option value="857">毕节</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=858">
					<option value="858">六盘水</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=855">
					<option value="855">凯里</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=852">
					<option value="852">遵义</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=859">
					<option value="859">兴义</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=856">
					<option value="856">铜仁</option>
				</ui:permTag>
				<ui:permTag src="/${system}/simcard/importSimcard.do?areaCode=853">
					<option value="853">安顺</option>
				</ui:permTag>
			</select>
		</p>
		<p class="alg_r"><input type="button" id="importSimcardTipOk" value="确 定" onclick="tipHide('#importSimcardTip');" class="hand btn83x23" /></p>
	</div>
	<div class="f"></div>
</div>
<div id="recommItemConfig" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="主推机型">配置主推机型</h2>
		<div id="recommItemConfigClose" class="o" title="关闭"></div>
		<p id="errorInfoConfig" class="errorTip" style="display:none"><label>&nbsp;</label>
		</p>
		 <p><label>排序：</label>
		 <input type="hidden" name="itemId" id="itemId">
        <input type="text" id="expanParam1" name="expanParam1" /></p>
        <p><label>机型亮点：</label>
        <textarea id="itemHighlight" name="itemHighlight" rows="3" cols="31" value="" class="gray are"></textarea></p>
		<p>
		<label>合约亮点：</label>
        <textarea id="contrHighl" name="contrHighl" rows="3" cols="31" value="" class="gray are"></textarea></p>
		<p>
		
		<p><label>&nbsp;</label>
		<input type="button" value="确 认" id="recommItemConfigConfirm" class="hand btn83x23"/>
		<input type="button" value="取 消" id="recommItemConfigReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

<div id="queryOfferProduct" class="alt alt2" style="display:none">
    <div class="t"></div>
    <div class="c set">
        <h2 title="产品列表">产品列表</h2>
        <div id="queryOfferProductClose" class="o" title="关闭"></div>
        <p style="margin-top:5px"><input type="hidden" id="pageNo" name="pageNo"/><input type="hidden" id="keyword" name="keyword" />
		 产品名称：
        <input type="text" id="productName" name="productName" class="text20" size="20" />
		 规格编码：
        <input type="text" id="resCode" name="productName" class="text20" size="20" />
        <input type="button" id="queryOfferProductQuery" class="hand btn83x23" value="查询" />
        </p>
        <div class="h200">
            <table cellspacing="0" summary="" class="tab">
            <thead>
            <th>产品编号</th>
            <th class="wp">产品名称</th>
            <th>产品规格</th>
            <th>操作</th>
            </thead>
            <tbody id="queryOfferProductTable">

            </tbody>
            </table>
        </div>
        <div id="pageID" class="page_c"></div>
        <div class="alg_c orange">提示：点击“选择”按钮后，查看页面灰色透明下是否有变化。<br />也可滑动页面滚动条查看“产品编码”。</div>
    </div>
    <div class="f"></div>
</div>

<div id="modifyItemConfig" class="alt" style="display:none">
  <div class="t"></div>
	<div class="c set">
		<h2 title="主推机型">修改主推机型</h2>
		<div id="modifyItemConfigClose" class="o" title="关闭"></div>
		<p id="errorInfoModify" class="errorTip" style="display:none"><label>&nbsp;</label>
		</p>
		<label>操作备注：</label>
        <textarea id="expanParam2" name="expanParam2" rows="3" cols="31" value="" class="gray are"></textarea></p>
		<p>
		
		<p><label>&nbsp;</label>
		<input type="hidden" name="modifyItemConfigItemId" id="modifyItemConfigItemId">
		<input type="button" value="确 认" id="modifyItemConfigConfirm" class="hand btn83x23"/>
		<input type="button" value="取 消" id="modifyItemConfigReset" class="hand btn83x23b" /></p>
	</div>
	<div class="f"></div>
</div>

</body>
</html>
