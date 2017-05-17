<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>操作记录_实体商品_商品管理</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="menu" content="ItemMgmtMenu"/>
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
			var ref = $(this).attr("ref");
			var ref_t = tObj.attr("ref");
			tObj.attr("class","nor");
			$(this).attr("class","here");
			$(ref_t).hide();
			$(ref).show();
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
	$("#button1").click(function(){
        if (!updateList()) {
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
	<c:if test="${tableName!='EB_SIMCARD' }">
    	<jsp:include page="/${system }/common/itemmenu.jsp" />
    </c:if>
    <c:if test="${tableName=='EB_SIMCARD' }">
    	<jsp:include page="/${system }/common/simcardmenu.jsp" />
    </c:if>
</div></div>

<div class="frameR"><div class="content">

	<div class="loc icon"><samp class="t12"></samp>
		<c:if test="${tableName=='EB_ITEM' }">
			<c:if test="${isCard=='y' }">
				<fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;
				<a href="<c:url value="/${system }/card/listCard.do"/>" title="移动号卡">移动号卡</a>&nbsp;&raquo;&nbsp;
				<a href="javascript:history.back(-1);">编辑移动号卡</a>&nbsp;&raquo;&nbsp;<span class="gray">操作记录</span>
			</c:if>
			<c:if test="${empty isCard || isCard=='n' }">
				<fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;
				<a href="<c:url value="/${system }/item/listEntity.do"/>" title="实体商品">实体商品</a>&nbsp;&raquo;&nbsp;
				<a href="javascript:history.back(-1);">编辑商品</a>&nbsp;&raquo;&nbsp;<span class="gray">操作记录</span>
			</c:if>			
		</c:if>
		<c:if test="${tableName=='EB_OFFER' }">
			<fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;
			<a href="<c:url value="/${system }/activity/listoffer.do"/>" title="活动档次">活动档次</a>&nbsp;&raquo;&nbsp;
			<a href="javascript:history.back(-1);">编辑活动档次</a>&nbsp;&raquo;&nbsp;<span class="gray">操作记录</span>
		</c:if>
		<c:if test="${tableName=='EB_OFFER_GROUP' }">
			<fmt:message key='menu.current.loc'/>：<fmt:message key='ItemMgmtMenu.title' />&nbsp;&raquo;&nbsp;
			<a href="<c:url value="/${system }/activity/listOfferGroup.do"/>" title="营销案">营销案</a>&nbsp;&raquo;&nbsp;
			<a href="javascript:history.back(-1);">编辑营销案</a>&nbsp;&raquo;&nbsp;<span class="gray">操作记录</span>
		</c:if>		
		<c:if test="${tableName=='EB_SIMCARD' }">
			<fmt:message key='menu.current.loc'/>：<c:out value="号卡管理"></c:out>&nbsp;&raquo;&nbsp;
			<a href="<c:url value="/${system }/simcard/listSimCard.do?saleStatus=1"/>" title="号卡列表">号卡列表</a>&nbsp;&raquo;&nbsp;
			<a href="javascript:history.back(-1);">编辑号卡</a>&nbsp;&raquo;&nbsp;<span class="gray">操作记录</span>
		</c:if>
    <a class="inb btn80x20" title="返回" href="javascript:history.back(-1);">返回</a>
    </div>

	<c:if test="${tableName=='EB_ITEM' }">
		<div class="sch"><p>商品名称：${name }&nbsp;&nbsp;&nbsp;&nbsp;商品编号：<var>${no }</var></p></div>
	</c:if>
	<c:if test="${tableName=='EB_OFFER' }">
		<div class="sch"><p>活动名称：${name }&nbsp;&nbsp;&nbsp;&nbsp;活动编号：<var>${no }</var></p></div>
	</c:if>
	<c:if test="${tableName=='EB_OFFER_GROUP' }">
		<div class="sch"><p>活动名称：${name }&nbsp;&nbsp;&nbsp;&nbsp;活动编号：<var>${no }</var></p></div>
	</c:if>
	<c:if test="${tableName=='EB_SIMCARD' }">
		<div class="sch"><p>品牌：${name }&nbsp;&nbsp;&nbsp;&nbsp;号码：<var>${no }</var></p></div>
	</c:if>
	
    <table cellspacing="0" class="tab">
        <tr>
            <th width="12%">操作类型</th>
            <th width="12%">操作时间</th>
            <th width="15%">操作人</th>
            <th>操作备注</th>
        </tr>
        <c:forEach items='${logs}' var="log" varStatus="count">
            <tr>
            <td>${log.opType }</td>
            <td><fmt:formatDate value="${log.opTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
            <td class="nwp">${log.username }</td>
            <td class="nwp">${log.notes }</td>
            </tr>
        </c:forEach>
    </table>
	
</div></div>
</body>
