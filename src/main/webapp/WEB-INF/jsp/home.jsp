<%@page import="com.lth.kaoqinsys.pojo.Teacher"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="./component/head.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>
<body class="hold-transition skin-blue sidebar-mini" style="height:100%">

	<div class="wrapper">
		<header class="main-header"> <!-- Logo --> <a href="home"
			class="logo"> <!-- mini logo for sidebar mini 50x50 pixels --> <span
			class="logo-mini"><b>考勤</b> </span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>考勤系统</b> </span> </a> <!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="home#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span> </a>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="hidden-xs">${teacher.name}</span> </a>
					<ul class="dropdown-menu">
						<li class="user-header" style="height:90px">
							<p>${teacher.isadmin==1?"管理员":"普通用户"}</p> 账号：${teacher.num}</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a class="btn btn-default btn-flat" id="modifypassword">修改密码</a>
							</div>
							<div class="pull-right">
								<a class="btn btn-danger btn-flat" id="logout">退出</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		</nav> </header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel --> <!-- /.search form -->
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="active treeview"><a href="#"> <i
					class="fa fa-home"></i> <span>主页</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i> </span> </a>
				<ul class="treeview-menu">
					<li class="active" data-url="kebiao"><a><i
							class="fa fa-calendar-times-o"></i> 课程表</a></li>
					<li data-url="record"><a><i class="fa fa-line-chart"></i>
							考勤记录</a></li>
					<c:if test="${teacher.isadmin==1}">
						<li data-url="auth"><a><i class="fa fa-cog"></i> 权限管理</a>
						</li>
					</c:if>
				</ul>
			</li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content" id="content"> </section>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>
	<div class="modal loading-modal"
		style="display:none;background:rgba(0,0,0,0.1);z-index:10000000000000"
		data-backdrop="static">
		<div class="loading">
			<div class="shcl"
				style="position: relative; width: 0px; height: 0px; margin-left: 1px; margin-top: 1px;">
				<div
					style="left: 0px; top: 0px; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.1s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.2s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.3s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.4s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.5s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.6s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.7s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.8s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
				<div
					style="left: 0px; top: 0px; animation-delay: 0.9s; position: absolute; visibility: hidden; width: 0px; height: 0px; background: rgb(60, 141, 188); animation-name: shcl1_bounce; animation-duration: 1s; animation-iteration-count: infinite; animation-direction: normal;"></div>
			</div>
		</div>
	</div>

	<div style="display:none" id='modifycontent'>

		<form class="form-horizontal" method="post" action="modifypassword"
			id="modifyform">
			<span class="heading">修改密码</span>
			<div class="form-group">
				<input type="password" class="form-control" id="oldpassword"
					name="oldpassword" placeholder="原  密  码"> <i
					class="fa fa-lock"></i>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="newpassword"
					name="newpassword" placeholder="新  密  码"> <i
					class="fa fa-lock"></i>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" id="repassword"
					name="repassword" placeholder="确认密码"> <i class="fa fa-lock"></i>
			</div>
			<div class="form-group">
				<button class="btn btn-primary" type="submit" id="confirmmodify">确认修改</button>
			</div>
		</form>

	</div>
</body>
<script>
	$(function() {
		top.Base64 = new Base64();
		$('.loading').shCircleLoader({
			color : '#3c8dbc',
			dots : 10
		});

		$(document).ajaxStart(function() {
			$('.loading-modal').modal('show');
		});
		$(document).ajaxComplete(function(result) {
			setTimeout(function() {
				$('.loading-modal').modal('hide');
			}, 500);
		});
		$(document).ajaxError(function(result) {
			setTimeout(function() {
				$('.loading-modal').modal('hide');
			}, 500);
		});
		$(".treeview-menu").on("click", "li", function() {
			var $this = $(this);
			$this.addClass("active").siblings().removeClass("active");
			var url = $this.data('url');
			if (url == 'kebiao') {
				url += '?' + $.param(top.curWeekAndTerm);
			}
			$('#content').load(url);
			location.hash = top.Base64.encode(url);
		});
		$(window).bind('hashchange', function() {
			initPage();
		});
		$('#logout').click(function() {
			layer.confirm('确定要退出？', {
				btn : [ '确定', '取消' ]
			//按钮
			}, function() {
				$.post('logout', function(result) {
					layer.msg(result.message);
					if (result.code == 1) {
						gotologin();
					}

				});
			}, function() {

			});

		});

		$('#modifypassword').click(function() {
			layer.open({
				type : 1,
				title : '修改密码',
				scrollbar : false,
				area : [ '600px', '' ],
				content : $('#modifycontent')
			});
		});
		$('#confirmmodify').click(
				function(e) {
					var $form = $('#modifyform');
					var validfield = true;
					$form.find('input').each(
							function(i, e) {
								var val = $(e).val().trim();
								if (!val) {
									layer.tips($(e).attr('placeholder')
											+ '不能为空', $(e));
									validfield = false;
									return false;
								}
							});
					if (validfield) {
						$.post($form.attr('action'), $form.serialize(),
								function(result) {

									if (result.code == 1) {
										layer.closeAll();
										layer.msg(result.message);
									} else if (result.code == 303) {
										layer.msg(result.message);
										gotologin();
									} else {
										layer.msg(result.message);
									}
								});
					}
					return false;
				});

		var curWeekAndTerm = getCurrentTermAndWeek();
		top.curWeekAndTerm = curWeekAndTerm;

		initPage();

	});
	function gotologin() {
		setTimeout(function() {
			layer.closeAll();
			location.href = 'login';
		}, 500);
	}
	function initPage() {
		var hash = top.Base64.decode(location.hash);

		if (hash) {
			$('#content').load(hash);
			$(".treeview-menu").find('li').each(function(i, e) {
				if (hash.indexOf($(e).data('url')) == 0) {
					$(e).addClass("active");
				} else {
					$(e).removeClass("active");
				}
			});
		}

		else
			$('#content').load("kebiao?" + $.param(curWeekAndTerm));
	}
</script>
</html>