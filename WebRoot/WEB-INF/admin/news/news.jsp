<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "bpm-process");%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>新闻信息</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript" src='<s:url value="/js/viewNews.js" />'></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10" style="float:right"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">新闻详情</h4>
		</header> <s:hidden id="newsId" value="%{#request.model.id}" />
		<table width="100%">
			<tr>
				<td align="center">
					<h4>
						<s:property value="#request.model.title" />
					</h4>
				</td>
			</tr>
			<tr>
				<td style="font-size: 14px">发布者:<s:property
						value="#request.model.admin.username" />&nbsp;&nbsp;发布时间：<s:date
						name="#request.model.createTime" format="yyyy-MM-dd HH:mm:ss" />&nbsp;&nbsp;阅读量:<s:property
						value="#request.model.count" />
				</td>
			</tr>
			<tr>
				<td style="font-size: 14px">作者:<s:property
						value="#request.model.author" />&nbsp;&nbsp;来源:<s:property
						value="#request.model.source" />
				</td>
			</tr>
			<tr>
				<td><s:property value="#request.model.content" escape="false" /></td>
			</tr>
			<tr>
				<td align="center"><s:a action="NewsAction_getAllNews">返回新闻管理列表</s:a></td>
			</tr>
		</table>
		<header class="header">
		<h4 class="title">相关评论</h4>
		</header>
		<table width="100%">
			<tr id="res">
				<td>已有 <span id="count"><s:property
							value="#request.allComments.size" /></span> 条评论 </td>
			</tr>
			<s:if test="#request.allComments.size == 0">
				<tr>
					<td align="center">还没有人评论，抢个沙发试试！</td>
				</tr>
			</s:if>
			<s:iterator value="#request.allComments" var="c" status="status">
				<tr>
					<td><s:property value="#status.count" />楼</td>
				</tr>
				<tr>
					<td>评论者：<s:property value="#c.user.username" /></td>
					<td><span style="float: right">评论时间：<s:date
								name="#c.createTime" format="yyyy-MM-dd HH:mm:ss" /></span></td>
				</tr>
				<tr>
					<td colspan="2">内容：<s:property value="#c.content" /> <span
						style="float: right"><s:a href="javascript:void(0);"
								onclick="deleteComment(%{#c.id},false)">删除该评论</s:a></span>
					</td>
				</tr>
			</s:iterator>
		</table>
		</article> <article>

		<div class="m-clear"></div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>
