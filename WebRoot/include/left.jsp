<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'top.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <jsp:include page="css.jsp" />
    <jsp:include page="js.jsp" />
  </head>
  
  <body>
  <div id="leftbar">
    	<h3><a href="#">论文</a></h3>
    	<div>
			<p><a href="paperList.do?q=0&f=1" target="mainFrame">我的论文列表</a></p>
			<p><a href="paperListPass.do?f=1" target="mainFrame">我的审核论文列表</a></p>
			<p><a href="paperList.do?f=1&q=1&s_type_id=48,49" target="mainFrame">全院SCI论文目录</a></p>
			<p><a href="paperListLiter.do?q=0&f=1" target="mainFrame">论文文献</a></p>
			<p><a href="submit/paperAddInput.do" target="mainFrame">论文提交</a></p>
		</div>
    	<h3><a href="#">项目</a></h3>
    	<div>
			<p><a href="projectList.do?q=0&f=1" target="mainFrame">项目列表</a></p>
			<p><a href="submit/projectAddInput.do" target="mainFrame">项目提交</a></p>
		</div>
    	<h3><a href="#">著作</a></h3>
    	<div>
			<p><a href="bookList.do?q=0&f=1" target="mainFrame">著作列表</a></p>
			<p><a href="submit/bookAddInput.do" target="mainFrame">著作提交</a></p>
		</div>
    	<h3><a href="#">奖项</a></h3>
    	<div>
			<p><a href="awardsList.do?q=0&f=1" target="mainFrame">奖项列表</a></p>
			<p><a href="submit/awardsAddInput.do" target="mainFrame">奖项提交</a></p>
		</div>
    	<h3><a href="#">专利</a></h3>
    	<div>
			<p><a href="patentList.do?q=0&f=1" target="mainFrame">专利列表</a></p>
			<p><a href="submit/patentAddInput.do" target="mainFrame">专利提交</a></p>
		</div>
    	<h3><a href="#">软件著作权</a></h3>
    	<div>
			<p><a href="softwareList.do?q=0&f=1" target="mainFrame">软件著作权列表</a></p>
			<p><a href="submit/softwareAddInput.do" target="mainFrame">软件著作权提交</a></p>
		</div>
		<!-- 超级管理员 -->
		<% 
		String type = session.getAttribute("login_type").toString();
		if (type.equals("1")) {
		%>
		<h3><a href="#">成果管理</a></h3>
    	<div>
			<p><a href="index.do?t=1" target="mainFrame" >当年所有成果</a></p>
			<p><a href="paperList.do?q=1&f=1" target="mainFrame">论文</a></p>
			<p><a href="projectList.do?q=1&f=1" target="mainFrame">项目</a></p>
			<p><a href="bookList.do?q=1&f=1" target="mainFrame">著作</a></p>
			<p><a href="awardsList.do?q=1&f=1" target="mainFrame">奖项</a></p>
			<p><a href="patentList.do?q=1&f=1" target="mainFrame">专利</a></p>
			<p><a href="softwareList.do?q=1&f=1" target="mainFrame">软件著作权</a></p>
		</div>
		<h3><a href="#">成果类型管理</a></h3>
    	<div>
			<p><a href="admin/typeAdmin.do?t=1"  target="mainFrame">论文</a></p>
			<p><a href="admin/typeAdmin.do?t=11" target="mainFrame">论文分区</a></p>
			<p><a href="admin/typeAdmin.do?t=2"  target="mainFrame">项目</a></p>
			<p><a href="admin/typeAdmin.do?t=3"  target="mainFrame">著作</a></p>
			<p><a href="admin/typeAdmin.do?t=4"  target="mainFrame">奖项</a></p>
			<p><a href="admin/typeAdmin.do?t=5"  target="mainFrame">专利</a></p>
			<p><a href="admin/typeAdmin.do?t=6"  target="mainFrame">软件著作权</a></p>
		</div>
    	<h3><a href="#">用户管理</a></h3>
    	<div>
			<p><a href="admin/userAdmin.do" target="mainFrame">用户列表</a></p>
		</div>
    	<h3><a href="#">实验室管理</a></h3>
    	<div>
			<p><a href="admin/labAdmin.do" target="mainFrame">实验室列表</a></p>
		</div>
    	<h3><a href="#">统计</a></h3>
    	<div>
			<p><a href="admin/reportInput.do" target="mainFrame">生成报表</a></p>
			<p><a href="paperListLiter.do?q=1&f=1" target="mainFrame">论文文献</a></p>
		</div>
    	<h3><a href="#">系统设定</a></h3>
    	<div>
			<p><a id="a_canSubmit" href="javascript:canSubmitSwitch()" target="left"><%=application.getAttribute("canSubmitText") %></a></p>
    	    <p><a href="admin/submitTip.do?type=Paper" target="mainFrame">提交论文说明</a></p>
    	    <p><a href="admin/submitTip.do?type=Project" target="mainFrame">提交项目说明</a></p>
    	    <p><a href="admin/submitTip.do?type=Book" target="mainFrame">提交著作说明</a></p>
    	    <p><a href="admin/submitTip.do?type=Awards" target="mainFrame">提交奖项说明</a></p>
    	    <p><a href="admin/submitTip.do?type=Patent" target="mainFrame">提交专利说明</a></p>
    	    <p><a href="admin/submitTip.do?type=Software" target="mainFrame">提交软件著作说明</a></p>
		</div>
		<%} %>
  </div>
  </body>
    <script>
    $(function() {
		$( "#leftbar" ).accordion({ 
			active: 0, 
			autoHeight: false,
			collapsible: true 
		});	
	});
    function canSubmitSwitch() {
        $.ajax({
            url: "admin/canSubmitSwitch.do",
            type: 'post',
            success:
                function (result) {
                    if (result.indexOf("1") != -1) {
                        alert("操作成功！");
                        if ($("#a_canSubmit").text() == "开启成果提交") {
                            $("#a_canSubmit").text("关闭成果提交");
                        } else {
                            $("#a_canSubmit").text("开启成果提交");
                        }
                    } else {
                        alert("操作失败！");
                    }
            	}
        });
    }
    </script>
</html>