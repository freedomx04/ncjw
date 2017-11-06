<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>南城廉政网</title>
<meta name="keywords" content="南城廉政网,江西南城廉政网,中共南城县纪律检查委员会,南城县监察局,南城县纪律监察局网站" />
<meta name="description" content="中共南城县纪律检查委员会-南城县纪律监察局网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<!-- 验证网站所有权 -->
<meta name="baidu-site-verification" content="Lckb341lJs" />
<meta name="360-site-verification" content="a535269a65c5027db4d1bd44d0b3ab4c" />

<link rel="stylesheet" href="css/home.css" type="text/css"/>
<link rel="stylesheet" href="css/base.css" type="text/css"/>
<link rel="stylesheet" href="vendor/slideBox/jquery.slideBox.css" type="text/css"/>
<script type="text/javascript" src="vendor/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="vendor/slideBox/jquery.slideBox.js"></script>
<script type="text/javascript" src="vendor/jquery/jquery-doT.js"></script>
<script type="text/javascript" src="vendor/doT/1.0.1/doT.js"></script>

<%@ include file="/WEB-INF/template/top.jsp"%>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<script type="text/javascript">
</script>
</head>
<body>
	<div id="home">
		<header>
			<div></div>
			<div class="nav_wraper">
				<div class="navcont">
					<div class="nav-left">
						<ul>
							<li class="i-hide nav_home"><a href="./" target="_blank">首页</a></li>
							<li><a href="column?type=2" target="_blank">图片新闻</a></li>
							<li><a href="column?type=3" target="_blank">南城廉政</a></li>
							<li><a href="column?type=4" target="_blank">信息公开</a></li>
							<li><a href="column?type=5" target="_blank">曝光台</a></li>
							<li><a href="column?type=6" target="_blank">廉政教育</a></li>
							<li><a href="column?type=7" target="_blank">工作动态</a></li>
							<li><a href="column?type=8" target="_blank">专题集锦</a></li>
						</ul>
					</div>
					<div class="nav-right">
						<input type="hidden" name="select" id="select" value="0">
						<input id="keyword" class="search" type="text" name="keyword"> <input type="submit" value="" class="searchbtn" style="cursor: pointer;">
					</div>
				</div>
			</div>	
		</header>
		<div id="content"></div>
		<footer>
		</footer>
	</div>
</body>

<script class="template Main" type="text/x-jquery-tmpl">
<div class="toutiao">
	<table width="980" border="0" align="center" cellpadding="0" cellspacing="8" bgcolor="#FFFFFF">
		<tbody>
			<tr>
				<td style="text-align: left; width: 75px;"><img src="img/toutiao.png" width="75" height="75"></td>
				<td align="center">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed; overflow: hidden;word-wrap: break-word;">
						<tr>
							<td align="center" class="toutiao_td"><a target="_blank"></a></td>
						</tr>
						<tr>
							<td class="i-font-14">
								<a class="ellipsis toutiao_01" target="_blank"></a>|
								<a class="ellipsis toutiao_02" target="_blank"></a>|
								<a class="ellipsis toutiao_03" target="_blank"></a>|
								<a class="ellipsis toutiao_04" target="_blank"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div>
	<div class="publicity_pictures">
		<div id="scoll_wraper" class="slideBox">
			<ul class="items">
			</ul>
		</div>
	</div>
	<div class="annouce_news">
		<div class="menu"><a href="column?type=3" target="_blank">南城廉政</a></div>
		<ul>
		</ul>
	</div>
</div>
<div>
	<div class="exposure">
		<div class="menu"><a href="column?type=5" target="_blank">曝光台</a></div>
		<ul>
		</ul>
	</div>
	<div>
		<div class="organ">
			<div class="menu"><a href="column?type=1" target="_blank">组织机构</a></div>
			<ul>
			</ul>
		</div>
		<div class="report">
			<div class="menu"><a>举报</a></div>
			<div style="height: 51px;">
				<a href="rpguide" target="_blank">
					<img src="img/jubao_01.png">
				</a>
				<a href="http://jiangxi.12388.gov.cn/jiangxi/fuzhoushi/guangchangxian/" target="_blank" style="float: right;">
					<img src="img/jubao_02.png">
				</a>
			</div>
			<div class="report-contact">
				<p style="font-size: 20px;">举报方式:</p>
				<p>南城县扶贫领域违纪问题举报电话：0794—7177007；0794—12388</p>
				<p>来信举报，请寄：南城县纪委信访室（县行政中心317室），邮编：344700</p>
			</div>
		</div>
	</div>
</div>
<div>
	<div class="project_highlights">
		<div class="menu"><a href="column?type=8" target="_blank">专题集锦</a></div>
		<ul>
		</ul>
	</div>
	<div>
		<div class="public_info">
			<div class="menu"><a href="column?type=4" target="_blank">信息公开</a></div>
			<ul>
			</ul>
		</div>
	</div>
</div>
<div>
	<img src="img/bg_01.jpg" style="width: 100%; height: 90px; background-color:red;"/>
</div>
<div>
	<div class="dynamic_work ">
		<div class="menu"><a href="column?type=7" target="_blank">工作动态</a></div>
		<ul>
		</ul>
	</div>
	<div class="integrity_education">
		<div class="menu"><a href="column?type=6" target="_blank">廉政教育</a></div>
		<ul>
		</ul>
	</div>
</div>
<div class="site i-cf" style="margin-top: 20px;">
	<div class="menu">网站链接</div>
	<ul class="site_img">
		<li><a href="http://www.ccdi.gov.cn/" target="_blank"><img src="img/site/site_01.jpg"></a></li>
		<li><a href="http://www.jx.gov.cn" target="_blank"><img src="img/site/site_02.jpg"></a></li>
		<li><a href="http://www.jxdi.gov.cn" target="_blank"><img src="img/site/site_03.jpg"></li>
		<li><a href="http://www.jxnc.gov.cn/" target="_blank"><img src="img/site/site_04.jpg"></a></li>
	</ul>
	<ul class="nav">
		<li class="active" id="sitenav_0"><a>全省纪检监察网站</a></li>
		<li id="sitenav_1"><a>本市纪检监察网站</a></li>
		<li id="sitenav_2"><a>重点新闻网站</a></li>
	</ul>
</div>
<div style="margin: 8px 0 50px 0; text-align: center;" class="i-cf">
	<ul class="sitelink">
		<ol>
			<li><a href="http://www.jjlx.gov.cn" target="_blank">九江市</a></li>
			<li><a href="http://www.jdzlz.gov.cn" target="_blank">景德镇市</a></li>
			<li><a href="http://www.pxql.gov.cn" target="_blank">萍乡市</a></li>
			<li><a href="http://www.xylz.gov.cn" target="_blank">新余市</a></li>
			<li><a href="http://www.srlz.gov.cn" target="_blank">上饶市</a></li>
			<li><a href="http://www.ytlz.gov.cn" target="_blank">鹰潭市</a></li>
			<li><a href="http://www.jglz.gov.cn" target="_blank">吉安市</a></li>
			<li><a href="http://www.gzjj.gov.cn" target="_blank">赣州市</a></li>
			<li><a href="http://www.ncdi.gov.cn/" target="_blank">南昌市</a></li>
			<li><a href="http://www.ycjjjc.gov.cn" target="_blank">宜春市</a></li>
		</ol>
		<ol class="i-hide">
			<li><a href="http://www.lcxlz.gov.cn/index.html" target="_blank">黎川县</a></li>
			<li><a href="http://www.lcqlzw.com/" target="_blank">临川区</a></li>
			<li><a href="http://www.dxlzw.com/" target="_blank">东乡县</a></li>
			<li><a href="http://www.zxlz.gov.cn" target="_blank">资溪县</a></li>
			<li><a href="http://www.jxgc.gov.cn/gcjj" target="_blank">广昌县</a></li>
			<li><a href="http://www.jxlean.gov.cn/lzw/" target="_blank">乐安县</a></li>
			<li><a href="http://yhlzw.jxyh.gov.cn/index.html" target="_blank">宜黄县</a></li>
		</ol>
		<ol class="i-hide">
			<li><a href="http://www.people.com.cn" target="_blank">人民网</a></li>
			<li><a href="http://www.xinhuanet.com" target="_blank">新华网</a></li>
			<li><a href="http://www.cntv.cn" target="_blank">央视网</a>
			</li><li><a href="http://www.china.com.cn" target="_blank">中国网</a></li>
			<li><a href="http://gb.cri.cn" target="_blank">国际在线</a></li>
			<li><a href="http://www.chinadaily.com.cn/hqzx" target="_blank">中国日报网</a></li>
			<li><a href="http://www.youth.cn" target="_blank">中青网</a></li>
			<li><a href="http://www.ce.cn" target="_blank">中国经济网</a></li>
			<li><a href="http://www.chinataiwan.org" target="_blank">中国台湾网</a></li>
			<li><a href="http://www.chinataiwan.org" target="_blank">中国西藏网</a></li>
			<li><a href="http://www.gmw.cn" target="_blank">光明网</a></li>
			<li><a href="http://www.cnr.cn" target="_blank">中国广播网</a></li>
			<li><a href="http://www.chinanews.com" target="_blank">中国新闻网</a></li>
			<li><a href="http://jx.people.com.cn" target="_blank">人民网江西频道</a></li>
			<li><a href="http://www.jx.xinhuanet.com" target="_blank">新华网江西频道</a></li>
			<li><a href="http://www.jxjgdj.gov.cn" target="_blank">江西机关党建网</a></li>
			<li><a href="http://www.jxwmw.cn" target="_blank">江西文明网</a></li>
			<li><a href="http://www.jxcn.cn" target="_blank">今视网</a></li>
			<li><a href="http://www.jxgdw.com" target="_blank">中国台湾网</a></li>
			<li><a href="www.jxnews.com.cn" target="_blank">大江网</a></li>
			<li><a href="http://www.ncnews.com.cn" target="_blank">天圆网</a></li>
			<li><a href="http://www.ncwm.gov.cn" target="_blank">南昌文明网</a></li>
		</ol>
	</ul>
	<!-- <span id="_ideConac">
		<a href="//bszs.conac.cn/sitename?method=show&amp;id=31FA1E8302E17373E053022819AC20DD" target="_blank"><img id="imgConac" vspace="0" hspace="0" border="0" src="//dcs.conac.cn/image/red.png" data-bd-imgshare-binded="1"></a>
	</span> -->
</div>
</script>

<script class="template Li" type="text/x-jquery-tmpl">
{{~it.data : data:index}}
<li class="ellipsis">
	<span class="round">●</span>
	<a href="{{="article?type=" + data.type + "&id=" + data.id}}" target="_blank">{{=data.title}}</a>
</li>
{{~}}
</script>

<script class="template TopicLi" type="text/x-jquery-tmpl">
{{~it.data : data:index}}
<li class="ellipsis">
	<span class="round">●</span>
	<a href="{{="column?type=8&topicId="+data.id + "&title=" + encodeURIComponent(data.title)}}" target="_blank">{{=data.title}}</a>
</li>
{{~}}
</script>

<script class="template SearchResult" type="text/x-jquery-tmpl">
<div id="container-two">
	<div id="contenttwo">
		<div class="rightcon">
			<div class="righthead">
				<div class="righttitle"></div>
			</div>	
			{{? it.data != null}}
			{{~it.data.list:data:index}}					
			<div class="rightlist">
				<div class="rightlisthead">
					<span class="rightlist-title ellisps">
						<a href="{{="article?type=" + data.type + "&id=" + data.id}}" target="_blank">{{=data.title}}</a>
					</span> 
					<p><span class="rightlist-time">{{=(new Date(data.createTime)).format("yyyy-MM-dd")}}</span></p>
				</div>
			</div>	
			{{~}}	
			{{?}}			
			<div>
				第{{=it.page}}页, 共{{=it.pageSize}}页 <a onclick="searchArticle(1)">首页</a>
				{{?it.page != 1 && it.pageSize != 0}}
				<a onclick="{{= "searchArticle("+(parseInt(it.page) - 1)+")" }}">上一页</a>
				{{?}}
				{{?it.page != it.pageSize && it.pageSize != 0}}
				<a onclick="{{="searchArticle("+(parseInt(it.page) + 1)+")"}}">下一页</a>
				{{?}}
				<a onclick="{{="searchArticle("+it.pageSize+")"}}">末页</a>
			</div>
		</div>
	</div>
</div>
</script>

<script>
;(function() {
	$home = $("#home");
	$home.find("header > div").eq(0).html($(".template.Top").doT({
		currentTime: currentTime()
	}));
	$home.find("footer").html($(".template.Footer").doT());
	$home.find("#content").html($(".template.Main").doT());
	
	articleListByType(1, 3, $home.find(".organ ul"));
	articleListByType(3, 9, $home.find(".annouce_news ul"));
	articleListByType(4, 6, $home.find(".public_info ul"));
	articleListByType(5, 10, $home.find(".exposure ul"));
	articleListByType(6, 6, $home.find(".integrity_education ul"));
	articleListByType(7, 6, $home.find(".dynamic_work ul"));
	topicList();
	toutiao();
	
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: 2,
			page: 0,
			size: 5,
		},
		success: function(data) {
			if(data.status == 0) {
				$.each(data.data, function(i, e) {
					$("<li style='width: 480px; height: 270px'>"
						+"<a href='article?type="+e.type+"&id="+e.id+"' title='"+e.title+"' target='_blank'>"
						+"<img src='"+e.imagePath+"'>"
						+"</a></li>").appendTo($home.find(".publicity_pictures .items"));
				});
				$home.find("#scoll_wraper").slideBox({
					duration: 0.5,	//滚动持续时间，单位：秒
					easing: 'linear',	//swing,linear//滚动特效
					delay: 2,	//滚动延迟时间，单位：秒
					hideClickBar: true,
					effect:"fold"
				});
			}
		},
		error: function() {}
	});
	
	$home
	.on("mouseover", ".site .nav li", function() {
		var $this = $(this);
		$home.find(".site .nav li").removeClass("active");
		$this.addClass("active");
		$home.find(".sitelink").find("ol").addClass("i-hide");
		$home.find(".sitelink").find("ol").eq($this.attr("id").split("_")[1]).removeClass("i-hide");
	})
	.on("click", ".searchbtn", function(event) {
		$home.css("background-color", "#ebeaea");
		$home.find("#content").css("background-color", "#ebeaea");
		$home.find(".nav_home").removeClass("i-hide");
		$home.find(".nav_home").next().hide();
		searchArticle(1);
	})
	.on("keypress", "#keyword", function(event) {
         if(event.keyCode == "13") {
			$home.css("background-color", "#ebeaea");
			$home.find("#content").css("background-color", "#ebeaea");
			$home.find(".nav_home").removeClass("i-hide");
			$home.find(".nav_home").next().hide();
			searchArticle(1);
         }
	});
})();
function searchArticle(page) {
	$home.find("#content").html('<div style="text-align: center;"><img src="img/loading.gif"></div>');
	
	var size = 10;
	$.ajax({
		url: "article/search",
		type: "POST",
		data: {
			keywords: $home.find("#keyword").val(),
			page: page,
			size: size,
		},
		success: function(data) {
			if(data.status == 0) {
				$home.find("#content").html($(".template.SearchResult").doT({
					data: data.data,
					page: page,
					pageSize: data.data != null ? Math.ceil(parseInt(data.data.count)/size) : 0
				}));
			}
		},
		error: function(e) {}
	});
}
function topicList() {
	$.ajax({
		url: "topic/listPaging",
		type: "POST",
		data: {
			page: 0,
			size: 6,
		},
		success: function(data) {
			if(data.status == 0) {
				$(".project_highlights ul").html($(".template.TopicLi").doT({
					data: data.data
				}));
			}
		},
		error: function() {}
	});
}
function articleListByType(type, size, $obj) {
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: type,
			page: 0,
			size: size,
		},
		success: function(data) {
			if(data.status == 0) {
				$obj.html($(".template.Li").doT({
					data: data.data
				}));
			}
		},
		error: function() {}
	});
}
function toutiao() {
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: 3,
			page: 0,
			size: 1,
		},
		success: function(data) {
			if(data.status == 0 && data.data.length != 0) {
				$(".toutiao_td a").html(data.data[0].title).attr("href", "article?type=3&id=" + data.data[0].id);
			}
		},
		error: function() {}
	});
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: 4,
			page: 0,
			size: 1,
		},
		success: function(data) {
			if(data.status == 0 && data.data.length != 0) {
				$(".toutiao_01").html(data.data[0].title).attr("href", "article?type=4&id=" + data.data[0].id);
			}
		},
		error: function() {}
	});
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: 5,
			page: 0,
			size: 1,
		},
		success: function(data) {
			if(data.status == 0 && data.data.length != 0) {
				$(".toutiao_02").html(data.data[0].title).attr("href", "article?type=5&id=" + data.data[0].id);
			}
		},
		error: function() {}
	});
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: 6,
			page: 0,
			size: 1,
		},
		success: function(data) {
			if(data.status == 0 && data.data.length != 0) {
				$(".toutiao_03").html(data.data[0].title).attr("href", "article?type=6&id=" + data.data[0].id);
			}
		},
		error: function() {}
	});
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: 7,
			page: 0,
			size: 1,
		},
		success: function(data) {
			if(data.status == 0 && data.data.length != 0) {
				$(".toutiao_04").html(data.data[0].title).attr("href", "article?type=7&id=" + data.data[0].id);
			}
		},
		error: function() {}
	});
}
</script>
<script>
(function(){
	var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https'){
    	bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
  	} else {
  		bp.src = 'http://push.zhanzhang.baidu.com/push.js';
  	}
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>
<script>
(function(){
   var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?344ef6737257e4bd0f35ba96c8130772":"https://jspassport.ssl.qhimg.com/11.0.1.js?344ef6737257e4bd0f35ba96c8130772";
   document.write('<script src="' + src + '" id="sozz"><\/script>');
})();
</script>
</html>