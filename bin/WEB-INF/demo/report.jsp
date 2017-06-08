<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>举报</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
<style type="text/css">
.reportMgr input {
	margin-bottom: 0;
}
</style>
</head>
<body class="reportMgr" style="width:1024; min-width: 1024px; padding: 20px;">
	
	<div class="add">
		<label class="font-bold">新增(report/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<form id="form-add" enctype= "multipart/form-data">
						<table>
							<tr><td><strong>举报人信息</strong></tr>
							<tr><td>姓名:</td><td><input type="text" name="name"/></td></tr>
							<tr><td>身份证号</td><td><input type="text" name="identityCard"/></td></tr>
							<tr><td>联系方式</td><td><input type="text" name="telephone"/></td></tr>
							<tr><td>政治面貌</td><td><input type="text" name="political"/></td></tr>
							<tr><td>现居住地址</td><td><input type="text" name="address"/></td></tr>
							<tr><td>级别</td><td><input type="text" name="level"/></td></tr>
							
							<tr><td><strong>被举报人信息</strong></td></tr>
							<tr><td>被举报人<span class="text-red">*</span></td><td><input type="text" name="respondentName"/></td></tr>
							<tr><td>单位<span class="text-red">*</span></td><td><input type="text" name="respondentUnit"/></td></tr>
							<tr><td>职务<span class="text-red">*</span></td><td><input type="text" name="respondentPosition"/></td></tr>
							<tr><td>所在地区<span class="text-red">*</span></td><td><input type="text" name="respondentArea"/></td></tr>
							<tr><td>级别<span class="text-red">*</span></td><td><input type="text" name="respondentLevel"/></td></tr>
							
							<tr><td><strong>举报正文</strong></td></tr>
							<tr><td>标题<span class="text-red">*</span></td><td><input type="text" name="title"/></td></tr>
							<tr><td>问题类别<span class="text-red">*</span></td><td><input type="text" name="type"/></td></tr>
							<tr><td>问题细类<span class="text-red">*</span></td><td><input type="text" name="subType"/></td></tr>
							<tr><td>主要问题<span class="text-red">*</span></td><td><input type="text" name="content"/></td></tr>
							
							<tr><td>文件:</td><td><input type="file" name="uploadFile" accept="*" /></td></tr>
							<tr><td><input type="button" class="add-btn" value="confirm"/></td></tr>
						</table>
					</form>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="search">
		<label class="font-bold">举报查询(report/search)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>查询码:</td><td><input type="text" class="search-searchCode"/></td></tr>
						<tr><td><input type="button" class="search-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="search-textarea" style="width: 600px; height: 400px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">举报详情(report/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>reportId:</td><td><input type="text" class="detail-reportId"/></td></tr>
						<tr><td><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="list">
		<label class="font-bold">举报列表(report/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 600px; height: 400px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="reply">
		<label class="font-bold">举报回复(report/reply)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>reportId:</td><td><input type="text" class="reply-reportId"/></td></tr>
						<tr><td>reply:</td><td><input type="text" class="reply-reply"/></td></tr>
						<tr><td><input type="button" class="reply-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="reply-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
	;(function($) {
		
		var $add = $(".reportMgr .add");
		$add.on("click", ".add-btn", function() {
			$.ajax({
				url: "report/add",
				type: "POST",
				data: new FormData($("#form-add")[0]),
				processData: false,
				contentType: false,
				cache: false, 
				success: function(data) {
					$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $search = $(".reportMgr .search");
		$search.on("click", ".search-btn", function() {
			$.ajax({
				url: "report/search",
				type: "POST",
				data: {
					searchCode: $search.find(".search-searchCode").val()
				},
				success: function(data) {
					$search.find(".search-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$search.find(".search-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $detail = $(".reportMgr .detail");
		$detail.on("click", ".detail-btn", function() {
			$.ajax({
				url: "report/detail",
				type: "POST",
				data: {
					reportId: $detail.find(".detail-reportId").val()
				},
				success: function(data) {
					$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $list = $(".reportMgr .list");
		$list.on("click", ".list-btn", function() {
			$.ajax({
				url: "report/list",
				type: "POST",
				success: function(data) {
					$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
		var $reply = $(".reportMgr .reply");
		$reply.on("click", ".reply-btn", function() {
			$.ajax({
				url: "report/reply",
				type: "POST",
				data: {
					reportId: $reply.find(".reply-reportId").val(),
					reply: $reply.find(".reply-reply").val(),
				},
				success: function(data) {
					$reply.find(".reply-textarea").val(JSON.stringify(data, undefined, 4));
				},
				error: function(err) {
					$reply.find(".reply-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
				}
			});
		});
		
	})(jQuery);
	</script>
</body>
</html>
