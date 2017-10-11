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
<script type="text/javascript" src="vendor/local/js/base.js"></script>
<script type="text/javascript" src="vendor/jquery/jquery-doT.js"></script>
<script type="text/javascript" src="vendor/doT/1.0.1/doT.js"></script>
<link rel="stylesheet" href="css/report.css" type="text/css"/>
<title></title>

<script type="text/javascript">
</script>
</head>
<body>
	<div id="report" class="page">
		<div class="left head">
			<div class="left banner"></div>
			<div class="left nav_bg3">
				<div class="left nav_bg_L3">
				</div>
				<div class="left nav_bg_M3">
					<div class="left nav_def3" id="index">
						<a href="./" target="_parent">首&nbsp;&nbsp;&nbsp;页</a>
					</div>
					<div class="left nav_def3" id="notice">
						<a>网上举报须知</a>
					</div>
					<div class="left nav_def3" id="search">
						<a>举&nbsp;报&nbsp;查&nbsp;询</a>
					</div>
				</div>
				<div class="left nav_bg_R3">
				</div>
			</div>
		</div>
		<div class="left page_main">
		</div>
		<div class="left foot_bg">
			<div class="left foot_con">
				版权所有 © 中共南城纪委 南城监察局
				<br>
				赣ICP备
			</div>
		</div>
	</div>
</body>
<script class="template ReportMain" type="text/x-jquery-tmpl">
<div class="left page_main_con" style="width: 730px; text-align:center;">
	<div class="left xz_tit">
		<div class="left xz_tit_con">
		</div>
	</div>
	<div class="left page_main_text" style="width: 720px; text-indent: 30pt; line-height: 40px; font-size:16pt; font-family: 仿宋; font-weight:bold;">
		<div>
			一、纪检监察机关举报网站受理范围：
		</div>
		<div>
        	1.受理对党组织、党员和监察对象违反党纪政纪行为的检举控告；
		</div>
		<div style=" width: 100%; ">
        	2.依法应由纪检监察机关受理的党组织、党员和监察对象不服党纪政纪处分和其他处理的申诉；
		</div>
		<div>
        	3.对党风廉政建设和反腐败工作的意见建议。
		</div>

		<div>
        	二、举报人对举报事实的真实性负责。对于借举报捏造事实、诬告陷害的，依照有关规定严肃处理；涉嫌犯罪的，移送司法机关依法处理。
		</div>

		<div>
        	三、纪检监察机关提倡实名举报（请填写真实姓名、身份证号、家庭住址或工作单位以及准确联系方式等内容）。
		</div>

		<div class="left xz_con_list">
			<input type="checkbox" name="acceptCheckbox" id="acceptCheckbox">
			我已阅读以上条款
		</div>
	</div>
    <div class="left page_main_tit" style="margin-top: 20px; display: none;" id="waitinfo">
		<input type="button" title="我要举报" id="wyjb" value=" 1秒" style="width: 75px; height: 35px; font-size: 16px; font-weight: bold;">
	</div>
	<div class="left page_main_tit" style="margin-top: 20px; display: block;" id="tjinfo">
	<input type="button" title="署名举报" id="sm" class="button_sm_grey" disabled="">
</div>
</script>

<script class="template ReportSearch" type="text/x-jquery-tmpl">
<div class="left page_main_con">
	<div class="left sear_tit">
		<div class="left sear_tit_con"></div>
	</div>
	<div class="left sear_con">
		<font color="#FF0000">
			特别提示：请到相应的举报网站查询反馈，此处只能查询反映到南城县纪委监察局举报网站信件的反馈！</font>
	</div>
	<div class="left sear_table">
		<form method="post">
			<table class="table_report" cellpadding="0" cellspacing="0">
				<tbody><tr>
					<td class="redStar">
						<font class="red">*</font>
					</td>
					<td class="read_cons_sear2" style="text-align: left;">
						请输入查询码：
					</td>
					<td colspan="3" class="report_info" style="text-align: left">
						<input name="searchCode" maxlength="20" id="searchCode" class="font14" style="width: 430px;" type="text">
					</td>
				</tr>
				<tr>
					<td class="redStar">
					</td>
					<td class="read_cons_sear2" style="text-align: left;">
						操作：
					</td>
					<td colspan="3" class="td_mes report_info" style="text-align: left;">
						<input id="report_search" class="but_search3" value="查 询" type="button">
					</td>
				</tr>
				<tr>
					<td class="redStar">
					</td>
					<td class="read_cons_sear2" style="text-align: left;">
						答复内容：
					</td>
					<td colspan="3" class="font14 report_info" style="padding: 0px;">
						 <div id="fresult" class="fresult">
						</div>
					</td>
				</tr>
			</tbody></table>
		</form>
	</div>
</div>
</script>

<script class="template Report" type="text/x-jquery-tmpl">
<div class="left page_main_bg">
<div class="left fj_form_con">
	<div class="left form_title">
		<div class="left form_title_nm" style="width: 220px;">
		</div>
	</div>
	<form id="report-form" enctype= "multipart/form-data">
	<div class="left sear_table" style="margin-top: 0px;">
		<table cellspacing="0" cellpadding="0" class="table_info">
			<tbody><tr>
				<td colspan="6" class="table_name">
					举报人信息（注意:标有
					<font style="color: red;"> * </font>的必须填写）
				</td>
			</tr>
			<tr>
				<td class="td_name2" style="width: 90px;">
					姓名
				</td>
				<td class="td_star" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info" style="width: 300px;">
					<input type="text" name="name" maxlength="30" id="name" class="input_text">
				</td>
				<td class="td_name2" style="width: 90px;">
					身份证号
				</td>
				<td class="td_star" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info" style="width: 300px;">
					<input type="text" name="identityCard" maxlength="18" class="input_text" id="identityCard">
				</td>

			</tr>
			<tr>
				<td class="td_name2">
					联系方式
				</td>
				<td class="td_star" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info">
					<input type="text" name="telephone" maxlength="50" id="telephone" class="input_text">
				</td>
				<td class="td_name2">
					政治面貌
				</td>
				<td class="td_star" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info">
					<select id="political" name="political" class="input_sele">
						<option value="">
							==请选择==
						</option>
						{{~it.political: data}}
							<option value="{{=data.value}}">{{=data.name}}</option>
						{{~}}
					</select>
				</td>
			</tr>
			<tr>
				<td class="td_name2">
					现居住地址
				</td>
				<td class="td_star" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info">
					<input type="text" name="address" maxlength="100" value="" id="address" class="input_text">
				</td>
				<td class="td_name2">
					级别
				</td>
				<td class="td_star" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info">
					<select id="level" name="level" class="input_sele">
						<option value="">
							==请选择==
						</option>
						{{~it.level: data}}
							<option value="{{=data.value}}">{{=data.name}}</option>
						{{~}}
					</select>
				</td>
			</tr>

		</tbody></table>
	</div>
	<div class="left sear_table">
		<table cellspacing="0" cellpadding="0" class="table_info">
			<tbody><tr>
				<td colspan="6" class="table_name">
					被举报人（单位）信息（注意:标有
					<font style="color: red;"> * </font>的必须填写）
				</td>
			</tr>
			<tr>
				<td class="td_name2" style="width: 90px;">
					被举报人
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info" style="width: 300px;">
					<input type="text" name="respondentName" maxlength="30" value="" id="respondentName" class="input_text">
				</td>
				<td class="td_name2" style="width: 90px;">
					单位
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info" style="width: 300px;">
					<input type="text" name="respondentUnit" maxlength="100" value="" id="respondentUnit" class="input_text">
				</td>
			</tr>
			<tr>
				<td class="td_name2">
					职务
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info">
					<input type="text" name="respondentPosition" maxlength="30" id="respondentPosition" value="" class="input_text">
				</td>
				<td class="td_name2">
					所在地区
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info">
					<input type="text" name="respondentArea" maxlength="50" value="" id="respondentArea" class="input_text" style="width: 250px;">
				</td>
			</tr>
			<tr>
				<td class="td_name2">
					级别
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info" colspan="4">
					<select id="respondentLevel" name="respondentLevel" class="input_sele">
						<option value="">
							==请选择==
						</option>
						{{~it.level: data}}
							<option value="{{=data.value}}">{{=data.name}}</option>
						{{~}}
					</select>
				</td>
			</tr>

		</tbody></table>
	</div>
	<div class="left sear_table">
		<table cellspacing="0" cellpadding="0" class="table_info">
			<tbody><tr>
				<td colspan="4" class="table_name">
					举报正文（注意:标有
					<font style="color: red;"> * </font>的必须填写）
				</td>
			</tr>
			<tr>
				<td class="td_name2" style="width: 115px;">
					标题
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info" style="width: 715px;">
					<input type="text" name="title" maxlength="50" value="" id="title" class="input_text" style="width: 682px;">
				</td>
			</tr>
			<tr>
				<td class="td_name2">
					问题类别
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info">
					<select id="type" name="type" class="input_sele" style="width: 689px;">
						<option value="">
							==请选择==
						</option>
						{{~it.issue: data}}
							<option value="{{=data.value}}">{{=data.name}}</option>
						{{~}}
					</select>
				</td>
			</tr>
			<tr>
				<td class="td_name2">
					问题细类
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info">
					<select id="subType" name="subType" class="input_sele" style="width: 689px;">
						<option value="">
							==请选择==
						</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="td_name2">
					主要问题
					<br>
					(剩余
					<font style="font-weight: bolder; font-size: 17px;" id="tip">1000</font>字)
				</td>
				<td class="td_star" style="width: 15px;">
					<font style="color: red;"> * </font>
				</td>
				<td class="td_info" style="height: 325px;">
					<textarea name="content" cols="85" rows="20" maxlength="1000" id="content" style="width: 682px; font-size: 15px;"></textarea>
				</td>
			</tr>
		</tbody></table>
	</div>

	<div class="left sear_table">
		<table cellspacing="0" cellpadding="0" class="table_info">
			<tbody><tr>
				<td colspan="4" class="table_name">
					上传附件
				</td>
			</tr>
			<tr>
				<td class="td_name2" rowspan="2" style="width: 115px;">
					附件
				</td>
				<td class="td_star" rowspan="2" style="width: 15px;">
					&nbsp;
				</td>
				<td class="td_info" style="width: 730px;">
					<input type="file" name="uploadFile" id="uploadFile" accept="*"/>
					<span>温馨提醒：附件大小不超过10M。<span>
				</span></td>
			</tr>
			<tr style="height: 0px">
			</tr>
		</tbody></table>
	</div>

	<div class="left oper_box" style="margin-top: 30px;">
		<table align="center">
			<tbody><tr>
				<td style="width: 100px;">
					<input id="addReport" type="button" class="but_submit" value="提 交">
				</td>
				<td style="width: 100px;">
					<input id="clearForm" type="reset" class="but_submit" value="重 填">
				</td>
			</tr>
		</tbody></table>
	</div>
	</form>
</div>
</div>
</script>

<script>
;(function() {
	
	$report = $("#report");
	$report.find(".page_main").html($(".template.ReportMain").doT());
	
	$report
	.on("click", "#notice a", function() {
		$report.find(".page_main").html($(".template.ReportMain").doT());
	})
	.on("click", "#search a", function() {
		$report.find(".page_main").html($(".template.ReportSearch").doT());
	})
	.on("click", "#acceptCheckbox", function() {
		var acceptCheck = $(this);		
		if(acceptCheck.prop("checked") == true){
			$report.find("#sm").removeAttr("disabled");
			$report.find("#sm").addClass("button_sm");
		} else {
			$report.find("#sm").attr("disabled");
			$report.find("#sm").addClass("button_sm_grey");
		}
	})
	.on("click", ".button_sm_grey", function() {
		$report.find(".page_main").html($(".template.Report").doT({
			political: $k.constant.political,
			level: $k.constant.level,
			issue: $k.constant.issue,
		}));
	})
	.on("change", "#type", function() {
		var type = $(this).val();
		var subType = $k.constant.issue[type].sub;
		$report.find("#subType").html("<option>==请选择==</option>");
		$.each(subType, function(i, e) {
			$("<option value='"+e.value+"'>"+e.name+"</option>").appendTo($report.find("#subType"));
		});
	})
	.on("click", "#report_search", function() {
		var searchCode = $report.find("#searchCode").val();
		if(searchCode == "") {
			alert("请输入查询码！");
		}
		$.ajax({
			url: "report/search",
			type: "POST",
			data: {
				searchCode: searchCode
			},
			success: function(data) {
				if (data.status == 0) {
					if(data.data == "") {
						$report.find("#fresult").html("暂无回复！");
					} else {
						$report.find("#fresult").html(data.data);
					}
				} else {
					alert("查询码错误！");
				}
			},
		});
	})
	.on("click", "#addReport", function() {
		var respondentName = $report.find(".sear_table").find("#respondentName").val();
		var respondentUnit = $report.find(".sear_table").find("#respondentUnit").val();
		var respondentPosition = $report.find(".sear_table").find("#respondentPosition").val();
		var respondentArea = $report.find(".sear_table").find("#respondentArea").val();
		var respondentLevel = $report.find(".sear_table").find("#respondentLevel").val();
		var title = $report.find(".sear_table").find("#title").val();
		var type = $report.find(".sear_table").find("#type").val();
		var subType = $report.find(".sear_table").find("#subType").val();
		var content = $report.find(".sear_table").find("#content").val();
		
		if(respondentName == "" || respondentUnit == "" || respondentPosition == "" || respondentArea == "" || respondentLevel == "" || title == "" || subType == "" || type == "" || content == "") {
			alert("请完成表格必填项！！");
			return;
		}
		$.ajax({
			url: "report/add",
			type: "POST",
			data: new FormData($("#report-form")[0]),
			processData: false,
			contentType: false,
			cache: false, 
			success: function(data) {
				if(data.status == 0) {
					alert("提交成功，您的查询码为" + data.data + "\n您可凭此码查询举报回复！");
				} else {
					alert("提交失败，请重试！");
				}
				window.location = "index";
			},
		});
	})
	.on("keyup", "#content", function() {
		var $max =1000;  
        var $length = $(this).val().length;  
        if ($length <= $max) {  
            $report.find("#tip").html($max - $length);  
        }
	});
	
})();
</script>
</html>