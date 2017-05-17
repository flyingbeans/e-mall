<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>营销案审核_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript">
	$(document).ready(function(){
		var obj=null;
		$("a[group]").click(function(){
			$("#errorInfoAdd").html("<label>&nbsp;</label>");
		    $("#itemNote").val("");
		    tipHide("#errorInfoAdd");
			tipShow('#addItemNote');
			obj=$(this);
		});
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
			var ajaxData="offerGroupId="+itemId+"&status="+showStatus+"&itemNote="+itemNote;
	        $.ajax({
	        	type:"post",
	         	url:"${base}/activity/updateOfferGroupStatus.do",
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
	             		window.location.href ="${base}/activity/listOfferGroup.do?showStatus=0&labelStatus=5";
	             	}else{
	             		alert(result._mes);
	             	}
	             	 tipHide('#addItemNote');
	        	}
	        });
		});
	});
	
	function singleDel(url){
		tipShow('#confirmDiv');
        $("input[id='confirmDivOk']").click(function(){
	    	$("#form1").attr("action",url);
		    $("#form1").submit();
		})
/* 	    if(confirm("确定删除记录")){
	    	$("#form1").attr("action",url);
		    $("#form1").submit();
	    } */
	}
	$(document).ready(function(){
		$("#all").click(function(){
	     	if($("#all").attr("checked")){
	        	$("input[name='ids']").attr("checked", true);
	        }else{
	        	$("input[name='ids']").attr("checked", false);
	        }
	    });
		$("#checkall").click(function(){
			$("input[name='ids']").attr("checked", true);
			$("#all").attr("checked",true)
		});
		$("#cancelall").click(function(value){
			$("input[name='ids']").attr("checked", false);
			$("#all").attr("checked",false)
		});

        $("#"+("label"+${labelStatus})).attr("class","here");
		<c:if test="${message!=null }">
			alert('<c:out value="${message }"/>');
		</c:if>
	});

    function orderBy(orderBy,orderByStatus){
        $("#orderBy").val(orderBy);//代表按那个字段排序
        $("#orderByStatus").val(orderByStatus);//代表排序方式，即升序还是降序
        goSearch('#form1','#userSearch');
    }

    $(function(){
        searchText('#searchText','#offerGroupName',40);
        pageInitialize('#form1','#offerGroupName');
        $('#goSearch').click(function(){
            $("#pageNo").val(1);
            goSearch('#form1','#offerGroupName','#areaIds');
        });
    });

    function doIt(ajaxData,type){
         var result=false;
        $.ajax({
             type:"POST",
             async: false,
             url:"${base}/activity/changeSatus.do",
             data:(ajaxData),
             success:function(data){
                 if(data == "true"){
                 result=true;
                 }
            }
			});
        if(result){
            tipShow('#addTagTip');
            //var name = window.prompt("请输入操作备注","");
            if(type==1)alert("审核未通过成功");
            if(type==2)alert("审核通过成功");
            if(type==3)alert("下架成功");
            if(type==4)alert("上架成功");
        }
         if(!result){
                alert("操作失败!");
            }
             if(${labelStatus==0}) {
                   window.location.href ="${base}/activity/listAudit.do?labelStatus=0";
            }
          if(${labelStatus==1}) {
                   window.location.href ="${base}/activity/listAudit.do?auditStatus=0&labelStatus=1";
            }
          if(${labelStatus==2}) {
                   window.location.href ="${base}/activity/listAudit.do?auditStatus=2&labelStatus=2";
            }
            if(${labelStatus==3}) {
                   window.location.href ="${base}/activity/listAudit.do?auditStatus=1&labelStatus=3";

            }
            
    }

    function changeStaus(offerGroupId,status,showStatus,type){
             if(showStatus==0&&status==2){
            alert("上架商品不能直接未审核,请先下架商品");
            return false;
        }
               if((status==0||status==2)&&showStatus==0){
            alert("未审核商品不能上架,请先审核商品");
            return false;
        }
        var data="auditStatus="+status+"&offerGroupId="+offerGroupId+"&showStatus="+showStatus;
        $('#urlAddress').val(data);
         $('#_type').val(type);
         tipShow('#addTagTip');

    }
	
    function publishOfferGroup(offerGroupId){
    	tipShow('#staticLoadDiv');
    	var ajaxData="topicId="+offerGroupId;
        $.ajax({
        	type:"post",
         	url:"${staticPublishUrlPre}/static4ebiz/static/publishSingleTopic.do",
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

    <div class="loc icon">
        <span class="l">
            <samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<span class="gray" title="营销案审核">营销案审核</span>
        </span>
        <span class="r">
            <img src="<c:url value="/ecps/console/images/orange.gif"/>">即将开始<img src="<c:url value="/ecps/console/images/red.gif"/>">马上开始<img src="<c:url value="/ecps/console/images/green.gif"/>">正在进行<img src="<c:url value="/ecps/console/images/gray.gif"/>">时间截止
        </span>
    </div>

<form id="form1" name="form1" action="${base}/activity/listOfferGroup.do" method="post">

    <h2 class="h2_ch">
    <span id="tabs" class="l">
        <a href="${base}/activity/listAudit.do?labelStatus=0" title="全部营销案" class="nor" id="label0" >全部</a>
        <a href="${base}/activity/listAudit.do?auditStatus=0&labelStatus=1"title="待审核营销案" class="nor" id="label1">待审核</a>
        <a href="${base}/activity/listAudit.do?auditStatus=2&labelStatus=2"title="审核不通过营销案" class="nor" id="label2">审核不通过</a>
        <a href="${base}/activity/listAudit.do?auditStatus=1&labelStatus=3"title="已审核营销案" class="nor" id="label3">已审核</a>
    </span>
    </h2>

    <input type="hidden" id="labelStatus" name="labelStatus" value="${labelStatus}">
    <input type="hidden" id="auditStatus" name="auditStatus" value="${offerGroup.auditStatus}">
    <input type="hidden" id="showStatus" name="showStatus" value="${offerGroup.showStatus}">
	<div class="sch">
        <input type="hidden" id="offerGroupName" name="offerGroupName" />
        <p><fmt:message key="tag.search"/>：<select name="offerType">
        <option value="0">全部营销类型</option>
        <!-- 
        <option value="1"<c:if test='${offerGroup.offerType==1 }'> selected</c:if>>购物送礼</option>
        -->
        <option value="2"<c:if test='${offerGroup.offerType==2 }'> selected</c:if>>预存话费送手机</option>
        <option value="3"<c:if test='${offerGroup.offerType==3 }'> selected</c:if>>购买手机送话费</option>
        </select>
        <select name="areaIds">
        	<option value="0">请选择归属地</option>
        	<c:forEach items='${roleAreaList}' var='myRoleArea'>
        		<option  value='${myRoleArea.areaId}' <c:if test='${myRoleArea.areaId == offerGroup.areaIds }'> selected</c:if>><c:out value='${myRoleArea.areaName}'></c:out></option>
        	</c:forEach>
        </select>
        <input type="text" id="searchText" name="searchText" value="${offerGroup.offerGroupName }" title="请输入营销案名称或简称或编号" class="text20 medium gray" /><input type="submit" id="goSearch" class="hand btn60x20" value="<fmt:message key="tag.search"/>" />
        </p>
    </div>
	<!-- 
    <div class="page_c">
        <span class="l"></span>
        <span class="r inb_a">
            <a href="${base}/activity/forwardAddOfferGroup.do"  class="btn80x20">添加营销案</a>
        </span>
    </div>
	 -->
	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="全选/取消" /></th>
			<th>简称</th>
			<th>归属地</th>
			<th class="wp">营销案名称</th>
			<th>营销类型</th>
			<th>档次数</th>
			<th>时效</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="offerGroup">
			<tr>
				<td><input type="checkbox" name="ids" value="${offerGroup.offerGroupId}"/></td>
				<td class="nwp"><c:out value='${offerGroup.shortName}'/></td>
				<td>
					<c:forEach items='${offerGroup.listOfferGroupArea}' var='myOfferGroupArea'>
						<c:out value='${myOfferGroupArea.areaName}'></c:out>
					</c:forEach>
				</td>
				<td><c:out value='${offerGroup.offerGroupName}'/></td>
				<td>
					<c:if test='${offerGroup.offerType==1}'>购物送礼</c:if>
					<c:if test='${offerGroup.offerType==2}'>预存话费送手机</c:if>
					<c:if test='${offerGroup.offerType==3}'>购买手机送话费</c:if>
				</td>
				<td>
					<c:choose>
						<c:when test="${offerSizeMap[offerGroup.offerGroupId].offerSize!=null}">
							<a href="${base}/activity/listoffer.do?offerGroupId=${offerGroup.offerGroupId}&offerType=${offerGroup.offerType}"><c:out value="${offerSizeMap[offerGroup.offerGroupId].offerSize}"/></a>
						</c:when>
						<c:otherwise>0</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:if test='${offerGroup.activityStatus==1}'><img title="即将开始" src="<c:url value='/ecps/console/images/orange.gif'/>" /></c:if>
					<c:if test='${offerGroup.activityStatus==2}'><img title="马上开始" src="<c:url value='/ecps/console/images/red.gif'/>" /></c:if>
					<c:if test='${offerGroup.activityStatus==3}'><img title="正在进行" src="<c:url value='/ecps/console/images/green.gif'/>" /></c:if>
					<c:if test='${offerGroup.activityStatus==4}'><img title="时间截止" src="<c:url value='/ecps/console/images/gray.gif'/>" /></c:if>
				</td>

				<td>
                    <a href="${base}/activity/viewOfferGroup.do?offerGroupTag=audit&offerGroupId=${offerGroup.offerGroupId}" title="查看">查看</a>	
                    <c:if test="${labelStatus==0}">
                        <a href="${base}/activity/checkOfferGroup.do?offerGroupId=${offerGroup.offerGroupId}&labelStatus=0">审核</a>
                    </c:if>
                    <c:if test="${labelStatus==1}">
                        <a href="${base}/activity/checkOfferGroup.do?offerGroupId=${offerGroup.offerGroupId}&auditStatus=0&labelStatus=1">审核</a>
                    </c:if>
                    <c:if test="${labelStatus==2}">
                        <a href="${base}/activity/checkOfferGroup.do?offerGroupId=${offerGroup.offerGroupId}&auditStatus=2&labelStatus=2">审核</a>
                    </c:if>
                    <c:if test="${labelStatus==3}">
                        <a href="${base}/activity/checkOfferGroup.do?offerGroupId=${offerGroup.offerGroupId}&auditStatus=1&labelStatus=3">审核</a>
                    </c:if>

                    <c:if test="${labelStatus==0||labelStatus==1||labelStatus==2||labelStatus==3||labelStatus==4 ||labelStatus==5}">
                    	<a href="${base}/activity/listoffer.do?offerGroupId=${offerGroup.offerGroupId}&offerType=${offerGroup.offerType}">查看档次</a>
                    </c:if>

                    
                    <!--  
                    <c:if test="${labelStatus==0}">
                    	<c:if test='${offerGroup.showStatus==0}'>
                    		<ui:permTag src="/${system}/static/toPublishJsp.do">
		                    <a href="#" onclick="publishOfferGroup(${offerGroup.offerGroupId})">发布</a>
							</ui:permTag>
                    	</c:if>
                    </c:if>
                    -->
                   
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="10">
                	选择： <a id="checkall" href="javascript:void(0);" >全选</a> <samp>-</samp> 
                		  <a id="cancelall" href="javascript:void(0);" >取消</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="page_c">
        <span class="r page">
            <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            <input type="hidden" value="${pageNo}" id="pageNo" name="pageNo" />
            <input type="hidden" value="${pagination.totalCount}" id="paginationPiece" name="paginationPiece" />
            <input type="hidden" value="${pagination.pageNo}" id="paginationPageNo" name="paginationPageNo" />
            <input type="hidden" value="${pagination.totalPage}" id="paginationTotal" name="paginationTotal" />
            <input type="hidden" value="${pagination.prePage}" id="paginationPrePage" name="paginationPrePage" />
            <input type="hidden" value="${pagination.nextPage}" id="paginationNextPage" name="paginationNextPage" />
            共<var id="pagePiece" class="orange">0</var>条<var id="pageTotal">1/1</var><span id="previousNo" class="inb" title="上一页">上一页</span><a href="javascript:void(0);" id="previous" class="hidden" title="上一页">上一页</a><span id="nextNo" class="inb" title="下一页">下一页</span><a href="javascript:void(0);" id="next" class="hidden" title="下一页">下一页</a><input type="text" id="number" name="number" class="txts" size="3" /><input type="button" id="skip" class="hand" value='跳转' />
        </span>
    </div>
</form>
</div></div>
</body>
