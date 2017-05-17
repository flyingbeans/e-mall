<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>查看号卡_号卡管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>

<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/uploads.js'/>"></script>
<script type="text/javascript">
function backList(url) {
	document.location = url;
}

$(document).ready(function() {
	
	searchText('#lblSearchText','#lblkeyword',40);
	$("#editLabelsBtn").click(function() {
		tipShow('#editSimCardLabels');
	});
	
	$("#lblQuery").click(function(){
        submitText('#lblSearchText','#lblkeyword',40);
		getData();
	});
	
	$("input[name='ids']").live("click", function(){
		processSelect(this);
	});
	
	$("input[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
		}else{
			a.next("span").empty();
		}
	});
	
	$("#price").blur(function(){
		if(parseFloat($("#price").val()) > 9999999.99){
			$("#"+$("#price").attr("errorspan")).html("<span class='tip errorTip'>"+$("#price").attr("desc")+"</span>");
		}
	});
	
	$("#form111").submit(function(){
		var isSubmit = true;
		if(!check())
		{
			isSubmit = false;
		}
		return isSubmit;
	});
});
function check(){
	var isOk = true;
	$("input[reg1]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			$("#"+a.attr("errorspan")).html("<span class='tip errorTip'>"+a.attr("desc")+"</span>");
			isOk = false;
		}
	});
		if(parseFloat($("#price").val()) > 9999999.99){
			$("#"+$("#price").attr("errorspan")).html("<span class='tip errorTip'>"+$("#price").attr("desc")+"</span>");
			isOk = false;
	}
	return isOk;
}
$(function() {
	$("#tabs a").each(function() {
		if($(this).attr("class").indexOf("here") == 0) {
			tObj = $(this);
		}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var rel = $(this).attr("rel");
            var rev = $(this).attr("rev");
			var rel_t = tObj.attr("rel");
			tObj.attr("class","nor");
			$(this).attr("class","here");
            if($(rev).length) {
            	$(rev).show();
            } else {
            	$('#submitDis').hide();
            }
			$(rel_t).hide();
			$(rel).show();
			tObj = $(this);
			if(rel == '#tab_2') {
				FCKeditorAPI.GetInstance('simcardDesc').Focus();
			}
		});
	});
});

function getData() {
	var lblkeyword=$("#lblkeyword").val();
	var lblPageNo=$("#lblPageNo").val();
	$.ajax({
		type:"post",
		url:"${path}/simcard/getAvlLabels.do",
		data:{lblkeyword:lblkeyword,lblPageNo:lblPageNo},
		complete:viewData
	});
}

function viewData(data) {
	//$('#responseTexts').val=data.responseText;
	var pagination = eval("("+data.responseText+")");
	viewTable(pagination[0].pagination);
	viewPage(pagination[0].pagination);
}

function viewTable(pagination) {
	var content="";
    var len = pagination.list.length;
    for(var i=0;i<len;i++){
    	var lblId = pagination.list[i].labelId;
    	var lblNo = pagination.list[i].labelNum;
    	var lblName = pagination.list[i].labelName;
    	var lblDesc = pagination.list[i].labelDesc;
    	var lblStatus = 0;
    	if (pagination.list[i].status == 1) {
    		lblStatus = 1;
    	} else {
    		lblStatus = 0;
    	}
    	content+="<tr";
    	content+=" id='lblIdTip"+lblId+"'>";
    	content+="<td>"+lblNo+"</td>";
    	content+="<td>"+lblName+"</td>";
    	content+="<td class='nwp'>"+lblDesc+"</td>";
    	if (lblStatus == 1) {
    		content+="<td>启用</td>";
    	}
		if (lblStatus == 0) {
			content+="<td>停用</td>";
    	}
		var tempValue = '{"lblId":"'+lblId+'","lblNo":"'+lblNo+'","lblName":"'+lblName+'"}';
		content+="<td><input type='button' name='ids' class='hand btn60x20' value='选择' tempValue='"+tempValue+"'/></td>";
		content+="</tr>";
	}
	$("#viewlblID").html(content);
}

function viewPage(pagination) {
	var page="";
	page+="<span class='r page inb_a'>";
	if(pagination.pageNo==1){
		page+="<fmt:message key='tag.page.previous'/>&nbsp;";
	}else{
		page+="<a href='javascript:void(0);' onclick='gotoPage("+pagination.prePage+")'><fmt:message key='tag.page.previous'/></a>";
	}
	if(pagination.totalPage<=pagination.pageNo){
		page+="<fmt:message key='tag.page.next'/>&nbsp;";
	}else{
		page+="<a href='javascript:void(0);' onclick='gotoPage("+pagination.nextPage+")'><fmt:message key='tag.page.next'/></a>";
	}
	page+="</span>";
	$("#pagelblID").html(page);
}

function gotoPage(pageNo){
	$("#lblPageNo").val(pageNo);
	getData();
}

function processSelect(obj){
	var tempValue=$(obj).attr("tempValue");
	var record=eval("("+tempValue+")");
	var lblId = record.lblId;
	var lblName = record.lblName;
	var lblNo = record.lblNo;
	
    var size = $("#lblIdTab"+lblId).length;
    var content  = "";
    if(size==0){
    	content+="<tr";
    	content+=" id='lblIdTab"+lblId+"'>";
    	content+="<td>"+"<input type='hidden' id='lblIds' name='lblIds' value='"+lblId+"' />"+lblNo+"</td>";
    	content+="<td>"+lblName+"</td>";
    	content+="<td>"+"<a href='javascript:void(0);' onclick='deleteLabel("+lblId+");'>删除</a>"+"</td>";
    	content+="</tr>";
    	
        $("#tbodylbl").append(content);
    }else{
    	alert("该标签已添加，不能重复加入标签！");
    }
}

function deleteLabel(lblId) {
	$("#lblIdTab"+lblId).remove();
}
</script>

</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system }/common/simcardmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

	<c:url value="/${system }/simcard/listSimCard.do?saleStatus=1" var="backurl"/>
	
    <div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<a href="<c:url value="/${system }/simcard/listSimCard.do?saleStatus=1"/>" title="号卡管理">号卡管理</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑号卡</span>

    </div>
    <%--
    <h2 class="h2_ch">
    	<span id="tabs" class="l">
			<a href="javascript:void(0);" rel="#tab_1" rev="#submitDis" title="基本信息" class="here">基本信息</a>
			<a href="javascript:void(0);" rel="#tab_2" rev="#submitDis" title="号卡描述" class="nor">号卡描述</a>
		</span>
	</h2>
     --%>
    <form id="form111" name="form111" action="${path}/simcard/updateSimCard.do" method="post" enctype="multipart/form-data">
		<ul id="tab_1" class="uls edit set">
			<li><label>号码：</label><span><c:out value="${card.simcardNumber}"/>&nbsp;</span>
			</li>
			<li><label>号段：</label><span><c:out value="${card.simcardRange}"/>&nbsp;</span>
			</li>
			<li><label>号码归属地：</label><span><c:out value="${card.simcardLocale}"/>&nbsp;</span>
			</li>
			<li><label>号码标签：</label><span>&nbsp;</span><input type="button" id="editLabelsBtn" name="editLabelsBtn" value="编辑标签" class="pointer" />
			</li>
			<li><label>&nbsp;</label>
				<div class="pre">
					<table id="tbodylbl" cellspacing="0" summary="" class="tab">
						<tr>
							<th>标签编号</th>
							<th>标签名</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${labels}" var="e">
						<tr id="lblIdTab${e.labelId}">
							<td><input type="hidden" id="lblIds" name="lblIds" value="${e.labelId}" />${e.labelNum}</td>
							<td>${e.labelName}</td>
							<td><a href="javascript:void(0);" onclick="deleteLabel(${e.labelId});">删除</a></td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</li>
			<li><label>所属品牌：</label><span><c:out value="${card.brandName}"/>&nbsp;</span>
			</li>
			<li><label>主套餐：</label>
				<div class="pre">
					<table cellspacing="0" summary="" class="tab">
						<tr>
							<th width="12%">套餐编号</th>
							<th width="15%">套餐名称</th>
							<th width="15%">所属品牌</th>
							<th width="15%">套餐描述</th>
						</tr>
						<c:if test="${not empty suit}" >
						<tr>
							<td>${suit.suitNo}</td>
							<td class="nwp">${suit.suitName}</td>
							<td>${suit.brandName}</td>
							<td class="nwp"><c:out value="${suit.suitDesc}" escapeXml="true"/></td>
						</tr>
						</c:if>
					</table>
				</div>
			</li>
			<li>
				<label>预存金额：</label>
				<input type="text" id="price" name="price" value="<fmt:formatNumber type="number" value="${card.prepaid/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber>" class="text state" reg1="^(([1-9]+)|([0-9]+\.{0,1}[0-9]{0,2}))$" maxlength="10" desc="请输入大于0小于10000000的数字，最多保留两位小数！" errorspan="prepaidStyle"/><span id="prepaidStyle" class="pos"></span>
			</li>
			<li><label>上下架状态：</label>
			<input type="radio" group="show" name="showStatus" value="1" class="txt" <c:if test="${card.showStatus==1}"> checked</c:if> />上架&nbsp;&nbsp;
			<input type="radio" group="show" name="showStatus" value="0" class="txt" <c:if test="${card.showStatus==0}"> checked</c:if> />下架
			</li>
		</ul>
		<%--edit byWenxian屏蔽号卡描述功能 --%>
		<%-- 
		<div id="tab_2" class="edit" style="display: none">
			<textarea name="simcardDesc" id="simcardDesc">${card.simcardDesc}</textarea>
			<script type="text/javascript">   
				var ${"simcardDesc"} = new FCKeditor('simcardDesc');
				${"simcardDesc"}.BasePath = '${path}/res/plugins/fckeditor/';
				${"simcardDesc"}.Config["CustomConfigurationsPath"] = "${path}/res/plugins/fckeditor/myconfig.js";
				${"simcardDesc"}.Config["LinkBrowser"] = false;
				${"simcardDesc"}.Config["ImageBrowser"] = false;
				${"simcardDesc"}.Config["FlashBrowser"] = false;
				${"simcardDesc"}.Config["MediaBrowser"] = false;
				${"simcardDesc"}.Config["LinkUpload"] = true;
				${"simcardDesc"}.Config["ImageUpload"] = true;
				${"simcardDesc"}.Config["FlashUpload"] = true;
				${"simcardDesc"}.Config["MediaUpload"] = true;
				${"simcardDesc"}.Config["LinkUploadURL"] = "${path}/uploads/fckUpload.do";
				${"simcardDesc"}.Config["ImageUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Image";
				${"simcardDesc"}.Config["FlashUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Flash";
				${"simcardDesc"}.Config["MediaUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Media";
				${"simcardDesc"}.ToolbarSet = "My";
				${"simcardDesc"}.Width = "100%";
				${"simcardDesc"}.Height = "400";				
				${"simcardDesc"}.ReplaceTextarea();
				//${name}.Value = "";
				//${name}.Create();
			</script>
		</div>
		--%>
		<ul class="uls edit set">
			<li><label>&nbsp;</label><input type="submit" class="hand btn83x23" value="提交" /><input type="button" class="hand btn83x23b" id="reset1" value='<fmt:message key="button.cancel"/>' onclick="backList('${backurl}')"/>
				<input type="hidden" id="simcardId" name="simcardId" value="${card.simcardId}"/>
			</li>
		</ul>
	</form>
    <div class="loc">&nbsp;</div>
	
	<div class="edit set"><h2>操作记录</h2></div>
    <iframe src="${base}/consolelog/top10.do?entityId=${card.simcardId}&tableName=EB_SIMCARD" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>
    
</div></div>
</body>

