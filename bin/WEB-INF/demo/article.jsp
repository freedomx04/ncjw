<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>文章</title>
<%@ include file="/WEB-INF/include/html_head_preload.jsp"%>
</head>
<body class="articleMgr" style="width:1024; min-width: 1024px; padding: 20px;">
	<div class="add">
		<label class="font-bold">文章新增(article/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>title:</td><td><input type="text" class="add-title"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="add-type"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="add-imagePath"/></td></tr>
						<tr><td>content:</td><td><input type="text" class="add-content"/></td></tr>
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
		<label class="font-bold">文章编辑(article/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>articleId:</td><td><input type="text" class="edit-articleId"/></td></tr>
						<tr><td>title:</td><td><input type="text" class="edit-title"/></td></tr>
						<tr><td>type:</td><td><input type="text" class="edit-type"/></td></tr>
						<tr><td>imagePath:</td><td><input type="text" class="edit-imagePath"/></td></tr>
						<tr><td>content:</td><td><input type="text" class="edit-content"/></td></tr>
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
		<label class="font-bold">文章删除(article/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>articleIds:</td><td><input type="text" class="delete-articleIds"/></td></tr>
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
	
	<div class="top">
		<label class="font-bold">文章置顶(article/top)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>articleId:</td><td><input type="text" class="top-articleId"/></td></tr>
						<tr><td><input type="button" class="top-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="top-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="detail">
		<label class="font-bold">文章详情(article/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>articleId:</td><td><input type="text" class="detail-articleId"/></td></tr>
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
	
	<div class="listByType">
		<label class="font-bold">根据类型获取文章列表(article/listByType)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>type:</td><td><input type="text" class="listByType-type"/></td></tr>
						<tr><td><input type="button" class="listByType-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByType-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="listByTypePaging">
		<label class="font-bold">根据类型获取文章列表分页(article/listByTypePaging)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>type:</td><td><input type="text" class="listByTypePaging-type"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="listByTypePaging-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="listByTypePaging-size"/></td></tr>
						<tr><td><input type="button" class="listByTypePaging-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByTypePaging-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>	
	
	<div class="listByCount">
		<label class="font-bold">文章数量分析(article/listByCount)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="listByCount-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="listByCount-textarea" style="width: 600px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="search">
		<label class="font-bold">全文搜索(article/search)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>keywords:</td><td><input type="text" class="search-keywords"/></td></tr>
						<tr><td>page:</td><td><input type="text" class="search-page"/></td></tr>
						<tr><td>size:</td><td><input type="text" class="search-size"/></td></tr>
						<tr><td><input type="button" class="search-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="search-textarea" style="width: 600px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	<script type="text/javascript">
		;(function($) {
			
			var $add = $(".articleMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "article/add",
					type: "POST",
					data: {
						title: $add.find(".add-title").val(),
						type: $add.find(".add-type").val(),
						imagePath: $add.find(".add-imagePath").val(),
						content: $add.find(".add-content").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".articleMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "article/edit",
					type: "POST",
					data: {
						articleId: $edit.find(".edit-articleId").val(),
						title: $edit.find(".edit-title").val(),
						type: $edit.find(".edit-type").val(),
						imagePath: $edit.find(".edit-imagePath").val(),
						content: $edit.find(".edit-content").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".articleMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "article/delete",
					type: "POST",
					data: {
						articleIds: $delete.find(".delete-articleIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $top = $(".articleMgr .top");
			$top.on("click", ".top-btn", function() {
				$.ajax({
					url: "article/top",
					type: "POST",
					data: {
						articleId: $top.find(".top-articleId").val()
					},
					success: function(data) {
						$top.find(".top-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$top.find(".top-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".articleMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "article/detail",
					type: "POST",
					data: {
						articleId: $detail.find(".detail-articleId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByType = $(".articleMgr .listByType");
			$listByType.on("click", ".listByType-btn", function() {
				$.ajax({
					url: "article/listByType",
					type: "POST",
					data: {
						type: $listByType.find(".listByType-type").val(),
					},
					success: function(data) {
						$listByType.find(".listByType-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByType.find(".listByType-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByTypePaging = $(".articleMgr .listByTypePaging");
			$listByTypePaging.on("click", ".listByTypePaging-btn", function() {
				$.ajax({
					url: "article/listByTypePaging",
					type: "POST",
					data: {
						type: $listByTypePaging.find(".listByTypePaging-type").val(),
						page: $listByTypePaging.find(".listByTypePaging-page").val(),
						size: $listByTypePaging.find(".listByTypePaging-size").val(),
					},
					success: function(data) {
						$listByTypePaging.find(".listByTypePaging-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByTypePaging.find(".listByTypePaging-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $listByCount = $(".articleMgr .listByCount");
			$listByCount.on("click", ".listByCount-btn", function() {
				$.ajax({
					url: "article/listByCount",
					type: "POST",
					success: function(data) {
						$listByCount.find(".listByCount-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$listByCount.find(".listByCount-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $search = $(".articleMgr .search");
			$search.on("click", ".search-btn", function() {
				$.ajax({
					url: "article/search",
					type: "POST",
					data: {
						keywords: $search.find(".search-keywords").val(),
						page: $search.find(".search-page").val(),
						size: $search.find(".search-size").val(),
					},
					success: function(data) {
						$search.find(".search-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$search.find(".search-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
		})(jQuery);
	</script>
</body>
</html>
