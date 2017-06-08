<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>后台管理</title>
	<%@ include file="/WEB-INF/include/html_head_preload.jsp"%> 
	
	<!-- page -->
	<%@ include file="/WEB-INF/pages/overview.jsp" %>
	<%@ include file="/WEB-INF/pages/user.jsp" %>
	<%@ include file="/WEB-INF/pages/article.jsp" %>
	<%@ include file="/WEB-INF/pages/topic.jsp" %>
	<%@ include file="/WEB-INF/pages/report.jsp" %>
	
	<!-- template -->
	<%@ include file="/WEB-INF/template/dialog.jsp" %>
	<%@ include file="/WEB-INF/template/editor.jsp" %>
	
</head>
<body>
	
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="manager"><strong>南城纪委监察局后台管理</strong></a>
            </div>
            
            <ul class="nav navbar-top-links navbar-right">
            	<li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> 
                        <span class="username"></span>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user" style="min-width: 100px;">
                        <li>
                        	<a class="user-logout">
                        		<i class="fa fa-sign-out fa-fw"></i> 登出
                        	</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<li class="module" module="overview">
                            <a href="#1"><i class="fa fa-dashboard fa-fw"></i> 总览</a>
                        </li> 
                        <li class="module" module= "user">
                            <a href="#2"><i class="fa fa-user fa-fw"></i> 用户管理</a>
                        </li>
                        <li>
                            <a href="#3"><i class="fa fa-bar-chart-o fa-fw"></i> 分类管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li class="module" module="article" article="1"><a href="#3.1">组织结构</a></li>
                                <li class="module" module="article" article="2"><a href="#3.2">图片新闻</a></li>
                                <li class="module" module="article" article="3"><a href="#3.3">南城廉政</a></li>
                                <li class="module" module="article" article="4"><a href="#3.4">信息公开</a></li>
                                <li class="module" module="article" article="5"><a href="#3.5">曝光台</a></li>
                                <li class="module" module="article" article="6"><a href="#3.6">廉政教育</a></li>
                                <li class="module" module="article" article="7"><a href="#3.7">工作动态</a></li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li class="module" module="topic">
                        	 <a href="#4"><i class="fa fa-list fa-fw"></i> 专题集锦</a>
                        </li>
                        <li class="module" module="report">
                            <a href="#5"><i class="fa fa-envelope fa-fw"></i> 举报管理</a>
                        </li>
                    </ul>
                </div>
            </div>
		</nav>
		
		<!-- content -->
		<div id="page-wrapper"></div>
	
	</div>
	
	<script type="text/javascript">
	
		var $page = $("#wrapper");
		var $content = $page.find("#page-wrapper");
		
		init();
		
		// set user name
		var user = $k.user.get();
		$page.find(".username").text(user.username);
		
		$page
		.on("click", ".sidebar .module", function() {
			var moduleName = $(this).attr("module");
			var articleType = $(this).attr("article");
			if (articleType) {
				$k.page[moduleName].draw(articleType).load();
			} else {
				$k.page[moduleName].draw().load();
			}
			
			$content.find(".modulePage").hide();
			$content.find('.' + moduleName + 'Page').show();
		})
		.on("click", ".user-logout", function() {
			$.ajax({
				url: "user/logout",
				type: "POST",
				data: { 
					userId: $k.user.get().id 
				},
				success: function(data) {
					if (data.status == 0) {
						window.location.href = "./login";
					}
					$k.user.logout();
				},
				error: function(err) {}
			});
		});
		
		function init() {
			$('<div class="overviewPage modulePage"></div>').appendTo($content);
			$k.page.overview = new $k.proto.Overview().init($content.find(".overviewPage"));
			
			$('<div class="userPage modulePage"></div>').appendTo($content);
			$k.page.user = new $k.proto.User().init($content.find(".userPage"));
			
			$('<div class="articlePage modulePage"></div>').appendTo($content);
			$k.page.article = new $k.proto.Article().init($content.find(".articlePage"));
			
			$('<div class="topicPage modulePage"></div>').appendTo($content);
			$k.page.topic = new $k.proto.Topic().init($content.find(".topicPage"));
			
			$('<div class="reportPage modulePage"></div>').appendTo($content);
			$k.page.report = new $k.proto.Report().init($content.find(".reportPage"));
		}
		
		// init
		$('.sidebar .module[module="overview"]').trigger("click");
	
	</script>
</body>
</html>