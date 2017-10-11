<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Article" type="text/x-jquery-tmpl">
	<div class="row">
		<div class="col-lg-12">
			<h3><strong>{{=it.title}}</strong></h3>
        </div>
	</div>

	<div>
		<div class="col-lg-12" style="padding: 0;">
			<div>
				<table class="table table-striped table-hover" id="article-table">
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
						<tr>
							<td colspan = "5">
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

<script class="template ArticleAdd" type="text/x-jquery-tmpl">
	<div class="modal-dialog" style="width: 850px;">
   		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		<h4 class="modal-title" articleType="{{=it.articleType}}"><strong>新增{{=it.title}}</strong></h4>
      		</div>
      		<div class="modal-body" style='max-height: 560px; overflow: auto;'>
       			<form class="article-form form-horizontal" role="form">
  					<div class="form-group">
    					<label for="title" class="col-sm-1 control-label">标题:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" name="title" placeholder="标题">
    					</div>
  					</div>
					{{? it.articleType == '2' }}
  					<div class="form-group">
   						<label for="source" class="col-sm-1 control-label">图片:</label>
    					<div class="col-sm-10">
							<input type="file" class="file uploadImage" name="uploadImage">
    					</div>
      				</div>
					{{?}}
  					<div class="form-group" style="margin-bottom: 0px;">
   						<label for="source" class="col-sm-1 control-label">来源:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" name="source" placeholder="来源">
    					</div>
      				</div>
					<div class="form-group">
						<div class="article-editor"></div>
					</div>
				</form>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default" data-dismiss="modal">取  消</button>
        		<button type="button" class="btn btn-primary article-add-confirm">确  定</button>
      		</div>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</script>

<script class="template ArticleList" type="text/x-jquery-tmpl">
	{{~ it.data: article: index }}
	<tr class="table-tr">
		<td class="article-id" articleId="{{=article.id}}">{{=index+1}}</td>
		<td class="article-title"><a href="article?id={{=article.id}}" target="_blank">{{=article.title}}</a></td>
		<td class="text-right">{{=$k.util.getDateString2(article.createTime)}}</td>
		<td class="text-right">{{=$k.util.getDateString2(article.updateTime)}}</td>
		<td class="text-right">
			<button type="button" class="btn btn-primary article-edit"><span class="fa fa-edit"></span> 编辑</button>
			<button type="button" class="btn btn-primary article-delete"><span class="fa fa-times"></span> 删除</button>
			<button type="button" class="btn btn-primary article-top"><span class="fa fa-long-arrow-up"></span> 置顶</button>
		</td>		
	</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Article";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempAddTar: {
			value: $(".template.ArticleAdd")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on("click", ".article-add", function() {
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html(self.$tempAddTar.doT({
						title: $k.util.getTitle(self.articleType),
						articleType: self.articleType
					}));
					self.editor = new $k.proto.Editor().init($dialog.find('.article-editor')).draw();
					self.fileinput($dialog.find('.uploadImage'));
					$dialog.modal({backdrop: 'static'});
					self.articleAddValid($dialog);
					
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
				.on("click", ".article-edit", function(){
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
							$dialog.html(self.$tempAddTar.doT({
								title: $k.util.getTitle(self.articleType),
								articleType: self.articleType,
							}));
							self.fileinput($dialog.find('.uploadImage'), {
								initialPreview:	"<img src='" + data.data.imagePath + "' class='file-preview-image'>"
							});
							self.editor = new $k.proto.Editor().init($dialog.find(".article-editor")).draw();
							$dialog.find('input[name="title"]').val(data.data.title);
							$dialog.find('input[name="source"]').val(data.data.source);
							$dialog.find("#editor").html(data.data.content);
							
							$dialog.modal({backdrop: 'static'});
							self.articleAddValid($dialog);
							
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
			value: function(articleType) {
				var self = this;
				
				self.articleType = articleType;
				var title = $k.util.getTitle(articleType);
				self.$tar.html(self.$tempTar.doT({
					title: title
				}));
				
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
					url: "article/listByType",
					type: "POST",
					data: {
						type: self.articleType
					},
					success: function(data) {
						self.$tar.find("#article-table tbody").html(
							$(".template.ArticleList").doT({
									data: data.data
								})
							);
						self.table = $k.util.dataTable(self.$tar.find("#article-table"));
					},
					error: function(err) {}
				});
				
				return self;
			}
		},
		articleAddValid: {
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
		},
		fileinput: {
			value: function($input, parm) {
				var options = $.extend({
					language: 'zh', //设置语言
					maxFileCount: 1,
				    allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
				    showUpload: false, //是否显示上传按钮
				    dropZoneEnabled: true,//是否显示拖拽区域
				    browseClass: "btn btn-primary", // 按钮样式  
				}, parm);
				$input.fileinput(options);
			}
		}
	});
	
})( jQuery );
</script>
