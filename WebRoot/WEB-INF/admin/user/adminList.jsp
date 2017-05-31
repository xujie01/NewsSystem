<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "doc");%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>管理员信息列表</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript" src='<s:url value="/js/delete.js" />'></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10" style="float: right">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">管理员信息列表</h4>
				</header>
				<div class="well">
					<table id="demoGrid" class="table">
						<thead>
							<tr>
								<th class="sorting">序号</th>
								<th class="sorting">用户名</th>
								<th class="sorting">Email</th>
								<th class="sorting">启用</th>
								<th class="sorting">锁定日期</th>
								<th class="sorting">最后登录日期</th>
								<th class="sorting">最后登录IP</th>
								<th class="sorting">创建时间</th>
								<th class="sorting">修改</th>
								<th class="sorting">删除</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.allAdmins" var="u" status="status">
								<tr>
									<td><s:property value="#status.count" /></td>
									<td><s:property value="#u.username" /></td>
									<td><s:property value="#u.email" /></td>
									<td><s:if test="#u.enabled == true">已启用</s:if> <s:else>未启用</s:else></td>
									<td><s:if test="#u.lockedTime == null">未锁定</s:if> <s:else>
											<s:date name="#u.lockedTime" format="yyyy-MM-dd HH:mm:ss" />
										</s:else></td>
									<td><s:if test="#u.loginTime == null">未登录</s:if> <s:else>
											<s:date name="#u.loginTime" format="yyyy-MM-dd HH:mm:ss" />
										</s:else></td>
									<td><s:if test="#u.ipAddress == null">未登录状态</s:if> <s:else>
											<s:property value="#u.ipAddress" />
										</s:else></td>
									<td><s:date name="#u.createTime"
											format="yyyy-MM-dd HH:mm:ss" /></td>
									<td><s:a href="AdminAction_editAdmin?id=%{#u.id}">修改</s:a></td>
									<td><s:a cssClass="adminDelete" href="javascript:void(0)"
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
