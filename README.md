# 基于SSH的Java EE新闻发布系统

## 项目介绍

基于Struts + Spring + Hibernate + Bootstrap 技术开发的新闻发布系统。

### 系统功能：

前台主要是时事新闻的浏览，用户注册及登录，用户评论新闻等功能。后台为管理员对新闻以及新闻栏目的CRUD操作，新闻审核，权限以及角色的控制等。

### 技术选型

**后端技术**:

* Struts
* Spring 
* Hibernate
* EhCache——缓存框架
* JSP

**前端技术**:

* jQuery
* Bootstrap
* UEditor——在线HTML编辑器

### 模块介绍

* 公共类设计

Web.xml中配置Struts及初始化Spring容器，制定WEB-INF路径下applicationContex.xml文件作为Spring配置文件，在Spring中定义数据源Bean，使用C3P0数据源，定义Hibernate的SessionFactory，并依赖注入数据源。

* magicgis.newssystem.models

实体类及Hibernate持久化配置文件。

* magicgis.newssystem.dao 

DAO层。

* magicgis.newssystem.services

Service层。

* magicgis.newssystem.actions

web层。

* magicgis.newssystem.cache 

EhCache缓存键值生成器。

* magicgis.newssystem.constant

常量类。

* magicgis.newssystem.listener

ApplicationListener监听。

* magicgis.newssystem.interceptor

Struts拦截器。

* magicgis.newssystem.filter

Struts过滤。

* magicgis.newssystem.aware

管理权限接口。

* JSP模块

WEB-INF/views、WEB-INF/admin、WebRoot/admin。

### 数据模型

![数据模型](/documents/data-model.png)

## 环境搭建

### 开发工具

* MySQL: 数据库

* Tomcat: 应用服务器

* SVN: 版本管理

* MyEclipse: 开发IDE

* PowerDesigner: 建模工具

### 开发环境

* Jdk8

## 演示地址

演示地址：http://47.92.7.213:8080/HRSystem/index.jsp

### 预览图

![预览图](/documents/preview1.png)
![预览图](/documents/preview2.png)
![预览图](/documents/preview3.png)

