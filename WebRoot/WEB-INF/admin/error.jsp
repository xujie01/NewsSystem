<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>Error</title>
<%@include file="/admin/s.jsp"%>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">出错了</h4>
		</header>
		<div class="content content-inner">
			<center>
				<h4>亲，抱歉，你没有该权限！</h4>
				<h4>请与网站管理员联系。</h4>
			</center>
		</div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>