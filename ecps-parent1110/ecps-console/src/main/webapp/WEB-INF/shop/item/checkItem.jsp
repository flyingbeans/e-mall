<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>审核商品_实体商品_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/uploads.js'/>"></script>
<script language="javascript" type="text/javascript">

function swapNode(node1,node2)
{
var _parent=node1.parentNode;
var _t1=node1.nextSibling;
var _t2=node2.nextSibling;
if(_t1)
_parent.insertBefore(node2,_t1);
else
_parent.appendChild(node2);
if(_t2)
_parent.insertBefore(node1,_t2);
else
_parent.appendChild(node1);
}

function swap(index1,index2){
swapNode(document.getElementById(index1),document.getElementById(index2));
}

function up(index){
   var _element=document.getElementById("imgs"+index+"Img");
    var _element1=document.getElementById("imgs"+(index-1)+"Img");
    if(_element1!=null){
        var imagTemp=_element.getAttribute("src");
        var imagTemp1=_element1.getAttribute("src");
         $("#imgs"+index+"Img").attr("src",imagTemp1);
        $("#imgs"+(index-1)+"Img").attr("src",imagTemp);

         var fileTemp=$("#imgsFilePath"+index).val();
         var fileTemp1=$("#imgsFilePath"+(index-1)).val();
           $("#imgsFilePath"+index).val(fileTemp1);
           $("#imgsFilePath"+(index-1)).val(fileTemp);
    }
}
function down(index){
   var _element=document.getElementById("imgs"+index+"Img");
    var _element1=document.getElementById("imgs"+(index+1)+"Img");
    if(_element1!=null){
        var imagTemp=_element.getAttribute("src");
        var imagTemp1=_element1.getAttribute("src");
         $("#imgs"+index+"Img").attr("src",imagTemp1);
        $("#imgs"+(index+1)+"Img").attr("src",imagTemp);

         var fileTemp=$("#imgsFilePath"+index).val();
         var fileTemp1=$("#imgsFilePath"+(index+1)).val();
           $("#imgsFilePath"+index).val(fileTemp1);
           $("#imgsFilePath"+(index+1)).val(fileTemp);
    }
}
$(function(){
	var divNum=1;
	var tObj;
	$("#tabs a").each(function(){
		if($(this).attr("class").indexOf("here") == 0){tObj = $(this)}
		$(this).click(function(){
			var c = $(this).attr("class");
			if(c.indexOf("here") == 0){return;}
			var rel = $(this).attr("rel");
            var rev = $(this).attr("rev");
			var rel_t = tObj.attr("rel");
			tObj.attr("class","nor");
			$(this).attr("class","here");
            if($(rev).length){$(rev).show();}else{$('#submitDis').hide();}
			$(rel_t).hide();
			$(rel).show();
			tObj = $(this);
		});
	});
	$("input[reg1]").blur(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			if(a.next("span").length ==0){
			a.after("<span>"+a.attr("desc")+"</span>");
			}
		}else{
			a.next("span").remove();
			}
		});
	//实现页面规格的自动增加和删除
	$("#button2").click(function(){
		var d=(divNum++);
		$("#button2").before("<div class='sp_0' id='sp_"+d+"'>"+$("#sp_0").html().replace(/specradio/g,d+"specradio")+"</div>");
		$("#button3").removeAttr("disabled");
		});
	$("#button3").click(function(){
		$("#button2").prev("div").remove();
		divNum--;
		var i=$("div[id*='sp']");
		if(i.length==1){
			$("#button3").attr("disabled","disabled");
			}
		});
	$(".sub1").click(function(){
         if (!updateList()) {
            alert("必须上传图片");
			return;
		} 
        var s=true;
		$("#myForm").find("[reg1],[desc]").each(function(){
		var a=$(this);
		var reg = new RegExp(a.attr("reg1"));
		var objValue = a.val();
		if(!reg.test(objValue)){
			    if(a.next("span").length ==0){
				a.after("<span>"+a.attr("desc")+"</span>");
			    }
					s=false;
					return;
				}
			});
        if(s){
                 //敏感词
        var sensitivity=true;
       var content = FCKeditorAPI.GetInstance("itemDesc").GetXHTML(true);
          $.ajax({
             type:"POST",
             async: false,
             url:"validSen.do",
             data:"itemName="+$("#itemName").val()+"&promotion="+$("#promotion").val()+"&keywords="+$("#keywords").val()+"&pageDesc="+$("#pageDesc").val()+"&itemDesc="+content,
             success:function(responseText){
               var dataObj=eval("("+responseText+")");
               if(dataObj[0]._success=="false"){
                  alert(dataObj[0]._message);
                   sensitivity=false;
               }else if(dataObj[0]._success=="true"){
                 sensitivity=true;
               }
            }
            });
        if(!sensitivity){
          return;
       }
        var shenhe=$(this).val();
       if(shenhe=="确认审核"){
    	   $("#myForm").append("<input type='hidden' name='auditStatus' id='auditStatus' value='"+1+"'/>");
        }else{
      	   $("#myForm").append("<input type='hidden' name='auditStatus' id='auditStatus' value='"+2+"'/>");
        }
		var iNum=0;
		$("#tab_3").each(function(){
             $(this).find(".paraValue4").each(function(){
                    var a=$(this);
                    var pKey=a.val();
                    var pType=a.next();
                    var pVal="";
                    if(typeof(pType.attr("type")) == "undefined"){
                       pVal=pType.val();
                     }
                    if(pType.attr("type") == "text"){
                       pVal=a.next(".paraValue").val();
                     }
                    if(pType.attr("type") == "radio"){
                       pVal=a.next("input:checked").val();
                    }
                    if(pType.attr("type") == "checkbox"){
                    	 var b=a.nextAll("input:checked");
                         for(var jj=0;jj<b.length;jj++){
                            pVal=pVal+b.eq(jj).val()+",";  
                         }
                    }
                    if(pVal != "" && typeof(pVal) !="undefined"){
                        var paraVal=pKey+"|"+pVal;
                    $("#myForm").append("<input type='hidden' name='paraValue' id='paraValue' value='"+paraVal+"'/>");
                        }
                 });
			});
		$("#myForm").submit();
        }
		});

	$("#showStatus3").click(function(){
		var a=$("#auditStatus1").attr("checked");
		if("checked" != a){
			alert("必须得审核通过后，才能上架");
			$("#showStatus4").attr("checked",true);
		}
	});
	$("input[name='businessScope']").each(function(){
		var value = $(this).val();
		<c:forEach items='${itemBusinessScopeList}' var="itemBusinessScope">
			if('${itemBusinessScope.businessScopeId}' == value){
				$(this).attr("checked",true);
			}
	    </c:forEach>
	    $(this).attr("disabled",true);
	});
	 $("#auditStatus0").click(function(){
	    	$("#showStatus4").attr("checked",true);
	    	$("#showStatus1").attr("value","1");
	        });
	    $("#auditStatus2").click(function(){
	    	$("#showStatus4").attr("checked",true);
	    	$("#showStatus1").attr("value","1");
	    });
	    $("#showStatus4").click(function(){
	    	 $("#showStatus1").attr("value","1");
     });
});

function addPic() {
	var imgsCount = $("#imgsCount").val();
	var imgsIndex = $("#imgsIndex").val();
	if (imgsCount < 5) {
		var imgsBlankValue = $("#imgsBlank").val();
		var oneTr = '<tr id="imgsTr'+imgsIndex+'">'+
			'<td>'+
			'<span class="pic"><img id="imgs'+imgsIndex+'Img" name="imgs'+imgsIndex+'Img" src="'+imgsBlankValue+'" width="100" height="100" /></span>'+
			'<input type="file" id="imgs'+imgsIndex+'File" name="imgs'+imgsIndex+'File" class="file" onchange="submitUploads(\''+imgsIndex+'\')" />'+
			'<input type="hidden" id="imgsFilePath'+imgsIndex+'" name="imgsFilePath'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileDesc'+imgsIndex+'" name="imgsFileDesc'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileIndex'+imgsIndex+'" name="imgsFileIndex'+imgsIndex+'" value="'+imgsIndex+'" />'+
			'</td>'+
			'<td class="nwp">'+
			'<input type="text" id="imgsDesc'+imgsIndex+'" name="imgsDesc'+imgsIndex+'" class="text20 state" />'+
			'</td>'+
			'<td>'+
            '<input class="hand btn60x20" onclick="delPic(\''+imgsIndex+'\')" type="button" value="删 除" />'+
			'</td>'+
			'</tr>';
		$("#imgsPre tr").last().prev().after(oneTr);
		imgsCount++;
		imgsIndex++;
		$("#imgsCount").val(imgsCount);
		$("#imgsIndex").val(imgsIndex);
	} else {
		alert("只能添加5个图片，图片已达到上限！");
	}
}

function delPic(imgsIndex) {
	var filePath = $("#imgsFilePath"+imgsIndex).val();
	if (filePath != "") {
		deleteUploads(filePath);
	}
	
	var imgsCount = $("#imgsCount").val();
	imgsCount--;
	$("#imgsCount").val(imgsCount);
	$("#imgsTr"+imgsIndex).remove();
}

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/listAudit.do?auditStatus=0"/>" title="<fmt:message key='menu.leftItem.auditList'/>"><fmt:message key='menu.leftItem.auditList'/></a>&nbsp;&raquo;&nbsp;<span class="gray">查看商品</span>
    <a href="<c:url value="/${system }/item/listAudit.do?auditStatus=0"/>" title="返回商品审核" class="inb btn80x20">返回商品审核</a>
</div>
<form action="${path}/item/updateItem.do" name="myForm" id="myForm" method="post">
<h2 class="h2_ch"><span id="tabs" class="l">
<a href="javascript:void(0);" rel="#tab_1" rev="#submitDis" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" rel="#tab_2" rev="#submitDis" title="商品描述" class="nor">商品描述</a>
<a href="javascript:void(0);" rel="#tab_3" rev="#submitDis" title="商品参数" class="nor">商品参数</a>
<a href="javascript:void(0);" rel="#tab_4" title="商品规格" class="nor">商品规格</a>
<a href="javascript:void(0);" rel="#tab_5" title="商品规格" class="nor">包装清单</a>
</span></h2>
<div id="tab_1" class="edit set">
	<input type="hidden" name="itemId" id="itemId" value="${ebItem.itemId}"/>
	<p><label>商品编号：</label>${ebItem.itemNo}</p>
    <p><label><samp>*</samp>商品名称：</label><input type="text" reg1="^.{0,100}$" desc="100个任意字符以内" id="itemName" name="itemName" class="text state" value="${ebItem.itemName}" escapeXml="false" disabled="true"/>
	</p>
	<p><label><samp>*</samp>商品分类：</label><select disabled="true"><option>${ebCat.catName}<option></select>
        <input type="hidden" id="catId" name="catId" value="${ebCat.catId}" class="txt" />
	</p>
	<p><label><samp>*</samp>商品品牌：</label><select  id="brandId" name="brandId" disabled="true">
    <c:forEach items="${blist}" var="b">
    <option<c:if test="${b.brandId == ebItem.brandId}"> selected</c:if> value="${b.brandId}">${b.brandName}</option>
    </c:forEach>
	</select></p>
	<p><label><samp>*</samp>运营范围:</label>
		<c:forEach items="${businessScopeList}" var="businessScope">
			<input name="businessScope" type="checkbox"  value="${businessScope.businessScopeId}"/><c:out value="${businessScope.businessScopeName}"></c:out>&nbsp;&nbsp;
		</c:forEach>
	</p>
	<p><label>赠品信息:</label>
		<c:if test="${phone!=''}">
			<c:if test="${phone=='0'}">
				<input id="phone" name="phone" type="checkbox"  value="${phone}"  disabled="disabled"/>裸机送&nbsp;&nbsp;
			</c:if>
			<c:if test="${phone=='1'}">
				<input id="phone" name="phone" type="checkbox"  value="${phone}" checked disabled="disabled"/>裸机送&nbsp;&nbsp;
			</c:if>
		</c:if>
		<c:if test="${phone==''}">
			<input id="phone" name="phone" type="checkbox"  value="0"  disabled="disabled"/>裸机送&nbsp;&nbsp;
		</c:if>
		<c:if test="${offer!=''}">
			<c:if test="${offer=='0'}">
				<input id="offer" name="offer" type="checkbox" value="${offer}" disabled="disabled" />营销案送&nbsp;&nbsp;
			</c:if>
			<c:if test="${offer=='1'}">
				<input id="offer" name="offer" type="checkbox" value="${offer}" checked  disabled="disabled"/>营销案送&nbsp;&nbsp;
			</c:if>
		</c:if>
		<c:if test="${offer==''}">
			<input id="offer" name="offer" type="checkbox" value="0" disabled="disabled" />营销案送&nbsp;&nbsp;
		</c:if>
	</p>
	<p><label></label>
		<img id='giftImgImgSrc' src='${rsImgUrlInternal}${ebItem.giftImg}' onerror="this.src='${base}/res/imgs/deflaut.jpg'" height="100" width="100" />
		<input type="text" reg1="^(.{0,100})$" desc="100以内任意字符" id="giftDesc" name="giftDesc" class="text state" value="${ebItem.giftDesc}"  maxlength="100" disabled="disabled"/>
	</p>
    <p><label>标签图：</label>
		<c:if test="${ebItem.tagImg==1 }">无</c:if>
		<c:if test="${ebItem.tagImg==2 }">
			<span style="position:relative;display:block;width:225px;height:290px;margin:-26px 0 0 200px">
				<img src="${base }/res/imgs/p225x290.jpg" width="225" height="290" />
				<img id="upshow" src="${rsImgUrlInternal}${itemTagImg.tagImgUrl }" onerror="this.src='${base}/res/imgs/deflaut.jpg'"  style="position:absolute;top:5px;right:5px" />
			</span>
		</c:if>
	</p>
   	<p><label>促销语：</label><input type="text" reg1="^[a-zA-Z0-9_\u4e00-\u9fa5\s]{0,100}$" desc="100个字符以内,包括汉字、字母与数字" id="promotion" name="promotion" class="text state" value="${ebItem.promotion}" disabled="true"/>
   	</p>
    <p><label>状态：</label><input<c:if test="${ebItem.isNew==1}"> checked</c:if> id="featuredItem" name="featuredItem" type="checkbox" value="1" disabled="true"/>新品&nbsp;&nbsp;<input<c:if test="${ebItem.isGood==1}"> checked</c:if> id="featuredItem" name="featuredItem" type="checkbox" value="2" disabled="true"/>推荐&nbsp;&nbsp;<input<c:if test="${ebItem.isHot==1}"> checked</c:if> id="featuredItem" name="featuredItem" type="checkbox" value="3" disabled="true"/>热卖
    </p>
    <a name="uploadImgs" id="uploadImgs"></a>
    <p><label><samp>*</samp>上传商品图片(90x150尺寸):</label><span id="uploadImgTip1" class="orange">注:该尺寸图片必须为90x150。</span></p>
    <p><label></label>
		<img id='imgSize1ImgSrc' src='${rsImgUrlInternal}${ebItem.imgSize1}' onerror="this.src='${base}/res/imgs/deflaut.jpg'" height="100" width="100" />
		<input type='hidden' id='imgSize1Action' name='imgSize1Action' value='${path}/uploads/upload_pic.do' />
        <input type='hidden' id='imgSize1' name='imgSize1' value='${ebItem.imgSize1}' reg="^.+$" tip="亲！您忘记上传图片了。" />
	</p>
	<p><label><samp>*</samp>上传图片：</label><span id="uploadImgTip" class="orange">注：第一张上传图为默认图。</span></p>

    <div id="imgsPre" class="up_box">
        <table cellspacing="0" summary="上传图片" class="tab2">
            <tr id="imgsTitle">
                <th>上传图片</th>
                <th class="wp">图片描述</th>
                <th>操作</th>
            </tr>
            <c:forEach items='${imageList}' var="item" varStatus="count">
                <tr id="imgsTr${count.index}" >
                    <td>
                        <span class="pic"><img id="imgs${count.index}Img" name="imgs${count.index}Img" src="${item.filePath}" onerror="this.src='${path}/res/imgs/deflaut.jpg'" width="100" height="100" /></span>
<!--                        <input type="file" id="imgs${count.index}File" name="imgs${count.index}File" class="file" onchange="submitUploads('${count.index}')" />-->
                        <input type="hidden" id="imgsFilePath${count.index}" name="imgsFilePath${count.index}" value="${item.filePath}" />
                        <input type="hidden" id="imgsFileDesc${count.index}" name="imgsFileDesc${count.index}" value="${item.fileDesc}" />
                        <input type="hidden" id="imgsFileIndex${count.index}" name="imgsFileIndex${count.index}" value="${count.index}" />
                    </td>
                    <td class="nwp">
                        <input type="text" id="imgsDesc${count.index}" name="imgsDesc${count.index}" value="${item.fileDesc}" class="text20 state" disabled="disabled"/>
                    </td>
                    <td>
<%--                         <input class="hand btn60x20" onclick="up(${count.index})" type="button" value="上 移" /><br />
                        <input class="hand btn60x20" onclick="down(${count.index})" type="button" value="下 移" /><br /> --%>
<!--                        <input class="hand btn60x20" onclick="delPic('${count.index}')" type="button" value="删 除" />-->
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="alg_r" colspan="3">
<!--                    <input class="hand btn83x23b" id="picturesButton" onclick="addPic()" disabled type="button" value="增加图片" />-->
                    <!-- <a href="#uploadImgs" onclick="updateList()">test</a> -->
                    <input type='hidden' id='imgs' name='imgs' value='' />
                    <input type="hidden" id="imgsCount" name="imgsCount" value="${fn:length(imageList)}"/>
                    <input type="hidden" id="imgsIndex" name="imgsIndex" value="${fn:length(imageList)}"/>
                    <input type='hidden' id='imgsUploadAction' name='imgsUploadAction' value='${path}/uploads/upload_pics.do' />
                    <input type='hidden' id='imgsDeleteAction' name='imgsDeleteAction' value='${path}/uploads/upload_delete.do' />
                    <input type='hidden' id='imgsBlank' name='imgsBlank' value='<c:url value='/images/logo266x64.png'/>' />
                </td>
            </tr>
        </table>
    </div>

	<p><label>页面关键词：</label><input type="text" reg1="^[a-zA-Z0-9_\u4e00-\u9fa5]{0,30}$" desc="30个字符以内,包括汉字、字母与数字" id="keywords" name="keywords" class="text state" value="${ebItem.keywords}" disabled="true"/>
	</p>
	<p><label class="alg_t">页面描述：</label><textarea id="pageDesc" reg1="^(.|\n){0,130}$" desc="130个以内的任意字符" escapexml="false" name="pageDesc" class="are" rows="6" cols="45" disabled="true">${ebItem.pageDesc}</textarea>
	</p>
</div>

<div id="tab_2" class="edit" style="display: none">
${ebItem.itemDesc}
</div>

<div id="tab_3" class="edit set" style="display: none">
    <c:if test="${fn:length(list1) == 0}">
    <p><label></label>无属性</p>
    </c:if>
    <c:forEach items="${list1}" var="f" varStatus="status">
        <c:forEach items="${ebPVs}" var="ebPV">
        <c:if test="${ebPV.featureId == f.featureId}">
        <c:set var="e" value="${ebPV.paraValue}" scope="page"></c:set>
        </c:if>
        </c:forEach>
        <p><label>${f.featureName}：</label>
        <c:if test="${f.inputType == 1}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <select class="paraValue" disabled>
            <option value="">请选择</option>
            <c:forEach items="${f.selectValues}" var="f1">
            <option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option>
            </c:forEach>
            </select>
        </c:if>
        <c:if test="${f.inputType == 2}">
            <c:forEach items="${f.selectValues}" var="f2" varStatus="s">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input<c:if test="${e == f2}"> checked</c:if> type="radio" class="paraValue"  id="pradio${s.index}" name="pradio${status.index}" value="${f2}" disabled/>${f2}&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 3}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <c:forEach items="${f.selectValues}" var="f3" varStatus="s">
                <input<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> type="checkbox" class="paraValue" id="pcheck${s.index}" name="pcheck${status.index}" value="${f3}" disabled/>${f3}&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 4}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input type="text" class="text state paraValue" value="${e}" disabled/>
        </c:if>
        </p>
    </c:forEach>
</div>

<div id="tab_4" style="display: none">
<c:forEach items="${ebSkus}" var="ebSku" varStatus="st">
    <div id="sp_0" class="sp_0">
		 <table cellspacing="0" summary="" class="tab3">
            <c:if test="${fn:length(list2) == 0}">
            <tr><th colspan="2" class="gray">&nbsp;&nbsp;<b>默认</b></th></tr>
            </c:if>
            <c:forEach items="${list2}" var="f" varStatus="status">
                <c:forEach items="${ebSku.ebSV}" var="ebSV">
                <c:if test="${ebSV.featureId == f.featureId}">
                <c:set var="e" value="${ebSV.specValue}" scope="page"></c:set>
                </c:if>
                </c:forEach>
			    <tr><th>&nbsp;&nbsp;${f.featureName}：</th><th class="wp nwp">
                <c:if test="${f.inputType == 1}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" disabled />
                    <select class="specValue1" disabled>
                    <c:forEach items="${f.selectValues}" var="f1">
                        <option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option>
                    </c:forEach>
                    </select>
                </c:if>
                <c:if test="${f.inputType == 2}">
                    <input  type="hidden" class="specValue4" value="${f.featureId}" />
                    <c:forEach items="${f.selectValues}" var="f2" varStatus="idx">
                    <input disabled<c:if test="${e == f2}"> checked</c:if> id="radio${status.index}" type="radio" class="specValue1" name="${st.index}specradio${status.index}" value="${f2}" />${f2}&nbsp;&nbsp;
                    </c:forEach>
                </c:if>
                <c:if test="${f.inputType == 3}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <c:forEach items="${f.selectValues}" var="f3" varStatus="idx">
                    <input disabled<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> id="check${status.index}" name="${st.index}speccheck${status.index}" type="checkbox" class="specValue1" value="${f3}" />${f3}&nbsp;&nbsp;
                    </c:forEach>
                </c:if>
                <c:if test="${f.inputType == 4}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <input disabled type="text" class="text20 state specValue1" value="${e}" />
                </c:if>
			</th></tr>
		</c:forEach>
        <tr><td colspan="2">
            <table cellspacing="0">
                <tr>
                    <th>排序</th>
                    <th>商城价</th>
                    <th>市场价</th>
                    <th>库存</th>
                    <th>购买上限</th>
                    <th>货号</th>
                    <th>货位</th>
                    <th>上下架</th>
                    <th>类型</th>
                </tr>
                <tr>
                    <td width="10%" class="nwp"><var>${ebSku.skuSort}</var></td>
                    <td width="12%" class="nwp"><samp class="red">*</samp> <var><fmt:formatNumber type="number" value="${ebSku.skuPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber></var></td>
                    <td width="12%" class="nwp"><var>
                    <c:if test="${ebSku.marketPrice!=null }">
                    	<fmt:formatNumber type="number" value="${ebSku.marketPrice/100}" pattern="#.##" minFractionDigits="2"></fmt:formatNumber>
                    </c:if>
                    </var></td>
                    <td width="12%" class="nwp"><var>${ebSku.stockInventory}</var></td>
                    <td width="12%" class="nwp"><var>${ebSku.skuUpperLimit}</var></td>
                    <td width="12%" class="nwp"><var>${ebSku.sku}</var></td>
                    <td width="12%" class="nwp"><var>${ebSku.location}</var></td>
                    <td class="nwp">
                    <select id="showStatus1" name="showStatus1" disabled>
                    <option<c:if test="${ebSku.showStatus == 0}"> selected </c:if> value="0">上架 </option>
                    <option<c:if test="${ebSku.showStatus == 1}"> selected </c:if> value="1">下架</option>
                    </select>
                    </td>
                    <td class="nwp">
                        <select id="skuType" name="skuType" disabled>
                         	<option<c:if test="${ebSku.skuType == 0}"> selected </c:if> value="0">赠品 </option>
		                    <option<c:if test="${ebSku.skuType == 1}"> selected </c:if> value="1">普通</option>
                        </select>
                    </td>
                </tr>
            </table>
            </td></tr>
        </table>
    </div>
</c:forEach>
</div>
<div id="tab_5" class="edit" style="display: none">
${ebItem.packingList}
</div>

<%-- <div id="submitDis">

    <div class="loc">&nbsp;</div>

    <div class="edit set">
    <p><label class="alg_t">操作备注：</label><textarea id="logNotes" name="logNotes" class="are arew" style="width:50%;" rows="6" cols="80" reg1="^(.|\n){0,90}$" desc="请限制在90个字符以内"></textarea>
        <input type="hidden" name="oldAuditStatus" id="oldAuditStatus" value="${ebItem.auditStatus }" >
    </p>
    <p><label>&nbsp;</label><input 
        type="button" value="确认审核" class="hand btn83x23 sub1" />&nbsp;&nbsp; <input 
        type="button" value="审核不通过"  class="hand btn83x23b sub1" /></p>
    </div>

</div> --%>

</form>
<div class="loc">&nbsp;</div>

<div class="edit set"><h2>操作记录</h2></div>
<iframe src="<c:url value='/${system }/consolelog/top10.do?entityId=${ebItem.itemId}&tableName=EB_ITEM'/>" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>

</div></div>
</body>
