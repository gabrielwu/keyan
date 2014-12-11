<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=basePath%>media/js/jquery-1.7.1.min.js"></script>
<script src="<%=basePath%>media/js/jquery-ui-1.8.23.custom.min.js"></script>
<script src="<%=basePath%>media/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>media/js/common.js"></script>
