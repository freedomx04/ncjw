<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<script type="text/javascript" src="vendor/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="vendor/jquery/jquery-doT.js"></script>
<script type="text/javascript" src="vendor/doT/1.0.1/doT.js"></script>
<link rel="stylesheet" href="css/home.css" type="text/css"/>
<link rel="stylesheet" href="css/base.css" type="text/css"/>
<link rel="stylesheet" href="css/article.css" type="text/css"/>

<%@ include file="/WEB-INF/template/top.jsp"%>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<title></title>

<script type="text/javascript">
</script>
</head>
<body style="min-width: 980px;">
	<div id="home">
		<header>
			<div></div>
			<div class="onered"></div>
		</header>
		<div id="toplinecontainer">
			<div id="position">
				<p>
					<span>当前位置：<a href="./">首页</a>
					</span>
				</p>
			</div>
			<div id="topline">
				<div class="tophead">
					<h1>
						网站声明
					</h1>
					<div class="authortime">
						<span class="author">来源：</span>
						<span>南城纪委监察局网站</span>
						<span class="author">时间：</span>
						<span>2016-10-19</span>
					</div>
				</div>
				<div class="toplinecon">
					<div id="videoId" class="toplinetxt">
						<p><span style="font-family: arial, helvetica,sans-serif; font-size: 16px;"></span></p>
						<p><span style="font-size: 16px;">本网站内容由全市各级纪检监察机关以及相关单位提供。本网站所涉及到的版权归本网站所属。</span></p>
						<p><span style="font-size: 16px;">本网站提供的资料如与相关纸质文本不符，以纸质文本为准。</span></p>
						<p><span style="font-size: 16px;">本网站欢迎其他媒体或互联网站转载本网站提供的信息和服务内容；如欲转载，请与相应提供单位直接联系获得合法授权，并保留本网站注明的来源。经本网站授权使用的单位，不应超越所获授权范围，也不得歪曲和篡改本网站所发布的内容。</span></p>
						<p><span style="font-size: 16px;">本网站发布或转载的理论或评论文章，仅代表作者个人观点，其原创性以及文中表达的观点和判断不代表本网站。</span></p>
						<p><span style="font-family: arial, helvetica,sans-serif; font-size: 16px;"></span><br></p>
						<p><br></p><p><br></p><p><br></p><p><br></p><p></p>	
					</div>
				</div>
			</div>
		</div>
		<footer>
		</footer>
	</div>
</body>
<script>
;(function() {
	
	$home = $("#home");
	$home.find("header > div").eq(0).html($(".template.Top").doT({
		currentTime: currentTime()
	}));
	
	$home.find("footer").html($(".template.Footer").doT());
	var type = getParam("type");
	var articleId = getParam("id");
	$home.find(".weizhi").html(getTypeStr(type)).attr("href", "column?type="+type);
	
	$.ajax({
		url: "article/detail",
		type: "POST",
		data: {
			articleId: articleId
		},
		success: function(data) {
			if(data.status == 0) {
				$home.find("#topline").html($(".template.Article").doT({
					data: data.data
				}));
			}
		},
		error: function() {}
	});
	
})();
</script>
</html>