<%@ page language="java" pageEncoding="utf-8"%>
<!-- 这段代码的意思是获取当前项目的路径，如：http://localhost:8080/项目名称。 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><%=request.getParameter("title")%></title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
 <!-- Font Awesome -->
<link rel="stylesheet" href="css/font-awesome-4.6.3/css/font-awesome.min.css">
<link href="css/custom.css" rel="stylesheet" />

<link rel="stylesheet" href="css/adminlte/AdminLTE.min.css"/>
<link rel="stylesheet" href="css/adminlte/skins/_all-skins.min.css">

<link rel="stylesheet" href="css/fullcalendar/fullcalendar.min.css">

<link rel="stylesheet" href="css/jquery.shCircleLoader.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/plugins/adminlte/app.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/layer/layer.js"></script>
<script type="text/javascript" src="js/plugins/jquery.shCircleLoader-min.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
    
</head>
