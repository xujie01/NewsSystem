<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "bpm-task");%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>栏目信息列表</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript" src='<s:url value="/js/delete.js" />'></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">栏目信息列表</h4>
				</header>
				<div class="well">
					<table id="demoGrid" class="table">
						<thead>
							<tr>
								<th class="sorting">序号</th>
								<th class="sorting">栏目名</th>
								<th class="sorting">栏目介绍</th>
								<th class="sorting">创建者</th>
								<th class="sorting">创建时间</th>
								<th class="sorting">修改</th>
								<th class="sorting">删除</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#request.allNewsTypes" var="t" status="status">
								<tr>
									<td><s:property value="#status.count" /></td>
									<td><s:property value="#t.typeName" /></td>
									<td><s:property value="#t.introduction" /></td>
									<td><s:property value="#t.admin.username" /></td>
									<td><s:date name="#t.createTime"
											format="yyyy-MM-dd HH:mm:ss" /></td>
									<td><s:a
											action="NewsTypeAction_updateNewsType?id=%{#t.id}">修改</s:a></td>
									<td><s:a cssClass="typeDelete" href="javascript:void(0)"
											id="%{#t.id}">删除</s:a></td>
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
