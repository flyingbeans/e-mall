<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="upload.title"/></title>
    <meta name="heading" content="<fmt:message key='upload.heading'/>"/>
    <meta name="menu" content="AdminMenu"/>
</head>
<body id="main" style="background:#f1f1f1 none">
<!--
    The most important part is to declare your form's enctype to be "multipart/form-data"
-->

<div class="content" style="width:100%;padding-bottom:10px;text-align:center">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key="upload.heading"/></div>

    <spring:bind path="fileUpload.*">
        <c:if test="${not empty status.errorMessages}">
        <div class="error">
            <c:forEach var="error" items="${status.errorMessages}">
                <img src="<c:url value="/images/iconWarning.gif"/>"
                    alt="<fmt:message key="icon.warning"/>" class="icon" />
                <c:out value="${error}" escapeXml="false"/><br />
            </c:forEach>
        </div>
        </c:if>
    </spring:bind>


    <form:form commandName="fileUpload" method="post" action="fileupload" enctype="multipart/form-data"
        onsubmit="return validateFileUpload(this)" id="uploadForm" class="sign">
        <ul class="ul set">
            <li>
                <label class="desc">&nbsp;</label><span class="orange"><fmt:message key="upload.message"/></span>
            </li>
            <li>
                <appfuse:label key="uploadForm.name" styleClass="desc"/>
                <form:errors path="name" cssClass="fieldError"/>
                <form:input path="name" id="name" cssClass="text state" cssErrorClass="text state error"/>
            </li>
            <li>
                <appfuse:label key="uploadForm.file" styleClass="desc"/>
                <form:errors path="file" cssClass="fieldError"/>
                <input type="file" name="file" id="file" class="file large"/>
            </li>
            <li>
                <label class="desc">&nbsp;</label>
                <input type="submit" name="upload" class="hand btn83x23" onclick="bCancel=false" value="<fmt:message key="button.upload"/>" />
                <input type="reset" name="cancel" class="hand btn83x23b" onclick="bCancel=true" value='<fmt:message key="button.cancel"/>' />
            </li>
        </ul>
    </form:form>

    <div class="loc">&nbsp;</div>

</div></div>

<script type="text/javascript">
    Form.focusFirstElement($('uploadForm'));
    highlightFormElements();
</script>
<v:javascript formName="fileUpload" staticJavascript="false"/>
<script type="text/javascript" src="<c:url value="/scripts/validator.jsp"/>"></script>
</body>