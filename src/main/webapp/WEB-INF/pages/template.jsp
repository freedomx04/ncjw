<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script class="template User" type="text/x-jquery-tmpl">
	asdasd
</script>

<script class="template RoleList" type="text/x-jquery-tmpl">
	{{~ it.data: role:index }}
	<tr class="table-tr">
		<td><input type='checkbox' class='box' name='box'/></td>
		<td id="{{=role.id}}">{{=index+1}}</td>
		<td class="td-title ellipsis" title="{{=role.name}}"><a class="roleInfo-href">{{=role.name}}</a></td>
		<td class="td-name ellipsis" title="{{=role.code}}">{{=role.code}}</td>
		<td class="td-content ellipsis" title="{{=role.description}}">{{=role.description}}</td>
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
		init: {
			value: function($tar) {
				var self = this;
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
				return self;
			}
		},
	});
	
})( jQuery );
</script>
