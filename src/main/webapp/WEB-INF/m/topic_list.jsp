<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/preload.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title>专题集锦</title>
	
</head>
<body class="gray-bg page-index">

	<!-- header -->
	<%@ include file="/WEB-INF/m/header.jsp"%>
	
	<div class="main white-bg">
		<div class="index-block">
			<div class="index-title">
				<h2>专题集锦</h2>
			</div>
			<div class="index-content">
				<ul class="list-unstyled">
					<c:forEach var="topic" items="${topicList}">
						<li class="text-ellipsis">
							<a href="${ctx}/m/topic?topicId=${topic.id}">${topic.title}</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/m/footer.jsp"%>

</body>
</html>