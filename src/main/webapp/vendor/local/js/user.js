;(function() {
	
	$k.user.set = function(userObj) {
		if (userObj) {
			$.session.set("cur_user", JSON.stringify(userObj))
		}
	}
	
	$k.user.get = function() {
		var userObj = $.session.get("cur_user");
		if (userObj != undefined) {
			return JSON.parse($.session.get("cur_user"));
		}
		return undefined;
	}
	
	$k.user.logout = function() {
		$.session.remove("cur_user");
	}
	
})();