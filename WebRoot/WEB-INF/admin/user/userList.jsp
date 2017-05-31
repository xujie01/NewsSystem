<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "msg");%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>用户信息列表</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript" src='<s:url value="/js/delete.js" />' /></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">用户信息列表</h4>
				</header>
				<div class="well">
					<table id="demoGrid" class="table">
						<thead>
							<tr>
								<th class="sorting">序号</th>
								<th class="sorting">用户名</th>
								<th class="sorting">Email</th>
								<th class="sorting">创建时间</th>
								<th class="sorting">删除</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.allUsers" var="u" status="status">
								<tr>
									<td><s:property value="#status.count" /></td>
									<td><s:property value="#u.username" /></td>
									<td><s:property value="#u.email" /></td>
									<td><s:date name="#u.createTime"
											format="yyyy-MM-dd HH:mm:ss" /></td>
									<td><s:a cssClass="userDelete" href="javascript:void(0)"
											id="%{#u.id}">删除</s:a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
