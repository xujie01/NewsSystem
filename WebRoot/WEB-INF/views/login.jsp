<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录页面</title>
<link href='<s:url value="/css/css.css" />' rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src='<s:url value="/js/jquery-1.10.2.min.js" />' /></script>
<script type="text/javascript" src='<s:url value="/js/frontIndex.js" />' /></script>
</head>
<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="147" background='<s:url value="/images/top02.gif" />'><img
				src='<s:url value="/images/top03.gif" />' width="776" height="147" /></td>
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
									<td align="center"><img
										src='<s:url value="/images/ico13.gif" />' width="107"
										height="97" /></td>
								</tr>
								<tr>
									<td height="40" align="center">&nbsp;</td>
								</tr>

							</table></td>
						<td><img src='<s:url value="/images/line01.gif" />' width="5"
							height="292" /></td>
					</tr>
				</table></td>
			<td><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<s:form action="LoginAction_doneLogin" method="post" theme="simple">
						<legend class="top-font01">用户登录</legend>
						<br>
						<tr>
							<td width="31%" height="35" class="login-text02">用户名：<br /></td>
							<td width="69%"><input id="username" name="username"
								type="text" size="30" /></td>
						</tr>
						<tr>
							<td width="31%" height="35" class="login-text02">密 码：<br /></td>
							<td width="69%"><input id="password" name="password"
								type="password" size="31" /></td>
						</tr>
						<tr>
							<td height="35" class="login-text02">验证图片：<br /></td>
							<td width="92" valign="bottom"><img
								src="LoginAction_getRandomPictrue" width="100" height="40"
								onclick="changeValidateCode(this)" /><span class="login-text02">(点击图片更换验证码)</span></td>
						</tr>
						<tr>
							<td height="35" class="login-text02">请输入验证码：</td>
							<td><input name="validationCode" type="text" size="30" /></td>
						</tr>
						<tr>
							<td width="100%" height="35" colspan="2" class="login-text02"><font
								color="red"><s:actionerror></s:actionerror></font></td>
						</tr>
						<tr>
							<td height="35">&nbsp;</td>
							<td><input type="submit" class="right-button01" value="登陆" />&nbsp;&nbsp;<input
								name="reset" class="right-button01" type="button" value="注册"
								onClick="reg()" /></td>
						</tr>
						<s:token></s:token>
					</s:form>
				</table></td>
		</tr>
	</table>
</body>
</html>