<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="userList.title"/></title>
    <meta name="heading" content="<fmt:message key='userList.heading'/>"/>
    <meta name="menu" content="AdminMenu"/>
</head>
<body id="main">

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key="userList.heading"/></div>

    <div class="sch">
    <form method="get" action="${base}/admin/users" id="searchForm">
        <fmt:message key="button.search"/>
        <input type="text" size="20" name="q" id="query" class="text20 medium" value="${param.q}" placeholder="Enter search terms" />
        <input type="submit" class="hand btn60x20" value="<fmt:message key="button.search"/>" />
    </form>
    </div>

    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="<c:url value="/userform?method=Add&from=list"/>" title="<fmt:message key="button.add"/>" class="btn80x20"><fmt:message key="button.add"/></a>
            <a href="<c:url value="/users"/>" title="<fmt:message key="button.done"/>" class="btn80x20"><fmt:message key="button.done"/></a>
        </span>
    </div>

    <display:table name="userList" cellspacing="0" cellpadding="0" requestURI=""
        defaultsort="1" id="users" pagesize="25" class="table" export="true">
        <display:column property="username" escapeXml="true" sortable="true" titleKey="user.username" style="width: 25%"
            url="/userform?from=list" paramId="id" paramProperty="id"/>
        <display:column property="fullName" escapeXml="true" sortable="true" titleKey="activeUsers.fullName" style="width: 34%"/>
        <display:column property="email" sortable="true" titleKey="user.email" style="width: 25%" autolink="true" media="html"/>
        <display:column property="email" titleKey="user.email" media="csv xml excel pdf"/>
        <display:column sortProperty="enabled" sortable="true" titleKey="user.enabled" style="width: 16%; padding-left: 15px" media="html">
            <input type="checkbox" disabled="disabled" <c:if test="${users.enabled}">checked="checked"</c:if>/>
        </display:column>
        <display:column property="enabled" titleKey="user.enabled" media="csv xml excel pdf"/>

        <display:setProperty name="paging.banner.item_name" value="user"/>
        <display:setProperty name="paging.banner.items_name" value="users"/>

        <display:setProperty name="export.excel.filename" value="User List.xls"/>
        <display:setProperty name="export.csv.filename" value="User List.csv"/>
        <display:setProperty name="export.pdf.filename" value="User List.pdf"/>
    </display:table>

    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="<c:url value="/userform?method=Add&from=list"/>" title="<fmt:message key="button.add"/>" class="btn80x20"><fmt:message key="button.add"/></a>
            <a href="<c:url value="/users"/>" title="<fmt:message key="button.done"/>" class="btn80x20"><fmt:message key="button.done"/></a>
        </span>
    </div>

    <script type="text/javascript">
        highlightTableRows("users");
    </script>

    <div class="loc">&nbsp;</div>

</div></div>
</body>
