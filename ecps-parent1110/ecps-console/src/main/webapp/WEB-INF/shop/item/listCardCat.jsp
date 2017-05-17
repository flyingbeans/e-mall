<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>商品分类_分类管理_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
<meta name="tag" content="tagName" />
<link rel="stylesheet" type="text/css" href="<c:url value='/${system}/scripts/tabletree/css/jquery.treeTable.css'/>"/>
<script type="text/javascript" src="<c:url value='/${system}/scripts/tabletree/js/jquery.treeTable.min.js'/>"></script>
<script type="text/javascript">
	function publishCat(url){
		tipShow('#staticLoadDiv');
		var ajaxData="";
		$.ajax({
        	type:"post",
         	url:url,
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

    function isChecked(){
        var isselected=false;
        $("input[name='ids']").each(function(){
            if($(this).attr("checked")){
                isselected=true;
            }
        });
        return isselected;
    }
    var flag=null;
    function singleDel(url){
    	tipShow('#confirmDiv');
    	objUrl=url;
    	flag="singleDel";
/*         if(confirm("确定删除记录")){
            document.location=url;
        } */
    }
    function batchDel(){
        if(!isChecked()){
            alert("请选择记录");
            return;
        }
        tipShow('#confirmDiv');
        flag="batchDel";

    }
    
    $(document).ready(function() {
		$("#treeid").treeTable({treeColumn:0});
		$("input[id='confirmDivOk']").click(function(){
			if(flag=="singleDel"){
				document.location=objUrl;
			}else if(flag=="batchDel"){
				var form = document.getElementById("form1");
	            form.action="${base}/item/cat/batchDelCatById.do";
	            form.submit();
			}else{
				return;
			}
			
		})
	});
	
    $(document).ready(function(){
		<c:if test="${message!=null }">
			alert("<c:out value='${message }'/>");
		</c:if>
		<ui:permTag src="/${system}/static/toPublishJsp.do">
        	$(".publish").show();
     	</ui:permTag>
	});
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title'/>&nbsp;&raquo;&nbsp;<a href="${path}/item/cat/listCat.do?catType=1" title="分类管理">分类管理</a>&nbsp;&raquo;&nbsp;<span class="gray" title="商品分类">商品分类</span></div>
    <h2 class="h2_ch"><span id="tabs" class="l">
    <a href="${path}/item/cat/listCat.do?catType=1"  title="实体商品" class="nor">实体商品</a>
    <a href="${path}/card/listCardCat.do?catType=2"  title="移动号卡" class="here">移动号卡</a>
    </span></h2>
    <form id="form1" name="form1" action="${path}/card/listCardCat.do" method="post">
    <div class="page_c">
    	<span class="l">
            <c:url value="/${system }/item/cat/addcat.do" var="addcat">
            	<c:param name="catType" value="2"/>
            </c:url>
        </span>
        <span class="r inb_a">
            <a href="${addcat}" class="btn80x20">添加分类</a>
        </span>
    </div>
    <c:url value="/${system }/item/cat/getCat.do?itemType=2" var="getCat"/>
	<c:url value="/${system }/item/feature/listFeature.do?itemType=2" var="listFeature"/>
    <c:url value="/${system }/item/cat/deleteCatById.do" var="deleteCatById"/>

    <ui:catTable name="treeid" list="listcat" rootId="0" delURL="${deleteCatById}" editURL="${getCat}" paramURL="${listFeature}" staticURL="${staticPublishUrlPre}/static4ebiz/static/publishSingleChannel.do"/>

    </form>
</div></div>
</body>
