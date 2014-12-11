<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<style type="text/css">
	* {margin:0; padding:0;}
	#bottom {text-align:center; font-size:16px; line-height:3; color:#fff; height:42px; background: url(<%=basePath%>media/css/images/header-bg.png) repeat-x;}
	#bottom span{font-family:\5FAE\8F6F\96C5\9ED1;}
	</style>
  </head>
  <body>
    <div id="bottom">Copyright©2012 <span>吉林大学计算机科学与技术学院</span></div>
  </body>
</html>