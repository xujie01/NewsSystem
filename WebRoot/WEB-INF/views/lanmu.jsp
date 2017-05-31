<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="#request.newsType.typeName" /></title>
<link href='<s:url value="/css/style.css" />' rel="stylesheet" type="text/css" />
</head>
<body>
	<s:include value="header.jsp" />
	<fieldset>
		<legend>
			<s:property value="#request.newsType.typeName" />
		</legend>
		<br>
		<s:property value="#request.newsType.introduction" />
	</fieldset>
	<div style="width: 100%; float: left;">
		<div style="width: 70%; float: left; display: inline-block;">
			<s:if
				test="#request.page.list ==null || #request.page.list.size == 0">
				<ul>
					<li>No News!</li>
				</ul>
			</s:if>
			<s:else>
				<ul>
					<s:iterator value="#request.page.list" var="n">
						<li><s:a action="NewsAction_getViewNews?id=%{#n.id}">
								<s:property value="#n.title" />
							</s:a> <span><s:date name="#n.createTime"
									format="yyyy-MM-dd HH:mm" /></span></li>
						<br>
					</s:iterator>

				</ul>
			</s:else>
		</div>
		<div style="width: 30%; float: left; display: inline-block;">
			<ul>
				<li>新闻热文排行</li>
			</ul>
			<s:if test="#request.hotNews ==null || #request.hotNews.size == 0">
				<ul>
					<li>No News!</li>
				</ul>
			</s:if>
			<s:else>
				<ul>
					<s:iterator value="#request.hotNews" var="n" status="status">
						<li style="font-size: 14px"><s:property value="#status.count" />.<s:a
								action="NewsAction_getViewNews?id=%{#n.id}">
								<s:property value="#n.title" />
							</s:a></li>
					</s:iterator>
				</ul>
			</s:else>
		</div>
		<div style="width: 100%; float: left;">
			<br> <br>
			<center>
				<s:a href="NewsTypeAction_getNews?page=1&id=%{#request.newsType.id}">首页</s:a>
				<s:if test="#request.page.currentPage!=1">
					<s:a
						href="NewsTypeAction_getNews?page=%{#request.page.currentPage-1}&id=%{#request.newsType.id}">上一页</s:a>
				</s:if>
				<s:if test="#request.page.currentPage != #request.page.pageCount">
					<s:a
						href="NewsTypeAction_getNews?page=%{#request.page.currentPage+1}&id=%{#request.newsType.id}">下一页</s:a>
				</s:if>
				<s:a
					href="NewsTypeAction_getNews?page=%{#request.page.pageCount}&id=%{#request.newsType.id}">尾页</s:a>
				当前第
				<s:property value="#request.page.currentPage" />
				页,总共
				<s:property value="#request.page.pageCount" />
				页
			</center>
		</div>
	</div>
	<s:include value="footer.html" />
</body>
</html>