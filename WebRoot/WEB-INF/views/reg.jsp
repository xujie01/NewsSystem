<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册页面</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src='<s:url value="/js/jquery-1.10.2.min.js" />' /></script>
<script type="text/javascript" src='<s:url value="/js/frontIndex.js" />' /></script>
</head>
<body>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="147" background="images/top02.gif"><img
				src="images/top03.gif" width="776" height="147" /></td>
		</tr>
	</table>
	<table width="562" border="0" align="center" cellpadding="0"
		cellspacing="0" class="right-table03">
		<tr>
			<td width="221"><table width="95%" border="0" cellpadding="0"
					cellspacing="0" class="login-text01">

					<tr>
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0" class="login-text01">
								<tr>
									<td align="center"><img src="images/ico13.gif" width="107"
										height="97" /></td>
								</tr>
								<tr>
									<td height="40" align="center">&nbsp;</td>
								</tr>

							</table></td>
						<td><img src="images/line01.gif" width="5" height="292" /></td>
					</tr>
				</table></td>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<s:form action="RegAction_doneReg" namespace="/" method="post">
						<legend class="top-font01">用户注册</legend>
						<br>
						<tr>
							<td width="31%" height="35" class="login-text02">用户名：<br /></td>
							<td width="69%"><input id="username" name="username"
								type="text" size="30" /></td>
						</tr>
						<tr>
							<td width="31%" height="35" class="login-text02">密&nbsp;码：<br /></td>
							<td width="69%"><input id="password" name="password"
								type="password" size="31" /></td>
						</tr>
						<tr>
							<td width="31%" height="35" class="login-text02">确认密码：<br /></td>
							<td width="69%"><input id="confirmPassword"
								name="confirmPassword" type="password" size="31" /></td>
						</tr>
						<tr>
							<td width="31%" height="35" class="login-text02">Email：<br /></td>
							<td width="69%"><input id="email" name="email" type="text"
								size="31" /></td>
						</tr>
						<tr>
							<td height="35" class="login-text02">验证图片：<br /></td>
							<td width="92" valign="bottom"><img
								src="RegAction_getRandomPictrue" width="100" height="40"
								onclick="regChangeValidateCode(this)" /><span
								class="login-text02">(点击图片更换验证码)</span></td>
						</tr>
						<tr>
							<td height="35" class="login-text02">请输入验证码：</td>
							<td><input name="validationCode" type="text" size="30" /></td>
						</tr>
						<tr>
							<td width="100%" height="35" colspan="2" class="login-text02"><font
								color="red"><s:fielderror></s:fielderror></font></td>
						</tr>
						<tr>
							<td height="35">&nbsp;</td>
							<td><s:submit cssClass="right-button01" value="注册" />&nbsp;&nbsp;
								<s:a href="/NewsSystem/LoginAction_login" cssClass="login-text02">已有账号?现在登录</s:a></td>
						</tr>
					</s:form>
				</table></td>
		</tr>
	</table>
</body>
</html>