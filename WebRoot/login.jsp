<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String msg = "";
if(request.getAttribute("msg")!=null){
	msg = (String)request.getAttribute("msg");
}
String username = "";
if(request.getAttribute("username")!=null){
	username = (String)request.getAttribute("username");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/login.css"> 

  </head>
  
  <body>
    <form action="login" method="post">
    <div id="login">
        <div class="header" id="">科研管理系统</div>
        <p class="msg"><%=msg %></p>
        <p class="p_input">
            <span>用户名</span>
            <input value="<%=username %>" name="username" id="username"/>
        </p>
        <p class="p_input">
        	<span>密&nbsp;&nbsp;码</span>
            <input name="password" id="password" type="password"/>
        </p>
        <div class="div_submit" id="">
            <input type="submit"  id="login_submit" value="登录" />
        </div>
        <div id="bottom">Copyright©2012 <span>吉林大学计算机科学与技术学院</span></div>
    </div>
    </form>
  </body>
</html>
