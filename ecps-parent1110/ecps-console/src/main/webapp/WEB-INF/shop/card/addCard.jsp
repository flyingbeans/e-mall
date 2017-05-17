<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>添加移动号卡_移动好卡_商品管理</title>
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


//敏感词
       var sensitivity=true;
       var content = $("#itemDesc").val();
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

        if(s){
            var iNum=0;
        $(".sp_0").each(function(){
            var sku=iNum+'|'+$(this).find("#sort").val()
       			+'|'+$(this).find("#skuPrice").val()
       			+'|'+$(this).find("#marketPrice").val()
       			+'|'+$(this).find("#stockInventory").val()
       			+'|'+$(this).find("#sku").val()
       			+'|'+$(this).find("#location").val()
       			+'|'+$(this).find("#skuImg").val()
       			+'|'+$(this).find("#showStatus1").val()
            	+'|'+$(this).find("#skuType").val();
   			var spec=$(this).find(".specValue4");
   			spec.each(function(){
   			 var a=$(this);
             var pKey=a.val();
             var pType=a.next();
             var pVal="";
             if(pType.attr("g") == "g"){
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
                 }else{
                 var specVal=sku;
             $("#myForm").append("<input type='hidden' name='specValue' id='specValue' value='"+specVal+"'/>");
                 }
   	   			});
		if(spec.length ==0){
			var specVal=sku;
			 $("#myForm").append("<input type='hidden' name='specValue' id='specValue' value='"+specVal+"'/>");
			}
             iNum++;
            });
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
		//$("#marketPrice").val($("#marketPrice1").val()*100);
		$("#myForm").submit();
        }
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
		//return;
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
		$("#skuPrice").val(test+"00");
	}
	else{
		$("#skuPriceMin1").val(firstSub+'.'+lastSub);
		$("#skuPrice").val(firstSub+lastSub);
	}
}

</script>
</head>
<body id="main">

<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system }/common/itemmenu.jsp" />
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc' />：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/card/listCard.do"/>" title="移动号卡">移动号卡</a>&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system }/item/addCatItemCard.do"/>" title="商品分类">商品分类</a>&nbsp;&raquo;&nbsp;<span class="gray">添加移动号卡</span>
    <a href="<c:url value="/${system }/item/addCatItemCard.do"/>" title="返回移动号卡" class="inb btn120x20">返回移动号卡</a>
</div>
<form action="${path}/card/saveCard.do" name="myForm" id="myForm" method="post">
<h2 class="h2_ch"><span id="tabs" class="l">
<a href="javascript:void(0);" ref="#tab_1" title="基本信息" class="here">基本信息</a>
<a href="javascript:void(0);" ref="#tab_2" title="号卡描述" class="nor">号卡描述</a>
<a href="javascript:void(0);" ref="#tab_3" title="商品参数" class="nor">商品参数</a>
</span></h2>

<div id="tab_1" class="edit set">
	<p><label><samp>*</samp>卡号：</label><input type="text" reg1="^([\d]{11,11})$" desc="请输入11位数字" id="itemName" name="itemName" class="text state" value="${ebItem.itemName}" maxlength="11" />
	</p>
	<p><label><samp>*</samp>商品分类：</label>${ebCat.catName}<input type="hidden" id="catId" name="catId" value="${ebCat.catId}" />
    </p>
	<p><label>商品品牌：</label><select id="brandId" name="brandId">
        <option value="-1" selected="selected">请选择商品品牌</option>
        <c:forEach items="${blist}" var="b">
        <option value="${b.brandId}">${b.brandName}</option>
        </c:forEach>
	</select></p>
	<p><label>市场价：</label><input type="text" desc="保留2位小数，最多允许9位有效数字" reg1="^[0-9]{0,7}\.{0,1}[0-9]{0,2}$" id="marketPrice1" onblur="changeMarPri()" name="marketPrice1" class="text state" value="<c:if test="${ebItem.marketPrice!=null}">${ebItem.marketPrice/100}</c:if>" />
    </p>
    <p><label><samp>*</samp>预存话费：</label><input type="text" desc="保留2位小数，最多允许9位有效数字" reg1="^[0-9]{1,7}\.{0,1}[0-9]{0,2}$" id="skuPriceMin1" name="skuPriceMin1" class="text state" value="<c:if test="${ebItem.skuPriceMin!=null}">${ebItem.skuPriceMin}</c:if>" onblur="changeSkuPriMin()"/>
    </p>
    <!-- 
	<p><label>标签图：</label>
        <input type="checkbox" id="tagImg1" name="tagImg" value="1" class="txt" onclick="checkRadio(this);"/>独家&nbsp;&nbsp;
        <input type="checkbox" id="tagImg2" name="tagImg" value="2" class="txt" onclick="checkRadio(this);"/>推荐&nbsp;&nbsp;
        <input type="checkbox" id="tagImg3" name="tagImg" value="3" class="txt" onclick="checkRadio(this);"/>惊爆价
	</p>
	-->
   	<p><label>促销语：</label><input type="text" reg1="^(.{0,100})$" desc="100个任意字符以内" id="promotion" name="promotion" class="text state"  value="${ebItem.promotion}" maxlength="100"/>
   	</p>
    <p><label>号码靓度：</label>
    <input name="simLevel" type="radio" value="3" checked/>普通号&nbsp;&nbsp;
    <input name="simLevel" type="radio" value="2" />普通靓号&nbsp;&nbsp;
    <input name="simLevel" type="radio" value="1"/>超级靓号
    </p>
    <input type="hidden" id="auditStatus" name="auditStatus" value="1">
    <c:choose>
        <c:when test="${ebItem.auditStatus==null}">
            <p><label>上下架状态：</label><input type="radio" id="showStatus1" name="showStatus" value="0" />上架&nbsp;&nbsp;<input type="radio" id="showStatus1" name="showStatus" value="1" checked />下架
            </p>
        </c:when>
        <c:otherwise>
            <p><label class="alg_t">上下架：</label><input<c:if test="${ebItem.showStatus == 0}"> checked</c:if> type="radio" id="showStatus3" name="showStatus" value="0" class="txt" />上架&nbsp;&nbsp;<input<c:if test="${ebItem.showStatus == 1}"> checked</c:if> type="radio" id="showStatus4" name="showStatus" value="1" class="txt" />下架
            </p>
        </c:otherwise>
    </c:choose>
</div>

<div id="tab_2" class="edit" style="display: none">
<textarea name="itemDesc" id="itemDesc"></textarea>
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
    <p><label></label>无属性</p>
    </c:if>
    <c:forEach items="${list1}" var="f" varStatus="status">
	<p><label>${f.featureName}：</label>
        <c:if test="${f.inputType == 1}">
		<input type="hidden" class="paraValue4" value="${f.featureId}" />
        <select class="paraValue" g="g">
        <option value="">请选择</option>
        <c:forEach items="${f.selectValues}" var="f1">
            <option value="${f1}">${f1}</option>
        </c:forEach>
        </select>
	    </c:if>
        <c:if test="${f.inputType == 2}">
		<c:forEach items="${f.selectValues}" var="f2">
            <input type="hidden" class="paraValue4" value="${f.featureId}" />
            <input type="radio" class="paraValue"  id="pradio${status.index}" name="pradio${status.index}" value="${f2}" />${f2}&nbsp;&nbsp;
		</c:forEach>
	    </c:if>
        <c:if test="${f.inputType == 3}">
		<input type="hidden" class="paraValue4" value="${f.featureId}" />
        <c:forEach items="${f.selectValues}" var="f3">
            <input type="checkbox" class="paraValue" id="pcheck${status.index}" name="pcheck${status.index}" value="${f3}" />${f3}&nbsp;&nbsp;
        </c:forEach>
	    </c:if>
        <c:if test="${f.inputType == 4}">
		<input type="hidden" class="paraValue4" value="${f.featureId}" />
		<input type="text" class="text state paraValue" />
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
                    <tr>
                    <td class="nwp"><input type="text" id="sort" name="sort" class="text20" value="1" maxlength="2" size="5" /></td>
                    <td class="nwp"><samp class="red">*</samp> <input type="text" id="skuPrice" name="skuPrice" class="text20" size="5" value="" /></td>
                    <td class="nwp"><input type="text" id="costPrice" name="costPrice" class="text20" size="5" value=""/></td>
                    <td class="nwp"><samp class="red">*</samp> <input  type="text" id="stockInventory" name="stockInventory" class="text20" size="5" value="1" /></td>
                    <td class="nwp"><input type="text" id="sku" name="sku" class="text20" size="5" value="12" /></td>
                    <td class="nwp"><input  type="text" id="location" name="location" class="text20" size="5" value=""/></td>
                    <td class="nwp"> <input type="text"  id="marketPrice" name="marketPrice" value=""/></td>
                    <td><select id="skuImg" name="skuImg">
                        <option value="1">第一张</option>
                        <option value="2">第二张</option>
                        <option value="3">第三张</option>
                        <option value="4">第四张</option>
                        <option value="5">第五张</option>
                    </select></td>
                    <td>
                    <input id="showStatus1" name="showStatus1" value="0"/>
                    </td>
                  <td><input id="skuType" name="skuType" value="1"/></td>
                </tr>
            </table>
            </td></tr>
        </table>
    </div>
</div>

<div class="loc">&nbsp;</div>

<div class="edit set">
<p><label for="submit">&nbsp;</label><input id="button1"
	type="button" value="提 交" class="hand btn83x23" />&nbsp;&nbsp;<input
	type="button" onclick="javascript:;history.back();" value="取消" class="hand btn83x23b" /></p>
</div>

</form>
<div class="loc">&nbsp;</div>

</div></div>
</body>

