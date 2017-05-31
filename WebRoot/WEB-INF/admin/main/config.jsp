<%@page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<style>
li {list-style-type:none;}
</style>
<%@include file="/admin/meta.jsp"%>
<title>流程列表</title>
<%@include file="/admin/s.jsp"%>
</head>
<body>
	<%@include file="/admin/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10" style="float: right">
			<h4>新闻发布系统</h4>
			<p>开发环境：JDK + MyEclipse + Tomcat + MySQL</p>
			<p>使用技术：Struts2 + Spring4 + Hibernate4 + Bootstrap</p>
			<p>项目描述：前台主要是时事新闻的浏览，用户注册及登录，用户评论新闻等功能。后台为管理员对新闻以及新闻栏目的CRUD操作，新闻审核，权限以及角色的控制等。</p>
			<p>责任描述：<p>
			<ul>
				<li>1、前期需求分析，业务模块划分，数据库设计。</li>
				<li>2、根据所需求的设计进行开发，编写代码，实现以及测试功能。</li>
				<li>3、集成功能，修改前端框架为Bootstrap。</li>
			</ul>
		</section>
		<!-- end of main -->
	</div>

</body>

</html>
