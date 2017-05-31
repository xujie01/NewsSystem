<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%pageContext.setAttribute("currentMenu", "bpm-delegate");%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>新建权限</title>
<%@include file="/admin/s.jsp"%>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">添加权限</h4>
		</header>

		<div class="content content-inner">

			<form method="post" action="RightAction_saveOrUpdateRight"
				class="form-horizontal">
				<div class="control-group">
					<label class="control-label">权限名称：</label>
					<div class="controls">
						<div class="input-append">
							<s:textfield name="rightName" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">权限URL：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="rightUrl" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">公共资源：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:checkbox name="common" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">权限描述：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textarea name="rightDesc" cols="15" rows="5" />
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