<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "cal");%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>角色管理</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript" src='<s:url value="/js/delete.js" />'></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">角色信息列表</h4>
		</header>
		<div class="well">
			<table id="demoGrid" class="table">
				<thead>
					<tr>
						<th class="sorting">序号</th>
						<th class="sorting">角色名称</th>
						<th class="sorting">角色属性</th>
						<th class="sorting">修改</th>
						<th class="sorting">删除</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="allRoles" var="r" status="st">
						<tr>
							<td><s:property value="#st.count" /></td>
							<td><s:property value="#r.roleName" /></td>
							<td><s:property value="#r.roleValue" /></td>
							<td><s:a action="RoleAction_editRole?id=%{#r.id}">修改</s:a></td>
							<td><s:a cssClass="roleDelete" href="javascript:void(0)"
											id="%{#r.id}">删除</s:a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>