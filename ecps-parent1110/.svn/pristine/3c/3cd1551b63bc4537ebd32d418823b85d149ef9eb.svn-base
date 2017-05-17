<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>编辑移动号卡_移动好卡_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
<script type="text/javascript" src="<c:url value='/${system }/res/plugins/fckeditor/fckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ecps/console/res/js/uploads.js'/>"></script>
<script language="javascript" type="text/javascript">
function checkRadio(obj){
     var checks = document.getElementsByName("tagImg");
    if(obj.checked)
    {for(var i=0;i<checks.length;i++){
            checks[i].checked = false; }
        obj.checked = true;
    }else
    {
        for(var i=0;i<checks.length;i++){
            checks[i].checked = false;
        }
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
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
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
	$("#button1").click(function(){
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
            if($("#itemName").val()!="${ebItem.itemName}") {
            //重命名
		var rename=true;
		$.ajax({
             type:"POST",
             async: false,
             url:"${path }/item/validJSONName.do",
             data:"itemName="+$("#itemName").val(),
             success:function(data){
                 if(data == "false"){
                 rename=false;
                 }
            }
			});
		if(!rename){
			 if($("#itemName").next("span").length ==0){
			$("#itemName").after("<span>商品名称重复</span>");
			 }
          return;
	   }
            }
                 //敏感词
        var sensitivity=true;
       var content = $("#itemDesc").val();//FCKeditorAPI.GetInstance("itemDesc").GetXHTML(true);
          $.ajax({
             type:"POST",
             async: false,
             url:"${path }/item/validSen.do",
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
		var iNum=0;
		$("#tab_3").each(function(){
             $(this).find(".paraValue4").each(function(){
                    var a=$(this);
                    var pKey=a.val();
                    var pType=a.next();
                    var pVal="";
                    if(pType.attr("g") == "g"){
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
                            pVal=pVal+b.eq(jj).val()+"/r/n";  
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
	//实现分类与属性的联动
	$("#catId").change(function(){
		var a=$(this).val();
		var a1=$("#itemId").val();
		var a2=confirm("修改分类会清空现有商品参数，需要重新录入新参数，确认修改分类?");
		if(a2==false){
			$(this).val(${ebCat.catId});
			return;
			}
		top.location.href="/console/card/chgFeaByCat.do?itemId="+a1+"&catId="+a;
		});

});
function changeMarPri(){
	var test=$("#marketPrice1").val();
	var reg0=/^[0-9]{1,7}\.{0,1}[0-9]*$/;
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
		$("#marketPrice1").val(test+".00");
		$("#marketPrice").val(test+"00");
	}
	else{
		$("#marketPrice1").val(firstSub+'.'+lastSub);
		$("#marketPrice").val(firstSub+lastSub);
	}
}
function changeSkuPriMin(){
	var test=$("#skuPriceMin1").val();
	var reg0=/^[0-9]{1,7}\.{0,1}[0-9]*$/;
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
		$("#skuPriceMin1").val(test+".00");
		$("#skuPriceMin").val(test+"00");
	}
	else{
		$("#skuPriceMin1").val(firstSub+'.'+lastSub);
		$("#skuPriceMin").val(firstSub+lastSub);
	}
}

$(document).ready(function(){
   changeMarPri();
    changeSkuPriMin();
});
</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
	<jsp:include page="/${system }/common/itemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">
<form action="" id="myForm1"></form>
<div class="loc icon"><samp class="t12"></samp><fmt:message
	key='menu.current.loc' />:<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/card/listCard.do"/>">移动号卡</a>&nbsp;&raquo;&nbsp;<span class="gray">编辑移动号卡</span><a href="<c:url value="/${system }/card/listCard.do"/>" class="inb btn80x20">返回移动号卡</a></div>
<form action="${path}/card/editSaveCard.do" name="myForm" id="myForm"
	method="post">
<h2 class="h2_ch"><span id="tabs" class="l"> <a
	href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" ref="#tab_2" title="商品描述" class="nor">号卡描述</a>
<a href="javascript:void(0);" ref="#tab_3" title="商品参数" class="nor">商品参数</a>
</span></h2>
<div id="tab_1" class="edit set">
	<input type="hidden" name="itemId" id="itemId" value="${ebItem.itemId}"/>
	<input type="hidden" name="itemNo" id="itemNo" value="${ebItem.itemNo}"/>
    <p><label><samp>*</samp>卡号：</label><input type="text"  reg1="^\d{11,11}$" desc="请出入11位数字" id="itemName" name="itemName" value="${ebItem.itemName}" escapeXml="false" class="text state" maxlength="11" />
	</p>
    <p><label>商品编号：</label>${ebItem.itemNo}</p>
	<p><label><samp>*</samp>商品分类：</label>${ebCat.catName }
	<input type="hidden" name="catId" value="${ebCat.catId }"/>
	</p>
	<p><label>商品品牌：</label><select  id="brandId" name="brandId" >
	<option<c:if test="${ebItem.brandId==-1}"> selected</c:if> value="-1">请选择商品品牌</option>
	<c:forEach items="${blist}" var="b">
		<option<c:if test="${b.brandId == ebItem.brandId}"> selected</c:if> value="${b.brandId}">${b.brandName}</option>
	</c:forEach>
	</select></p>
	<p><label>市场价：</label><input type="text" desc="保留2位小数，最多允许9位有效数字" reg1="^[0-9]{0,7}\.{0,1}[0-9]{0,2}$"
           id="marketPrice1" name="marketPrice1" class="text state" onblur="changeMarPri()"
           value="<fmt:formatNumber value='${ebItem.marketPrice/100}' pattern="#0.00"></fmt:formatNumber>"/>
	    <input type="hidden"  id="marketPrice" name="marketPrice" value="${ebItem.marketPrice}"/>
	</p>
	<p><label><samp>*</samp>预存话费：</label><input type="text" desc="保留2位小数，最多允许9位有效数字" reg1="^[0-9]{1,7}\.{0,1}[0-9]{0,2}$" id="skuPriceMin1" name="skuPriceMin1" class="text state" value="<c:if test="${ebItem.skuPriceMin!=null}">${ebItem.skuPriceMin/100}</c:if>" onblur="changeSkuPriMin()" />
	<input type="hidden"  id="skuPriceMin" name="skuPriceMin" value="${ebItem.skuPriceMin}"/>
	</p>
	<!-- 
    <p><label>标签图：</label>
    	<input type="checkbox"<c:if test="${ebItem.tagImg ==1}"> checked</c:if> id="tagImg" name="tagImg" value="1" onclick="checkRadio(this);" />独家&nbsp;&nbsp;
        <input type="checkbox"<c:if test="${ebItem.tagImg ==2}"> checked</c:if> id="tagImg" name="tagImg" value="2" onclick="checkRadio(this);"/>推荐&nbsp;&nbsp;
        <input type="checkbox"<c:if test="${ebItem.tagImg ==3}"> checked</c:if> id="tagImg" name="tagImg" value="3" onclick="checkRadio(this);"/>惊爆价
	</p>
	-->
   	<p><label>促销语：</label><input type="text" reg1="^(.{0,100})$" desc="100个任意字符以内" id="promotion" name="promotion" value="${ebItem.promotion}" class="text state" />
   	</p>
    <p><label>状态：</label>
    	<input<c:if test="${ebItem.simLevel==3 || ebItem.simLevel==null}"> checked</c:if> name="simLevel" type="radio" value="3" />普通号&nbsp;&nbsp;
    	<input<c:if test="${ebItem.simLevel==2}"> checked</c:if> name="simLevel" type="radio" value="2" />普通靓号&nbsp;&nbsp;
    	<input<c:if test="${ebItem.simLevel==1}"> checked</c:if> name="simLevel" type="radio" value="1" />超级靓号
    </p>
    <input type="hidden" id="auditStatus" name="auditStatus" value="1">
	<p><label>上下架：</label><input<c:if test="${ebItem.showStatus == 0}"> checked</c:if> type="radio" id="showStatus3" name="showStatus" value="0" />上架&nbsp;&nbsp;<input<c:if test="${ebItem.showStatus == 1}"> checked</c:if> type="radio" id="showStatus4" name="showStatus" value="1" />下架
	</p>
</div>

<div id="tab_2" class="edit" style="display:none">
<textarea name="itemDesc" id="itemDesc">${ebItem.itemDesc}</textarea>
<script type="text/javascript">   
	var ${"itemDesc"} = new FCKeditor('itemDesc');
	${"itemDesc"}.BasePath = '${path }/res/plugins/fckeditor/';
	${"itemDesc"}.Config["CustomConfigurationsPath"] = "${path }/res/plugins/fckeditor/myconfig.js";
	${"itemDesc"}.Config["LinkBrowser"] = false;
	${"itemDesc"}.Config["ImageBrowser"] = false;
	${"itemDesc"}.Config["FlashBrowser"] = false;
	${"itemDesc"}.Config["MediaBrowser"] = false;
	${"itemDesc"}.Config["LinkUpload"] = true;
	${"itemDesc"}.Config["ImageUpload"] = true;
	${"itemDesc"}.Config["FlashUpload"] = true;
	${"itemDesc"}.Config["MediaUpload"] = true;
	${"itemDesc"}.Config["LinkUploadURL"] = "${path}/uploads/fckUpload.do";
	${"itemDesc"}.Config["ImageUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Image";
	${"itemDesc"}.Config["FlashUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Flash";
	${"itemDesc"}.Config["MediaUploadURL"] = "${path}/uploads/fckUpload.do?typeStr=Media";
	${"itemDesc"}.ToolbarSet = "My";
	${"itemDesc"}.Width = "100%";
	${"itemDesc"}.Height = "400";				
	${"itemDesc"}.ReplaceTextarea();
	//${name}.Value = "";
	//${name}.Create();
</script>
</div>

<div id="tab_3" class="edit set" style="display: none">
    <c:if test="${fn:length(list1) == 0}">
    <p><label>&nbsp;</label>无属性</p>
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
            <select class="paraValue" g="g">
            <option value="">请选择</option>
            <c:forEach items="${f.selectValues}" var="f1">
                <option<c:if test="${e == f1}"> selected</c:if> value="${f1}">${f1}</option>
            </c:forEach>
            </select>
        </c:if>
        <c:if test="${f.inputType == 2}">
            <c:forEach items="${f.selectValues}" var="f2" varStatus="s">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input<c:if test="${e == f2}"> checked</c:if> type="radio" class="paraValue"  id="pradio${s.index}" name="pradio${status.index}" value="${f2}" />${f2}&nbsp;&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 3}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <c:forEach items="${f.selectValues}" var="f3" varStatus="s">
                <input<c:if test="${fn:indexOf(e,f3) != -1}"> checked</c:if> type="checkbox" class="paraValue" id="pcheck${s.index}" name="pcheck${status.index}" value="${f3}" />${f3}&nbsp;&nbsp;
            </c:forEach>
        </c:if>
        <c:if test="${f.inputType == 4}">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input type="text"  class="txt paraValue" value="${e}"/>
        </c:if>
        </p>
    </c:forEach>
</div>

<div id="tab_4" style="display: none">
    <div id="sp_0" class="sp_0">
        <table cellspacing="0" summary="" class="tab3">
        <c:if test="${fn:length(list2) == 0}">
        <tr><th colspan="2" class="gray b">&nbsp;&nbsp;<b>默认</b></th></tr>
        </c:if>
        <c:forEach items="${list2}" var="f" varStatus="status">
            <tr><th>&nbsp;&nbsp;${f.featureName}：</th><th class="wp nwp">
                <c:if test="${f.inputType == 1}">
                <input type="hidden" class="specValue4" value="${f.featureId}" />
                <select class="specValue1">
                    <c:forEach items="${f.selectValues}" var="f1">
                        <option value="${f1}">${f1}</option>
                    </c:forEach>
                </select>
            </c:if>
            <c:if test="${f.inputType == 2}">
                <input  type="hidden" class="specValue4" value="${f.featureId}" />
                <c:forEach items="${f.selectValues}" var="f2" varStatus="idx">
                <input<c:if test="${idx.index ==0}"> checked</c:if> id="radio${status.index}" type="radio" class="specValue1" name="specradio${status.index}" value="${f2}" />${f2}&nbsp;&nbsp;
                </c:forEach>
            </c:if>
            <c:if test="${f.inputType == 3}">
                <input type="hidden" class="specValue4" value="${f.featureId}" />
                <c:forEach items="${f.selectValues}" var="f3" varStatus="idx">
                    <input id="check${status.index}" name="speccheck${status.index}" type="checkbox" class="specValue1" value="${f3}" />${f3}&nbsp;&nbsp;
                </c:forEach>
            </c:if>
            <c:if test="${f.inputType == 4}">
                <input type="hidden" class="specValue4" value="${f.featureId}" />
                <input type="text" class="text state specValue1" />
            </c:if>
            </th></tr>
        </c:forEach>
        <tr><td colspan="2">
            <table cellspacing="0">
                <c:forEach items="${ebSkus}" var="ebSku" varStatus="st">
                <tr>
                <td class="nwp"><input type="text" id="sort" name="sort" maxlength="2"  size="2"/></td>
                <td class="nwp"><samp>*</samp><input  type="text" id="skuPrice" name="skuPrice" size="5" value="${ebSku.skuPrice/100}"/></td>
                <td class="nwp"><input type="text" id="costPrice" name="costPrice" size="5" /></td>
                <td class="nwp"><samp>*</samp><input  type="text" id="stockInventory" name="stockInventory" size="5" value="${ebSku.stockInventory}"></td>
                <td class="nwp"><input type="text"  id="sku" name="sku"  size="5"></td>
                <td class="nwp"><input  type="text" id="location" name="location" size="5"/></td>
                <td><select id="skuImg" name="skuImg">
                <option value="1">第一张</option>
                <option value="2">第二张</option>
                <option value="3">第三张</option>
                <option value="4">第四张</option>
                <option value="5">第五张</option>
                </select></td>
                <td>
                <input id="showStatus1" name="showStatus1" value="1"/>
                </td>
                <td><input id="skuType" name="skuType" value="1"/></td>
                <td><input type="button" value="删除" onclick="clickRemove('#sp_0')"/></td>
                </tr>
                </c:forEach>
            </table>
         </td></tr>
        </table>
    </div>
 </div>

<div class="loc">&nbsp;</div>

<div class="edit set">
<p><label class="alg_t">操作备注：</label><textarea id="logNotes" name="logNotes" class="are arew" style="width:50%;" rows="6" cols="80" reg1="^(.|\n){0,90}$" desc="请限制在90个字符以内"></textarea></p>
<p><label for="submit">&nbsp;</label><input id="button1"
	type="button" value="提 交" class="hand btn83x23" />&nbsp;&nbsp;<input
	type="button" value="取消" onclick="javascript:;history.back();" class="hand btn83x23b" /></p>
</div>

</form>

<div class="loc">&nbsp;</div>

<div class="edit set"><h2>操作记录</h2></div>
<iframe src="<c:url value='/${system }/consolelog/top10.do?entityId=${ebItem.itemId}&tableName=EB_ITEM&isCard=y'/>" width="100%" height="400" marginwidth="0" marginheight="0" frameBorder="no" framespacing="0" allowtransparency="true" scrolling="auto"></iframe>

</div></div>
</body>
