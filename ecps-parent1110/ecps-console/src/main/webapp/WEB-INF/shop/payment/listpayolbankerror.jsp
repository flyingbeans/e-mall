<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>网银列表_支付机构管理_支付管理</title>
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
			$("#keyWordText").val("请输入商品编号或商品名称");
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
			if($("#keyWordText").val()!="请输入商品编号或商品名称"){
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
		<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：支付管理&nbsp;&raquo;&nbsp;<a href="<c:url value='/${system}/payment/listPaymentOrg.do'/>">支付机构管理</a>&nbsp;&raquo;&nbsp;<span class="gray">网银列表</span>
	    </div>
		
		<div class="sch">
	        <p><fmt:message key="tag.search"/>：
        	<input type="hidden" id="keyWord" name="keyWord" value="${keyWord}" />
	        <c:choose>
	        	<c:when test="${keyWord!=''}">
			        <input type="text" id="keyWordText" value="${keyWord}" class="text20 medium" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search" />" /></p>
	        	</c:when>
	        	<c:otherwise>
		        	<input type="text" id="keyWordText" value="请输入商品编号或商品名称" title="请输入商品编号或商品名称" class="text20 medium gray"/><input type="button" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search" />" /></p>
	        	</c:otherwise>
	        </c:choose>
	    </div>
    
		<div class="page_c">
			<span class="l">
	        </span>
	        <span class="r inb_a">
	            <input type="button" disabled="disabled" class="btn80x20" title="新增网银" value="新增网银" />
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
			</tbody>
		</table>
		<div class="page_c">
	        <span class="r page">
	            <input type="hidden" value="" id="orderBy" name="orderBy" />
	            <input type="hidden" value="" id="orderByStatus" name="orderByStatus" />
	            <input type="hidden" value="" id="pageNo" name="pageNo" />
	            <input type="hidden" value="0" id="paginationPiece" name="paginationPiece" />
	            <input type="hidden" value="1" id="paginationPageNo" name="paginationPageNo" />
	            <input type="hidden" value="1" id="paginationTotal" name="paginationTotal" />
	            <input type="hidden" value="" id="paginationPrePage" name="paginationPrePage" />
	            <input type="hidden" value="" id="paginationNextPage" name="paginationNextPage" />
				共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
	        </span>
	    </div>
	    
</div></div>
</body>