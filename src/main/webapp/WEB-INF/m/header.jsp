<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/vendor/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/vendor/animate/animate.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/vendor/swiper/css/swiper.min.css">

<style type="text/css">
html {
	height: 100%;
}
.white-bg {
	background-color: #fff;
}
.gray-bg {
	background-color: #f3f3f4;
}
.navbar-toggle .icon-bar {
	background-color: #000;
}
a {
	color: #222;
}
.text-ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	-moz-text-overflow: ellipsis;
}
.page-index {
	position: relative;
	min-height: 100%;
	padding-bottom: 90px;
}
.main {
	margin-top: 15px;
	margin-bottom: 15px;
}

/* article */
.index-block {
	padding: 10px;
}
.index-title {
	min-height: 34px;
	color: #a30000;
	border-bottom: 2px solid #a30000;
	margin-bottom: 10px;
}
.index-title h2 {
	font-size: 20px;
	padding-left: 10px;
	margin-top: 10px;
}
.index-title a {
	font-size: 14px;
	padding-top: 5px;
}
.index-content li {
	font-size: 16px;
	margin: 20px 10px;
}
</style>

<header class="navbar navbar-static-top white-bg">
	<div class="container">
		<div class="navbar-header" style="width: auto;">
			<button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar" aria-controls="bs-navbar" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
			</button>
			<a href="${ctx}/m" class="navbar-brand" style="font-size: 16px;"><i class="fa fa-home fa-fw"></i>首页</a>
		</div>
		<nav id="bs-navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li>
					<a class="index-news" href="${ctx}/m/list?type=2">图片新闻</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/list?type=3">南城廉政</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/list?type=5">曝光台</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/list?type=1">组织结构</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/topicList">专题集锦</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/list?type=4">信息公开</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/list?type=7">工作动态</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/m/list?type=6">廉政教育</a>
				</li>
			</ul>
		</nav>
	</div>
</header>

<script type="text/javascript" src="${ctx}/vendor/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/vendor/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/vendor/swiper/js/swiper.min.js"></script>