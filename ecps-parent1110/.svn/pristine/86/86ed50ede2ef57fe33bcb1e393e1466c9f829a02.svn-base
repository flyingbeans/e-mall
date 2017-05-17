<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
    <title>商品录入及上下架</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
      <script language="javascript" type="text/javascript">
$(function(){
	var tObj;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
			tObj = $(this);
			
		});
	});
	
});
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
	<jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>
    <fmt:message key='menu.current.loc'/>:<fmt:message key='ItemMgmtMenu.title'/>&gt商品录入及上下架</div>

 <h2 class="h2_ch"><span id="tabs" class="l"><a href="javascript:void(0);" ref="#tab_1" title="全部" class="here">全部</a>
 <a href="javascript:void(0);" ref="#tab_2" title="实体商品" class="nor">实体商品</a>
 <a href="javascript:void(0);" ref="#tab_3" title="营销案" class="nor">营销案</a>
 <a href="javascript:void(0);" ref="#tab_4" title="号卡" class="nor">号卡</a>
 </span></h2>

<div id="tab_1" style="display:none"></div>
<div id="tab_2">

    <form id="form1" name="form1" action="${path}/log/login/listBackLandLog.do" method="post">

    <div class="sch">
        <p><fmt:message key="tag.search"/><select id="selTime" name="selTime">
	    	<option value="0" <c:if test='${selTime==0}'>selected</c:if>>请选择时间段</option>
	    </select>
	    <input type="submit" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
        </p>
    </div>

    <div class="page_c">
        <span class="l">
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.audit"/>" class="hand btn60x20" />
        </span>
        <span class="r inb_a">
            <a href="${path}/item/addCatItem.do"  class="btn80x20"><fmt:message key="tag.add"/></a>
        </span>
    </div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="<fmt:message key="tag.selected.allORcancel"/>" /></th>
			<th class="wp"><fmt:message key='menu.rightItem.itemName'/></th>
			<th class="wp"><fmt:message key='menu.rightItem.itemNo'/></th>
			<th><fmt:message key='menu.rightItem.cat'/></th>
			<th><fmt:message key='menu.rightItem.price'/></th>
			<th><fmt:message key='menu.rightItem.show1'/></th>
			<th><fmt:message key='menu.rightItem.feature1'/></th>
			<th><fmt:message key='menu.rightItem.feature2'/></th>
			<th><fmt:message key='menu.rightItem.feature3'/></th>
			<th><fmt:message key='menu.rightItem.stock'/></th>
			<th><fmt:message key='tag.column.operation'/></th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="backlandlog">
			<tr>
				<td><input type="checkbox" name="ids" value="${backlandlog.logId}"/></td>
				<td class="nwp"><c:out value='${backlandlog.logUserName}'/></td>
				<td><fmt:formatDate value="${backlandlog.logTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:out value='${backlandlog.logIpAddress}'/></td>
				<td>
					<c:url value="/log/login/deleteBackLandLogById.do" var="deleteBackLandLogById">
						<c:param name="id" value="${backlandlog.logId}"/>
					</c:url>
					<a href="#" onclick="singleDel('${deleteBackLandLogById}')">删除</a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="7" align="right">
                <fmt:message key='tag.select'/>：<a href="#" title="<fmt:message key='tag.selected.all'/>" onclick="checkAllIds();"><fmt:message key='tag.selected.all'/></a> 
                <samp>-</samp> <a href="#" title="<fmt:message key='tag.selected.cancel'/>" onclick="uncheckAllIds();"><fmt:message key='tag.selected.cancel'/></a>
				</td>
			</tr>
		</tbody>
	</table>

    <div class="page_c">
        <span class="l inb_a">
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.audit"/>" class="hand btn60x20" />
        </span>
        <span class="r page inb_a">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><fmt:message key="tag.page.previous"/></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="#" onclick="gotoPage('${pagination.prePage}')"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><fmt:message key="tag.page.next"/></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="#" onclick="gotoPage('${pagination.nextPage}')"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>

    </form>
    </div>
    <div id="tab_3" style="display:none"></div>
    <div id="tab_4" style="display:none"></div>
    
</div></div>
</body>

