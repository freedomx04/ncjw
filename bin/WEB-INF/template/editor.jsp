<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<style type="text/css">
.article-editor .hero-unit {
	padding: 10px;
}
.article-editor .container {
	width: 100%;
	padding: 0px;
}
.article-editor	#editor {
	height: 250px;
	max-height: 250px;
}
</style>

<script class="template Editor" type="text/x-jquery-tmpl">
	<div class="container">
		<div class="hero-unit">
			<div id="alerts"></div>
   			<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      			<div class="btn-group">
        			<a class="btn dropdown-toggle" data-toggle="dropdown" title="字体"><i class="icon-font"></i><b class="caret"></b></a>
          			<ul class="dropdown-menu"></ul>
        		</div>

      			<div class="btn-group">
        			<a class="btn dropdown-toggle" data-toggle="dropdown" title="字体大小"><i class="icon-text-height"></i><b class="caret"></b></a>
          			<ul class="dropdown-menu">
          				<li><a data-edit="fontSize 5"><font size="5">大号</font></a></li>
          				<li><a data-edit="fontSize 3"><font size="3">默认</font></a></li>
          				<li><a data-edit="fontSize 1"><font size="1">小号</font></a></li>
          			</ul>
      			</div>

      			<div class="btn-group">
       				<a class="btn" data-edit="bold" title="加粗"><i class="icon-bold"></i></a>
        			<a class="btn" data-edit="italic" title="斜体"><i class="icon-italic"></i></a>
        			<a class="btn" data-edit="strikethrough" title="删除线"><i class="icon-strikethrough"></i></a>
       				<a class="btn" data-edit="underline" title="下划线"><i class="icon-underline"></i></a>
      			</div>

      			<div class="btn-group">
        			<a class="btn" data-edit="insertunorderedlist" title="无序列表"><i class="icon-list-ul"></i></a>
        			<a class="btn" data-edit="insertorderedlist" title="有序列表"><i class="icon-list-ol"></i></a>
        			<a class="btn" data-edit="outdent" title="减少缩进"><i class="icon-indent-left"></i></a>
        			<a class="btn" data-edit="indent" title="首行缩进"><i class="icon-indent-right"></i></a>
      			</div>

      			<div class="btn-group">
        			<a class="btn" data-edit="justifyleft" title="居左对齐"><i class="icon-align-left"></i></a>
        			<a class="btn" data-edit="justifycenter" title="居中对齐"><i class="icon-align-center"></i></a>
        			<a class="btn" data-edit="justifyright" title="居右对齐"><i class="icon-align-right"></i></a>
        			<a class="btn" data-edit="justifyfull" title="两端对齐"><i class="icon-align-justify"></i></a>
      			</div>

     			<div class="btn-group">
		  			<a class="btn dropdown-toggle" data-toggle="dropdown" title="超链接"><i class="icon-link"></i></a>
		    		<div class="dropdown-menu">
			    		<input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
			    		<button class="btn" type="button">新增</button>
        			</div>
        			<a class="btn" data-edit="unlink" title="取消超链接"><i class="icon-cut"></i></a>
      			</div>
      
     			<div class="btn-group">
        			<a class="btn" title="插入图片" id="pictureBtn">
						<i class="icon-picture"></i>
						<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
					</a>
      			</div>

      			<div class="btn-group">
        			<a class="btn" data-edit="undo" title="撤销"><i class="icon-undo"></i></a>
        			<a class="btn" data-edit="redo" title="重做"><i class="icon-repeat"></i></a>
      			</div>

      			<input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    		</div>	<!-- btn-toolbar -->

    		<div id="editor" contenteditable="true">
    		</div>
 		 </div>
	</div>
</script>

<script type="text/javascript">
	;(function($) {

		var fnName = "Editor";
		var Klass = $k.proto[fnName] = function() {
		};
		Klass.prototype = Object.create(Object.prototype, {
			$tempTar: {
				value : $(".template." + fnName)
			},
			init: {
				value: function($tar) {
					var self = this;
					self.$tar = $tar;
					return self;
				}
			},
			draw: {
				value: function() {
					var self = this;
					self.$tar.html(self.$tempTar.doT());
					
					function initToolbarBootstrapBindings() {
						var fonts = ['SimHei', 'SimSun', 'Microsoft YaHei', 'Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
						         'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Verdana'],
						fontTarget = $('[title=字体]').siblings('.dropdown-menu');
						$.each(fonts, function (idx, fontName) {
							fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
						});
						       	
						$('a[title]').tooltip({container: '.container'});
						$('.dropdown-menu input').click(function() {return false;})
							.change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
							.keydown('esc', function () {this.value='';$(this).change();});

						$('[data-role=magic-overlay]').each(function () { 
							var overlay = $(this), target = $(overlay.data('target')); 
							//overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
							overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width('40px').height('30px');
						});
						if ("onwebkitspeechchange"  in document.createElement("input")) {
							var editorOffset = $('#editor').offset();
							$('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
						} else {
							$('#voiceBtn').hide();
						}
					}
					
					function showErrorAlert (reason, detail) {
						var msg='';
						if (reason==='unsupported-file-type') { 
							msg = "Unsupported format " +detail; 
						} else {
							console.log("error uploading file", reason, detail);
						}
						$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
							'<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
					};
					   
					initToolbarBootstrapBindings();  
					$('#editor').wysiwyg({ 
						fileUploadError: showErrorAlert
					});
					window.prettyPrint && prettyPrint(); 
					
					return self;
				}
			},
		});

	})(jQuery);
</script>
