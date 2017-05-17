<%@ include file="/common/taglibs.jsp" %>
<head>
    <title><fmt:message key="productDetail.title"/>
    </title>
    <meta name="heading" content="<fmt:message key='productDetail.heading'/>"/>
</head>
<form:form commandName="product" method="post" action="productForm" id="productForm"
           onsubmit="return validateProduct(this)">
    <form:errors path="*" cssClass="error" element="div"/>
    <form:hidden path="id"/>
    <ul>
        <li>
            <appfuse:label styleClass="desc" key="product.productName"/>
            <form:errors path="productName" cssClass="fieldError"/>
            <form:input path="productName" id="productName" cssClass="text medium" cssErrorClass="text medium error"
                        maxlength="50"/>
        </li>
        <li>
            <appfuse:label styleClass="desc" key="product.sku"/>
            <form:errors path="sku" cssClass="fieldError"/>
            <form:input path="sku" id="sku" cssClass="text medium" cssErrorClass="text medium error" maxlength="50"/>
        </li>
        <li>
            <appfuse:label styleClass="desc" key="product.price"/>
            <form:errors path="price" cssClass="fieldError"/>
            <form:input path="price" id="price" cssClass="text medium" cssErrorClass="text medium error"
                        maxlength="50"/>
        </li>
        <li class="buttonBar bottom">
            <input type="submit" class="hand btn83x23" name="save" value="<fmt:message key="button.save"/>"/>
            <c:if test="${not empty product.id}">
                <input type="submit" class="hand btn83x23b" name="delete" onclick="bCancel=true;return confirmDelete('product')" value="<fmt:message key="button.delete"/>"/>
            </c:if>
            <input type="submit" class="hand btn83x23b" name="cancel" value='<fmt:message key="button.cancel"/>' onclick="bCancel=true"/>
        </li>
    </ul>
</form:form>
<script type="text/javascript">
    Form.focusFirstElement($('productForm'));
</script>
<v:javascript formName="product" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value='/scripts/validator.jsp'/>"></script>