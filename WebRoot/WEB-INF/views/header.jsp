<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
</head>
<body>
	<table border="1" width="100%" bordercolor="#43A3E9" align="center">
		<tr align="center">
			<td><span style="font-size: 26px">新闻频道</span></td>
		</tr>
		<tr>
			<td align="right"><s:if test="#session.user.id != null">
					<font size="2"> Hello: <s:property
							value="#session.user.username" />&nbsp;&nbsp;<a
						href="UserAction_loginout">退出</a>&nbsp;&nbsp;
					</font>
				</s:if> 
				<s:else>
					<s:a href="/NewsSystem/LoginAction_login">点击登录</s:a>&nbsp;&nbsp;&nbsp;&nbsp;<s:a
						href="/NewsSystem/RegAction_reg">注册</s:a>&nbsp;&nbsp;
				</s:else>
			</td>
		</tr>
	</table>
</body>
</html>