<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="./component/head.jsp">
	<jsp:param value="${title}" name="title" />
</jsp:include>
<body class="hold-transition skin-blue sidebar-mini">
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
								<a href="#" class="btn btn-default btn-flat">修改密码</a>
							</div>
							<div class="pull-right">
								<a href="#" class="btn btn-default btn-flat">退出</a>
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
					<li data-url="record"><a><i class="fa fa-line-chart"></i> 考勤记录</a></li>
					<li data-url="auth"><a><i class="fa fa-cog"></i> 权限管理</a></li>
				</ul>
			</li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<section class="content" id="content">
			</section>
		</div>
		<div class="control-sidebar-bg"></div>
	</div>

</body>
<script>
    $('#content').load("kebiao");
    $(".treeview-menu").on("click","li",function(){
             var  $this=$(this);
             $this.addClass("active").siblings().removeClass("active");
             var url=$this.data('url');
             $('#content').load(url);
    });
</script>
</html>