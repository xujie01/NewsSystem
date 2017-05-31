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
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">添加栏目</h4>
		</header>

		<div class="content content-inner">

			<form method="post" action="NewsTypeAction_saveNewsType"
				class="form-horizontal">
				<s:hidden name="adminId" value="%{#session.admin.id}" />
				<div class="control-group">
					<label class="control-label">栏目名：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="typeName" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">栏目介绍：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textarea placeholder="介绍一下你的栏目吧" cols="15" rows="10"
								name="introduction" />
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
</body>
</html>
