<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <title>会员详细信息页面</title>
    <meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
    <meta name="tag" content="tagName"/>
    <script type="text/javascript">
     function startStatus(){
		var form = document.getElementById("form1");
         form.action="${base}/ptlUser/updatePtlUserInfoStatus.do";
		 form.submit();
	}
	function stop(){
		var form = document.getElementById("form1");
        form.action="${base}/ptlUser/updatePtlUserInfoStatus.do";
		form.submit();
	}
    function returnPtlUserList(){
		var form = document.getElementById("form2");
        form.action="${base}/ptlUser/returnPtlUserList.do";
		form.submit();
	}
    function gotoPage(addrPageNo){
        var tempNo=<c:out value="${pageination.pageNo}"/>;
        if(addrPageNo!='jump'){
            $("#addrPageNo").val(addrPageNo);
        }else{
            var jumpPage=$("#addrPageNo").val();
            var reg = /^[0-9]*[1-9][0-9]*$/;
			if(!reg.test(jumpPage)){
				alert("请输入正整数页码");
				$("#addrPageNo").val(tempNo);
				return false;
			}
            var totalPage=<c:out value="${pageination.totalPage}"/>;
			if(jumpPage>totalPage){
				$("#addrPageNo").val(<c:out value="${pageination.totalPage}"/>);
            }
        }
        $("#form3").action="${base}/ptlUser/ptlUserInfoDetail.do";
        $("#form3").submit();
    }

        $(document).keydown(function(event) {
           if (event.keyCode==13) {
            var tempNo=<c:out value="${pageination.pageNo}"/>
            var jumpPage=$("#addrPageNo").val();
            var reg  = /^[0-9]*[1-9][0-9]*$/;
			if(!reg.test(jumpPage)){
				alert("请输入正整数页码");
				$("#addrPageNo").val(tempNo);
                event.returnValue=false;
                return false;
			}
            var totalPage=<c:out value="${pageination.totalPage}"/>;
			if(jumpPage>totalPage){
				$("#addrPageNo").val(<c:out value="${pageination.totalPage}"/>);

        }
        $("#form3").action="${base}/ptlUser/ptlUserInfoDetail.do";
        $("#form3").submit();
           }
        });
    </script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="./ptlUserBar.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp>当前位置：<fmt:message key='EbPtlUserMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<span class="gray" title="会员详细信息页面">会员详细信息页面</span>
        <c:url value="/${system}/ptlUser/ptlUserList.do" var="ptUserList">
        <c:param name="client" value="${client }"/>
        <c:param name="regInfo" value="${regInfo }"/>
        <c:param name="cellPhone" value="${cellPhone }"/>
        <c:param name="orderBy" value="${orderBy }"/>
        <c:param name="orderByStatus" value="${orderByStatus }"/>
        <c:param name="pageNo" value="${pageNo }"/>
        </c:url>
        <a href="${ptUserList}" title="返回会员管理" class="inb btn80x20">返回会员管理</a>
    </div>
	<div class="edit set">
		<h2 >
            <form action="#" id="form1" name="form1">
            <span>注册信息</span>
            <span class="r">
                <input type="hidden" value="${ptlUser.ptlUserId}" id="id" name="id" />
                <input type="hidden" value="${ptlUser.status}" id="status" name="status" />
                <input type="hidden" value="${client }" id="client" name="client"/>
                <input type="hidden" value="${regInfo }" id="regInfo" name="regInfo"/>
                <input type="hidden" value="${cellPhone }" id="cellPhone" name="cellPhone"/>
                <input type="hidden" value="${orderBy }" id="orderBy" name="orderBy"/>
                <input type="hidden" value="${orderByStatus }" id="orderByStatus" name="orderByStatus"/>
                 <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
                 <c:if test="${ ptlUser.isMobileClient == 0}">
	                 <c:if test="${ptlUser.status==null}"><span style=""></span>
	                      <input type="button"  onclick="startStatus();"  value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
	                     <input type="button"  onclick="stop();"   value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
	                 </c:if>
	                 <c:if test="${ptlUser.status==1}"><span style=""></span>
	                     <input type="button"  onclick="startStatus();" disabled="disabled"  value="<fmt:message key="tag.start"/>" style="width:60px;height:20px" />
	                     <input type="button"  onclick="stop();"   value="<fmt:message key="tag.stop"/>" class="hand btn60x20" />
	                 </c:if> 
	                <c:if test="${ptlUser.status==0}"><span style=""></span> 
	                     <input type="button" onclick="startStatus();"   value="<fmt:message key="tag.start"/>" class="hand btn60x20" />
	                     <input type="button"  onclick="stop();" disabled="disabled"  value="<fmt:message key="tag.stop"/>" style="width:60px;height:20px" />
	                 </c:if>
	            </c:if>
                </span>
            </form>
        </h2>
		<p>
		<c:if test="${ptlUser.isMobileClient != 1 }"><label>邮箱：</label><var><c:out value=""/>${ptlUser.email}</var></c:if>
		<%--当为移动用户时，username,phone,cellphone都保存了手机号 --%>
		<c:if test="${ptlUser.isMobileClient == 1 }"><label>账号：</label><var><c:out value=""/>${ptlUser.username}</var></c:if>
		</p>
	</div>
	<c:if test="${ptlUser.isMobileClient != 1 }">
    		<div class="loc">&nbsp;</div>
		    <div class="edit set">
				<h2 title="个人资料">个人资料</h2>
		        <ul class="uls">
		            <li><label>用户名：</label>${ptlUser.username}</li>
		            <li><label>真实姓名：</label>${ptlUser.realName}</li>
		            <li><label>性别：</label><c:if test='${ptlUser.gender==0}'>保密</c:if><c:if test='${ptlUser.gender==1}'>男</c:if><c:if test='${ptlUser.gender==2}'>女</c:if></li>
		            <li><label>手机：</label><var>${ptlUser.cellPhone}</var></li>
		            <li><label>固话：</label><var>${ptlUser.phone}</var></li>
		            <li><label>居住地：</label>
		            	<c:out value="${ptlUser.resiProv }"/><c:out value="${ptlUser.resiCity }"/><c:out value="${ptlUser.resiDist }"/>
		            </li>
		            <li><label>详细地址：</label><div class="pre"><c:out value="${ptlUser.addr}" escapeXml="true"/>&nbsp;</div></li>
		            <li><label>邮编：</label><var>${ptlUser.zipCode}</var></li>
		        </ul>
			</div>
	</c:if>
	<div class="loc">&nbsp;</div>

	<div class="edit set">
		<h2 title="收货地址信息">收货地址信息</h2>
        <p><label>收货地址列表：</label><var class="red">第一条为默认地址</var></p>
        <table cellspacing="0" summary="" class="tab">
		    <thead>
			    <th>编号</th>
			    <th>收货人</th>
			    <th>所在地</th>
			    <th>街道地址</th>
			    <th>邮编</th>
                <th>手机/固话</th>
		</thead>
            <tbody>
			<c:forEach items='${pageination.list}' var="shipAddrs" varStatus="p">
	                <tr>
	                    <td><c:out value="${p.count }"/></td>
	                    <td><c:out value="${shipAddrs.userName}"/></td>
	                    <td><c:out value="${shipAddrs.province}"/>&nbsp;<c:out value="${shipAddrs.city}"/>&nbsp;<c:out value="${shipAddrs.region}"/></td>
	                    <td class="nwp"><c:out value="${shipAddrs.street}"/></td>
	                    <td><c:out value="${shipAddrs.postalCode}"/></td>
	                    <td>
	                    	<c:out value="${shipAddrs.telephone}"/>
	                    	<c:if test="${!empty shipAddrs.telephone && !empty shipAddrs.fixedphone}">/</c:if>
	                    	<c:out value="${ shipAddrs.fixedphone}"/>
	                    </td>
	                </tr>
            </c:forEach>
            </tbody>
            </table>
           <div class="page_c">
          <form action="#" id="form3" name="form3">
            <span class="r page inb_a">
            <input type="hidden" value="${ptlUser.ptlUserId}" id="id" name="id" />
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${client }" id="client" name="client"/>
                <input type="hidden" value="${regInfo }" id="regInfo" name="regInfo"/>
                <input type="hidden" value="${cellPhone }" id="cellPhone" name="cellPhone"/>
                <input type="hidden" value="${orderBy }" id="orderBy" name="orderBy"/>
                <input type="hidden" value="${orderByStatus }" id="orderByStatus" name="orderByStatus"/>
            <%--根据defect-430去除分页 --%>
            <%--
            <var>共<c:out value="${pageination.totalCount}"/>条</var>
            <var><c:out value="${pageination.pageNo}"/>/<c:out value="${pageination.totalPage}"/></var>
            <c:if test='${pageination.pageNo==1}'><fmt:message key="tag.page.previous"/></c:if>
            <c:if test='${pageination.pageNo>1}'><a href="#" onclick="gotoPage('${pageination.prePage}')"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pageination.totalPage==pageination.pageNo}'><fmt:message key="tag.page.next"/></c:if>
            <c:if test='${pageination.totalPage>pageination.pageNo}'><a href="#" onclick="gotoPage('${pageination.nextPage}')"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="addrPageNo" id="addrPageNo" class="txts" value="${pageination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
             --%>
        </span>
               </form>
               </div>
	</div>
    <div class="loc">&nbsp;</div>
    <div align="Center">
          <form action="#" id="form2" name="form2" onsubmit="return false">
            <table> <tr>
                    <td>
                   <input type="hidden" id="pageNo1" name="pageNo" value="${pageNo}"/>
                    <input type="hidden" id="search1"  name="search" value="${search}"/>
                 </td>
             </tr></table>
          </form>
    </div>
    <div class="loc">&nbsp;</div>

</div></div>
</body>