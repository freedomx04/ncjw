<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>专题</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="topicMgr" style="width:1024; min-width: 1024px; padding: 20px;">
	<div class="add">
		<label class="font-bold">专题新增(topic/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>title:</td><td><input type="text" class="add-title"/></td></tr>
						<tr><td><input type="button" class="add-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="edit">
		<label class="font-bold">专题编辑(topic/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>topicId:</td><td><input type="text" class="edit-topicId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="edit-title"/></td></tr>
						<tr><td><input type="button" class="edit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="edit-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="delete">
		<label class="font-bold">专题删除(topic/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>topicIds:</td><td><input type="text" class="delete-topicIds"/></td></tr>
						<tr><td><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">专题详情(topic/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>topicId:</td><td><input type="text" class="detail-topicId"/></td></tr>
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
		<label class="font-bold">专题列表(topic/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listPaging">
		<label class="font-bold">专题列表分页(topic/listPaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>page:</td><td><input type="text" class="listPaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listPaging-size"/></td></tr>
						<tr><td><input type="button" class="listPaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listPaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".topicMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "topic/add",
					type: "POST",
					data: {
						title: $add.find(".add-title").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".topicMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "topic/edit",
					type: "POST",
					data: {
						topicId: $edit.find(".edit-topicId").val(),
						title: $edit.find(".edit-title").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".topicMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "topic/delete",
					type: "POST",
					data: {
						topicIds: $delete.find(".delete-topicIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".topicMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "topic/detail",
					type: "POST",
					data: {
						topicId: $detail.find(".detail-topicId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".topicMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "topic/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listPaging = $(".topicMgr .listPaging");
			$listPaging.on("click", ".listPaging-btn", function() {
				$.ajax({
					url: "topic/listPaging",
					type: "POST",
					data: {
						page: $listPaging.find(".listPaging-page").val(),
						size: $listPaging.find(".listPaging-size").val(),
					},
					success: function(data) {
						$listPaging.find(".listPaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listPaging.find(".listPaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>
