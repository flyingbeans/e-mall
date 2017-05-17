<!-- Save it in UTF-8 encoding format for showing Chinese characters correctly.  -->
<%@ include file="/ecps/console/common/taglibs.jsp"%>

<head>
<title><fmt:message key="productList.title" />
</title>
<meta name="heading" content="<fmt:message key='productList.heading'/>" />
    <meta name="menu" content="ProductMenu"/>
</head>

<body>

<div class="frameL"><div class="menu icon">
    <jsp:include page="../../common/orderLocalMenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key="orderLocalMenu.heading"/></div>

    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="<c:url value="/productForm/"/>" title="<fmt:message key="button.add"/>" class="btn80x20"><fmt:message key="button.add"/></a>
        </span>
    </div>

    <display:table name="productList" cellspacing="0" cellpadding="0"
    class="table" requestURI="" defaultsort="4" defaultorder="descending" id="productList"
    export="false" pagesize="4">
    <display:column property="id" escapeXml="true" sortable="true"
    titleKey="product.id"/>
    <display:column property="productName" escapeXml="true" sortable="true"
    titleKey="product.productName"/>
    <display:column property="sku" escapeXml="true" sortable="true"
    titleKey="product.sku"/>
    <display:column property="price" escapeXml="true" sortable="true"
    titleKey="product.price"/>
    <display:column escapeXml="true" sortable="false" titleKey="button.edit"
    url="/productForm" paramId="id" paramProperty="id">
    <fmt:message key="button.edit"/>
    </display:column>

    <display:setProperty name="paging.banner.item_name">
    <fmt:message key="productList.product" />
    </display:setProperty>
    <display:setProperty name="paging.banner.items_name">
    <fmt:message key="productList.products" />
    </display:setProperty>

    </display:table>

    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="<c:url value="/productForm/"/>" title="<fmt:message key="button.add"/>" class="btn80x20"><fmt:message key="button.add"/></a>
        </span>
    </div>

    <script type="text/javascript">
    highlightTableRows("productList");
    </script>

</div></div>
</body>