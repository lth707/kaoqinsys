<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<jsp:include page="./component/head.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>



<body>
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form class="form-horizontal" method="post" action="login"
					id="login_form">
					<span class="heading">用户登录</span>
					<div class="form-group">
						<input type="text" class="form-control" id="num" name="num"
							placeholder="工     号"> <i class="fa fa-user"></i>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="密　码"> <i class="fa fa-lock"></i>
						<a href="#" class="fa fa-question-circle"></a>
					</div>
					<div class="form-group">
						<div class="main-checkbox">
							<input type="checkbox" value="None" id="checkbox1" name="check" />
							<label for="checkbox1"></label>
						</div>
						<span class="text">记住密码</span>
						<button type="submit" class="btn btn-default">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	var nummsg = '${nummsg}';
	var passwordmsg = '${passwordmsg}';
	if (nummsg) {
		layer.tips(nummsg, $("#num"));
	} else {
		if (passwordmsg) {
			layer.tips(passwordmsg, $("#password"));
		}
	}
	$(function() {
		$("#login_form").on("submit", function() {
			var num = $.trim($("#num").val());
			var password = $.trim($("#password").val());
			var isSuccess = 1;
			if (num.length == 0) {
				layer.tips('工号不能为空', $("#num"));
				isSuccess = 0;
			}
			if (isSuccess == 0) {
				return false;
			}
			if (password.length == 0) {
				layer.tips('密码不能为空', $("#password"));
				isSuccess = 0;
			}
			if (isSuccess == 0) {
				return false;
			}
			return true;
		});
	});
</script>
</html>
