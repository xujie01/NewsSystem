<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>新闻信息</title>
<script type="text/javascript" src='<s:url value="/js/jquery-1.10.2.min.js" />' /></script>
<script type="text/javascript" src='<s:url value="/js/viewNews.js" />'></script>
</head>
<body>
	<s:hidden id="userId" value="%{#session.user.id}" />
	<s:hidden id="newsId" value="%{#request.model.id}" />
	<table border="1" width="800px" bordercolor="#43A3E9" align="center">
		<tr>
			<td align="left"><s:a action="NewsAction_getAllPassedNews">首页</s:a> > <s:a
					action="NewsTypeAction_getNews?id=%{#request.model.newsType.id}">
					<s:property value="#request.model.newsType.typeName" />
				</s:a> > 正文</td>
		</tr>
		<tr bgcolor="#D5E8FD" align="center">
			<td>
				<h1 style="text-align: center; font-size: 16px">
					<s:property value="#request.model.title" />
				</h1>
			</td>
		</tr>
		<tr>
			<td>发布者：<span style="color: red"><s:property
						value="#request.model.admin.username" /></span> &nbsp;&nbsp;&nbsp;发布时间：<span
				style="color: red"><s:date name="#request.model.createTime"
						format="yyyy-MM-dd HH:mm:ss" /></span> &nbsp;&nbsp;&nbsp;阅读量：<span
				style="color: red"><s:property value="#application.count" />
			</span>
			</td>
		</tr>
		<tr>
			<td>作者:<span style="color: red"><s:property
						value="#request.model.author" /></span> &nbsp;&nbsp;&nbsp;来源:<span
				style="color: red"><s:property value="#request.model.source" />
			</span>
			</td>
		</tr>
		<tr>
			<td><s:property value="#request.model.content" escape="false" /></td>
		</tr>
		<tr align="center">
			<td align="center"><s:a action="NewsAction_getAllPassedNews">返回首页</s:a></td>
		</tr>
	</table>
	<br>
	<table border="1" width="800px" bordercolor="#43A3E9" align="center">
		<tr bgcolor="#D5E8FD" id="res">
			<td colspan="2">评论<span style="float: right">已有 <span
					id="count" style="color: red"><s:property
							value="#request.allComments.size" /></span> 条评论
			</span></td>
		</tr>
		<s:if test="#request.allComments.size == 0">
			<tr>
				<td>还没有人评论，抢个沙发试试！</td>
			</tr>
		</s:if>
		<s:iterator value="#request.allComments" var="c" status="status">

			<tr>
				<td colspan="2"><s:property value="#status.count" />楼</td>
			</tr>
			<tr>
				<td>评论者：<s:property value="#c.user.username" /></td>
				<td>评论时间：<s:date name="#c.createTime"
						format="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td colspan="2">内容：<s:property value="#c.content" /> <s:if
						test="#c.user.id == #session.user.id ">
						<span style="float: right"><s:a href="javascript:void(0);"
								onclick="deleteComment(%{#c.id},true)">删除</s:a></span>
					</s:if>
				</td>
			</tr>
		</s:iterator>
	</table>
	<br>
	<table align="center" border="1" width="800px">
		<tr>
			<td>
				<center>
					<fieldset>
						<legend>发表评论 </legend>
						<br>
						<s:if test="#session.user.id != null">用户名：
						<s:property value="#session.user.username" />
							<br>
							<textarea id="comment" rows="10" cols="80" placeholder="随便说点什么吧"></textarea>
							<br>
							<br>
							<input type="submit" class="right-button01"
								onclick="submitComment()" value="评论">
						</s:if>
						<s:else>
							<s:a href="/NewsSystem/LoginAction_login">点击登录</s:a>
						</s:else>
					</fieldset>
				</center>
			</td>
		</tr>
	</table>
</body>
</html>
