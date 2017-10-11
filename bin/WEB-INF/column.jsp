<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<script type="text/javascript" src="vendor/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="vendor/jquery/jquery-doT.js"></script>
<script type="text/javascript" src="vendor/doT/1.0.1/doT.js"></script>
<link rel="stylesheet" href="css/base.css" type="text/css"/>
<link rel="stylesheet" href="css/home.css" type="text/css"/>
<link rel="stylesheet" href="css/column.css" type="text/css"/>

<%@ include file="/WEB-INF/template/top.jsp"%>
<%@ include file="/WEB-INF/template/footer.jsp"%>
<title></title>

<script type="text/javascript">
</script>
</head>
<body>
	<div id="home">
		<header>
			<div></div>
			<div class="onered"></div>
		</header>
		<div id="content" style="height: 600px;">
			<!-- 左侧导航开始 -->
			<div class="other_left">      
    			<div class="channl_box">
			       <div class="channl" id="channl_1">
			           <a href="javascript:void(0)" onclick="columnPaging(1, this)">组织机构</a>        
			       </div>
			    </div>
			     <div class="channl_box">
			        <div class="channl" id="channl_2">
			          <a href="javascript:void(0)" onclick="columnPaging(2, this)">图片新闻</a>
			        </div>
			     </div>
                <div class="channl_box" style="margin-top: 10px; padding-top: 0px;" id="ldhd">
                  <div class="channl" id="channl_3">
                  	<a href="javascript:void(0)" onclick="columnPaging(3, this)">南城廉政</a>
                  </div>
                </div>
			    <div class="channl_box">
			        <div class="channl" id="channl_4">
			          <a href="javascript:void(0)" onclick="columnPaging(4, this)">信息公开</a>
			        </div>
			    </div>
				<div class="channl_box">
			       <div class="channl" id="channl_5">
			           <a href="javascript:void(0)" onclick="columnPaging(5, this)">曝光台</a>        
			       </div>
			    </div>
			     <div class="channl_box">
			        <div class="channl" id="channl_6">
			          <a href="javascript:void(0)" onclick="columnPaging(6, this)">廉政教育</a>
			        </div>
			     </div>
				 <div class="channl_box">
			        <div class="channl" id="channl_7">
			          <a href="javascript:void(0)" onclick="columnPaging(7, this)">工作动态</a>
			        </div>
			     </div>
			     <div class="channl_box">
			        <div class="channl" id="channl_8">
			            <a href="javascript:void(0)" onclick="columnPaging(8, this)">专题集锦</a>
			        </div>
			     </div>
		    </div>
		    <!-- 左侧导航结束 -->
			<div class="other_center pub_center">
	        </div>
		</div>
		<footer>
		</footer>
	</div>
</body>
<script class="template ColumnPage" type="text/x-jquery-tmpl">
<h3 class="tith2">
{{=it.typeStr}}
</h3>
<div class="redline"></div>
<ul class="list_news_dl column_list">
</ul>
<div class="page">
    <a onclick="{{="columnList("+it.type+", 0)"}}">首页</a>&nbsp;&nbsp;
	<a class="prev i-hide">上一页</a>&nbsp;&nbsp;
	<a class="{{="next " + (it.length != 1 ? "": "i-hide")}}">下一页</a>&nbsp;&nbsp;
	<a onclick="{{="columnList("+it.type+", "+(it.length -1)+")"}}"">尾页</a>&nbsp;&nbsp;
		总共{{=it.length}}页&nbsp;当前第<span class="currPage">1</span>页&nbsp;&nbsp;
	<select id="page_select" onchange="returnPage(this);">
	  	<option value="">转到</option>
	    {{ for(var i=1; i <= it.length; i++) { }}
			<option value="{{=i-1}}">第{{=i}}页</option>
		{{ } }}
	</select>
</div>
</script>
<script class="template ColumnList" type="text/x-jquery-tmpl">
{{~it.data : data : index}}
<li>
	<a href="{{="article?id=" + data.id + "&type=" + data.type}}"><i></i> {{=data.title}}</a>
</li>
{{~}}
</script>
<script class="template TopicList" type="text/x-jquery-tmpl">
{{~it.data : data : index}}
<li>
	<a onclick="{{="topicArticleList("+data.id+",'"+data.title+"')"}}"><i></i> {{=data.title}}</a>
</li>
{{~}}
</script>

<script>
var nowtype = getParam("type");
;(function() {
	$home = $("#home");
	$home.find("header > div").eq(0).html($(".template.Top").doT({
		currentTime: currentTime()
	}));
	$home.find("footer").html($(".template.Footer").doT());
	
	var type = getParam("type");
	if(type == 8 && getParam("topicId") != "") {
		columnPaging(type, "#channl_8", true);
	} else {
		columnPaging(type, "#channl_"+type);
	}
	
	$home.find("#channl_" + type).addClass("active");
	$home.find(".homepage_sy").removeClass("i-hide");
	
	$home
	.on("click", ".prev, .next", function() {
		var $page = $(this).closest("div");
		var size = parseInt($page.find("#page_select option").size()) -1;
		var page =  $page.find(".currPage").html();
		//nowtype = $home.find(".channl.active").attr("id").split("_")[1];
		if($(this).hasClass("prev")) {
			if(page == 2) {
				$(this).addClass("i-hide");
				$page.find(".next").removeClass("i-hide");
			} else {
				$(this).removeClass("i-hide");
			}
			if(nowtype == "8") {
				topicPageList(parseInt(page)-2);
			} else {
				columnList(nowtype, parseInt(page)-2);
			}
		} else {
			if(page == (parseInt(size)-1)) {
				$(this).addClass("i-hide");
				$page.find(".prev").removeClass("i-hide");
			} else {
				$(this).removeClass("i-hide");
			}
			if(nowtype == "8") {
				topicPageList(parseInt(page));
			} else {
				columnList(nowtype, parseInt(page));
			}
		}
		if(page != 0 && page != (parseInt(size)-1)) {
			$page.find(".next").removeClass("i-hide");
			$page.find(".prev").removeClass("i-hide");
		}
	})
})();
function topicArticleList(topicId, title) {
	$.ajax({
		url: "topic/detail",
		type: "POST",
		data: {
			topicId: topicId
		},
		success: function(data) {
			if(data.status == 0) {
				$(".column_list").html($(".template.ColumnList").doT({
					data: data.data.articles,
				}));
				$(".page").addClass("i-hide");
				$(".tith2").html(title);
			}
		},
		error: function(e) {}
	});
}
function topicPageList(page) {
	$.ajax({
		url: "topic/listPaging",
		type: "POST",
		data: {
			page: parseInt(page),
			size: 10
		},
		success: function(data) {
			if(data.status == 0) {
				$(".column_list").html($(".template.TopicList").doT({
					data: data.data,
				}));
				$(".currPage").html(parseInt(page) + 1);
			}
		},
		error: function(e) {}
	});
}
function columnPaging(type, obj, bool) {
	nowtype = type;
	$(".channl").removeClass("active");
	$(obj).parent().addClass("active");
	var url = "article/listByType";
	if(type == 8) {
		url = "topic/list";
	}
	$.ajax({
		url: url,
		type: "POST",
		data: {type: type},
		success: function(data) {
			if(data.status == 0) {
				var length = Math.ceil(data.data.length/10);
				$(".other_center").html($(".template.ColumnPage").doT({
					type: type,
					typeStr: bool ? getParam("title") : getTypeStr(type),
					length: length
				}));
				if(type == 8 && bool) {
					topicArticleList(getParam("topicId"), getParam("title"));
				} else if(type == 8 && bool != "undefined") {
					topicPageList(0);
				} else{
					columnList(type, 0);
				}
			}
		},
		error: function(e) {}
	});
}
function columnList(type, page) {
	$.ajax({
		url: "article/listByTypePaging",
		type: "POST",
		data: {
			type: parseInt(type),
			page: parseInt(page),
			size: 10
		},
		success: function(data) {
			if(data.status == 0) {
				$(".column_list").html($(".template.ColumnList").doT({
					data: data.data,
				}));
				$(".currPage").html(parseInt(page) + 1);
			}
		},
		error: function(e) {}
	});
}
function returnPage(obj) {
	var page = $(obj).val();
	columnList(nowtype, page);
	$(obj).closest("div").find(".currPage").html(parseInt(page)+1);
	$(obj).val("");
}
</script>
</html>