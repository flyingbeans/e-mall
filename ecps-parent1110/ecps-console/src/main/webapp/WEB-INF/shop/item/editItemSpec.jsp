<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑规格_实体商品_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/${system }/res/js/uploads.js'/>"></script>
<script language="javascript" type="text/javascript">

function checkReg(a){	
	var reg = new RegExp(a.attr("reg1"));
	var objValue = a.val();
	if(!reg.test(objValue)){
	    if(a.next("span").length ==0){
			a.after("<span>"+a.attr("desc")+"</span>");
	    }					
		return false;
	}
	return true;	
}

$(function(){
	var divNum=$(".sp_0").length;
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
			if(ref == '#tab_2'){
				FCKeditorAPI.GetInstance('itemDesc').Focus();
				//FCKeditorAPI.GetInstance('itemDesc').EditorDocument.body.innerHTML = '12123123';
			}
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
		var a=$(".sp_0:first").html().replace(/specradio/g,d+"specradio");
		var a1=a.replace(/skuId/g,"skuIda");
		var b=a1.replace(/clickRemove\('#sp\_\d+',/g,"clickRemove('#sp_"+d+"',-");
		//alert("aa-->"+b);
		var reg1Js='<script language="javascript" type="text/javascript">'
			+'	$("input[reg1]").blur(function(){'
			+'		var a=$(this);'
			+'		var reg = new RegExp(a.attr("reg1"));'
			+'		var objValue = a.val();'
			+'		if(!reg.test(objValue)){'
			+'			if(a.next("span").length ==0){'
			+'			a.after("<span>"+a.attr("desc")+"</span>");'
			+'			}'
			+'		}else{'
			+'			a.next("span").remove();'
			+'			}});'
		    +'<\/script'+'>';
		$("#button2").parent().parent().before("<div class='sp_0' id='sp_"+d+"'>"+b+"</div>"+reg1Js);
		});
	$("#button1").click(function(){
        var s=true;
        if(!skuSepValueValid()){
        	return false;
        }
        
		$("#tab_4").find("[reg1],[desc]").each(function(){
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
		
		if(!checkReg($("#logNotes")))
			s = false;
		
        if(s){
        	// 检查是否存在两个默认sku
        	var hasExistDefaultSku = false;
        	        	
			var iNum=0;
	        $(".sp_0").each(function(){
	            var sku=iNum+'-';
	            	if(typeof($(this).find("#skuId").val())!="undefined"){
	            		sku+=$(this).find("#skuId").val();
	            	}else{
	            		sku+="0";
	            	}
	            	sku+='|'+$(this).find("#sort").val()
	       			+'|'+$(this).find("#skuPrice").val()
	       			+'|'+$(this).find("#marketPrice").val()
	       			+'|'+$(this).find("#stockInventory").val()
	       			+'|'+$(this).find("#sku").val()
	       			+'|'+$(this).find("#location").val()
	       			+'|'+$(this).find("#skuUpperLimit").val()
	       			+'|'+$(this).find("#showStatus1").val()
	            	+'|'+$(this).find("#skuType").val();
	            
	   			var spec=$(this).find(".specValue4");
	   			
	   			// 检查是否存在默认sku冲突
   				var tmpDefaultSku = true;
	   			spec.each(function(){
	                var a=$(this);
	                var pKey=a.val();
	                var pType=a.next();
	                var pVal="";
	                if(typeof(pType.attr("type")) == "undefined"){
	                    pVal=pType.val();
	                }
	                if(pType.attr("type") == "text"){
	                    pVal=a.next(".specValue1").val();
	                }
	                if(pType.attr("type") == "radio"){
	                    pVal=a.nextAll("input:checked").val();
	                }
	                if(pType.attr("type") == "checkbox"){
	                    var b=a.nextAll("input:checked");
	                    for(var jj=0;jj<b.length;jj++){
	                       pVal=pVal+b.eq(jj).val()+",";
	                    }
	                }
	                if(pVal != "" && typeof(pVal) !="undefined"){
	                    var specVal=sku+"|"+pKey+"|"+pVal;
	                    $("#myForm").append("<input type='hidden' name='specValue' id='specValue' value='"+specVal+"'/>");
	                    tmpDefaultSku = false;
	                }else{
	                    var specVal=sku;
	                    $("#myForm").append("<input type='hidden' name='specValue' id='specValue' value='"+specVal+"'/>");
	                }
	            });
	   			// 循环结束，判断该sku是否默认sku
	   			if(tmpDefaultSku){	   				
	   				hasExistDefaultSku = true;	   				
	   			}
	   			
	            if(spec.length ==0){
	                var specVal=sku;
	                $("#myForm").append("<input type='hidden' name='specValue' id='specValue' value='"+specVal+"'/>");
	            }
	             iNum++;
	        });
	        
	        if(iNum>1 && hasExistDefaultSku){
	        	alert("无任何规格值的规格具备唯一性，仅能单独保存，请检查是否存在其他规格");
	        }else{
	        	$("#myForm").submit();
	        }
        }
		});
	/**$(".showStatus1").change(function(){
		var a1=$(this).val();
		var a2=$("#showStatus3").val();
        if(a2 == 1 && a1==0){
            alert("商品规格上架，商品必须先上架");
            $("#showStatus1").attr("value","1");
           }
        })*/
        /**
        var radioChecked=1;
        var radioValue=$(".sp_0").find("input[type='radio']:checked").val();
        $(".sp_0").find("input[type=radio]").live("click",function(){
            var val = $(this).val();
            var nam = $(this).attr('name');
            $('input[name='+ nam +']').each(function(){$(this).attr('checked','');});
            $(this).attr('checked','checked');
            radioChecked++;
            if(radioValue == val){
                if(radioChecked > 2){$(this).removeAttr('checked');radioChecked=1;}
            }else{
                radioValue=val;
                $(this).attr('checked','checked');
            }

        })
        **/
	$(".sp_0").find("input[type=radio]").live("dblclick",function(){
		if($(this).attr('checked') == 'checked'){
			$(this).removeAttr('checked');
		}else{
			$(this).attr('checked','checked');
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
});
function clickRemove(id,skuId){
    if(confirm("确认要删除此规格")){
	var b=$(id+" .showStatus1").val();
	var a=$(".sp_0").length;
	if(a == 1){
	alert("默认规格不可删除");
		return;
	}
	if(b == 0){
    alert("规格必须是下架状态才能删除");
    return;
	}
	$.ajax({
        type:"POST",
        async: false,
        url:"${path }/item/deleteSkuCheck.do",
        data:"skuId="+skuId,
        success:function(data){
            if(data.indexOf('false') !=-1){
            alert("商品在订单中不可删除");
            }else{
            	$(id).remove();
           }
       }  
		});
	
      }
}
function changePri(obj){
	var reg0=/^[0-9]{1,7}\.{0,1}[0-9]*$/;
	var test=obj.value;
	if(!reg0.test(test)){
		return;
	}
	var test1=test.indexOf(".");
	var firstSub=test.substring(0,test1);
	var lastSub=test.substring(test1+1,test.length);
	if(lastSub.length >= 3) {
		lastSub=lastSub.substring(0, 2); 
	}
	if(lastSub.length==1){
		lastSub=lastSub+'0';
	}
	if(lastSub.length==0){
		lastSub='00';
		}
	if(test1==-1){
		obj.value=test+".00";
	}
	else{
		obj.value=firstSub+'.'+lastSub;
	}
}
 function showValid(a1){
	var a2=$("#showStatus3").val();
    if(a2 ==1 && a1.value==0){
        alert("商品规格上架，商品必须先上架");
        a1.value=1;
       }
}

function addPic() {
	var imgsCount = $("#imgsCount").val();
	var imgsIndex = $("#imgsIndex").val();
	if (imgsCount < 5) {
		var imgsBlankValue = $("#imgsBlank").val();
		var oneTr = '<tr id="imgsTr'+imgsIndex+'">'+
			'<td class="nwp">'+
			'<img id="imgs'+imgsIndex+'Img" name="imgs'+imgsIndex+'Img" src="'+imgsBlankValue+'" width="100" height="100" />'+
			'<input type="file" id="imgs'+imgsIndex+'File" name="imgs'+imgsIndex+'File" onchange="submitUploads(\''+imgsIndex+'\')" />'+
			'<input type="hidden" id="imgsFilePath'+imgsIndex+'" name="imgsFilePath'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileDesc'+imgsIndex+'" name="imgsFileDesc'+imgsIndex+'" />'+
			'<input type="hidden" id="imgsFileIndex'+imgsIndex+'" name="imgsFileIndex'+imgsIndex+'" value="'+imgsIndex+'" />'+
			'</td>'+
			'<td class="nwp">'+
			'<input type="text" id="imgsDesc'+imgsIndex+'" name="imgsDesc'+imgsIndex+'" />'+
			'</td>'+
			'<td>'+
			'<a href="#uploadImgs" onclick="delPic(\''+imgsIndex+'\')" title="删除">删除</a>'+
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

function skuSepValueValid(){
	var list = new Array();
	var result=true;
	$(".sp_0").each(function(){
		var buffer="";
		var checkedNum = 0;
		$(this).find(".specValue4").each(function(){
            var obj=$(this).next();
            if(obj.attr("type")=="radio"){
            	var tempBuffer = $(this).nextAll("input:checked").val();
               buffer+=tempBuffer;
               if($.trim(tempBuffer) != "" && tempBuffer != null){
           			checkedNum++; 
           		}
            }
		});
		if(checkedNum == 0){
			alert("规格值为必选项,请为未选择规格值的商品规格添加规格值.");
    		result = false;
    		return false;
		}
		for(var a=0;a<list.length;a++){
			if(buffer==list[a]){
				alert("规格值不能相同");
				result=false;
				$("#button1").removeAttr("disabled");
				break;
			}
		}
		if(result){
			list.push(buffer);
		}else{
			return false;
		}
	});
	return result;
}
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system }/common/itemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/listEntity.do"/>" title="实体商品">实体商品</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑规格</span>
    <a href="<c:url value="/${system }/item/itemFrame.do"/>" title="返回实体商品" class="inb btn80x20">返回实体商品</a>
</div>

<form action="${path}/item/editSaveSku.do" name="myForm" id="myForm" method="post">
<h2 class="h2_ch"><span id="tabs">
<a href="javascript:void(0);" rel="#tab_1" title="基本信息" class="nor">基本信息</a>
<a href="javascript:void(0);" rel="#tab_2" title="商品描述" class="nor">商品描述</a>
<a href="javascript:void(0);" rel="#tab_3" title="商品参数" class="nor">商品参数</a>
<a href="javascript:void(0);" rel="#tab_4" rev="#submitDis"  title="商品规格" class="here">商品规格</a>
<a href="javascript:void(0);" rel="#tab_5" rev="#submitDis" title="包装清单" class="nor">包装清单</a>
</span></h2>

<div id="tab_1" class="edit set" style="display:none">
	<input type="hidden" name="itemId" id="itemId" value="${ebItem.itemId}"/>
	<p><label>商品编号：</label>${ebItem.itemNo}</p>
    <p><label><samp>*</samp>商品名称：</label>${ebItem.itemName}</p>
	<p><label><samp>*</samp>商品分类：</label>${ebCat.catName}</p>
	<p><label>商品品牌：</label>
	<select  id="brandId" name="brandId" disabled >
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
	<p><label>标签图：</label>
		<c:if test="${ebItem.tagImg==1 }">无</c:if>
		<c:if test="${ebItem.tagImg==2 }">
			<span style="position:relative;display:block;width:225px;height:290px;margin:-26px 0 0 200px">
				<img src="${base }/res/imgs/p225x290.jpg" width="225" height="290" />
				<img id="upshow" src="${rsImgUrlInternal}${itemTagImg.tagImgUrl }" onerror="this.src='${base}/res/imgs/deflaut.jpg'"  style="position:absolute;top:5px;right:5px" />
			</span>
		</c:if>
	</p>
   	<p><label>促销语：</label>${ebItem.promotion}</p>
    <p><label>状态：</label>
    	<c:if test="${ebItem.isNew==1 }">新品&nbsp;&nbsp;</c:if>
    	<c:if test="${ebItem.isGood==1 }">推荐&nbsp;&nbsp;</c:if>
    	<c:if test="${ebItem.isHot==1 }">特价</c:if>
    </p>
    <a name="uploadImgs" id="uploadImgs"></a>
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
                        <input type="text" id="imgsDesc${count.index}" name="imgsDesc${count.index}" value="${item.fileDesc}" class="text20 state" readonly/>
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
	<p><label>页面关键词：</label>${ebItem.keywords}</p>
	<p><label>页面描述：</label>${ebItem.pageDesc}</p>
</div>

<div id="tab_2" class="edit" style="display: none">
${ebItem.itemDesc}

</div>

<div id="tab_3" class="edit set" style="display: none">
    <c:if test="${fn:length(list1) == 0}">
    <p><label></label>无属性</p>
    </c:if>
    <c:forEach items="${list1}" var="f" varStatus="status">
    <c:set var="e" value="" scope="page"></c:set>
        <c:forEach items="${ebPVs}" var="ebPV">
            <c:if test="${ebPV.featureId == f.featureId}">
            <c:set var="e" value="${ebPV.paraValue}" scope="page"></c:set>
        </c:if>
        </c:forEach>
        <p><label>${f.featureName}：</label>
        <c:if test="${f.inputType == 1}">
            <select class="paraValue" disabled >
            <option value="">请选择</option>
            <c:forEach items="${f.selectValues}" var="f1">
            <option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option>
            </c:forEach>
            </select>
        </c:if>
        <c:if test="${f.inputType == 2}">
             <c:forEach items="${f.selectValues}" var="f2" varStatus="s">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input<c:if test="${e == f2}"> checked</c:if> type="radio" disabled class="paraValue" id="pradio${s.index}" name="pradio${status.index}" value="${f2}" />${f2}&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 3}">
            <c:forEach items="${f.selectValues}" var="f3" varStatus="s">
                <input<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> disabled type="checkbox" class="paraValue" id="pcheck${s.index}" name="pcheck${status.index}" value="${f3}" />${f3}&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 4}">
            ${e}
        </c:if>
        </p>
    </c:forEach>
</div>

<div id="tab_4">
<c:forEach items="${ebSkus}" var="ebSku" varStatus="st">
    <div id="sp_${st.index}" class="sp_0">
    <input type="hidden" name="skuId" value="${ebSku.skuId}" id="skuId"/>
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
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <select class="specValue1">
                    <c:forEach items="${f.selectValues}" var="f1">
                        <option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option>
                    </c:forEach>
                    </select>
                </c:if>
                <c:if test="${f.inputType == 2}">
                    <input  type="hidden" class="specValue4" value="${f.featureId}" />
                    <c:forEach items="${f.selectValues}" var="f2" varStatus="idx">
                    <input<c:if test="${e == f2}"> checked</c:if> id="radio${status.index}" type="radio" class="specValue1" name="${st.index}specradio${status.index}" value="${f2}" />${f2}&nbsp;&nbsp;
                    </c:forEach>
                </c:if>
                <c:if test="${f.inputType == 3}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <c:forEach items="${f.selectValues}" var="f3" varStatus="idx">
                    <input<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> id="check${status.index}" name="${st.index}speccheck${status.index}" type="checkbox" class="specValue1" value="${f3}" />${f3}&nbsp;&nbsp;
                    </c:forEach>
                </c:if>
                <c:if test="${f.inputType == 4}">
                    <input type="hidden" class="specValue4" value="${f.featureId}" />
                    <input  type="text" class="text20 state specValue1" value="${e}" />
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
                        <th>操作</th>
                    </tr>
                    <tr>
                        <td class="nwp"><input type="text" reg1="^[0-9]{0,2}$" desc="2个字符以内" id="sort" name="sort" maxlength="2" value="${ebSku.skuSort}" class="text20" size="5" /></td>
                        <td class="nwp"><samp class="red">*</samp> <input  reg1="^[0-9]{1,7}\.{0,1}[0-9]{0,2}$" desc="保留2位小数，最多允许9位有效数字" type="text" id="skuPrice" value="<fmt:formatNumber type="number" value="${ebSku.skuPrice/100}" pattern="#.##" minFractionDigits="2"/>" name="skuPrice" class="text20" size="5" onblur="changePri(this)" /></td>
                        <td class="nwp">
                        	<c:if test="${ebSku.marketPrice!=null }">
                        		<input type="text" id="marketPrice" name="marketPrice" value="<fmt:formatNumber type="number" value="${ebSku.marketPrice/100}" pattern="#.##" minFractionDigits="2"/>" class="text20" size="5" reg1="^[0-9]{0,7}\.{0,1}[0-9]{0,2}$" desc="保留2位小数，最多允许9位有效数字" onblur="changePri(this)" />
                        	</c:if>
                        	<c:if test="${ebSku.marketPrice==null }">
                        		<input type="text" id="marketPrice" name="marketPrice" value="" class="text20" size="5" reg1="^[0-9]{0,7}\.{0,1}[0-9]{0,2}$" desc="保留2位小数，最多允许9位有效数字" onblur="changePri(this)" />
                        	</c:if>
                        </td>
                        <td class="nwp"><samp class="red">*</samp><input reg1="^(0|[1-9][0-9]{0,4})$" desc="5个字符以内非负整数" value="${ebSku.stockInventory}" type="text" id="stockInventory" name="stockInventory" class="text20" size="5" /></td>
                        <td class="nwp"><input reg1="^(.{0,0}|0|[1-9][0-9]{0,4})$" desc="请输入5个字符以内非负整数或为空 " type="text" id="skuUpperLimit" name="skuUpperLimit" value="${ebSku.skuUpperLimit}" class="text20" size="5"/></td>
                        <td class="nwp"><input type="text" id="sku" name="sku" class="text20" size="5" value="${ebSku.sku}" reg1="^[a-zA-Z0-9_\u4e00-\u9fa5]{0,20}$" desc="20个字符以内" /></td>
                        <td class="nwp"><input reg1="^[a-zA-Z0-9_\u4e00-\u9fa5]{0,20}$" value="${ebSku.location}" desc="20个字符以内" type="text" id="location" name="location" class="text20" size="5" /></td>
                        <td>
                        <select id="showStatus1" name="showStatus1" class="showStatus1">
                        <option<c:if test="${ebSku.showStatus == 0}"> selected</c:if> value="0">上架 </option>
                        <option<c:if test="${ebSku.showStatus == 1}"> selected</c:if> value="1">下架</option>
                        </select>
                        </td>
                        <td>
                        	<select id="skuType" name="skuType">
                         	<!-- option<c:if test="${ebSku.skuType == 0}"> selected </c:if> value="0">赠品 </option -->
		                    <option<c:if test="${ebSku.skuType == 1}"> selected </c:if> value="1">普通</option>
                        	</select>
                        </td>
                        <td><input type="button" value="删除" class="hand btn60x20" onclick="clickRemove('#sp_${st.index}',${ebSku.skuId})"/></td>
                    </tr>
                </table>
            </td></tr>
        </table>
    </div>
</c:forEach>

    <c:if test="${fn:length(list2) != 0}">
    <div class="page_c"><span class="r"><input type="button" id="button2" name="button2" class="hand btn80x20" value="新增规格" /></span></div>
    </c:if>

</div>
<div id="tab_5" class="edit" style="display: none">
${ebItem.packingList}
</div>
<div id="submitDis">

    <div class="loc">&nbsp;</div>

    <div class="edit set">
    <p><label class="alg_t">操作备注：</label><textarea id="logNotes" name="logNotes" class="are arew" rows="6" cols="80" reg1="^(.|\n){0,90}$" desc="操作备注请限制在90个字符以内"></textarea>
        <input type="hidden" name="oldAuditStatus" id="oldAuditStatus" value="${ebItem.auditStatus }" >
    </p>
    <p><label>&nbsp;</label><input id="button1"
        type="button" value="提 交" class="hand btn83x23" />&nbsp;&nbsp; <input
        type="button" value="取消" onclick="javascript:;history.back();" class="hand btn83x23b" /></p>
    </div>

</div>

</form>
<div class="loc">&nbsp;</div>

<div class="edit set"><h2>操作记录</h2></div>
<iframe src="<c:url value='/${system }/consolelog/top10.do?entityId=${ebItem.itemId}&tableName=EB_ITEM'/>" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>

</div></div>
</body>
