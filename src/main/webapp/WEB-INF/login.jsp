<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>

<!-- CSS -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="vendor/assets/css/form-elements.css">
<link rel="stylesheet" href="vendor/assets/css/style.css">

<!-- Javascript -->
<script src="vendor/assets/js/jquery.backstretch.min.js"></script>
<script src="vendor/assets/js/scripts.js"></script>

</head>
<body>
	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>南城</strong>纪委监察局网站
						</h1>
						<div class="description">
							<p>
								
							</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>后台登录界面</h3>
								<p>输入您的用户名和密码:</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-key"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form class="login-form" role="form" action="" method="post">
								<div class="form-group">
									<label class="user-not-exist sr-only" for="form-username"
										data-placement="left" data-content="用户不存在!">Username</label>
									<label  class="user-invalid sr-only" for="form-username"
										data-placement="left" data-content="用户已被禁用!">Username</label>  
									<input type="text" name="form-username" placeholder="用户名" 
										data-toggle="tooltip" data-placement="top"
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="password-error sr-only" for="form-password"
									data-placement="left" data-content="密码错误!" >Password</label> 
									<input type="password" name="form-password" placeholder="密码" class="form-password form-control" id="form-password">
								</div>
								<button type="submit" class="submit-btn btn">登录</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
	
		var $form = $(".login-form");
		var $username = $form.find(".form-username");
		
		$form.submit(function(e) {
			
			var username = 	$form.find(".form-username").val();
			var password = $form.find(".form-password").val();
			
			if (username == "" || password == "") {
				return;
			}
			
			$.ajax({
				url: 'user/login',
				type: "POST",
				data:{
					username: username,
					password: $k.util.encrptByDES(password),
				},
				success: function(data) {
					switch (data.status) {
					case 0:
						window.location.href = "./manager";
						$k.user.set(data.data);
						break;
					case 2:
						$form.find(".user-not-exist").webuiPopover();
						$form.find(".user-not-exist").trigger("click"); 
						break;
					case 11:
						$form.find(".password-error").webuiPopover();
						$form.find(".password-error").trigger("click");
						break;
					case 13:
						$form.find(".user-invalid").webuiPopover();
						$form.find(".user-invalid").trigger("click");
						break;
					default:
						break;
					}
				},
				error: function() {}
			});
			
			return false;
		});
	
	</script>

</body>
</html>