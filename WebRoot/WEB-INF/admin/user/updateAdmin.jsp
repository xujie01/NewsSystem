<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%pageContext.setAttribute("currentMenu", "doc");%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>更新管理员</title>
<%@include file="/admin/s.jsp"%>
</head>
<script type="text/javascript">
	$(function() {
		$('#one1').click(function() {
			var size = $('#left>option:selected').size();
			if (size != 0) {
				$('#left > option:selected').appendTo($('#right'));
			} else {
				$('#left>option:first-child').appendTo($('#right'));
			}
		});
		$('#all1').click(function() {
			$('#left > option').appendTo($('#right'));
		});
		$('#one2').click(function() {
			var size = $('#right>option:selected').size();
			if (size != 0) {
				$('#right > option:selected').appendTo($('#left'));
			} else {
				$('#right>option:first-child').appendTo($('#left'));
			}
		});
		$('#all2').click(function() {
			$('#right > option').appendTo($('#left'));
		});
	});

	function submitForm1() {
		$('#left > option').attr('selected', 'selected');
		return true;
	}
</script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">编辑管理员</h4>
		</header>

		<div class="content content-inner">

			<form id="form1" method="post" action="AdminAction_saveOrUpdatAdmin"
				class="form-horizontal">
				<s:hidden name="adminId" value="%{#request.model.admin.id}" />
				<div class="control-group">
					<label class="control-label">管理员ID：</label>
					<div class="controls">
						<div class="input-append">
							<s:textfield name="id" value="%{#request.model.id}"
								readonly="true" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">用户名：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="username" value="%{#request.model.username}"
								readonly="true" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="email" value="%{#request.model.email}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">是否启用：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:checkbox name="enabled" value="%{#request.model.enabled}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">管理员角色：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<table>
								<tr>
									<td width="45%" align="right" class="login-text02">管理员已有角色：<br>
										<s:select id="left" name="ownRoleIds"
											list="%{#request.model.roles}" listKey="id"
											listValue="roleName" multiple="true" size="12"
											cssStyle="width:100px">
										</s:select></td>
									<td width="10%" valign="middle" align="center"><input
										type="button" id="one1" value="&gt;" class="btn"></input><br>
										<br> <input type="button" id="one2" value="&lt;"
										class="btn"></input><br> <br> <input type="button"
										id="all1" value="&gt;&gt;" class="btn"></input><br> <br>
										<input type="button" id="all2" value="&lt;&lt;" class="btn"></input><br>
										<br></td>
									<td width="45%" align="left" class="login-text02">管理员未有角色：<br>
										<s:select id="right" list="noOwnRoles" name="noOwnRoleIds"
											listKey="id" listValue="roleName" multiple="true" size="12"
											cssStyle="width:100px">
										</s:select></td>
								</tr>
							</table>
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