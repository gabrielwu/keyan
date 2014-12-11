<%@ page language="java" import="java.util.*, java.io.*" pageEncoding="utf-8"%>
<% String flag = "";
String filePath = this.getServletContext().getRealPath("/")+"media/js/commitShutdown.js";
System.out.println(filePath);
String content = "";
String commitOnOff = (String)application.getAttribute("commitOnOff");
if (commitOnOff == null || commitOnOff.equals("0")) {
	content = "";
	application.setAttribute("commitOnOff", "1");
	flag = "on";
} else {
	content = "$(function () {commitShutdown();});";
	flag = "off";
	application.setAttribute("commitOnOff", "0");
}
try {  
	FileWriter writer = new FileWriter(filePath, false); 
	writer.write(content); 
	writer.close(); 
} catch (IOException e) { 
	flag = "-1";
	e.printStackTrace(); 
} 
out.print(flag);
%>