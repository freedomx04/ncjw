<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="${ctx}/vendor/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/vendor/swiper/css/swiper.min.css">

<style type="text/css">
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
.main {
	margin-top: 15px;
	margin-bottom: 15px;
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
					<a class="index-news" href="${ctx}/news" target="_blank">图片新闻</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">南城廉政</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">曝光台</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">组织结构</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">专题集锦</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">信息公开</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">工作动态</a>
				</li>
				<li>
					<a class="index-news" href="${ctx}/news" target="_blank">廉政教育</a>
				</li>
			</ul>
		</nav>
	</div>
</header>

<script type="text/javascript" src="${ctx}/vendor/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/vendor/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/vendor/swiper/js/swiper.min.js"></script>