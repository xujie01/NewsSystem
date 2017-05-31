<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%pageContext.setAttribute("currentMenu", "bpm-process");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/admin/meta.jsp"%>
<title>新闻信息</title>
<%@include file="/admin/s.jsp"%>
<script type="text/javascript"
	src='<s:url value="/ueditor/ueditor.config.js" />' /></script>
<script type="text/javascript"
	src='<s:url value="/ueditor/ueditor.all.js" />' /></script>
</head>
<body>
	<%@include file="/admin/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/admin/menu.jsp"%>

		<section id="m-main" class="col-md-10"> <article
			class="m-widget"> <header class="header">
		<h4 class="title">编辑新闻</h4>
		</header>

		<div class="content content-inner">

			<form method="post" action="NewsAction_saveNews"
				class="form-horizontal" enctype="multipart/form-data">
				<s:hidden value="%{#request.model.thumbnail}" name="thumbnail" />
				<s:hidden name="adminId" value="%{#request.model.admin.id}" />
				<s:hidden name="stateId" value="%{#request.model.state.id}" />
				<div class="control-group">
					<label class="control-label">新闻ID：</label>
					<div class="controls">
						<div class="input-append">
							<s:textfield name="id" readonly="true"
								value="%{#request.model.id}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">标题：</label>
					<div class="controls">
						<div class="input-append">
							<s:textfield name="title" value="%{#request.model.title}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">作者：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="author" value="%{#request.model.author}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">来源：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="source" value="%{#request.model.source}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">创建者：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="admin.username" readonly="true"
								value="%{#request.model.admin.username}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">创建时间：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="createTime" readonly="true"
								value="%{#request.model.createTime}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">栏目：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:select list="%{#session.allNewsTypes}" name="newsType.id"
								listKey="id" listValue="typeName" style="width: 100"
								value="%{#request.model.newsType.id}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">缩略图：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:file name="upload" size="30" />
							<label>(图片大小不要超过2M)</label><font color="red"><s:fielderror
									fieldName="logoPhoto"></s:fielderror></font>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">阅读量：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="count" value="%{#request.model.count}"
								readonly="true" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">状态：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield type="text" readonly="true"
								value="%{#request.model.state.stateName}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">关键词：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<s:textfield name="keyword" size="30"
								value="%{#request.model.keyword}" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">内容：</label>
					<div class="controls">
						<div class="input-append" style="padding-left: 0px;">
							<div class="width:100%">
								<script id="container" name="content" type="text/plain"
									style="width:850px;height:400px;"><s:property value="#request.model.content" escape="false"/></script>
							</div>
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
			<!-- 实例化编辑器 -->
			<script type="text/javascript">
				var ue = UE.getEditor('container', {
					toolbars : [ [ 'fullscreen', 'anchor', //锚点
					'undo', //撤销
					'redo', //重做
					'bold', //加粗
					'indent', //首行缩进
					'snapscreen', //截图
					'italic', //斜体
					'underline', //下划线
					'strikethrough', //删除线
					'subscript', //下标
					'fontborder', //字符边框
					'superscript', //上标
					'formatmatch', //格式刷
					'source', //源代码
					'blockquote', //引用
					'pasteplain', //纯文本粘贴模式
					'selectall', //全选
					'print', //打印
					'preview', 'horizontal', //分隔线
					'removeformat', //清除格式
					'time', //时间
					'date', //日期
					'link', //超链接
					'unlink', //取消链接
					'inserttable', //插入表格
					'edittable', //表格属性
					'insertrow', //前插入行
					'insertcol', //前插入列
					'mergeright', //右合并单元格
					'mergedown', //下合并单元格
					], [ 'insertcode', //代码语言
					'fontfamily', //字体
					'fontsize', //字号
					'paragraph', //段落格式
					'justifyleft', //居左对齐
					'justifyright', //居右对齐
					'justifycenter', //居中对齐
					'justifyjustify', //两端对齐
					'imageleft', //左浮动
					'imagecenter', //居中
					'imageright', //右浮动
					'forecolor', //字体颜色
					'simpleupload', //单图上传
					'insertimage', //多图上传
					'edittd', //单元格属性
					'emotion', //表情
					'spechars', //特殊字符
					'searchreplace', //查询替换
					'map', //Baidu地图
					'music', //音乐
					'insertvideo', //视频
					], [ 'backcolor', //背景色
					'insertorderedlist', //有序列表
					'insertunorderedlist', //无序列表
					'rowspacingtop', //段前距
					'rowspacingbottom', //段后距
					'pagebreak', //分页
					'insertframe', //插入Iframe
					'imagenone', //默认

					'attachment', //附件
					'wordimage', //图片转存
					'lineheight', //行间距
					'edittip ', //编辑提示
					'customstyle', //自定义标题
					'autotypeset', //自动排版
					'background', //背景
					'template', //模板
					'scrawl', //涂鸦
					'charts' // 图表
					] ]
				});
			</script>
		</div>
		</article> </section>
		<!-- end of main -->
	</div>
</body>
</html>
