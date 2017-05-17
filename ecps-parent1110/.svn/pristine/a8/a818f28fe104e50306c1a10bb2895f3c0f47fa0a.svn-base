<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>静态化_系统配置</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
    <script type="text/javascript">
		$(document).ready(function() {
	    	<c:if test="${message!=null }">
				alert('<c:out value="${message }"/>');
			</c:if>
	    });
		function publishAll(){
			document.getElementById("publishBtn").style.display="none";
			document.getElementById("publishImg").style.display="block";
	    	var ajaxData="";
	    	$.ajax({
	        	type:"post",
	         	url:"${staticPublishUrlPre}/static4ebiz/static/publishAll.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	             		document.getElementById("publishBtn").style.display="block";
						document.getElementById("publishImg").style.display="none";
	             		alert("全量发布成功");
	             		window.location.href=window.location.href.replace("#","");
	             	}else{
	             		document.getElementById("publishBtn").style.display="block";
						document.getElementById("publishImg").style.display="none";
	             		alert(result._mes);
	             	}
	        	}
	        });
	    }
		
		function publishHome(){
			tipShow('#staticLoadDiv');
	    	var ajaxData="";
	        $.ajax({
	        	type:"post",
	         	url:"${staticPublishUrlPre}/static4ebiz/static/publishHome.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	             		tipHide('#staticLoadDiv');
	             		alert("首页发布成功");
	             	}else{
	             		tipHide('#staticLoadDiv');
	             		alert(result._mes);
	             	}
	        	}
	        });
	    }
		
		function publishOther(otherId){
	    	tipShow('#staticLoadDiv');
	    	var ajaxData="otherId="+otherId;
	        $.ajax({
	        	type:"post",
	         	url:"${staticPublishUrlPre}/static4ebiz/static/publishSingleOther.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	             		tipHide('#staticLoadDiv');
	             		alert("发布成功");
	             		/* window.location.href=window.location.href; */
	             		window.location.href=window.location.href.replace("#","");
	             	}else{
	             		tipHide('#staticLoadDiv');
	             		alert(result._mes);
	             	}
	        	}
	     });
		}
	</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/ecps/console/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="静态化">静态化</span>
    <c:url value="/${system}/system/site/site_edit.do" var="showsiteconfig">
        <c:param name="url" value="system/editsiteconfig"/>
    </c:url>
    </div>
	<div class="edit set">
		<p id="publishBtn" style="display:block">
			<ui:permTag src="/${system}/static4ebiz/static/publishAll.do">
			<input type="button" href="#" onclick="publishAll()" value="全量发布" class="btn60x20" />
			</ui:permTag>
		</p>
		<p id="publishImg" style="display:none">全量发布<img src="<c:url value='/ecps/console/res/imgs/loading.gif'/>"/>发布中... ...</p>
		<p>
			<ui:permTag src="/${system}/static4ebiz/static/publishAll.do">
			<input type="button" href="#" onclick="publishHome()" value="首页发布" class="btn60x20" /><span ><font color="#FF9900"">如想变更首页及频道页版位上的商品信息，请到内容维护模块进行对应版位发布。</font><span>
			</ui:permTag>
		</p>
		<br>
		<table class="tab">
			<thead>
				<th>SERIAL_NO</th>
				<th>SUIT_ID</th>
				<th>TPL_ID</th>
				<th>PAGE_ID</th>
				<th>PAGE_NAME</th>
				<th>说明</th>
				<th>最后发布时间</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach items='${deployOtherList}' var="obj">
					<tr>
						<td>${obj['SERIAL_NO']}</td>
						<td>${obj['SUIT_ID']}</td>
						<td>${obj['TPL_ID']}</td>
						<td>${obj['PAGE_ID']}</td>
						<td>${obj['PAGE_NAME']}</td>
						<td>${obj['HTML_PAGE_NAME']}</td>
						<td>
						<c:choose>
							<c:when test="${obj['PS_LASTPUBLISHSTARTTIME']==null }">
								<font color="#ff0000">尚未发布</font>
							</c:when>
							<c:otherwise>
								<font color="#009900"><c:out value="${obj['PS_LASTPUBLISHSTARTTIME']}"></c:out>
								</font>
							</c:otherwise>
						</c:choose>
						</td>
						<td>
							<ui:permTag src="/${system}/static4ebiz/static/publishAll.do">
							<a href="#" onclick="publishOther(${obj['PAGE_ID']})">发布</a>
							</ui:permTag>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="loc">&nbsp;</div>

</div></div>
</body>
 