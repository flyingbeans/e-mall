<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<title>内容维护_版位列表</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
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
	         	url:"${base}/item/changeShowStatus.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	            	var result=eval("("+responseText+")");
	             	if(result._status=="true"){
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

    $(document).ready(function(){
        searchText('#searchText','#userSearch',40);
        pageInitialize('#form1','#userSearch');
        $('#goSearch').click(function(){
            $("#pageNo").val(1);
            goSearch('#form1','#userSearch');
        });
    });

    function singleDel(itemId) {
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
        responseText = $.parseJSON(responseText);
        var status = responseText[0].deleteAble;
        if (status == "true") {
            var itemId = responseText[0].itemId;
            var delUrl = $("#deleteAction").val();
			tipShow('#confirmDiv');
			objDelUrl = delUrl;
            objItemId = itemId;
			
/*             if(confirm("确定删除该商品？")) {
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
    $(document).ready(function(){
        if($("#showStatus").val()==2){
            $("#label3") .attr("class","here");
        }
       else  if($("#showStatus").val()=='1'&&$("#auditStatus").val()=='1'){
            $("#label4") .attr("class","here");
        }
       else  if($("#showStatus").val()=='0'&&$("#auditStatus").val()=='1'){
            $("#label5") .attr("class","here");
        }
        else $("#label6") .attr("class","here");
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
    function publishOther(otherId){
    	tipShow('#staticLoadDiv');
    	var ajaxData="otherId="+otherId;
        $.ajax({
        	type:"post",
         	url:"${staticPublishUrlPre}/static4ebiz/static/publishSingleOther.do",
         	data:(ajaxData),
         	success:function(responseText){
            	var result=eval("("+responseText+")");
             	if(result._status=="true"){
             		tipHide('#staticLoadDiv');
             		alert("发布成功");
             		//window.location.href=window.location.href.replace("#","");
             		/* window.location.href=window.location.href; */
             		goSearch('#form1','#userSearch');
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
		<jsp:include page="/${system }/common/contentMaintainMenu.jsp" />
	</div></div>

	<div class="frameR"><div class="content">
				<div class="loc icon">
					<samp class="t12"></samp>
					<fmt:message key='menu.current.loc' />
					：内容维护&nbsp;&raquo;&nbsp;<span class="gray">版位列表</span>
				</div>

	<form id="form1" name="form1" action="${base}/contentMaintain/conditonSearch.do" method="post">
		<div class="sch">
        <input type="hidden" id="userSearch" name="userSearch" />
			<p>
				<fmt:message key="tag.search" />
				：
		<select id="needPublish" name="needPublish">
			<option value="" selected="">选择发布状态</option>
			<option value="1" <c:if test='${needPublish==1}'> selected </c:if>>待发布</option>
			<option value="2" <c:if test='${needPublish==2}'> selected </c:if>>已发布</option>
		</select>
			 <input type="text" id="searchText" name="searchText" value="${userSearch}" title="请输入版位名称" class="text20 medium gray" />
					<%--	<select id="slotBelong" name="slotBelong">
		   			 <option value="" selected="">请选择所属页面</option>
					  <option value="1" <c:if test='${slotBelong==1}'> selected </c:if>>首页</option>
					  <option value="2" <c:if test='${slotBelong==2}'> selected </c:if>>动态筛选页</option>
					  <option value="3" <c:if test='${slotBelong==3}'> selected </c:if>>赠送话费活动列表</option>
					  <option value="4" <c:if test='${slotBelong==4}'> selected </c:if>>0元购机活动列表</option>
					  <option value="5" <c:if test='${slotBelong==5}'> selected </c:if>>公共版位</option>
				 	</select> 
				<select id="slotType" name="slotType">
					<option value="" selected="">请选择版位类型</option>
					<option value="1" <c:if test='${slotType==1}'> selected </c:if>>推荐区</option>
					<option value="2" <c:if test='${slotType==2}'> selected </c:if>>货架</option>
					<option value="3" <c:if test='${slotType==3}'> selected </c:if>>排行榜</option>
				</select>  --%>
				<input type="submit" id="goSearch" class="hand btn60x20"
					value="<fmt:message key="tag.search" />" />
			</p>
		</div>
		<table cellspacing="0" summary="" class="tab" id="myTable">
			<thead>
				<th>版位名称</th>
				<th>所属页面</a></th>
				<th>类型</th>
				<th>可展示商品数量</th>
				<th>商品图片尺寸</th> 
				<th>发布状态</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach items='${pagination.list}' var="Slot">
					<tr>
						<td>
						<c:choose>
							<c:when test="${Slot.slotId == '61'}"><c:out value='${Slot.slotName}' /></c:when>
							<c:when test="${Slot.slotId == '71'}"><c:out value='${Slot.slotName}' /></c:when>
							<c:when test="${Slot.slotId == '81'}"><c:out value='${Slot.slotName}' /></c:when>
							<c:when test="${Slot.slotId == '91'}"><c:out value='${Slot.slotName}' /></c:when>
							<c:when test="${Slot.slotId == '110'}"><c:out value='${Slot.slotName}' /></c:when>
							<c:otherwise><c:out value='${Slot.areaName}' /><c:out value='${Slot.slotName}' /></c:otherwise>
						</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${Slot.slotBelong==1}">首页</c:when>
								<c:when test="${Slot.slotBelong==2}">动态筛选页 </c:when>
								<c:when test="${Slot.slotBelong==3}">赠送话费活动列表</c:when>
								<c:when test="${Slot.slotBelong==4}">0元购机活动列表</c:when>
								<c:otherwise>公共版位</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${Slot.slotType==1}">推荐区</c:when>
								<c:otherwise>货架</c:otherwise>
							</c:choose>
						</td>
						<c:if test="${Slot.slotName == '首页新品上架'}">
							<td>4</td>
							<td>90x90</td>
						</c:if>
						<c:if test="${Slot.slotName == '首页特价专区'}">
							<td>8</td>
							<td>150x150</td>
						</c:if>
						<c:if test="${Slot.slotName == '门户商城团购版位' || Slot.slotName == '门户商城营销案版位' || Slot.slotName == '门户商城裸机版位' || Slot.slotName == '门户商城秒杀版位' || Slot.slotName=='辽宁门户首页营销案版位'}">
							<td>不限</td>
							<td>150x150</td>
						</c:if>
						<td>
							<c:choose>
								<c:when test="${Slot.psResult==null }">
								<font color="#ff0000">待发布</font>
								</c:when>
								<c:otherwise>
								<font color="#009900">已发布</font>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
						<c:if test='${Slot.slotType==2}'><a href="${base}/contentMaintain/ItemList.do?slotId=${Slot.slotId}">查看商品</a> </c:if>
						<ui:permTag src="/${system}/static4ebiz/static/publishSingleOther.do">
						<a href="#" onclick="publishOther(${Slot.tplId})">发布</a>
						</ui:permTag>
						<%-- <a href="${base}/contentMaintain/">预览</a></td> --%>
						
				</c:forEach>
			</tbody>
		</table>
		 <div class="page_c">
        <span class="l inb_a">
<!--        <input type="button" onclick="batAudit();" value="<fmt:message key="tag.audit"/>" class="hand btn60x20" />
            <input type="button" onclick="batchUp();" value="上架" class="hand btn60x20" />
            <input type="button" onclick="batchDown();" value="下架" class="hand btn60x20" />
            <input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" /> -->
        </span>
        <span class="r page">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            <input type="hidden" value="${pagination.pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
            共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="submit" id="skip" class="hand" value='跳转' />
        </span>
    </div>

	</form>

</div></div>
</body>