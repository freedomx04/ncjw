<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>${article.title}</title>
	
	<style type="text/css">
	.article-content img {
		max-width: 100%;
		height: auto;
		display: block;
	}
	.article-title h2 {
		font-size: 24px;
		padding: 20px 15px 10px;
		margin: 0;
	}
	.article-title {
		border-bottom: 1px solid #d9d9d9;
		text-align: center;
	}
	.article-remark {
		color: #999;
		padding: 10px;
	}
	.article-content {
		padding: 15px;
		font-size: 16px;
		font-family: "宋体";
		color: #070707;
	}
	</style>
</head>
<body class="gray-bg page-index">
	
	<!-- header -->
	<%@ include file="/WEB-INF/m/header.jsp"%>
	
	<div class="main white-bg animated fadeInDown">
		<div class="article-title">
			<h2>${article.title}</h2>
			<div class="article-remark">
				<span style="margin-right: 10px;">来源：${article.source}</span>
				<span class="article-time">发布时间：<fmt:formatDate value="${article.updateTime}" pattern="yyyy-MM-dd"/></span>
			</div>
		</div>
		<div class="article-content">
			${article.content}
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/m/footer.jsp"%>
	
</body>
</html>