<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/redmond/jquery-ui-1.8.23.custom.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/styles.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/css/demos.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/datatables/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/datatables/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/datatables/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/datatables/css/demo_page.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/datatables/css/demo_table_jui.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>media/datatables/css/demo_table.css">