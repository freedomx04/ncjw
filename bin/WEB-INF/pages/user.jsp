<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template User" type="text/x-jquery-tmpl">
	<div class="row">
		<div class="col-lg-12">
			<h3><strong>用户管理</strong></h3>
        </div>
	</div>
	
	<div>
		<div class="col-lg-12" style="padding: 0;">
			<div>
				<table class="table table-striped table-hover" id="user-table">
            		<thead>
            			<tr>
            				<th class="index">#</th>
							<th>用户名</th>
							<th>用户状态</th>
							<th class="text-right">
								<button type="button" class="user-add btn btn-primary"><span class="fa fa-plus"></span> 新增</button>
							</th>
               			</tr>
            		</thead>
            		<tbody>
						<tr>
							<td colspan = "4">
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

<script class="template UserDialog" type="text/x-jquery-tmpl">
	<div class="modal-dialog">
   		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		<h4 class="modal-title"><strong>新增用户</strong></h4>
      		</div>
      		<div class="modal-body">
       			<form class="form-horizontal" role="form" action="">
  					<div class="form-group">
    					<label for="inputEmail3" class="col-sm-2 control-label">用户名:</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" name="username" placeholder="用户名">
    					</div>
  					</div>
  					<div class="form-group">
   						<label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
    					<div class="col-sm-10">
      						<input type="password" class="form-control" name="password" placeholder="密码">
    					</div>
      				</div>
				</form>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default" data-dismiss="modal">取  消</button>
        		<button type="button" class="btn btn-primary user-add-confirm">确  定</button>
      		</div>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</script>

<script class="template UserList" type="text/x-jquery-tmpl">
	{{~ it.data: user: index }}
	<tr class="table-tr">
		<td class="user-id" userId="{{=user.id}}">{{=index+1}}</td>
		<td class="user-name">{{=user.username}}</td>
		<td class="user-status">{{=(user.status == 0 ? '禁用' : '启用')}}</td>
		<td class="text-right">
			{{? user.status == 0 }}
			<button type="button" class="btn btn-primary user-status-btn user-enable"><span class="fa fa-check"></span> 启用</button>
			{{??}}
			<button type="button" class="btn btn-warning user-status-btn user-disable"><span class="fa fa-times"></span> 禁用</button>
			{{?}}
		</td>		
	</tr>
	{{~}}
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "User";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempDialogTar: {
			value: $(".template." + fnName + "Dialog")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on("click", ".user-add", function() {
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html(self.$tempDialogTar.doT());
					$dialog.modal({backdrop: 'static'});
					self.userAddValid($dialog);
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".user-add-confirm", function() {
						var bootstrapValidator = $dialog.find('form').data('bootstrapValidator');
						bootstrapValidator.validate();
						
						if (bootstrapValidator.isValid()) {
							$.ajax({
								url: 'user/add',
								type: 'POST',
								data: {
									username: $dialog.find('input[name = "username"]').val(),
									password: $k.util.encrptByDES($dialog.find('input[name = "password"]').val()),
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
				.on("click", ".user-disable", function() {
					var $tr = $(this).closest(".table-tr");
					var userId = $tr.find(".user-id").attr("userId");
					
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "禁用用户",
						content: "禁用用户将不能登录后台管理系统，是否禁用?"
					}));
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".btn-confirm", function() {
						$.ajax({
							url: 'user/status',
							type: 'POST',
							data: {
								userId: userId,
								status: 0,
							},
							success: function(data) {
								$tr.find(".user-status").text("禁用");
								$tr.find(".user-status-btn")
									.removeClass("btn-warning user-disable")
									.addClass("btn-primary user-enable")
									.html('<span class="fa fa-check"></span> 启用');
								$dialog.modal('hide');
							},
							error: function(err) {
								$dialog.modal('hide');
							}
						});
					});
				})
				.on("click", ".user-enable", function() {
					var $tr = $(this).closest(".table-tr");
					var userId = $tr.find(".user-id").attr("userId");
					
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html($(".template.ConfirmDialog").doT({
						title: "启用用户",
						content: "启动用户将可以登录后台管理系统，是否启用?"
					}));
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".btn-confirm", function() {
						$.ajax({
							url: 'user/status',
							type: 'POST',
							data: {
								userId: userId,
								status: 1,
							},
							success: function(data) {
								$tr.find(".user-status").text("启动");
								$tr.find(".user-status-btn")
									.removeClass("btn-primary user-enable")
									.addClass("btn-warning user-disable")
									.html('<span class="fa fa-times"></span> 禁用');
								$dialog.modal('hide');
							},
							error: function(err) {
								$dialog.modal('hide');
							}
						});
					});
				});
				
				$(window).bind('resize',
					function() {
						
					});
				
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				self.$tar.html(self.$tempTar.doT());
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
					url: "user/list",
					type: "POST",
					success: function(data) {
						self.$tar.find("#user-table tbody").html(
							$(".template.UserList").doT({
									data: data.data
								})
							);
						self.table = $k.util.dataTable(self.$tar.find("#user-table"));
					},
					error: function(err) {}
				});
				return self;
			}
		},
		userAddValid: {
			value: function($dialog) {
				$dialog.find('form').bootstrapValidator({
					message: 'This value is not valid',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
					fields: {
						username: {
							validators: {
								notEmpty: {
									message: '用户名不能为空'
								}
							}
						},
						password: {
							validators: {
								notEmpty: {
									message: '用户名不能为空'
								},
								stringLength: {
			                        min: 6,
			                        message: '密码必须大于6位'
			                    },
							}
						}
					}
				});
			}
		}
	});
	
})( jQuery );
</script>
