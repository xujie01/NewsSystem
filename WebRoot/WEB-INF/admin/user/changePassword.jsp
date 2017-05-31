<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>修改密码</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript" src='<s:url value="/js/admin.js" />' /></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">修改密码</h4>
		</header>

		<div class="content content-inner">

			<form id="form1" method="post" action="PasswordAction_changePassword"
				class="form-horizontal">
				<div class="control-group">
					<label class="control-label">原密码：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield id="password" type="password" name="password" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">新密码：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield type="password" name="newpassword" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">确认密码：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield type="password" name="newpassword2" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">验证图片：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<img src="PasswordAction_getRandomPictrue" width="120"
								height="40" onclick="changePasswordValidateCode(this)"
								alt="点击图片更换验证码" /><label>(点击图片更换验证码)</label>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">请输入验证码：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<input id="validationCode" name="validationCode" type="text" />
						</div>
					</div>
				</div>
				<div class="controls">
					<h5>
						<span style="color: red"><s:actionerror></s:actionerror></span>
					</h5>
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
