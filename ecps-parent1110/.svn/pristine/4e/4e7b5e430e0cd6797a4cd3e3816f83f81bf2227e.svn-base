<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>关联列表_广告位管理_广告管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="AdvertisementMenu"/>
<script language="javascript" type="text/javascript">
function orderBy(){
	if($("#orderBy").val()=='1'){
		$("#orderBy").val('0');
	} else {
		$("#orderBy").val('1');
	}
	var tableForm = document.getElementById('myForm');
	tableForm.action="${base}/adlocal/adListLink.do";
	tableForm.onsubmit=null;
	tableForm.submit();
}
function changePic(status1,url,status) {
	$("#linkStatus").attr('src', '${base}/images/loader.gif');
	$.ajax({
		type:'post',
		url : url,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType : 'json',
		success : function(data) {
			if (data[0].result=='error') {
			} 
			else{
				window.location.href="${base}/adlocal/adListLink.do?localId="+${locationId}+"&pageNo="+${pagination.pageNo};
			}
		}
	});
}
function gotoPage(pageNo){
    if(pageNo!='jump'){
        $("#pageNo").val(pageNo);
    }else{
        var jumppage=$("#pageNo").val();
        var reg = new RegExp("^[1-9][0-9]{0,3}$");
        if(!reg.test(jumppage)){
            alert("请输入数字1~9999内的数字");
            $("#pageNo").val("");
            return;
        }
        var totalPage=<c:out value="${pagination.totalPage}"/>;
        if(jumppage>totalPage){
            $("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
        }
    }
    $("#myForm").submit();
}
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/advertisementmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<!--这里是body -->
	<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：广告位管理&nbsp;&raquo;&nbsp;
	<span class="gray" title="${localName}">${localName}</span>
	<a title="返回广告位" class="inb btn80x20" href="${base}/adlocal/adlocal.do">返回广告位</a></div>
<form id="myForm" name="myForm" action="${base}/adlocal/adListLink.do" method="post">

    <table cellspacing="0" summary="" class="tab">
		<thead>
			<th class="wp">广告名称</th>
			<th>类型</th>
			<th>显示</th>
			<th><a href="javascript:orderBy();" title="创建时间" class="icon">创建时间<samp class="inb t14"></samp></a></th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="advertisement">
			<tr>
				<td title="${advertisement.adName}"><c:out value='${advertisement.adName}'/></td>
				<td>
					<c:choose>  
		 				<c:when test="${advertisement.adType == 1}">图片</c:when>
		 				<c:when test="${advertisement.adType == 0}">文字</c:when> 
		 				<c:when test="${advertisement.adType == 2}">flash</c:when> 
		 				<c:when test="${advertisement.adType == 3}">轮播图片</c:when>   
					</c:choose>
				</td>
				<td>
					<c:choose>  
		 				<c:when test="${advertisement.linkStatus==0}">
		 					<ui:permTag src="/${system}/adlocal/changeLink.do">
		 						<a href="javascript:void(0);" onclick="changePic('${advertisement.status}','${base}/adlocal/changeLink.do?adId=${advertisement.adId}&localId=${locationId}&status=1',1)" title="点击显示">
		 					</ui:permTag>		 					
								<img  id="linkStatus" style="border:medium none;" src="<c:url value='/ecps/console/images/no.gif'/>"/>
							<ui:permTag src="/${system}/adlocal/changeLink.do">
								</a>
							</ui:permTag>
							</c:when>
		 				<c:when test="${advertisement.linkStatus==1}">
		 					<ui:permTag src="/${system}/adlocal/changeLink.do">
		 						<a href="javascript:void(0);" onclick="changePic('${advertisement.status}','${base}/adlocal/changeLink.do?adId=${advertisement.adId}&localId=${locationId}&status=0',0)" title="点击取消显示">
		 					</ui:permTag>			 				
								<img id="linkStatus" style="border:medium none;" src="<c:url value='/ecps/console/images/yes.gif'/>"/>							
							<ui:permTag src="/${system}/adlocal/changeLink.do">
								</a>
							</ui:permTag>
							</c:when>  
						</c:choose>
				</td>
				<td><var><fmt:formatDate value="${advertisement.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></var></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="page_c">
        <span class="r page inb_a">
	<input type="hidden" value="${orderBy}"  id="orderBy"  name="orderBy" />
	<input type="hidden" value="${orderById}"  id="orderById"  name="orderById" />
            共 <var class="red">${pagination.totalCount}</var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="javascript:gotoPage('${pagination.prePage}');"  title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="javascript:gotoPage('${pagination.nextPage}');"  title="下一页"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
        </span>
    </div>
	<input type="hidden" name="localId" id="localId" value="${locationId}"></input> 
</form>
</div></div>
</body>

