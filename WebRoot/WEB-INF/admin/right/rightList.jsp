<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "bpm-delegate");%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>权限管理</title>
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
		<h4 class="title">权限信息列表</h4>
		</header>
		<div class="well">
			<table id="demoGrid" class="table">
				<thead>
					<tr>
						<th class="sorting">序号</th>
						<th class="sorting">权限名称</th>
						<th class="sorting">公共资源</th>
						<th class="sorting">权限URL</th>
						<th class="sorting">权限位</th>
						<th class="sorting">权限码</th>
						<th class="sorting">修改</th>
						<th class="sorting">删除</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#request.page.list" var="r" status="st">
						<tr>
							<td><s:property value="#st.count" /></td>
							<td><s:property value="#r.rightName"/></td>
							<td><s:checkbox name="#r.common" /></td>
							<td><s:property value="#r.rightUrl" /></td>
							<td style="color: gray;"><s:property value="#r.rightPos" /></td>
							<td style="color: gray;"><s:property value="#r.rightCode" /></td>
							<td><s:a action="RightAction_editRight?id=%{#r.id}">修改</s:a></td>
							<td><s:a cssClass="rightDelete" href="javascript:void(0)"
											id="%{#r.id}">删除</s:a></td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
		</div>
		</article> <article>
		<div class="m-page-info pull-left">
			共
			<s:property value="#request.page.totalCount" />
			条记录
		</div>

		<div class="m-pagination pull-right">
			<s:a href="RightAction_findAllRights?page=1">首页</s:a>
			<s:if test="#request.page.currentPage!=1">
				<s:a
					href="RightAction_findAllRights?page=%{#request.page.currentPage-1}">上一页</s:a>
			</s:if>
			<s:if test="#request.page.currentPage != #request.page.pageCount">
				<s:a
					href="RightAction_findAllRights?page=%{#request.page.currentPage+1}">下一页</s:a>
			</s:if>
			<s:a href="RightAction_findAllRights?page=%{#request.page.pageCount}">尾页</s:a>
			当前第
			<s:property value="#request.page.currentPage" />
			页,总共
			<s:property value="#request.page.pageCount" />
			页
		</div>
		<div class="m-clear"></div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>

