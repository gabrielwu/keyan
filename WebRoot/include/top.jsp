<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<style type="text/css">
	* {margin:0; padding:0;}
	#top { font-family:\5FAE\8F6F\96C5\9ED1;height:48px; background: url(<%=basePath%>media/css/images/header-bg.png) repeat-x;}
	#top p {letter-spacing:7;line-height:2.0;font-weight:400;text-align:center; font-size:22px; color: #fff;}
	#top div {font-size:14px;float:right; color:#fff; margin:-22px 40px 4px;}
	#top div a{color:#fff;text-decoration:none;}
	</style>
  </head>
  <body>
    <div id="top">
		<p>科研管理系统</p>
		<div>
		    <span><%=(String)session.getAttribute("login_name") %></span>
		    <a href="index.do?t=0" target="mainFrame" >[首页]</a>
		    <a href="personal/infoView.do" target="mainFrame">[我的信息]</a>
		    <a href="./personal/passwordModify.jsp" target="mainFrame">[修改密码]</a>
		    <!-- <a href="./include/top.jsp" target="mainFrame">[使用帮助]</a> -->
		    <a href="logout" target="_top">[安全退出]</a>
		</div>
	</div>
  </body>
</html>
