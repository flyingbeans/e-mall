function tipShow(idName){

	var idObj = $(idName);
	var idBgObj = $("#bgWindow");

	if(idBgObj.length == 0){
		var iframe,div;
		div = $("<div></div>");
		div.attr({id:"bgWindow",style:"display:none"});
		iframe = $("<iframe></iframe>");
		iframe.attr({id:"bgWindowIframe",src:"about:blank",marginwidth:"0",marginheight:"0",frameBorder:"no",framespacing:"0",allowtransparency:"true"});
		div.append(iframe);
		$(document.body).append(div);
		idBgObj = $("#bgWindow");	
	}

	var winH = $(window).height();
	var docH = $(document.body).height();
	if(winH > docH){docH = winH;}
	
	var winW = $(window).width();
	var docW = $(document.body).width();
	if(winW > docW){docW = winW;}

	var scrollH = $(document).scrollTop();
	if(scrollH == undefined){scrollH = 0}
	//alert(idObj.height());
	var t = parseInt((winH - idObj.height())/2);
	if(idObj.css("position") == "absolute"){t = t + scrollH;}
	if(t != parseInt(idObj.css("top"))){idObj.css("top",t);}

	var l = parseInt((winW - idObj.width())/2);
	if(l < 0){l = 0;}
	if(l != parseInt(idObj.css("left"))){idObj.css("left",l);}
	
	if(docW != parseInt(idBgObj.css("width"))){idBgObj.css("width",docW);}
	if(docH != parseInt(idBgObj.css("height"))){idBgObj.css("height",docH);idBgObj.find("iframe").css("height",docH);}

	idBgObj.show();
	idObj.show();

	window.onresize = function(){
		if(idObj.css("display") == "block"){tipShow(idName);}
	};
	window.onscroll = function(){
		if(idObj.css("display") == "block"){tipShow(idName);}
	};
	
	var close = idName + "Close";
	var reset = idName + "Reset";
	var ok = idName + "Ok";
	if($(close).length == 1){$(close).click(function(){tipHide(idName);});}
	if($(reset).length == 1){$(reset).click(function(){tipHide(idName);});}
	if($(ok).length == 1){$(ok).click(function(){tipHide(idName);});}
}

function tipHide(idName){$(idName).hide();$("#bgWindow").hide();}

/*加入收藏*/
function addToFavorite(){var a="http://www.10086.cn/";var b="中国移动通信";if(document.all){window.external.AddFavorite(a,b)}else if(window.sidebar){window.sidebar.addPanel(b,a,"")}else{alert("对不起，您的浏览器不支持此操作!\n请您使用菜单栏或Ctrl+D收藏本站。")}}function asyncScript(A,B){if(typeof A=="function"){var B=A,A=null}if(A){if(typeof A!="string"){return}var x=document.createElement('script');x.type='text/javascript';x.async=true;x.src=A;var s=document.getElementsByTagName('head')[0];s.appendChild(x);if(B){if(typeof B!="function"){return}if(!/*@cc_on!@*/0){x.onload=function(){B()}}else{x.onreadystatechange=function(){if(x.readyState=='loaded'||x.readyState=='complete'){B()}}}}}else{if(!B){return}setTimeout(function(){B()},0)}};function getRandomObj(A,R){var x=0;for(var i=0;i<A.length;i++){x+=R[i]||1;if(!R[i])R.push(1)}var y=Math.ceil(Math.random()*x),z=[],m=[];for(var i=1;i<x+1;i++){z.push(i)}for(var i=0;i<A.length;i++){m[i]=z.slice(0,R[i]);z.splice(0,R[i])}for(var i=0;i<m.length;i++){for(var j=0;j<m[i].length;j++){if(y==m[i][j]){return A[i]}}}}function setRandomAds(A,R,O,flag){var obj=getRandomObj(A,R),ele=document.getElementById(O),img;if(!obj){return}if(flag&&screen.width>=1280){obj.width=obj.width2;obj.url=obj.url2}else{obj.width=obj.width;obj.url=obj.url}img="<a href='"+obj.link+"' target='_blank'><img width='"+obj.width+"' height='"+obj.height+"' alt='"+obj.alt+"' app='image:poster' src='"+obj.url+"' /></a>";if(ele)ele.innerHTML=img}String.prototype.format=function(){var a=this,c=arguments.length;if(c>0){for(var b=0;b<c;b++){a=a.replace(new RegExp("\\{"+b+"\\}","g"),arguments[b]);}}return a;};function sBuilder(){this.strings=new Array();this.length=0;this.append=function(a){this.strings.push(a);this.length+=a.length;};this.toString=function(c,d,b){var c=c?c:"",a=this.strings.join(c);if(d&&b){a=a.substr(d,b);}return a;};};
/*设为首页*/
function setHomePage(obj){var aUrls=document.URL.split("/");var vDomainName="http://"+aUrls[2]+"/";try{/*IE*/obj.style.behavior="url(#default#homepage)";obj.setHomePage(vDomainName);}catch(e){/*other*/if(window.netscape) {/*ff*/try {netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); } catch (e) { alert("抱歉！您的浏览器不支持直接设为首页。请在浏览器地址栏输入\"about:config\"并回车然后将[signed.applets.codebase_principal_support]设置为\"true\"，点击\"加入收藏\"后忽略安全提示，即可设置成功。"); }var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);prefs.setCharPref('browser.startup.homepage',vDomainName);}}if(window.netscape)alert("抱歉！您的浏览器不支持直接设为首页。请在浏览器地址栏输入\"about:config\"并回车然后将[signed.applets.codebase_principal_support]设置为\"true\"，点击\"加入收藏\"后忽略安全提示，即可设置成功。");}
/*定时跳转*/
function countDown(idn,second,url){$(idn).text(second);if(--second>0){setTimeout("countDown('"+idn+"',"+second+",'"+url+"')",1000);}else{location.href=url;}}
/*定时隐藏*/
function countHide(idn,second){if(--second>0){setTimeout("countHide('"+idn+"',"+second+")",1000);}else{$(idn).fadeOut('slow');}}

/*
var resizeTimer = null;
var bodyWidth;
function doResize(){
	
	var winW = $(window).width();
	var docW = $(document.body).width();
	if(winW > docW){docW = winW;}
	if(bodyWidth != docW){
		bodyWidth = docW;
		if(docW<=1250){
            $('.w').css('width',"1250px");
            $('.main').css('width',"1250px");
            if($('.frameR')){$('.frameR').css('width',"1200px");}
		}else{
            $('.w').css('width',docW + "px");
            $('.main').css('width',(docW - 20) + "px");
            if($('.frameR')){$('.frameR').css('width',(docW - 242) + "px");}
		}
	}
	if(resizeTimer) clearTimeout(resizeTimer);
	resizeTimer = setTimeout("doResize()",0);
	
}
*/
/*查询文本输入*/
function searchText(fromId,toId,maxLen){
    var txt = $(fromId).attr('title');
    var tip = fromId.substring(1) + 'Tip';
    var val = $(fromId).val();
    if(val == ''){
        $(fromId).val(txt);$(fromId).addClass('gray');
    }else{
       if(val != txt){$(fromId).removeClass('gray');}
    }
    $(fromId).focus(function(){
        var val = $(this).val();
        if(val == txt){$(this).val('');$(this).removeClass('gray');}
    });
    $(fromId).blur(function(){
        var val = $(this).val();
        if(val == ''){
            $(this).val(txt);$(this).addClass('gray');$(toId).val('');return false;
        }else{
            if(val != txt){
                if(val.length > maxLen){
                    if($('#'+tip).length == 0){
                        $(this).after('<span id="'+tip+'" class="orange">请输入'+maxLen+'位内的字符！</span>');
                    }
                    return false;
                }else{
                    if($('#'+tip).length == 1){$('#'+tip).remove();}
                    $(this).removeClass('gray');
                    $(toId).val($.trim(val));
                }
            }else{$(toId).val('');return false;}
        }
    });
}
function submitText(fromId,toId,maxLen){
    var txt = $(fromId).attr('title');
    var tip = fromId.substring(1) + 'Tip';
    var val = $(fromId).val();
    if(val == ''){
        $(fromId).val(txt);$(fromId).addClass('gray');$(toId).val('');return false;
    }else{
        if(val != txt){
           if(val.length > maxLen){
                if($('#'+tip).length == 0){
                    $(fromId).after('<span id="'+tip+'" class="orange">请输入'+maxLen+'位内的字符！&nbsp;&nbsp;</span>');
                }
                return false;
            }else{
                if($('#'+tip).length == 1){$('#'+tip).remove();}
                $(fromId).removeClass('gray');
                $(toId).val($.trim(val));
            }
        }else{$(toId).val('');return false;}
    }
}
/*search*/
function goSearch(formId,textId){
	if(textId != ''){submitText('#searchText',textId,40);}
	setTimeout(function(){$(formId).submit();},0);
}
/*page*/
function pageInitialize(formId,textId){
    var piece = $('#paginationPiece').val();
    var pageNo = parseInt($('#paginationPageNo').val());
    var total = parseInt($('#paginationTotal').val());
    $('#pagePiece').text(piece);
    $('#pageTotal').text(pageNo+'/'+total);
    if(pageNo > 1){
          $('#previousNo').attr('class','hidden');
          $('#previous').attr('class','inb');
    }else{
        $('#previousNo').attr('class','inb');
        $('#previous').attr('class','hidden');
    }
    if(pageNo < total){
        $('#nextNo').attr('class','hidden');
        $('#next').attr('class','inb');
    }else{
        $('#nextNo').attr('class','inb');
        $('#next').attr('class','hidden');
    }
    $('#previous').click(function(){
        $('#pageNo').val($('#paginationPrePage').val());
        goSearch(formId,textId);
    });
    $('#next').click(function(){
       $('#pageNo').val($('#paginationNextPage').val());
       goSearch(formId,textId);
    });
    
}

//全选与取消
//全选checkbox
function checkAll(e, itemName) {
	var aa = document.getElementsByName(itemName);
	for ( var i = 0; i < aa.length; i++)
		aa[i].checked = e.checked;
}
//条目checkbox
function checkItem(e, allName) {
	var all = document.getElementsByName(allName)[0];
	if (!e.checked)
		all.checked = false;
	else {
		var aa = document.getElementsByName(e.name);
		for ( var i = 0; i < aa.length; i++)
			if (!aa[i].checked)
				return;
		all.checked = true;
	}
}
//全选链接
function checkAllIds() {
	var bb=  document.getElementById("all");
	bb.checked = true;
	var aa = document.getElementsByName("ids");
	for ( var i = 0; i < aa.length; i++)
		aa[i].checked = true;
}
//取消链接
function uncheckAllIds() {
	var bb=  document.getElementById("all");
	bb.checked = false;
	var aa = document.getElementsByName("ids");
	for ( var i = 0; i < aa.length; i++)
		aa[i].checked = false;
}
//是否选择
function isChecked(){
    var isselected=false;
    $("input[name='ids']").each(function(){
        if($(this).attr("checked")){
            isselected=true;
        }
    });
    return isselected;
}

$(function(){

    $("#number").keypress(function(){
        if(event.keyCode==13){return false;}
    });

});