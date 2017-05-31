<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "bpm-process");%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>新闻审核列表</title>
<%@include file="/admin/s.jsp"%>
</head>
<script type="text/javascript" src='<s:url value="/js/delete.js" />' /></script>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">

		<!-- start of main -->
		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">新闻审核列表</h4>
		</header>
		<div class="well">

			<table id="demoGrid" class="table">
				<thead>
					<tr>
						<th class="">序号</th>
						<th class="">标题</th>
						<th class="">作者</th>
						<th class="">来源</th>
						<th class="">创建者</th>
						<th class="">发布时间</th>
						<th class="">栏目</th>
						<th class="">状态</th>
						<th class="">删除</th>
					</tr>
				</thead>
				<tbody>
					<s:if
						test="#request.page.list == null || #request.page.list.size ==0">
						<tr>
							<td colspan="9" align="center"><h5>没有新闻需要审核</h5></td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.page.list" var="n" status="status">
							<tr>
								<td><s:property value="#status.count" /></td>
								<td><s:a action="NewsAction_getExamineNews?id=%{#n.id}"
										namespace="/">
										<s:property value="#n.title" />
									</s:a></td>
								<td><s:property value="#n.author" /></td>
								<td><s:property value="#n.source" /></td>
								<td><s:property value="#n.admin.username" /></td>
								<td><s:date name="#n.createTime"
										format="yyyy-MM-dd HH:mm:ss" /></td>
								<td><s:property value="#n.newsType.typeName" /></td>
								<td><s:property value="#n.state.stateName" /></td>
								<td><s:a cssClass="newsDelete" href="javascript:void(0)"
										id="%{#n.id}">删除</s:a></td>
							</tr>
						</s:iterator>
					</s:else>
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
			<s:a href="NewsAction_getAllNotPassedNews?page=1">首页</s:a>
			<s:if test="#request.page.currentPage!=1">
				<s:a
					href="NewsAction_getAllNotPassedNews?page=%{#request.page.currentPage-1}">上一页</s:a>
			</s:if>
			<s:if test="#request.page.currentPage != #request.page.pageCount">
				<s:a
					href="NewsAction_getAllNotPassedNews?page=%{#request.page.currentPage+1}">下一页</s:a>
			</s:if>
			<s:a
				href="NewsAction_getAllNotPassedNews?page=%{#request.page.pageCount}">尾页</s:a>
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
