<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>南城县工业园区综合信息服务平台</title>
	
	<style type="text/css">
	.page-index {
		position: relative;
		min-height: 100%;
		padding-bottom: 90px;
	}
	.swiper-container img {
		width: 100%;
		height: 100%;
	}
	.swiper-container .swiper-title {
		position: absolute;
		bottom: 15px;
		left: 15px;
		color: #fff;
		font-size: 18px;
		width: 90%;
	}
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
</head>

<body class="gray-bg page-index">

	<!-- header -->
	<%@ include file="/WEB-INF/m/header.jsp"%>
	
	<div class="main white-bg">
		<div class="swiper-container swiper-photonews" style="width: 100%; height: 300px;">
			<div class="swiper-wrapper">
				<c:forEach var="photonews" items="${photonewsList}">
					<div class="swiper-slide">
						<a href="" target="_blank">
							<img src="${ctx}/${photonews.imagePath}"> 
							<span class="swiper-title text-ellipsis">${photonews.title}</span>
						</a>
					</div> 
				</c:forEach>
			</div>
			<div class="swiper-button-prev"></div>
   			<div class="swiper-button-next"></div>
		</div>
	</div>
	
	<!-- 南城廉政 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>南城廉政<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="integritynews" items="${integritynewsList}">
						<li class="text-ellipsis">
							<a href="#">${integritynews.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 曝光台 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>曝光台<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="exposure" items="${exposureList}">
						<li class="text-ellipsis">
							<a href="#">${exposure.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 组织结构 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>组织结构<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="organization" items="${organizationList}">
						<li class="text-ellipsis">
							<a href="#">${organization.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 举报 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>举报</h2>
			</div>
			<div class="index-content">
				<div>
					<a href="http://jiangxi.12388.gov.cn/fuzhoushi/nanchengxian/">
						<button class="btn btn-lg btn-warning" style="width: 100%;">我要举报</button>
					</a>
				</div>
				<div style="background-color: #9B1017; border-radius: 0 0 15px 15px; 
					color: #fff; margin-top: 10px; padding: 5px 20px; font-size: 14px;">
					<p>举报电话:&nbsp;(0794)7177007;&nbsp;&nbsp;(0794)12388</p>
					<p>来信请寄:&nbsp;南城县纪委信访室(县行政中心317室)</p>
					<p>邮编:&nbsp;344700</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 专题集锦 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>专题集锦<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="topic" items="${topicList}">
						<li class="text-ellipsis">
							<a href="#">${topic.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 信息公开 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>信息公开<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="publish" items="${publishList}">
						<li class="text-ellipsis">
							<a href="#">${publish.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 工作动态-->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>工作动态<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="workDynamic" items="${workDynamicList}">
						<li class="text-ellipsis">
							<a href="#">${workDynamic.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 廉政教育 -->
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>廉政教育<a href="" class="pull-right">更多></a></h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="education" items="${educationList}">
						<li class="text-ellipsis">
							<a href="#">${education.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	
	<!-- footer -->
	<%@ include file="/WEB-INF/m/footer.jsp"%>
		
	<script type="text/javascript">
	;(function( $ ) {
		
		var $page = $('.page-index');
		
		// 图片新闻
		new Swiper('.swiper-photonews', {
			autoplay: {
				delay: 5000
			},
			loop: true,
			navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
		});
		
	})( jQuery );
	</script>

</body>
</html>