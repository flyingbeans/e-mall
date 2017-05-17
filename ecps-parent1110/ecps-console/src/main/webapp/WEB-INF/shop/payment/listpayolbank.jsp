<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title><c:out value="${paymentOrg.poName}"></c:out>支持网银列表_支付机构管理_支付管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript">
	function deletePayOlbank(olbankId){
		// 启用状态
		if($("#isShow"+olbankId).val()==1){
			alert("网银处于启用状态，请将其状态置为待选后再做删除。");
			return;
		}
		if(!confirm("删除网银后将无法恢复，您是否确认此操作？")){
			return;
		}
		$("#olbankId").val(olbankId);
		$("#form1").attr("action",$("#deleteUrl").val());
		$("#form1").submit();
	}
	function editPayOlbank(olbankId){
		
	}
	function emptyKeyWord(){
		$("#keyWordText").val("");
		$("#keyWordText").attr("class","text20 medium");
	}
	function checkKeyWord(){
		if($("#keyWordText").val()==""){
			$("#keyWordText").val("请输入网银名称");
			$("#keyWordText").attr("class","text20 medium gray");
			$("#keyWordText").click(function(){
				emptyKeyWord()
			});
		}else{
			$("#keyWordText").unbind("click");
		}
	}
	$(function(){
		pageInitialize('#form1','#keyWord');
		<c:if test="${keyWord==''}">
			$("#keyWordText").click(function(){
				emptyKeyWord()
			});
		</c:if>
		$("#keyWordText").blur(function(){
			checkKeyWord()
		});
		$("#form1").submit(function(){
			if($("#keyWordText").val()!="请输入网银名称"){
				$("#keyWord").val($("#keyWordText").val());
			}else{
				$("#keyWord").val("");
			}
		});
	});
</script>
</head>
<body id="main">

	<div class="frameL"><div class="menu icon">
	    <jsp:include page="/${system }/common/paymentmenu.jsp"/>
	</div></div>
	<div class="frameR"><div class="content">
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<a href="<c:url value='/${system}/payment/listPaymentOrg.do'/>">支付机构管理</a>&nbsp;&raquo;&nbsp;<span class="gray"><c:out value="${paymentOrg.poName}"></c:out>支持网银列表</span>
	    </div>
		
	    <form id="form1" name="form1" action="${base}/payment/listPayOlbank.do" method="post">
	    	<input type="hidden" id="deleteUrl" value="${base}/payment/deletePayOlbank.do"/>
	    	<input type="hidden" id="poId" name="poId" value="${paymentOrg.poId}"/>
	    	<input type="hidden" id="olbankId" name="olbankId"/>
	    
			<div class="sch">
		        <p><fmt:message key="tag.search"/>：
	        	<input type="hidden" id="keyWord" name="keyWord" value="${keyWord}" />
		        <c:choose>
		        	<c:when test="${keyWord!=''}">
				        <input type="text" id="keyWordText" value="${keyWord}" class="text20 medium" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search" />" /></p>
		        	</c:when>
		        	<c:otherwise>
			        	<input type="text" id="keyWordText" value="请输入网银名称" title="请输入网银名称" class="text20 medium gray"/><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search" />" /></p>
		        	</c:otherwise>
		        </c:choose>
		    </div>
	    
			<div class="page_c">
		        <span class="r inb_a">
		            <a href="${base}/payment/addPayOlbank.do?poId=${paymentOrg.poId}" class="btn80x20" title="新增网银">新增网银</a>
		        </span>
		    </div>
		    
			<table cellspacing="0" summary="" class="tab">
				<thead>
				    <th>网银名称</th>
					<th>网银代码</th>
					<th>状态</th>
					<th class="wp">支付说明</th>
		            <th>操作</th>
				</thead>
				<tbody>
					<c:forEach items="${pagination.list}" var="payOlbank">
						<tr>
							<td><c:out value="${payOlbank.olbankName}"></c:out></td>
							<td><c:out value="${payOlbank.olbankCode}"></c:out><input type="hidden" id="isShow${payOlbank.olbankId}" value="${payOlbank.isShow}"/></td>
							<c:choose>
								<c:when test="${payOlbank.isShow==1}">
									<td>启用</td>
								</c:when>
								<c:otherwise>
									<td>待选</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<%-- 描述类型为文本 --%>
								<c:when test="${payOlbank.olbankDescType==1}">
									<td class="nwp"><c:out value="${payOlbank.olbankDesc}" default="---"></c:out></td>
								</c:when>
								<%-- 描述类型为文本 --%>
								<c:when test="${payOlbank.olbankDescType==2}">
									<td class="nwp"><c:out value="${payOlbank.olbankDesc}" default="---"></c:out></td>
								</c:when>
								<%-- 描述类型为其他时，直接输出横线 --%>
								<c:otherwise>
									<td class="nwp">---</td>
								</c:otherwise>
							</c:choose>
							<td><a href="javascript:void(0);" onclick="deletePayOlbank(${payOlbank.olbankId})">删除</a>&nbsp;<a href="${base}/payment/editPayOlbank.do?olbankId=${payOlbank.olbankId}">编辑</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="page_c">
		        <span class="r page">
		            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
		            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
		            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
		            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
		            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
		            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
		            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
		            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
					共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
		        </span>
		    </div>
	    
		</form>
</div></div>
</body>
