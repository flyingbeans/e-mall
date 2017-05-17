<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>登陆日志_系统配置</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/ecps/console/res/plugins/My97DatePicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
    function isChecked(){
        var isselected=false;
        $("input[name='ids']").each(function(){
            if($(this).attr("checked")){
                isselected=true;
            }
        });
        return isselected;
    }
    function singleDel(logId, logTime){
        if(confirm("确定删除记录")){
        	var dlog = Date.parse(logTime.replace(/-/g,"/"));
        	dlog = new Date(dlog);
        	$.ajax({
	    		type:"post",
	    		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
	    		url:'${base}/log/login/getTime.do',
	    		
	    		complete:function(data){
	    			var resTxt = eval("("+data.responseText+")");
	    			
	    			var now=Date.parse(resTxt.sysTime.replace(/-/g,"/"));
	    			now = new Date(now);
	    			dnow = new Date(now.getFullYear(), now.getMonth()-3, now.getDate(),now.getHours(),now.getMinutes(),now.getSeconds());
	    			var difflog=dnow-dlog;
	    			
	    		
	    			
	    			if(difflog>0) {
	    				$("#form1").attr("action","${base}/log/login/deleteBackLandLogById.do?id=" + logId);
	    	           	$("#form1").submit();
	    			} else {
	    				alert("不能删除3个月内的日志!");
	    			}
	    		}
	    	});
        }
    }
    function batchDel(){
        if(!isChecked()){
            alert("请选择记录");
            return;
        }
        if(confirm("确定删除这些记录")){
        	$.ajax({
	    		type:"post",
	    		contentType: "application/x-www-form-urlencoded; charset=utf-8", 
	    		url:'${base}/log/login/getTime.do',
	    		
	    		complete:function(data){
	    			var resTxt = eval("("+data.responseText+")");
	    			
	    			var now=Date.parse(resTxt.sysTime.replace(/-/g,"/"));
	    			now = new Date(now);
	    			dnow = new Date(now.getFullYear(), now.getMonth()-3, now.getDate(),now.getHours(),now.getMinutes(),now.getSeconds());
	    			
		        	var array=new Array();
					var in3m=false;
					var out3m=false;
		        	$("input[name='ids']").each(function () {
		        		if ($(this).attr("checked")=="checked") {
				        		var dindex = Date.parse($("#"+$(this).val()).text().replace(/-/g,"/"));
								dindex = new Date(dindex);	
							    var difflog=dnow-dindex
							    if(difflog>0) {
							    	//-------xc 所选的日志有3个月之外的
							    	out3m=true;
				    			} else {
				    				//-------xc 所选的日志有3个月之内的
				    				$(this).attr("checked",false);
				    				in3m=true;
				    			}
				        	
		        			} 
		        		})
		            if(in3m&&out3m){
		        	$("#form1").attr("action","${base}/log/login/batchDelBackLandLogById.do");
		           	$("#form1").submit();	           	
			           alert("删除完成，其中3个月内的日志无法删除！")	       		
		           	}  
		           	else if(!out3m&&in3m){	           		
			           alert("3个月内的日志无法删除");
		           	} 
		          
	    		}
	    	});
        	
        }
    }
    function gotoPage(pageNo){
        if(pageNo!='jump'){
            $("#pageNo").val(pageNo);
        }else{
            var jumppage=$("#pageNo").val();
            var reg = new RegExp("^[0-9]*$");
            if(!reg.test(jumppage)){
                alert("请输入数字");
                $("#pageNo").val("");
                return;
            }
            var totalPage=<c:out value="${pagination.totalPage}"/>;
            if(jumppage>totalPage){
                $("#pageNo").val(<c:out value="${pagination.totalPage}"/>);
            }
        }
        $("#form1").submit();
    }
    function checkDate(){
    	var start=$("#begin").val();
    	var end=$("#end").val();
    	if(typeof(start)=="undefined" || start==""){
    		return true;
    	}
    	if(typeof(end)=="undefined" || end==""){
    		return true;
    	}
    	var d1=new Date(start.replace(/-/g,"/"));
    	var d2=new Date(end.replace(/-/g,"/"));
    	var temp=d2-d1;
    	if(temp<0){
    		alert("结束日期必须大于开始日期！");
    		return false;
    	}
    	return true;
    }
    $(document).ready(function(){
        $("#selTime").change(function(){
            var value=$("#selTime").val();
            if(value==1){
                $("#selTimeTo").show();
            }else{
            	$("#begin").val("");
            	$("#end").val("");
                $("#selTimeTo").hide();
            }
        });
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
    });
    $(document).ready(function(){
    	$("#form1").submit(function(){
    		 var jumppage=$("#pageNo").val();
             var reg = new RegExp("^[0-9]*$");
             if(!reg.test(jumppage)){
                 $("#pageNo").val("");
             }
    	});
    	$("#backlogID").click(function(){
    		if(checkDate()){
    			$("#form1").submit();
    		}
   		});
    	$("#exportLoginLogID").click(function(){
    		if(checkDate()){
    			 $("#form1").attr("action","${base}/log/login/exportBackLandLog.do");
    		     $("#form1").submit();
    		     $("#form1").attr("action","${base}/log/login/listBackLog.do");
    		}
   		});
    });
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/systemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">
<div class="loc icon"><samp class="t12"></samp><fmt:message key='menu.current.loc'/>：系统配置&nbsp;&raquo;&nbsp;<span class="gray" title="后台登陆日志管理">后台登陆日志管理</span></div>
<form id="form1" name="form1" action="${base}/log/login/listBackLog.do" method="post">
 	<div class="sch">
     	<p>
     		<fmt:message key="tag.search"/>：
     		<select id="selTime" name="selTime">
  				<option value="0" <c:if test='${selTime==0}'>selected</c:if>>请选择时间段</option>
      			<option value="1" <c:if test='${selTime==1}'>selected</c:if>>自定义</option>
			    <option value="2" <c:if test='${selTime==2}'>selected</c:if>>3个月前</option>
			    <option value="3" <c:if test='${selTime==3}'>selected</c:if>>半年前</option>
			    <option value="4" <c:if test='${selTime==4}'>selected</c:if>>一年前</option>
  			</select>
  			<span id="selTimeTo" <c:if test='${selTime!=1}'>style="display:none"</c:if>>
  				开始日期：<input type="text" id="begin" name="begin" onfocus="WdatePicker()" class="text20 date" readonly="readonly" value="${begin}"/>
  				结束日期：<input type="text" id="end" name="end" onfocus="WdatePicker()" class="text20 date" readonly="readonly" value="${end}" />
   			</span>
			登录用户：<input type="text" name="userSearch" class="text20 medium" value="${userSearch}"/>
			<input id="backlogID" type="button" class="hand btn60x20" value='<fmt:message key="tag.search"/>' />
     	</p>
 	</div>

	<div class="page_c">
    	<span class="l">
        	<input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
    	</span>
    	<span class="r inb_a">
        	<a href="#" id="exportLoginLogID" title="<fmt:message key="tag.add"/>" class="btn80x20">导出日志</a>
       </span>
   	</div>

	<table cellspacing="0" summary="" class="tab">
		<thead>
			<th><input type="checkbox" id="all" name="all" title="全选/取消" /></th>
			<th>登录用户</th>
			<th>登录时间</th>
			<th>登录IP</th>
			<th>操作</th>
		</thead>
		<tbody>
			<c:forEach items='${pagination.list}' var="backlandlog">
			<tr>
				<td><input type="checkbox" name="ids" value="${backlandlog.logId}"/></td>
				<td class="nwp"><c:out value='${backlandlog.logUserName}'/></td>
				<td id="${backlandlog.logId}"><fmt:formatDate value="${backlandlog.logTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><c:out value='${backlandlog.logIpAddress}'/></td>
				<td>
					<a href="#" onclick="singleDel('${backlandlog.logId}', '${backlandlog.logTime}')">删除</a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5">
                	选择： <a id="checkall" href="#" >全选</a> <samp>-</samp> 
                		  <a id="cancelall" href="#" >取消</a>
				</td>
			</tr>
		</tbody>
	</table>

   	<div class="page_c">
       	<span class="l inb_a">
        	<input type="button" onclick="batchDel();" value="<fmt:message key="tag.delete"/>" class="hand btn60x20" />
    	</span>
    	<span class="r page inb_a">
	        <input type="hidden" value="${orderBy}" id="orderBy" name="orderBy" />
            <input type="hidden" value="${orderByStatus}" id="orderByStatus" name="orderByStatus" />
            共 <var class="red">${pagination.totalCount}</var> 条&nbsp;&nbsp;
            <var><c:out value="${pagination.pageNo}"/>/<c:out value="${pagination.totalPage}"/></var>
            <c:if test='${pagination.pageNo==1}'><span class="inb" title="上一页"><fmt:message key="tag.page.previous"/></span></c:if>
            <c:if test='${pagination.pageNo>1}'><a href="#" onclick="gotoPage('${pagination.prePage}')" title="上一页"><fmt:message key="tag.page.previous"/></a></c:if>
            <c:if test='${pagination.totalPage==pagination.pageNo}'><span class="inb" title="下一页"><fmt:message key="tag.page.next"/></span></c:if>
            <c:if test='${pagination.totalPage>pagination.pageNo}'><a href="#" onclick="gotoPage('${pagination.nextPage}')"><fmt:message key="tag.page.next"/></a></c:if>
            <input type="text" name="pageNo" id="pageNo" class="txts" value="${pagination.pageNo}" size="7"/>
            <input type="button" onclick="gotoPage('jump')" value="<fmt:message key="tag.page.jump"/>" class="hand" />
    	</span>
	</div>
</form>
</div></div>
</body>

