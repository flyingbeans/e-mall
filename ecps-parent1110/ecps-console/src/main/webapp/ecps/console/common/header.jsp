<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp"%>
<div class="top w">
   <h1 title="管理员">
		<a href="<c:url value='/'/>">管理员</a>
   </h1>
   <dl>
   		<dt>
   			<c:if test="${user!= null }">
			<span title="${user.fullName}[${user.roleNames}]">
			${user.fullName}【<c:choose> 
			<c:when test="${fn:length(user.roleNames) > 10}"> 
			<c:out value="${fn:substring(user.roleNames, 0, 9)}..." /> 
			</c:when> 
			<c:otherwise> 
			<c:out value="${user.roleNames}" /> 
			</c:otherwise> 
			</c:choose> 】
			| <a href="${base}/permission/user/getUserIndex.do">修改资料</a></span>
			</c:if>
			&nbsp;欢迎使用 Ailk Tangram ECPS！
			<c:if test="${user == null }">
			   <a href="<c:url value="/"/>">请登陆</a>
			</c:if>
			<c:if test="${user != null }">
			   <a href="<c:url value="/${system}/logout.jsp"/>">退出</a>
			</c:if>
   		</dt>
   		<dd>
   			<span class="pre"></span>
   			<ul class="ul">
				<!-- li><a href="#" title="统一支撑运营平台" class="n01">统一支撑运营平台</a></li -->
			</ul>
			<span class="next"></span>
   		</dd>
   </dl>
</div>
<%-- Put constants into request scope --%>
<appfuse:constants scope="request"/>