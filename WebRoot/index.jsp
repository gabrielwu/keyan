<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>index</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  <frameset rows="48,*,42" cols="*" framespacing="0" border="none" >
      <frame src="include/top.jsp" frameborder="0" scrolling="no"  noresize="noresize"  />
      <frameset  cols="240,*"  framespacing="0" border="1" id="parentFrame">
          <frame src="./include/left.jsp"  name="left" id="left" noresize="noresize"  frameborder="1" scrolling="auto" />
          <frame src="<%=basePath%>index.do?t=0"  frameborder="0"  noresize="noresize" scrolling="yes" id="mainFrame" name="mainFrame"/>
      </frameset>
      <frame src="./include/bottom.jsp"  name="bottom" id="bottom" noresize="noresize" frameborder="1" scrolling="no" />
  </frameset>
<noframes>
<body>
</body>
</noframes>
