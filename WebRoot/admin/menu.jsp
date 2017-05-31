<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- start of sidebar -->
	<aside id="m-sidebar" class="col-md-2 panel-group " role="tablist" aria-multiselectable="true">

		<div class="panel panel-default">
			<div class="panel-heading" role="tab">
				<a role="button" data-toggle="collapse" aria-expanded="true" aria-controls="collapse-bpm-process"
					data-parent="#m-sidebar" href="#collapse-bpm-process"> <span class="title">新闻管理</span>
				</a>
			</div>
			<div id="collapse-bpm-process" class="panel-collapse collapse ${currentMenu == 'bpm-process' ? 'in' : ''}">
				<ul class="nav nav-pills nav-stacked">
					<li><s:a action="NewsAction_getAllNews">
							<i class="glyphicon glyphicon-list"></i>   新闻列表</s:a></li>
					<li><s:a action="NewsAction_addNews">
							<i class="glyphicon glyphicon-pawn"></i>   添加新闻</s:a></li>
					<li><s:a action="NewsAction_getAllNotPassedNews">
							<i class="glyphicon glyphicon-ok-sign"></i>   新闻审核</s:a></li>
				</ul>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab">
				<a role="button" data-toggle="collapse" aria-expanded="true" aria-controls="collapse-bpm-task"
					data-parent="#m-sidebar" href="#collapse-bpm-task"><span class="title">栏目管理</span>
				</a>
			</div>
			<div id="collapse-bpm-task" class="panel-collapse collapse ${currentMenu == 'bpm-task' ? 'in' : ''}">
				<ul class="nav nav-pills nav-stacked">
					<li><s:a action="NewsTypeAction_getAllNewsTypes">
							<i class="glyphicon glyphicon-th-list"></i>   栏目列表</s:a></li>
					<li><s:a action="NewsTypeAction_addNewsType">
							<i class="glyphicon glyphicon-indent-right"></i>   添加栏目</s:a></li>
				</ul>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab">
				<a class="accordion-toggle" data-toggle="collapse" aria-expanded="true" aria-controls="collapse-bpm-delegate"
					data-parent="#m-sidebar" href="#collapse-bpm-delegate"><span class="title">权限设置</span>
				</a>
			</div>
			<div id="collapse-bpm-delegate" class="panel-collapse collapse ${currentMenu == 'bpm-delegate' ? 'in' : ''}">
				<ul class="nav nav-pills nav-stacked">
					<li><s:a action="RightAction_findAllRights">
							<i class="glyphicon glyphicon-align-justify"></i>   权限列表</s:a></li>
					<li><s:a action="RightAction_toAddRightPage">
							<i class="glyphicon glyphicon-plus-sign"></i>   添加权限</s:a></li>
				</ul>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab">
				<a class="accordion-toggle" data-toggle="collapse" aria-expanded="true" aria-controls="collapse-cal"
					data-parent="#m-sidebar" href="#collapse-cal"><span class="title">角色管理</span>
				</a>
			</div>
			<div id="collapse-cal" class="panel-collapse collapse ${currentMenu == 'cal' ? 'in' : ''}">
				<ul class="nav nav-pills nav-stacked">
					<li><s:a action="RoleAction_findAllRoles">
							<i class="glyphicon glyphicon-list-alt"></i>   角色列表</s:a></li>
					<li><s:a action="RoleAction_toAddRolePage">
							<i class="glyphicon glyphicon-education"></i>   添加角色</s:a></li>
				</ul>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab">
				<a class="accordion-toggle" data-toggle="collapse" aria-expanded="true" aria-controls="collapse-msg"
					data-parent="#m-sidebar" href="#collapse-msg "><span class="title">用户管理</span>
				</a>
			</div>
			<div id="collapse-msg" class="panel-collapse collapse ${currentMenu == 'msg' ? 'in' : ''}">
				<ul class="nav nav-pills nav-stacked">
					<li><s:a action="UserAction_getAllUsers">
							<i class="glyphicon glyphicon-user"></i>   用户列表</s:a></li>
				</ul>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading" role="tab">
				<a class="accordion-toggle" data-toggle="collapse" aria-expanded="true" aria-controls="collapse-doc"
					data-parent="#m-sidebar" href="#collapse-doc"><span class="title">管理员管理</span>
				</a>
			</div>
			<div id="collapse-doc" class="panel-collapse collapse ${currentMenu == 'doc' ? 'in' : ''}">
				<ul class="nav nav-pills nav-stacked">
					<li><s:a action="AdminAction_getAllAdmins">
							<i class="glyphicon glyphicon-th"></i>   管理员列表</s:a></li>
					<li><s:a action="AdminAction_toAddAdminPage">
							<i class="glyphicon glyphicon-log-in"></i>   添加管理员</s:a></li>
				</ul>
			</div>
		</div>

		<footer id="m-footer" class="text-center">
			<hr>
			<span style="font-family: Arial, Helvetica, sans-serif;">Copyright
				&copy; 2017 版权所有<br> All Rights Reserved
			</span>
		</footer>
	</aside>
	<!-- end of sidebar -->