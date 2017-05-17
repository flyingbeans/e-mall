<%@ include file="/ecps/console/common/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>属性管理_类目管理_商品管理</title>
<meta name="heading" content="商品管理"/>
<meta name="tag" content="tagName"/>
<script type="text/javascript" src="<c:url value='/${system}/res/js/jquery.tablesorter.js'/>"></script>
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
	
	var flag = null;
	
	function singleDel(url){
		tipShow('#confirmDiv');
		objUrl = url;
        flag="singleDel";
	}
	function batchDel(){
		if(!isChecked()){
			alert("请选择记录");
			return;
		}
		tipShow('#confirmDiv');
        flag="batchDel";
		
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
		$("input[id='confirmDivOk']").click(function(){
			if(flag=="singleDel"){
				document.location=objUrl;
			}else if(flag=="batchDel"){
				$("#form1").attr("action","${base}/item/feature/batchDelFeatureById.do");
		       	$("#form1").submit();
			}else{
				return
			}
		})
	});
	$(document).ready(function(){
		$("#catId").change(function(){
			$("#form1").attr("action","${base}/item/feature/listFeature.do");
	       	$("#form1").submit();
		});
		
	});
	$(document).ready(function(){
		<c:if test="${message!=null }">
			alert("<c:out value='${message }'/>");
		</c:if>
	});
</script>
</head>
<body id="main">
<div class="frameL"><div class="menu icon">
    <jsp:include page="/${system}/common/itemmenu.jsp"/>
</div></div>

<div class="frameR"><div class="content">

<div class="loc icon"><samp class="t12"></samp>当前位置：商品管理&nbsp;&raquo;&nbsp;<a href="<c:url value="/${system}/item/cat/listCat.do?catType=1"/>" >类目管理</a>&nbsp;&raquo;&nbsp;<span class="gray">属性管理</span><a href="<c:url value="/${system}/item/cat/listCat.do?catType=1"/>" class="inb btn120x20">返回类目管理</a></div>

<form id="form1" name="form1" action="${base}/item/feature/listFeature.do" method="post">
    
    
    
    <div class="page_c">
       
        <span class="r inb_a">
            <a href="${path }/shop/item/addfeature.jsp" title="添加" class="btn80x20">添加</a>
        </span>
    </div>
    
	<table id="sortTable" cellspacing="0" summary="" class="tab">
		<thead>
			<th>属性名称</th>
			<th>属性类型</th>
			<th>可选值</th>
			<th>规格</th>
			<th>筛选条件</th>
			<th>显示</th>
			<th>排序</th>
			<th>操作</th>
		</thead>
		<tbody>
			<tr>
					<td>内存</td>
					
					
					<td>单选</td>
					
					
					<td class="nwp">1G,2G,3G</td>
					
					<td>是</td>
					
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>颜色</td>
					
					
					<td>单选</td>
					
					
					<td class="nwp">黑色,白色</td>
					
					<td>是</td>
					
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>手机颜色</td>
					
					
					<td>单选</td>
					
					
					<td class="nwp">蓝色,绿色</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>像素</td>
					
					
					<td>单选</td>
					
					
					<td class="nwp">1024,768,1380</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>手机尺寸</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">151.1x80.5x9.4mm</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>手机重量</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">180g </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>其他特性</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">大容量电池,NFC功能</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>用户界面</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">Touch Wiz 5.0</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>CPU频率</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">1638MHz </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>SIM卡类型</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">Micro SIM卡</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>电池类型</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">可拆卸式电池</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>输入法</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">中文输入法,英文输入法,第三方输入法</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>输入方式</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">手写</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>通话记录</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">已接+已拨+未接电话</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>操作系统</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">Windows8,Android2.3,Android4.0,Android4.1,Android2.3.5,Android,IOS,Windows Mobile,Symbian,其他</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>GPS导航</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">内置GPS,支持A-GPS</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>感应器类型</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">重力感应器,加速传感器,光线传感器,距离传感器</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>摄像头类型</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">双摄像头(前后)</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>前置摄像头像素</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">190万像素</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>后置摄像头像素</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">800万像素</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>闪光灯</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">LED补光灯</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>自动对焦</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">支持</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>通讯录</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">名片式存储</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>地图软件</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">支持3D地图</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>电子罗盘</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">支持数字罗盘</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>摄像头</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">内置</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>传感器类型</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">CMOS</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>图像尺寸</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">最大支持3264×2448像素照片拍摄</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>视频拍摄</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">1080p视频录制(1920×1080,30帧/秒)</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>视频播放</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">3GP,MP4,WMV,ASF,AVI,FLV,MKV,WebM</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>音频播放</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">MP3,OGG,WMA,AAC,ACC+,eAAC+,AMR(NB,WB),MIDI,WAV,AC-3,Flac</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>图形格式</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">支持JPEG等格式</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>收音机</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">支持RDS功能的FM收音机</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>游戏</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">内置游戏,支持下载</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>社交应用</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">内置QQ,MSN,人人网,开心网,新浪微博,QQ空间</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>应用特点</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">WikiAR,淘宝,腾讯新闻</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>服务特色</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">社交圈,影视圈,悦读圈,音乐圈,S Pen程序,S Planner,S Memo </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>蓝牙传输</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">支持蓝牙4.0+EDR+A2DP </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>WLAN功能</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">WIFI,IEEE 802.11 a/n/b/g</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>数据接口</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">USB v2.0,支持USB OTG功能,TV-OUT </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>耳机插孔</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">3.5mm</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>CPU核心数</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">单核,双核,四核</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>网络支持</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">WCDMA,TD-HSDPA,GSM,TD-SCDMA,GPRS,EDGE</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>机身内存ROM</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">32GB,8GB,53.9MB,512MB,1GB,1.5GB,2GB,2.5GB,3GB,4GB,16G</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>运行内存RAM</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">768MB,2471KB,256MB,512MB,1GB,1.5GB,2GB,2.5GB,3GB,4GB</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>存储扩展</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">可支持32GB以上,无,最高可支持64GB mircoSD,最大支持32GB MicroSD扩展卡,支持,最大支持16GB MicroSD扩展卡</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>屏幕尺寸</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">4.65英寸,5英寸,5.5英寸,4.8英寸,4.5英寸,4.3英寸,4.0英寸,3.7英寸,3.75英寸,3.5英寸,3.14英寸,2.8英寸,2.4英寸,2.2英寸,1.8英寸</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>3</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>网络频率</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">TD-HSPA 1880-1920,TD-HSPA 2010-2025,WCDMA,GPRS 900/1800/1900,TD-HSDPA 1880/2010,EDGE 850/900/1900,GSM 850/900/1900,TD-SCDMA1900/2100,TDSCDMA 1900/2000MHz,HSDPA 1900/2000MHz,HSUPA 1900/2000MHz,2G 900/1800/1900MHz,WCDMA (900/2100MHz) ,EDGE900/1800/1900MHz,TD 1880/2010,2100MHz,GSM 900/1800/1900,TD-SCDMA 2010-2025,GSM 900/1800,GSM900/1800MHZ,TD-SCDMA 1880-1920</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>主屏分辨率</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">720×1200,940x540像素,480×854像素,1280×720像素,960×540像素,480×800像素,176×220像素,128×160像素,240×320像素,320×480像素</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>2</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>主屏材质</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">HD Super AMOLED </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>网络类型</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">单卡双模</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>理论速率</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">HSDPA：21Mbps,HSUPA：5.76Mbps </td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>外观设计</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">直板,翻盖,滑盖,侧滑盖</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>操作方式</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">标准键盘,触摸屏,全键盘</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>屏幕色彩</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">1600万色,26万色,65536色</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>CPU型号</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">高通骁龙S4,双核Tiger ,MTK MT6517A,联发科 MT6589,联发科 MT6517,展讯SC8810T 1GHz,Exynos 4412,高通MSM7627T,88PM8607,MARVELL 920H,88CP920,Marvell920,PXA920,ST-Ericsson 9500,MSM 7627T</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>电池容量</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">锂电池（1300mAh）,锂电池（1730mAh）,锂电池（1650mAh）,锂电池（1600mAh）,锂电池（1800mAh）,锂电池（2000mAh）,锂电池（1700mAh）,锂电池（1500mAh）,锂电池（2100mAh）,锂电池（3100mAh）,锂离子电池,锂电池（800mAh）,锂电池</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>上市时间</td>
					
					<td>下拉框</td>
					
					
					
					<td class="nwp">2010年,2011年01月,2011年12月,2011年,2012年,2013年</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>手机类型</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">无,3G手机,智能手机,商务手机,拍照手机,平板手机</td>
					
					
					<td>否</td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>
			
				<tr>
					<td>触摸屏</td>
					
					
					
					<td>复选</td>
					
					<td class="nwp">电容屏,多点触控 </td>
					
					
					<td>否</td>
					
					<td>是</td>
					
					
					<td>是</td>
					
					
					<td>1</td>
					<td><a href="#">编辑</a>
					<a href="#">删除</a>
					
					</td>
				</tr>

			
		</tbody>
	</table>
	
	
</form>
</div></div>
</body>


