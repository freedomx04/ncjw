<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>用户</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="userMgr" style="width:1024; min-width: 1024px; padding: 20px;">
	<div class="status">
		<label class="font-bold">登录状态： </label>
		<label class="loginStatus"></label>
	</div>
	<div class="divide"></div>
	
	<div class="login">
		<label class="font-bold">登录(user/login)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>username:</td><td><input type="text" class="login-username"/></td></tr>
						<tr><td>password:</td><td><input type="password" class="login-password"/></td></tr>
						<tr><td colspan="2"><input type="button" class="login-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="login-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="logout">
		<label class="font-bold">登出(user/logout)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="logout-userId"/></td></tr>
						<tr><td colspan="2"><input type="button" class="logout-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="logout-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="add">
		<label class="font-bold">添加(user/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>username:</td><td><input type="text" class="add-username"/></td></tr>
						<tr><td>password:</td><td><input type="password" class="add-password"/></td></tr>
						<tr><td colspan="2"><input type="button" class="add-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
	;(function($) {
		
		checkStatus();
		
		// check is login
		function checkStatus() {
			$.ajax({
				url: "user/loginStatus",
				type: "POST",
				success: function(data) {
					data == true ? $(".userMgr .loginStatus").text("已登录") : $(".userMgr .loginStatus").text("未登录");
				},
				error: function(data) {}
			});
		}
		
		var $login = $(".userMgr .login");
		$login.on("click", ".login-btn", function() {
			$.ajax({
				url: "user/login",
				type: "POST",
				data: {
					username: $login.find(".login-username").val(),
					password: $k.util.encrptByDES($login.find(".login-password").val()),
				},
				success: function(data) {
					$login.find(".login-textarea").val(JSON.stringify(data, undefined, 4));
					checkStatus();
				},
				error: function(err) {
					$login.find(".login-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $logout = $(".userMgr .logout");
		$logout.on("click", ".logout-btn", function() {
			$.ajax({
				url: "user/logout",
				type: "POST",
				data: {
					userId: $logout.find(".logout-userId").val(),
				},
				success: function(data) {
					$logout.find(".logout-textarea").val(JSON.stringify(data, undefined, 4));
					checkStatus();
				},
				error: function(err) {
					$logout.find(".logout-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $add = $(".userMgr .add");
		$add.on("click", ".add-btn", function() {
			$.ajax({
				url: "user/add",
				type: "POST",
				data: {
					username: $add.find(".add-username").val(),
					password: $k.util.encrptByDES($add.find(".add-password").val()),
				},
				success: function(data) {
					$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
	})(jQuery);
	</script>
</body>
</html>
