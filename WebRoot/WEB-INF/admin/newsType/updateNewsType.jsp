<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "bpm-task");%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>栏目信息</title>
<%@include file="/admin/s.jsp"%>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">编辑栏目</h4>
		</header>

		<div class="content content-inner">

			<form method="post" action="NewsTypeAction_saveNewsType"
				class="form-horizontal">
				<s:hidden name="adminId" value="%{#request.model.admin.id}" />
				<div class="control-group">
					<label class="control-label">栏目ID：</label>
					<div class="controls">
						<div class="input-append">
							<s:textfield type="text" name="id" readonly="true"
								value="%{#request.model.id}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">栏目名：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="typeName" value="%{#request.model.typeName}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">创建者：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="admin.username" readonly="true"
								value="%{#request.model.admin.username}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">创建时间：</label>
					<div class="controls">
						<div class="input-append"
							style="padding-left: 0px;">
							<s:textfield name="createTime" readonly="true"
								value="%{#request.model.createTime}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">栏目介绍：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textarea cols="15" rows="10" name="introduction"
								value="%{#request.model.introduction}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button id="submitButton" type="submit" class="btn">保存</button>
						&nbsp;
						<button type="button" onclick="history.back();" class="btn">返回</button>
					</div>
				</div>
			</form>
		</div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>
