;(function() {
	
	$k.constant.getAppealStatus = function(status) {
		switch(status)
		{
			case 0:
				return "待发送";
				break;
			case 1:
				return "待派发";
				break;
			case 2:
				return "待受理";
				break;
			case 3:
				return "处理中";
				break;
			case 4:
				return "待确认";
				break;
			case 5:
				return "已确认";
				break;
			case 6:
				return "驳回";
				break;
			default:
				return "";
		}
	}
	
	$k.constant.getDynamicType = function(status) {
		switch(status)
		{
			case 0:
				return "公告信息";
				break;
			case 1:
				return "政策信息";
				break;
			case 2:
				return "工业概况";
				break;
			default:
				return "";
		}
	}
	
})();