<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
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
<body>
	<div id="home">
		<header>
			<div></div>
			<div class="onered"></div>
		</header>
		<div id="toplinecontainer">
			<div id="position">
				<p>
					<span>当前位置：<a href="./">首页</a>
						<em>&gt;</em>
						<a href="" class="weizhi"></a>
					</span>
				</p>
			</div>
			<div id="topline">
			</div>
		</div>
		<footer>
		</footer>
	</div>
</body>
<script  class="template Article" type="text/x-jquery-tmpl">
<div class="tophead">
	<h1 style="word-break: break-all;">
		{{=it.data.title}}
	</h1>
	<div class="authortime">
		<span class="author">来源：</span>
		<span>{{=it.data.source}}</span>
		<span class="author">时间：</span>
		<span>{{=(new Date(it.data.createTime)).format("yyyy-MM-dd")}}</span>
	</div>
</div>
<div class="toplinecon">
	<div class="toplinetxt">
		<div>{{=it.data.content}}</div>
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