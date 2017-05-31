<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="navbar navbar-inverse"  role="navigation"><!--导航条、反色、固定在顶部 -->
	<div class="container"><!--将导航条居中对齐并在两侧添加内补 -->
		<div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	        </button>
	        <a class="navbar-brand" href="AdminAction_home">新闻发布系统后台管理</a><!--设置了内补（padding）和高度（height） -->
        </div>
        <!--导航链接，表格，和切换其他内容-->
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
	            <li><a href="AdminAction_homePage">前台首页</a></li>
	        </ul>
	        <ul class="nav navbar-nav">
	            <li><a href="AdminAction_sysConfig">系统配置</a></li>
	        </ul>			

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎，<s:property
					value="#session.admin.username"/> <b class="caret"></b></a>
                     <ul class="dropdown-menu">
                         <li><s:a action="PasswordAction_toChangePassword">
						<i class="glyphicon glyphicon-cog"></i>修改密码</s:a></li>
                         <li class="divider"></li>
                         <li><s:a action="AdminAction_doneLogout">
						<i class="glyphicon glyphicon-user"></i>退出</s:a></li>
                     </ul>
                 </li>
			</ul>
		</div>
		<!-- /.nav-collapse -->
	</div>
</div>
<!-- end of header bar -->
