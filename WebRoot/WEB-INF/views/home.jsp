<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻主页</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<s:include value="header.jsp" />
	<div class="row" style="padding-top:15px">
		<div class="col-md-4">
			<s:include value="carousel.html" />
		</div>
		<div class="col-md-5">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>今日头条</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(0) ==null || #request.allNews.get(0).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(0)" var="n"
							status="status">
							<tr>
								<td><font color="red"><s:a
											action="NewsAction_getViewNews?id=%{#n.id}">
											<s:property value="#n.title" />
										</s:a></font></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
		<div class="col-md-3">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=3">国际时事</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(1) ==null || #request.allNews.get(1).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(1)" var="n"
							status="status">
							<tr>
								<td style="font-size: 12px"><s:a
										action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" style="padding-top:15px">
		<div class="col-md-4">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=4">国内新闻</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(2) ==null || #request.allNews.get(2).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(2)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
		<div class="col-md-4">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=2">社会万象</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(3) ==null || #request.allNews.get(3).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(3)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
		<div class="col-md-4">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=5">娱乐新闻</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(4) ==null || #request.allNews.get(4).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(4)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" style="padding-top:15px">
		<div class="col-md-6">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=6">体育新闻</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(5) ==null || #request.allNews.get(5).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(5)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=7">军事新闻</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(6) ==null || #request.allNews.get(6).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(6)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row" style="padding-top:15px">
		<div class="col-md-6">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=8">科技之光</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(7) ==null || #request.allNews.get(7).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(7)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<table border="1" width="100%" bordercolor="#43A3E9">
				<tr>
					<td>
						<h2>
							<s:a action="NewsTypeAction_getNews?id=9">教育新闻</s:a>
						</h2>
					</td>
				</tr>
				<tbody align="center" valign="middle" id="tab">
					<s:if
						test="#request.allNews.get(8) ==null || #request.allNews.get(8).size ==0">
						<tr>
							<td colspan="4">没有相关的新闻!</td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="#request.allNews.get(8)" var="n"
							status="status">
							<tr>
								<td><s:a action="NewsAction_getViewNews?id=%{#n.id}">
										<s:property value="#n.title" />
									</s:a>&nbsp;&nbsp;&nbsp;<s:date name="#n.createTime"
										format="yyyy-MM-dd" /></td>
							</tr>
						</s:iterator>
					</s:else>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<s:include value="footer.html"/>
</body>
</html>
