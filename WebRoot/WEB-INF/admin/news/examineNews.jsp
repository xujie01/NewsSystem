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
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">新闻详情</h4>
		</header>
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
		</table>
		<header class="header">
		<h4 class="title">新闻审核</h4>
		</header>
		<table align="center">
			<tr>
				<td>
					<center>
						<s:form action="NewsAction_changeNewsState" method="post">
							<s:hidden name="id" value="%{#request.model.id}" />
							<s:iterator value="#session.allStates" var="s">
								<s:if test="#s.id == #request.model.state.id">
									<s:textfield type="radio" name="sw" checked="checked" value="%{#s.id}"/>
									<s:property value="#s.stateName" />
								</s:if>
								<s:else>
									<s:textfield type="radio" name="sw" value="%{#s.id}"/>
									<s:property value="#s.stateName" />
								</s:else>
							</s:iterator>
							<br>
							<br>
							<div class="control-group">
								<div class="controls">
									<button id="submitButton" type="submit" class="btn">保存</button>
									&nbsp;
									<button type="button" onclick="history.back();" class="btn">返回</button>
								</div>
							</div>
						</s:form>
					</center>
				</td>
			</tr>
		</table>

		</article> <article>

		<div class="m-clear"></div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>
