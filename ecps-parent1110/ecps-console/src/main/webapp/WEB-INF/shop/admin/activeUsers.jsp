<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="activeUsers.title"/></title>
    <meta name="heading" content="<fmt:message key='activeUsers.heading'/>"/>
    <meta name="menu" content="AdminMenu"/>
</head>
<body id="main">

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key="activeUsers.heading"/></div>

    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="<c:url value="/users"/>" title="<fmt:message key="button.done"/>" class="btn80x20"><fmt:message key="button.done"/></a>
        </span>
    </div>

    <p><fmt:message key="activeUsers.message"/></p>

    <display:table name="applicationScope.userNames" id="user" cellspacing="0" cellpadding="0"
        defaultsort="1" class="table" pagesize="50" requestURI="">

        <display:column property="username" escapeXml="true" style="width: 30%" titleKey="user.username" sortable="true"/>
        <display:column titleKey="activeUsers.fullName" sortable="true">
            <c:out value="${user.firstName} ${user.lastName}" escapeXml="true"/>
            <c:if test="${not empty user.email}">
            <a href="mailto:<c:out value="${user.email}"/>">
                <img src="<c:url value="/images/iconEmail.gif"/>" alt="<fmt:message key="icon.email"/>" class="icon"/></a>
            </c:if>
        </display:column>

        <display:setProperty name="paging.banner.item_name" value="user" />
        <display:setProperty name="paging.banner.items_name" value="users" />
    </display:table>

    <div class="loc">&nbsp;</div>

</div></div>
</body>
