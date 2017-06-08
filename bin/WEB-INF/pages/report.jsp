<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
.report-detail table {
	margin-bottom: 0px;
}
.report-detail table td {
	border: none!important;
	word-break: break-all;
　　	word-wrap: break-word;
}
.report-detail .panel-body {
	padding: 0px 10px;
}
.report-detail .td-title {
	width: 80px;
}
</style>
<script class="template Report" type="text/x-jquery-tmpl">
	<div class="row">
		<div class="col-lg-12">
			<h3><strong>举报管理</strong></h3>
        </div>
	</div>

	<div>
		<div class="col-lg-12" style="padding: 0;">
			<div>
				<table class="table table-striped table-hover" id="article-table">
            		<thead>
            			<tr>
            				<th class="index">#</th>
							<th>查询码</th>
							<th>标题</th>
							<th>类别</th>
							<th class="text-right">创建时间</th>
							<th class="text-right"></th>
               			</tr>
            		</thead>
            		<tbody>
						{{~ it.data: report: index }}
						<tr class="table-tr" reportId="{{=report.id}}">
							<td>{{=index+1}}</td>
							<td class="report-searchCode">{{=report.searchCode}}</td>
							<td class="report-title"><a class="report-detail">{{=report.title}}</a></td>
							<td class="report-type">{{=$k.constant.issue[report.type].name}}</td>
							<td class="text-right">{{=$k.util.getDateString2(report.createTime)}}</td>
							<td class="text-right">
								<button type="button" class="btn btn-primary report-reply" reply="{{=report.reply}}">
									<span class="fa fa-edit"></span> 答复
								</button>
							</td>		
						</tr>
						{{~}}
					</tbody>
          		</table>
			</div>		
		</div>	
	</div>
</script>

<script class="template ReportReply" type="text/x-jquery-tmpl">
	<div class="modal-dialog">
   		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		<h4 class="modal-title"><strong>举报答复</strong></h4>
      		</div>
      		<div class="modal-body">
       			<form class="form-horizontal" role="form">
  					<div class="form-group">
    					<label for="reply" class="col-sm-2 control-label">答复内容:</label>
    					<div class="col-sm-10">
							<textarea class="form-control reply-textarea" rows="5" placeholder="答复内容"></textarea>
    					</div>
  					</div>
				</form>
      		<div class="modal-footer">
        		<button type="button" class="btn btn-default" data-dismiss="modal">取  消</button>
        		<button type="button" class="btn btn-primary report-reply-confirm">确  定</button>
      		</div>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</script>

<script class="template ReportDetail" type="text/x-jquery-tmpl">
	<div class="modal-dialog report-detail">
   		<div class="modal-content" style="max-height: 700px; overflow: scroll;">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        		<h4 class="modal-title"><strong>{{=it.data.title}}({{=it.data.searchCode}})</strong></h4>
      		</div>
      		<div class="modal-body">
       			<div class="panel panel-default">
  					<div class="panel-heading">举报人信息</div>
 					<div class="panel-body">
    					<table class="table table-condensed">
							<tr>
								<td class="td-title"><strong>姓    名</strong></td>
								<td>{{=it.data.name}}</td>
								<td class="td-title"><strong>身份证号</strong></td>
								<td>{{=it.data.identityCard}}</td>
							</tr>
							<tr>
								<td class="td-title"><strong>联系方式</strong></td>
								<td>{{=it.data.telephone}}</td>
								<td class="td-title"><strong>政治面貌</strong></td>
								<td>{{=it.data.political !=null ? $k.constant.political[it.data.political].name : ""}}</td>
							</tr>
							<tr>
								<td class="td-title"><strong>居住地址</strong></td>
								<td >{{=it.data.address}}</td>
								<td class="td-title"><strong>级    别</strong></td>
								<td>{{=it.data.level != null ? $k.constant.level[it.data.level].name : ""}}</td>
							</tr>
						</table>
  					</div>
				</div>
       			<div class="panel panel-default">
  					<div class="panel-heading">被举报人信息</div>
 					<div class="panel-body">
    					<table class="table table-condensed">
							<tr>
								<td class="td-title"><strong>被举报人</strong></td>
								<td>{{=it.data.respondentName}}</td>
								<td class="td-title"><strong>单    位</strong></td>
								<td>{{=it.data.respondentUnit}}</td>
							</tr>
							<tr>
								<td class="td-title"><strong>职    务</strong></td>
								<td>{{=it.data.respondentPosition}}</td>
								<td class="td-title"><strong>所在地区</strong></td>
								<td>{{=it.data.respondentArea}}</td>
							</tr>
							<tr>
								<td class="td-title"><strong>级       别</strong></td>
								<td>{{=$k.constant.level[it.data.respondentLevel].name}}</td>
								<td class="td-title"></td>
								<td></td>
							</tr>
						</table>
  					</div>
				</div>
       			<div class="panel panel-default">
  					<div class="panel-heading">举报正文</div>
 					<div class="panel-body">
    					<table class="table table-condensed">
							<tr>
								<td class="td-title"><strong>问题类别</strong></td>
								<td>{{=$k.constant.issue[it.data.type].name}}--{{=$k.constant.issue[it.data.type].sub[it.data.subType].name}}</td>
							</tr>
							<tr>
								<td class="td-title"><strong>主要问题</strong></td>
								<td>{{=it.data.content}}</td>
							</tr>
							<tr>
								<td class="td-title"><strong>附    件</strong></td>
								<td><a href="report/download?reportId={{=it.data.id}}">{{=it.data.fileName || ""}}</a></td>
							</tr>
						</table>
  					</div>
				</div>
				<div class="panel panel-default" style="margin-bottom: 0px;">
  					<div class="panel-heading">答复内容</div>
 					<div class="panel-body" style="padding: 10px;">
    					{{=it.data.reply}}
  					</div>
				</div>
			</div>
    	</div><!-- /.modal-content -->
  	</div><!-- /.modal-dialog -->
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Report";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		$tempReportReply: {
			value: $(".template.ReportReply")
		},
		$tempReportDetail: {
			value: $(".template.ReportDetail")
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on("click", ".report-detail", function() {
					var reportId = $(this).closest(".table-tr").attr("reportId");
					$.ajax({
						url: 'report/detail',
						type: 'POST',
						data: {
							reportId: reportId
						},
						success: function(data) {
							var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
							$dialog.html(self.$tempReportDetail.doT({
								data: data.data
							}));
							$dialog.modal({backdrop: 'static'});
						},
						error: function(err) {}
					});
				})
				.on("click", ".report-reply", function() {
					var $tr = $(this).closest(".table-tr");
					var reportId = $tr.attr("reportId");
					var reply = $(this).attr("reply");
					var $dialog = $('<div class="modal" role="dialog"></div>').appendTo($tar);
					$dialog.html(self.$tempReportReply.doT({
						reply: reply,
					}));
					$dialog.find('.reply-textarea').val(reply);
					$dialog.modal({backdrop: 'static'});
					
					$dialog
					.on('hidden.bs.modal', function (e) {
						$dialog.remove();
					})
					.on("click", ".report-reply-confirm", function() {
						$.ajax({
							url: 'report/reply',
							type: 'POST',
							data: {
								reportId: reportId,
								reply: $dialog.find('.reply-textarea').val(),
							},
							success: function(data) {
								$tr.find('.report-reply').attr('reply', data.data);
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
				
				if (self.table) {
					self.table.destroy();
				}
				
				$.ajax({
					url: 'report/list',
					type: 'POST',
					success: function(data) {
						self.$tar.html(self.$tempTar.doT({
							data: data.data
						}));
						self.table = $k.util.dataTable(self.$tar.find("#article-table"));
					},
					error: function(err) {}
				});
				
				
				return self;
			}
		},
		load: {
			value: function() {
				var self = this;
				return self;
			}
		}
	});
	
})( jQuery );
</script>