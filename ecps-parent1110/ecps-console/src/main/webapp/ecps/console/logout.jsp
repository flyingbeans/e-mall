<%@ include file="common/taglibs.jsp"%>
<%@ page import="javax.servlet.http.Cookie" %>

<%
if (request.getSession(false) != null) {
    session.invalidate();
}
%>

<c:redirect url="/ecps/console/login.jsp"/>