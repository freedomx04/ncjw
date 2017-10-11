<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
.table-tr button {
	margin-left: 5px;
}
</style>

<script class="template Topic" type="text/x-jquery-tmpl">
	<div class="row">
		<div class="col-lg-12">
			<h3><strong>专题集锦</strong></h3>
        </div>
	</div>

	<div>
		<div class="col-lg-12" style="padding: 0;">
			<div>
				<table class="table table-striped table-hover" id="topic-table">
            		<thead>
            			<tr>
            				<th class="index">#</th>
							<th>
								标题
								<button type="button" class="topic-add btn btn-primary pull-right"><span class="fa fa-plus"></span> 新增</button>
							</th>
               			</tr>
            		</thead>
            		<tbody>
						<tr>
							<td colspan = "2">
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
							</td>
						</tr>
					</tbody>
          		</table>
			</div>		
		</div>	
	</div>
</script>

<script class="template TopicAdd" type="text/x-jquery-tmpl">
	<div class="modal-dialog">
   		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		<h4 class="modal-title"><strong>新增专题</strong></h4>
      		</div>
      		<div class="modal-body">
       			<form class="form-horizontal" role="form">
  					<div class="form-group">
    					<label for="title" class="col-sm-2 control-label">标题:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" name="title" placeholder="标题">
    					</div>
  					</div>
				</form>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default" data-dismiss="modal">取  消</button>
        		<button type="button" class="btn btn-primary topic-add-confirm">确  定</button>
      		</div>

    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</script>

<script class="template TopicList" type="text/x-jquery-tmpl">
	{{~ it.data: topic: index }}
	<tr class="table-tr" topicId="{{=topic.id}}">
		<td class="topic-id">{{=index+1}}</td>
		<td class="topic-title">
			<span title="{{=topic.title}}">{{=topic.title}}</span>
		
			<button type="button" class="btn btn-primary pull-right topic-top"><span class="fa fa-long-arrow-up"></span> 置顶</button>
			<button type="button" class="btn btn-primary pull-right topic-delete"><span class="fa fa-times"></span> 删除</button>
			<button type="button" class="btn btn-primary pull-right topic-edit"><span class="fa fa-edit"></span> 编辑</button>
			<button data-toggle="collapse" data-parent="#accordion" href="#collapse{{=index}}" type="button" class="btn btn-primary pull-right topic-detail">
				<span class="fa fa-list"></span> 详情
			</button>
			
			<div id="collapse{{=index}}" class="panel-collapse collapse" style="width: 100%;">
        		<div class="panel-body">
            		<table class="table table-striped table-hover" id="topic-table">
            			<thead>
            				<tr>
            					<th class="index">#</th>
								<th>标题</th>
								<th class="text-right">创建时间</th>
								<th class="text-right">修改时间</th>
								<th class="text-right">
									<button type="button" class="article-add btn btn-primary"><span class="fa fa-plus"></span> 新增</button>
								</th>
               				</tr>
            			</thead>
            			<tbody>
							{{~ topic.articles: article: num }}
							<tr class="table-tr" topicId="{{=topic.id}}">
								<td class="article-id" articleId="{{=article.id}}">{{=num+1}}</td>
								<td class="article-title"><a href="{{=article.linkPath}}" target="_blank">{{=article.title}}</a></td>
								<td class="text-right">{{=$k.util.getDateString2(article.createTime)}}</td>
								<td class="text-right">{{=$k.util.getDateString2(article.updateTime)}}</td>
								<td class="text-right">
									<button type="button" class="btn btn-primary article-edit"><span class="fa fa-edit"></span> 编辑</button>
									<button type="button" class="btn btn-primary article-delete"><span class="fa fa-times"></span> 删除</button>
									<button type="button" class="btn btn-primary article-top"><span class="fa fa-long-arrow-up"></span> 置顶</button>
								</td>
							</tr>
							{{~}}
						</tbody>
          			</table>
        		</div>
			</div>
		</td>
	</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Topic";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempAddTar: {
			value: $(".template.TopicAdd")
		},
		$tempArticleAdd: {
			value: $(".template.ArticleAdd")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on("click", ".topic-add", function() {
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html(self.$tempAddTar.doT());
					self.editor = new $k.proto.Editor().init($dialog.find(".topic-editor")).draw();
					$dialog.modal({backdrop: 'static'});
					self.topicAddValid($dialog);
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".topic-add-confirm", function() {
						var bootstrapValidator = $dialog.find('form').data('bootstrapValidator');
						bootstrapValidator.validate();
						
						if (bootstrapValidator.isValid()) {
							$.ajax({
								url: 'topic/add',
								type: 'POST',
								data: {
									title: $dialog.find('input[name = "title"]').val(),
								},
								success: function(data) {
									self.load();
									$dialog.modal('hide');
								},
								error: function(err) {
									$dialog.modal('hide');
								}
							});
						} else {
							return;
						}
					});
				})
				.on("click", ".topic-edit", function(){
					var $tr = $(this).closest(".table-tr");
					var topicId = $tr.attr("topicId");
					
					$.ajax({
						url: 'topic/detail',
						type: 'POST',
						data: { topicId: topicId },
						success: function(data) {
							var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
							$dialog.html(self.$tempAddTar.doT());
							$dialog.find('input[name="title"]').val(data.data.title);
							$dialog.modal({backdrop: 'static'});
							self.topicAddValid($dialog);
							
							$dialog
							.on('hidden.bs.modal', function (e) {
								$dialog.remove();
							})
							.on("click", ".topic-add-confirm", function() {
								var bootstrapValidator = $dialog.find('form').data('bootstrapValidator');
								bootstrapValidator.validate();
								
								if (bootstrapValidator.isValid()) {
									$.ajax({
										url: 'topic/edit',
										type: 'POST',
										data: {
											topicId: topicId,
											title: $dialog.find('input[name = "title"]').val(),
										},
										success: function(data) {
											self.load();
											$dialog.modal('hide');
										},
										error: function(err) {
											$dialog.modal('hide');
										}
									});
								} else {
									return;
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".topic-delete", function() {
					var $tr = $(this).closest(".table-tr");
					var topicId = $tr.attr("topicId");
					
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "删除该专题",
						content: "删除该专题官网将不在显示，并且专题下的文章都会删除，是否删除?"
					}));
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".btn-confirm", function() {
						$.ajax({
							url: 'topic/delete',
							type: 'POST',
							data: {
								topicId: topicId,
							},
							success: function(data) {
								$tr.remove();
								$dialog.modal('hide');
							},
							error: function(err) {
								$dialog.modal('hide');
							}
						});
					});
				})
				.on("click", ".topic-top", function() {
					var topicId = $(this).closest(".table-tr").attr("topicId");
					
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "置顶该专题",
						content: "置顶该专题将显示在官网最前面，是否置顶?"
					}));
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".btn-confirm", function() {
						$.ajax({
							url: 'topic/top',
							type: 'POST',
							data: {
								topicId: topicId,
							},
							success: function(data) {
								self.load();
								$dialog.modal('hide');
							},
							error: function(err) {
								$dialog.modal('hide');
							}
						});
					});
				})
				.on("click", ".article-add", function() {
					var topicId = $(this).closest(".table-tr").attr("topicId");
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html(self.$tempArticleAdd.doT({
						title: $k.util.getTitle(self.articleType),
						articleType: self.articleType
					}));
					self.editor = new $k.proto.Editor().init($dialog.find(".article-editor")).draw();
					$dialog.modal({backdrop: 'static'});
					self.topicAddValid($dialog);
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".article-add-confirm", function() {
						var bootstrapValidator = $dialog.find('form').data('bootstrapValidator');
						bootstrapValidator.validate();
						
						if (bootstrapValidator.isValid()) {
							var formData = new FormData($dialog.find('form')[0]); 
							formData.append("type", Number(self.articleType));
							formData.append("content", $dialog.find("#editor").html());
							formData.append("topicId", topicId);
							
							$.ajax({
								url: 'article/add',
								type: 'POST',
								data: formData,
					          	cache: false, 
					          	contentType: false, 
					          	processData: false,
								success: function(data) {
									self.load();
									$dialog.modal('hide');
								},
								error: function(err) {
									$dialog.modal('hide');
								}
							});
						} else {
							return;
						}
					});
				})
				.on("click", ".article-edit", function() {
					var topicId = $(this).closest(".table-tr").attr("topicId");
					var $tr = $(this).closest(".table-tr");
					var articleId = $tr.find(".article-id").attr("articleId");
					
					$.ajax({
						url: 'article/detail',
						type: 'POST',
						data: {
							articleId: articleId
						},
						success: function(data) {
							var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
							$dialog.html(self.$tempArticleAdd.doT({
								title: $k.util.getTitle(self.articleType),
								articleType: self.articleType,
							}));
							self.editor = new $k.proto.Editor().init($dialog.find(".article-editor")).draw();
							
							$dialog.find('input[name="title"]').val(data.data.title);
							$dialog.find('input[name="source"]').val(data.data.source);
							$dialog.find("#editor").html(data.data.content);
							
							$dialog.modal({backdrop: 'static'});
							self.topicAddValid($dialog);
							
							$dialog
							.on('hidden.bs.modal', function (e) {
								$dialog.remove();
							})
							.on("click", ".article-add-confirm", function() {
								var bootstrapValidator = $dialog.find('form').data('bootstrapValidator');
								bootstrapValidator.validate();
								
								if (bootstrapValidator.isValid()) {
									var formData = new FormData($dialog.find('form')[0]); 
									formData.append("articleId", articleId);
									formData.append("type", Number(self.articleType));
									formData.append("content", $dialog.find("#editor").html());
									formData.append("topicId", topicId);
									
									$.ajax({
										url: 'article/edit',
										type: 'POST',
										data: formData,
							          	cache: false, 
							          	contentType: false, 
							          	processData: false,
										success: function(data) {
											self.load();
											$dialog.modal('hide');
										},
										error: function(err) {
											$dialog.modal('hide');
										}
									});
								} else {
									return;
								}
							});
						},
						error: function(err) {}
					});
				})
				.on("click", ".article-delete", function() {
					var $tr = $(this).closest(".table-tr");
					var articleId = $tr.find(".article-id").attr("articleId");
					
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "删除该文章",
						content: "删除该文章官网将不在显示，是否删除?"
					}));
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".btn-confirm", function() {
						$.ajax({
							url: 'article/delete',
							type: 'POST',
							data: {
								articleId: articleId,
							},
							success: function(data) {
								$tr.remove();
								$dialog.modal('hide');
							},
							error: function(err) {
								$dialog.modal('hide');
							}
						});
					});
				})
				.on("click", ".article-top", function() {
					var articleId = $(this).closest(".table-tr").find(".article-id").attr("articleId");
					
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "置顶该文章",
						content: "置顶该文章将显示在官网最前面，是否置顶?"
					}));
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".btn-confirm", function() {
						$.ajax({
							url: 'article/top',
							type: 'POST',
							data: {
								articleId: articleId,
							},
							success: function(data) {
								self.load();
								$dialog.modal('hide');
							},
							error: function(err) {
								$dialog.modal('hide');
							}
						});
					});
				});
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				self.$tar.html(self.$tempTar.doT());
				self.articleType = '8';
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				
				if (self.table) {
					self.table.destroy();
				}
				
				$.ajax({
					url: "topic/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#topic-table tbody").html(
							$(".template.TopicList").doT({
									data: data.data
								})
							);
						self.table = $k.util.dataTable(self.$tar.find("#topic-table"));
					},
					error: function(err) {}
				});
				
				return self;
			}
		},
		topicAddValid: {
			value: function($dialog) {
				$dialog.find('form').bootstrapValidator({
					message: 'This value is not valid',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
					fields: {
						title: {
							validators: {
								notEmpty: {
									message: '标题不能为空'
								}
							}
						},
					}
				});
			}
		}
	});
	
})( jQuery );
</script>