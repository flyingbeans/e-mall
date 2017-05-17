<%@ include file="/ecps/console/common/taglibs.jsp" %>
<title>Data Access Error</title>
<head>
    <meta name="heading" content="Data Access Failure"/>
    <meta name="menu" content="AdminMenu"/>
</head>
<body id="main">
<p>
    <c:out value="${requestScope.exception.message}"/>
</p>
<!--
<% 
if(null!=request.getAttribute("exception")){
	((Exception) request.getAttribute("exception")).printStackTrace(new java.io.PrintWriter(out));  

}
%>
--> 
<a href="mainMenu" onclick="history.back();return false">&#171; Back</a>
</body>