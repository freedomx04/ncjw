;(function() {
	
	$k.util.encrptByDES = function(pwd) {
		var key = new Date().format("yyyymmdd");
		var keyHex = CryptoJS.enc.Utf8.parse(key);
	    var encrypted = CryptoJS.DES.encrypt(pwd, keyHex, {
	        mode: CryptoJS.mode.ECB,
	        padding: CryptoJS.pad.Pkcs7
	    });
	    return encrypted.ciphertext.toString(CryptoJS.enc.Base64);
	}
	
	$k.util.decryptByDES = function(pwd) {
		var key = new Date().format("yyyyMMdd");
		var keyHex = CryptoJS.enc.Utf8.parse(key);
		var decrypted = CryptoJS.DES.decrypt({
		    ciphertext: CryptoJS.enc.Base64.parse(pwd)
		}, keyHex, {
		    mode: CryptoJS.mode.ECB,
		    padding: CryptoJS.pad.Pkcs7
		});
		return decrypted.toString(CryptoJS.enc.Utf8);
	}
	
	$k.util.getDateString = function(data) {
		if (data) {
			if (data.$data) {
				return Date.init(data).format("yyyy-mm-dd HH:MM"); 
			}
			return Date.init(data).format("yyyy-mm-dd HH:MM");
		}
		return "";
	}
	
	$k.util.getDateString2 = function(data) {
		if (data) {
			if (data.$date) {
				return Date.init(data.$date).format("yyyy-mm-dd");
			}
			return Date.init(data).format("yyyy-mm-dd");
		}
		return "";
	};
	
	$k.util.getDate = function(data) {
		if (data) {
			if (data.$date) {
				return Date.init(data.$date).format("yyyy-mm-dd HH:MM:ss");
			}
			return Date.init(data).format("yyyy-mm-dd");
		}
		return "";
	};
	
	$k.util.getTitle = function(articleType) {
		var title;
		switch (articleType) {
		case 1:	case '1':	title = '组织结构';	break;
		case 2: case '2':		title = '图片新闻';	break;
		case 3: case '3':		title = '南城廉政';	break;
		case 4: case '4':		title = '信息公开';	break;
		case 5: case '5':		title = '曝光台';		break;
		case 6: case '6':		title = '廉政教育';	break;
		case 7: case '7':		title = '工作动态';	break;
		case 8: case '8':		title = '专题文章';	break;
		default:	break;
		}
		return title;
},
	
	$k.util.getRequestParam = function(paras) {
		/** 从url中获取参数 **/
		var url = location.href;
		var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
		var paraObj = {};
		for ( var i = 0; j = paraString[i]; i++) {
			paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
					.indexOf("=") + 1, j.length);
		}
		var returnValue = paraObj[paras.toLowerCase()];
		if (typeof (returnValue) == "undefined") {
			return "";
		} else {
			return returnValue;
		}
	}
	
	$k.util.dataTable = function($table) {
		var ret = $table.DataTable({
			 lengthChange: false,
			 responsive: true,
			 ordering: false,
			 searching: false,
			 info: false,
			 language: {
				 emptyTable: "暂无数据！",
				 paginate: {
					 first: "首页",
					 last: "最后一页",
					 next: "下一页",
					 previous: "上一页",
				 }
			 },
/*			 initComplete: function() {
				 this.fnAdjustColumnSizing();
			 }*/
	     });
		return ret;
	}
	
	$k.util.dateTimepicker = function(format) {
		if(format == "" || format == undefined) {
			format = "Y-m-d";
		}
		rule = {
	      lang: "ch",           //语言选择中文
	      format: format,     //格式化日期
	      timepicker: false,    //关闭时间选项
	      scrollInput: false,
		}
		$('.datetimepicker').datetimepicker(rule);
	}
	
})();