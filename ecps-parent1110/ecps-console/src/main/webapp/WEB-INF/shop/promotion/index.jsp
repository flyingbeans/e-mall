<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>促销活动</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="PromotionMenu"/>
</head>
<body id="main">

	<div class="frameL">
			<div class="menu icon">
				<ui:permTag src="/${system}/promotion/index.do">
	    			<jsp:include page="/ecps/console/common/promotionmenu.jsp"/>
    			</ui:permTag>
			</div>
	</div>
	
	<div class="frameR">
			<div class="content">
			</div>
		</div>
	</div>
</body>

