<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>示例页面</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<style type="text/css">
</style>
</head>
<body class="demo" style="width:1024; min-width: 1024px;">
	<ul class="list-unstyled" style="padding: 20px;">
		<li><a class="clickableText" page="user">用户</a></li>
		<li><a class="clickableText" page="topic">专题</a></li>
		<li><a class="clickableText" page="article">文章</a></li>
		<li><a class="clickableText" page="report">举报</a></li>
	</ul>
	
</body>

<script type="text/javascript">
;(function( $ ) {
	
	var $body = $(".demo");
	$body.on("click", ".clickableText", function() {
		window.open('demoPage?page=' + $(this).attr("page"));
	});
	
})( jQuery );
</script>
</html>