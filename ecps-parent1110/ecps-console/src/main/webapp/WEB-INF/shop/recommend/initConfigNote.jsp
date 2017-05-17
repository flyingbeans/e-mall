<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ecps/console/common/taglibs.jsp"%>
<head>
<title>注音事项配置_代客下单</title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
<meta name="menu" content="relpaceGuestSubmitOrder" />
<script type="text/javascript"
	src="<c:url value='/${system}/res/js/jquery.form.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
	
	<script type="text/javascript">
		$(function(){
			 searchText('#note','#note',40);
		     pageInitialize('#form1','#note');
		});
		function checkNote(){
			var txacontext = $("#note").val();
			if(txacontext == "输入文本..."){
				$("#note").val("");
			}
		}
		//保存主推
	    function updateNote(){
			var note = $("#notes").val();
			if(note.length>500){
				alert("注意事项不能大于500个字符");
				return false;
			}
	    	var ajaxData = "note="+note;
	    	$.ajax({
	        	type:"post",
	         	url:"${base}/valetOrder/updateNote.do",
	         	data:(ajaxData),
	         	success:function(responseText){
	         		alert('操作成功');
	         		
	        	}
	        });
	    }
		//重置注意事项
		function resetNote(){
			$("#notes").val("输入文本...");
		}
		
		
	</script>
</head>
<body id="main">

	<div class="frameL">
		<div class="menu icon">
			<jsp:include page="/ecps/console/common/valetordermenu.jsp" />
		</div>
	</div>

	<div class="frameR">
		<div class="content">
			<div class="loc icon">
				<samp class="t12"></samp>
				<fmt:message key='menu.current.loc' />
				：代客下单管理&nbsp;&raquo;&nbsp;<span class="gray" title="注意事项 配置">注意事项配置</span>
			</div>

			<form action="${base}/valetOrder/updateNote.do" name="form1">
				<div class="edit set">
					<p>
						<label for=""><samp>*</samp>注意事项:</label>
						<textarea id="notes" name="notes" class="are arew" rows="6" cols="50" id="u22" onclick="checkNote();" ><c:choose><c:when test="${empty note }">输入文本...</c:when><c:otherwise>${note }</c:otherwise></c:choose></textarea>
					</p>
					<p><label for="submit">&nbsp;</label>
						<input type="button" value="确定" class="hand btn83x23" id="u23" onclick="updateNote();" />&nbsp;&nbsp;
						<input type="button" value="重置" class="hand btn83x23b" id="u24" onclick="resetNote();" />
					</p>
				</div>
			</form>
		</div>
	</div>
</body>