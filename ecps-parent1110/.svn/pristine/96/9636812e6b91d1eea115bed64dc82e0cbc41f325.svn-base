<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>移动号卡_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
<script language="javascript" type="text/javascript">
	$(document).ready(function(){
		var obj=null;
		$("a[group]").click(function(){
			$("#errorInfoAdd").html("<label>&nbsp;</label>");
		    $("#itemNote").val("");
		    tipHide("#errorInfoAdd");
			tipShow('#addItemNote');
			obj=$(this);
		});
		$("input[id='confirmDivOk']").click(function(){
			var form = document.getElementById("form1");
            form.action = objDelUrl + "?itemId=" + objItemId;
            form.submit();
		})
		$("input[id='addItemNoteConfirm']").click(function(){
			if(obj==null){
				return;
			}
			var value=obj.attr("group");
			var itemId=value.split(",")[0];
			var showStatus=value.split(",")[1];
			var itemNote=$("#itemNote").val();
			if(itemNote.length>90){
				tipShow("#errorInfoAdd");
				$("#errorInfoAdd").html("<label>&nbsp;</label>操作备注不能大于90个字符");
				return;
			}
			var ajaxData="itemId="+itemId+"&showStatus="+showStatus+"&itemNote="+itemNote;
	        $.ajax({
	        	type:"post",
	         	url:"${base}/item/changeCardShowStatusAjax.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
	             		if(showStatus==1){
	             			obj.attr("group",itemId+",0");	
	             		}else{
	             			obj.attr("group",itemId+",1");
	             		}
	             		if(showStatus==1){
	        	     		obj.html('<span class="not" title="下架"></span>');                 		
	        	     	}else{
	        	     		obj.html('<span class="is" title="上架"></span>');
	        	     	} 
	             		alert("操作成功");
	             		window.location.href=window.location.href;
	             	}else{
	             		alert(result._mes);
	             	}
	             	tipHide('#addItemNote');
	        	}
	        });
		});
	});
	
    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
        goSearch('#form1','#userSearch');
    }

    $(function(){
        searchText('#searchText','#userSearch',40);
        pageInitialize('#form1','#userSearch');
        $('#goSearch').click(function(){
            $("#pageNo").val(1);
            goSearch('#form1','#userSearch');
        });
    });

    function singleDel(itemId,showStatus) {
        if(showStatus==0){
            alert("已上架商品不能删除,请先下架商品");
            return;
        }
        var delChkUrl = $("#deleteCheckAction").val();

        var options = {
            beforeSubmit: showDeleteCheckRequest,
            success:      showDeleteCheckResponse,
            type:         'post',
            dataType:     "script",
            data:{
                'itemId':itemId
            },
            url:          delChkUrl
        };
        $('#form1').ajaxSubmit(options);
    }

    function showDeleteCheckRequest(formData, jqForm, options) {
        return true;
    }

    function showDeleteCheckResponse(responseText, statusText, xhr, $form) {
        responseText = eval('(' + responseText + ')');

        var status = responseText[0].deleteAble;
        if (status == "true") {
            var itemId = responseText[0].itemId;
            var delUrl = $("#deleteAction").val();
            tipShow('#confirmDiv');
            objDelUrl = delUrl;
            objItemId = itemId;
            /* if (confirm("确定删除该商品？")) {
                var form = document.getElementById("form1");
                form.action = delUrl + "?itemId=" + itemId;
                form.submit();
            } */
        } else if (status == "false") {
            alert(responseText[0]._mes);
        } else {
            alert("删除失败！");
        }

    }
    $(document).ready(function() {
        if ($("#auditStatus").val() == '0') {
            $("#label1").attr("class", "here");
        }
        else if ($("#auditStatus").val() == 2) {
            $("#label2").attr("class", "here");
        }
        else if ($("#auditStatus").val() == 1) {
            $("#label3").attr("class", "here");
        }
        else if ($("#showStatus").val() == '1') {
            $("#label4").attr("class", "here");
        }
        else if ($("#showStatus").val() == '0') {
            $("#label5").attr("class", "here");
        }
        else $("#label0").attr("class", "here");
    })
	
    function publishContent(itemId){
    	tipShow('#staticLoadDiv');
    	var ajaxData="contentId="+itemId;
        $.ajax({
        	type:"post",
         	url:"${staticPublishUrlPre}/static4ebiz/static/publishSingleContent.do",
         	data:(ajaxData),
         	success:function(responseText){
            	var result=eval("("+responseText+")");
             	if(result._status=="true"){
             		tipHide('#staticLoadDiv');
             		alert("发布成功");
             		window.location.href=window.location.href;
             	}else{
             		tipHide('#staticLoadDiv');
             		alert(result._mes);
             	}
        	}
        });
    }
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<span class="gray" title="移动号卡">移动号卡</span></div>

    <input type="hidden" id="deleteAction" name="deleteAction" value="${base}/card/deleteCard.do"/>
    <input type="hidden" id="deleteCheckAction" name="deleteCheckAction" value="${base}/item/deleteCheck.do"/>

    <form id="form1" name="form1" action="${base}/card/listCard.do" method="post">

        <div class="sch">
            <input type="hidden" id="userSearch" name="userSearch" />
            <p><fmt:message key="tag.search"/>：
                <ui:select name="catID" list="catList" rootId="0" defaulttext="全部分类" defaultvalue=""
                           currentValue="${catID}"/>
                <select id="simLevel" name="simLevel">
                    <option value="" selected="">全部靓度</option>
                    <option value="3"<c:if test='${simLevel==3}'> selected</c:if>>普通号</option>
                    <option value="2"<c:if test='${simLevel==2}'> selected</c:if>>普通靓号</option>
                    <option value="1"<c:if test='${simLevel==1}'> selected</c:if>>超级靓号</option>
                </select><select id="brandId" name="brandId" value="${brandId}">
                    <option value="">全部品牌</option>
                    <c:forEach items='${brandList}' var="brand">
                        <option value="${brand.brandId}" <c:if test='${brandId==brand.brandId}'> selected </c:if>>${brand.brandName}</option>
                    </c:forEach>
                </select><select id="stock" name="stock">
                    <option value="-1" selected="">全部库存</option>
                    <option value="0"<c:if test='${stock==0}'> selected</c:if>>已售</option>
                    <option value="1"<c:if test='${stock==1}'> selected</c:if>>未售</option>
                </select><input type="text" id="searchText" name="searchText" value="${userSearch}" title="请输入商品编号或商品名称" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>" />
            </p>
        </div>

        <div class="page_c">
             <span class="l">
<%--             <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" /> --%>
<%--             <input type="button" onclick="batAudit();" value="<fmt:message key="tag.audit"/>" class="hand btn60x20" /> --%>
<!--             <input type="button" onclick="batchUp();" value="上架" class="hand btn60x20" /> -->
<!--             <input type="button" onclick="batchDown();" value="下架" class="hand btn60x20" /> -->
            </span>
            <span class="r inb_a"><a href="${base}/item/addCatItemCard.do"  class="btn80x20">添加号卡</a></span>
        </div>

        <table cellspacing="0" summary="" class="tab">
            <thead>
            <th><input type="checkbox" id="all" onclick="checkAll(this, 'ids')" name="all"
                       title="<fmt:message key="tag.selected.allORcancel"/>"/></th>
            <th><a href="javascript:orderBy('item.item_no',${nextOrderByStatus})" class="icon"><fmt:message key='menu.rightItem.itemNo'/><samp class="inb t14"></samp></a></th>
            <th><a href="javascript:orderBy('item.item_name',${nextOrderByStatus})" class="icon"><fmt:message key='menu.rightItem.itemName'/><samp class="inb t14"></samp></a></th>
            <th>靓度</th>
            <th><a href="javascript:orderBy('sku.sku_price',${nextOrderByStatus})" class="icon">预存话费<samp class="inb t14"></samp></a></th>
            <th>品牌</th>
            <th>库存</th>
            <th>上下架</th>
            <th><fmt:message key='tag.column.operation'/></th>
            </thead>
            <tbody>
            <c:forEach items='${pagination.list}' var="item">
                <%-- <c:set var="fetItem" value="${item.featuredItem}"/> --%>
                <tr>
                    <td><input type="checkbox" name="ids" value="${item.itemId}"/>
                    <input type="hidden" id="marketPrice" name="marketPrice" value="${item.marketPrice}"/></td>
                    <td><c:out value='${item.itemNo}'/></td>
                    <td><c:out value='${item.itemName}' escapeXml="false"/></td>
                    <td><c:if test='${item.simLevel==1}'>超级靓号</c:if>
                    <c:if test='${item.simLevel==2}'>普通靓号</c:if>
                    <c:if test='${item.simLevel==3}'>普通号</c:if></td>
                    <td><fmt:formatNumber value="${item.skuPriceMin/100}" pattern="#0.00"/></td>
                    <td><img src="<c:if test='${item.brandImgs==""}'>${path }/res/imgs/deflaut.jpg</c:if>
                    <c:if test='${item.brandImgs!=""}'>${rsImgUrlInternal}${item.brandImgs}</c:if>"  onerror="this.src='${path }/res/imgs/deflaut.jpg'" width="25" height="25"></td>
                    <td>
                          <c:choose>
                            <c:when test="${item.stock==0}">
                               已售
                            </c:when>
                            <c:otherwise>
                               未售
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td> <input type="hidden" id="showStatus${item.itemId}" value="${item.showStatus}"/>
		                  <c:if test='${item.showStatus==0}'>
		                	<a href="javascript:void(0);" group="${item.itemId },1"><span class="is" title="上架"></span></a>
		                  </c:if>
		                  <c:if test='${item.showStatus==1}'>
		                	<a href="javascript:void(0);" group="${item.itemId },0"><span class="not" title="下架"></span></a>
		                  </c:if>
                    </td>
                    <td>
                        <c:url value="" var="deleteItemById">
                            <c:param name="id" value="${item.itemId}"/>
                        </c:url>
                         <c:if test='${item.showStatus==0}'>
                         	<a href="#" class="gray" title="编辑基本信息">编辑</a>
                         </c:if>
                          <c:if test='${item.showStatus==1}'>
                         	<a href="${base}/card/editCard.do?&itemId=${item.itemId}" title="编辑基本信息">编辑</a>
                         </c:if>
                        <a href="javascript:void(0);" onclick="singleDel('${item.itemId}')">删除</a>
                        <ui:permTag src="/${system}/static/toPublishJsp.do">
                        <a href="#" onclick="publishContent(${item.itemId})">发布</a>
                        </ui:permTag>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tr>
                <td colspan="10" align="right">
                    <fmt:message key='tag.select'/>：<a href="#"
                                                       title="<fmt:message key='tag.selected.all'/>"
                                                       onclick="checkAllIds();"><fmt:message
                        key='tag.selected.all'/></a>
                    <samp>-</samp> <a href="#" title="<fmt:message key='tag.selected.cancel'/>"
                                      onclick="uncheckAllIds();"><fmt:message
                        key='tag.selected.cancel'/></a>
                </td>
            </tr>
        </table>

        <div class="page_c">
        <span class="l inb_a">
        <%--             <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" /> --%>
        <%--             <input type="button" onclick="batchAudit();" value="<fmt:message key="tag.audit"/>" class="hand btn60x20" /> --%>
        <!--             <input type="button" onclick="batchUp();" value="上架" class="hand btn60x20" /> -->
        <!--             <input type="button" onclick="batchDown();" value="下架" class="hand btn60x20" /> -->
        </span>
        <span class="r page">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy"/>
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus"/>
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo"/>
            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
            共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
        </span>
        </div>
    <div id="tipDiv" class="alt" style="display:none">
  		<div class="t"></div>
		<div class="c set">
			<h2 title="系统提示">系统提示</h2>
			<div onclick="tipHide('#tipDiv')" class="o" title="关闭"></div>
			<p id="tipText" class="alg_c"></p>
			<p id="showButton" class="alg_r"><input id=tipDiv type="button" value="确 认" onclick="tipHide('#tipDiv')" class="hand btn83x23" /></p>
		</div>
		<div class="f"></div>
	</div>
   </form>

</div></div>
</body>
