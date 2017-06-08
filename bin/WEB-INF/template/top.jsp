<script class="template Top" type="text/x-jquery-tmpl">
<div id="topbar">
	<div class="topbar-w">
		<div class="day">
			今天是：<span id="current_time">{{=it.currentTime}}</span>
		</div>
		<div class="addcollect">
			<a href="javascript:void(0)" onclick="shoucang(document.title,window.location)"> 设为首页 </a>
		</div>
		<div class="homepage">
			<a href="javascript:void(0)" onclick="SetHome(this,window.location)">加入收藏</a>
		</div>
		<div class="homepage_sy" style="padding-left: 0;">
			<a href="./"> 首页 </a>
		</div>
		<div class="homepage_sy">
			<a href="./login" target="_blank"> 登录 </a>
		</div>
	</div>
</div>
<div id="topimg">
	<div class="topimgcon">
		 <img id="top_img" src="img/top_img01.jpg" width="100%" height="360">
		 <img class="top_img_logo" src="img/logo.png">
	</div>
</div>
</script>

<script type="text/javascript">
$(function(){
	setInterval("changeimg()", 30)
});

function changeimg(){ 
    $(".topimgcon").fadeTo(5000, 1,		function(){ $("#top_img").attr("src","img/top_img01.jpg"); });
    $(".topimgcon").fadeTo(5000, 0.4, 	function(){ $("#top_img").attr("src","img/top_img02.jpg"); });
    $(".topimgcon").fadeTo(5000, 1, 	function(){ $("#top_img").attr("src","img/top_img03.jpg"); });
    $(".topimgcon").fadeTo(5000, 0.4, 	function(){ $("#top_img").attr("src","img/top_img04.jpg"); });
    $(".topimgcon").fadeTo(5000, 1, 	function(){ $("#top_img").attr("src","img/top_img01.jpg"); });
}

function currentTime() {
	var d = new Date(), str = '';
	str += d.getFullYear() + '年';
	str += d.getMonth() + 1 + '月';
	str += d.getDate() + '日';

	var week;
	if (d.getDay() == 0)
		week = "星期日"
	if (d.getDay() == 1)
		week = "星期一"
	if (d.getDay() == 2)
		week = "星期二"
	if (d.getDay() == 3)
		week = "星期三"
	if (d.getDay() == 4)
		week = "星期四"
	if (d.getDay() == 5)
		week = "星期五"
	if (d.getDay() == 6)
		week = "星期六"
	str += " " + week;
	return str;
};
function SetHome(obj,vrl) { // 设置为主页 
	try{ 
		obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl); 
	} catch(e){ 
		if(window.netscape) { 
			try { 
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
			} catch (e) { 
				alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。"); 
			} 
			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch); 
			prefs.setCharPref('browser.startup.homepage',vrl); 
		} else { 
			alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。"); 
		} 
	} 
} 

function shoucang(sTitle,sURL) { // 加入收藏 兼容360和IE6 
	try { 
		window.external.addFavorite(sURL, sTitle); 
	} catch (e) { 
		try { 
			window.sidebar.addPanel(sTitle, sURL, ""); 
		} catch (e) { 
			alert("加入收藏失败，请使用Ctrl+D进行添加"); 
		} 
	} 
} 
function getParam(paras) {
	/** 从url中获取参数 **/
	var url = location.href;
	var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
	var paraObj = {};
	for ( var i = 0; j = paraString[i]; i++) {
		paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
				.indexOf("=") + 1, j.length);
	}
	var returnValue = paraObj[paras.toLowerCase()];
	if (typeof (returnValue) == "undefined") {
		return "";
	} else {
		return decodeURI(returnValue);
	}
}
function getTypeStr(type) {
	switch(parseInt(type))
	{
		case 1:
			return "组织机构";
			break;
		case 2:
			return "图片新闻";
			break;
		case 3:
			return "南城廉政";
			break;
		case 4:
			return "信息公开";
			break;
		case 5:
			return "曝光台";
			break;
		case 6:
			return "廉政教育";
			break;
		case 7:
			return "工作动态";
			break;
		case 8:
			return "专题集锦";
			break;
		default:
			return "";
	}
}
/** 
 * 时间对象的格式化; 
 */  
Date.prototype.format = function(format) {  
    /* 
     * eg:format="yyyy-MM-dd hh:mm:ss"; 
     */  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S" : this.getMilliseconds()  
        // millisecond  
    }  
  
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4  
                        - RegExp.$1.length));  
    }  
  
    for (var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1  
                            ? o[k]  
                            : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format;  
}  
</script>