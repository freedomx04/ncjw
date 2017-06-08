<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template Overview" type="text/x-jquery-tmpl">
	<div class="row">
		<div class="col-lg-12">
			<h3><strong>总览</strong></h3>
        </div>
	</div>

	<!-- <div>
		<div class="col-lg-12">
			<div class="panel panel-default">  
				<div class="panel-heading">
					<i class="fa fa-star fa-fw"></i> 今日新增
				</div>
				<div class="panel-body">
					<div class="row">

						<div class="col-lg-3 col-md-6">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-file-text-o fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">26</div>
											<div>新增新闻</div>
                       					</div>
									</div>
								</div>
								<a href="#">
									<div class="panel-footer">
										<span class="pull-left">详情</span>
										<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
                					</div>
								</a>
							</div>
						</div>

						<div class="col-lg-3 col-md-6">
							<div class="panel panel-green">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-3">
											<i class="fa fa-envelope fa-5x"></i>
										</div>
										<div class="col-xs-9 text-right">
											<div class="huge">12</div>
											<div>新增举报</div>
										</div>
									</div>
								</div>
                       			<a href="#">
                            		<div class="panel-footer">
                                		<span class="pull-left">详情</span>
                                		<span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                		<div class="clearfix"></div>
                            		</div>
                        		</a>
                    		</div>
                		</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

	<div>
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i> 新闻数量分析
				</div>
				<div class="panel-body">
					<div class="row">
	
						<div class="col-lg-8">
							<div class="article-chart">
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-4">
							<div class="article-count">
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
							</div>
						</div>
			
					</div>
				</div>
			</div>
		</div>
	<div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-bar-chart-o fa-fw"></i> 举报分析
				</div>
				<div class="panel-body">
					<div class="row">
	
						<div class="col-lg-8">
							<div class="report-chart">
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-4">
							<div class="report-count">
								<div class="sk-three-bounce">
									<div class="sk-child sk-bounce1"></div>
									<div class="sk-child sk-bounce2"></div>
									<div class="sk-child sk-bounce3"></div>
								</div>
							</div>
						</div>
			
					</div>
				</div>
			</div>
		</div>
	</div>

</script>

<script class="template ArticleCount" type="text/x-jquery-tmpl">
	<div class="list-group">
		{{~ it.data: data}} 
			<a href="#" class="article-item list-group-item">
				<i class="fa fa-file-text-o fa-fw"></i> {{=$k.util.getTitle(data[0])}}
				<span class="pull-right">{{=data[1]}}</span>
			</a>
		{{~}}
	</div>
</script>

<script class="template ReportCount" type="text/x-jquery-tmpl">
	<div class="list-group">
		<a href="#" class="report-item list-group-item">
			<i class="fa fa-envelope fa-fw"></i> 已答复
			<span class="pull-right">{{=it.data.reply}}</span>
		</a>
		<a href="#" class="report-item list-group-item">
			<i class="fa fa-warning fa-fw"></i> 未答复
			<span class="pull-right">{{=it.data.noreply}}</span>
		</a>
	</div>
</script>

<script type="text/javascript">
;(function( $ ) {
	
	var fnName = "Overview";
	var Klass = $k.proto[fnName] = function() {};
	Klass.prototype = Object.create(Object.prototype, {
		$tempTar: {
			value: $(".template." + fnName)
		},
		init: {
			value: function($tar) {
				var self = this;
				self.$tar = $tar
				.on('click', '.article-item', function() {
					var type = $(this).attr('articleType');
					if (type == '8') {
						$('.sidebar .module[module="topic"]').trigger("click");
					} else {
						$('.sidebar .module[article=' + type + ']').trigger('click');
					}
				})
				.on("click", ".report-item", function() {
					$('.sidebar .module[module="report"]').trigger("click");
				});
				
				return self;
			}
		},
		draw: {
			value: function() {
				var self = this;
				self.$tar.html(self.$tempTar.doT());
				
				// article count
				$.ajax({
					url: 'article/listByCount',
					type: 'POST',
					success: function(data) {
						self.$tar.find(".article-count").html($(".template.ArticleCount").doT({
							data: data.data
						}));
						
						var series = [];
						$.each(data.data, function(k, v) {
							v[0] = $k.util.getTitle(v[0]);
							series.push(v);
						})
						
						self.$tar.find(".article-chart").highcharts({
							chart: {
								type: 'column'
							},
							title: {
								text: '新闻数量图表分析'
							},
							xAxis: {
								type: 'category',
						    },
						    yAxis: {
						    	title: {
						    		text: '数量'
						    	}
						    },
						    legend: {
					            enabled: false
					        },
						    series: [{
						    	 name: '新闻数量',
						    	 data: series
			                }],
						}); 
					},
					error: function(data) {}
				});
				
				// report count
				$.ajax({
					url: 'report/listByCount',
					type: 'POST',
					success: function(data) {
						self.$tar.find(".report-count").html($(".template.ReportCount").doT({
							data: data.data
						}));
						
						var series = [];
						series.push(["已答复", data.data.reply]);
						series.push(["未答复", data.data.noreply]);
						
						self.$tar.find(".report-chart").highcharts({
							chart: {
					            plotBackgroundColor: null,
					            plotBorderWidth: null,
					            plotShadow: false
					        },
					        title: {
					            text: '举报分析'
					        },
					        plotOptions: {
					            pie: {
					                allowPointSelect: true,
					                cursor: 'pointer',
					                dataLabels: {
					                    enabled: false
					                },
					                showInLegend: true
					            }
					        },
					        series: [{
					            type: 'pie',
					            name: 'Browser share',
					            data: series
					        }],
						});
						
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
		},
	});
	
})( jQuery );
</script>
