<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> list1 = (ArrayList<Map<String, String>>)request.getAttribute("list1");
ArrayList<Map<String, String>> list2 = (ArrayList<Map<String, String>>)request.getAttribute("list2");
ArrayList<Map<String, String>> list3 = (ArrayList<Map<String, String>>)request.getAttribute("list3");
ArrayList<Map<String, String>> list4 = (ArrayList<Map<String, String>>)request.getAttribute("list4");
ArrayList<Map<String, String>> list5 = (ArrayList<Map<String, String>>)request.getAttribute("list5");
ArrayList<Map<String, String>> list6 = (ArrayList<Map<String, String>>)request.getAttribute("list6");
String q = (String)request.getAttribute("login_type");
String t = request.getParameter("t");
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
  </head>
  
  <body>
    <div class="box_1">
        <div class="div_title"><h4>论文列表</h4></div>
        <table id='tb1'>
	        <thead>
	            <tr>
	                <th>选择</th>
	                <th width="26%">论文题目</th>
	                <th>检索类型</th>
	                <th width="18%">作者</th>
	                <th>发表日期</th>
	                <th>提交日期</th>
	                <th>审核状态</th>
	                <th>奖励</th>
	                <th>操作</th>
	            </tr>
	        </thead>
	        <tbody>
	            <% for (Map<String, String> map: list1) { %>
	            <tr>
	                <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
	                <td><a href="paperView.do?id=<%=map.get("id") %>&q=0"><%=map.get("title") %></a></td>
	                <td><%=map.get("type") %></td>
	                <td><%=map.get("members") %></td>
	                <td><%=map.get("date_publish") %></td>
	                <td><%=map.get("date_commit") %></td>
	                <td>
	                <% 
	                    if (map.get("pass").equals("1")) out.print("通过");
	                    else if (map.get("pass").equals("2")) out.print("未通过");
	                    else if (map.get("pass").equals("3")) out.print("未审核");
	                %>
	                </td>
	                <td><% if (map.get("isAwarded").equals("t")) out.print("是"); else out.print("否");%></td>
	                <td>
	                    <% if (!q.equals("0") && t.equals("1")) { %>
	                    	<a href="paperView.do?id=<%=map.get("id") %>&q=1">审核</a>
	                    	<a href="submit/paperModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('1','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('1','<%=map.get("id") %>', 'f')">未奖励</a>
	                    	<a href="javascript:del(1,'<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
	                    	<a href="paperView.do?id=<%=map.get("id") %>&q=0">详情</a>
	                    	<% if (!map.get("pass").equals("1")) {%>
	                    		<a href="submit/paperModifyInput.do?id=<%=map.get("id") %>">编辑</a>
	                    		<a href="javascript:del(1,'<%=map.get("id") %>')">删除</a>
	                    	<% } %>
	                    <% } %>
	                </td>
	            </tr>
	            <% } %>
	            </tbody>
        </table>
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="1" id="selectAll_1"/>|
               <% if (q.equals("1")) { %>
                   <a href="javascript:batchPass('1','1')">审核通过</a>|
                   <a href="javascript:batchPass('1','2')">审核不通过</a>|
                   <a href="javascript:batchAward('1','t')">已奖励</a>|
                   <a href="javascript:batchAward('1','f')">未奖励</a>|
               <% } %>
                   <a href="javascript:batchDel('1')">删除</a></td>
           </tr>
        </table>
    </div>
    <div class="box_1">
        <div class="div_title"><h4>项目列表</h4></div>
        <table id='tb2'>
	        <thead>
	            <tr>
	                <th>选择</th>
	                <th width="">项目名称</th>
	                <th>类型</th>
	                <th>成员</th>
	                <th>开始日期</th>
	                <th>结束日期</th>
	                <th>提交日期</th>
	                <th>状态</th>
	                <th>审核状态</th>
	                <th>奖励</th>
	                <th>操作</th>
	            </tr>
	        </thead>
	        <tbody>
	        <% for (Map<String, String> map :list2) {%>
	            <tr>
	                <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
	                <td><a href="projectView.do?id=<%=map.get("id") %>&q=0"><%=map.get("title") %></a></td>
	                <td><%=map.get("type") %></td>
	                <td><%=map.get("members") %></td>
	                <td><%=map.get("date1") %></td>
	                <td><%=map.get("date2") %></td>
	                <td><%=map.get("date_commit") %></td>
	                <td><%=map.get("status") %></td>
	                <td>
	                <% 
	                    if (map.get("pass").equals("1")) out.print("通过");
	                    else if (map.get("pass").equals("2")) out.print("未通过");
	                    else if (map.get("pass").equals("3")) out.print("未审核");
	                %>
	                </td>
	                <td><% if (map.get("isAwarded").equals("t")) out.print("是"); else out.print("否");%></td>
	                <td>
	                    <% if (!q.equals("0") && t.equals("1")) { %>
	                    	<a href="projectView.do?id=<%=map.get("id") %>&q=1">审核</a>
	                    	<a href="submit/projectModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('2','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('2','<%=map.get("id") %>', 'f')">未奖励</a>
	                    	<a href="javascript:del(2,'<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
	                    	<a href="projectView.do?id=<%=map.get("id") %>&q=0">详情</a>
	                    	<% if (!map.get("pass").equals("1")) {%>
	                    		<a href="submit/projectModifyInput.do?id=<%=map.get("id") %>">编辑</a>
	                    		<a href="javascript:del(2,'<%=map.get("id") %>')">删除</a>
	                    	<% } %>
	                    <% } %>
	                </td>
	            </tr>
	        <% } %>
	        </tbody>
        </table>
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="2" id="selectAll_1"/>|
               <% if (q.equals("1")) { %>
                   <a href="javascript:batchPass('2','1')">审核通过</a>|
                   <a href="javascript:batchPass('2','2')">审核不通过</a>|
                   <a href="javascript:batchAward('2','t')">已奖励</a>|
                   <a href="javascript:batchAward('2','f')">未奖励</a>|
               <% } %>
                   <a href="javascript:batchDel('2')">删除</a></td>
           </tr>
        </table>
    </div>
    <div class="box_1">
        <div class="div_title"><h4>著作列表</h4></div> 
        <table id="tb3">
	        <thead>
	            <tr>
	                <th>选择</th>
	                <th width="">著作名称</th>
	                <th>类型</th>
	                <th>作者</th>
	                <th>出版日期</th>
	                <th>出版社</th>
	                <th>ISBN</th>
	                <th>提交日期</th>
	                <th>审核状态</th>
	                <th>奖励</th>
	                <th>操作</th>
	            </tr>
	        </thead>
	        <tbody>
	        <% for (Map<String, String> map :list3) {%>
	            <tr>
	                <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
	                <td><a href="bookView.do?id=<%=map.get("id") %>&q=0"><%=map.get("title") %></a></td>
	                <td><%=map.get("type") %></td>
	                <td><%=map.get("members") %></td>
	                <td><%=map.get("date_press") %></td>
	                <td><%=map.get("press") %></td>
	                <td><%=map.get("isbn") %></td>
	                <td><%=map.get("date_commit") %></td>
	                <td>
	                <% 
	                    if (map.get("pass").equals("1")) out.print("通过");
	                    else if (map.get("pass").equals("2")) out.print("未通过");
	                    else if (map.get("pass").equals("3")) out.print("未审核");
	                %>
	                </td>
	                <td><% if (map.get("isAwarded").equals("t")) out.print("是"); else out.print("否");%></td>
	                <td>
	                    <% if (!q.equals("0") && t.equals("1")) { %>
	                    	<a href="bookView.do?id=<%=map.get("id") %>&q=1">审核</a>
	                    	<a href="submit/bookModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('3','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('3','<%=map.get("id") %>', 'f')">未奖励</a>
	                    	<a href="javascript:del(3,'<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
	                    	<a href="bookView.do?id=<%=map.get("id") %>&q=0">详情</a>
	                    	<% if (!map.get("pass").equals("1")) {%>
	                    		<a href="submit/bookModifyInput.do?id=<%=map.get("id") %>">编辑</a>
	                    		<a href="javascript:del(3,'<%=map.get("id") %>')">删除</a>
	                    	<% } %>
	                    <% } %>
	                </td>
	            </tr>
	        <% } %>
	        </tbody>
        </table>  
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="3" id="selectAll_2"/>|
               <% if (q.equals("1")) { %>
                   <a href="javascript:batchPass('3','1')">审核通过</a>|
                   <a href="javascript:batchPass('3','1')">审核不通过</a>|
                   <a href="javascript:batchAward('3','t')">已奖励</a>|
                   <a href="javascript:batchAward('3','f')">未奖励</a>|
               <% } %>
                   <a href="javascript:batchDel('3')">删除</a></td>
           </tr>
        </table>
    </div>
    <div class="box_1">
        <div class="div_title"><h4>奖项列表</h4></div> 
        <table id="tb4">
	        <thead>
	            <tr>
	                <th>选择</th>
	                <th width="">奖项名称</th>
	                <th>类型</th>
	                <th>获奖人</th>
	                <th>授奖部门</th>
	                <th>级别</th>
	                <th>获奖日期</th>
	                <th>提交日期</th>
	                <th>审核状态</th>
	                <th>奖励</th>
	                <th>操作</th>
	            </tr>
	        </thead>
	        <tbody>
	        <% for (Map<String, String> map :list4) {%>
	            <tr>
	                <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
	                <td><a href="awardsView.do?id=<%=map.get("id") %>&q=0"><%=map.get("title") %></a></td>
	                <td><%=map.get("type") %></td>
	                <td><%=map.get("members") %></td>
	                <td><%=map.get("department") %></td>
	                <td><%=map.get("level") %></td>
	                <td><%=map.get("date") %></td>
	                <td><%=map.get("date_commit") %></td>
	                <td>
	                <% 
	                    if (map.get("pass").equals("1")) out.print("通过");
	                    else if (map.get("pass").equals("2")) out.print("未通过");
	                    else if (map.get("pass").equals("3")) out.print("未审核");
	                %>
	                </td>
	                <td><% if (map.get("isAwarded").equals("t")) out.print("是"); else out.print("否");%></td>
	                <td>
	                    <% if (!q.equals("0") && t.equals("1")) { %>
	                    	<a href="awardsView.do?id=<%=map.get("id") %>&q=1">审核</a>
	                    	<a href="submit/awardsModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('4','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('4','<%=map.get("id") %>', 'f')">未奖励</a>
	                    	<a href="javascript:del(4,'<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
	                    	<a href="awardsView.do?id=<%=map.get("id") %>&q=0">详情</a>
	                    	<% if (!map.get("pass").equals("1")) {%>
	                    		<a href="submit/awardsModifyInput.do?id=<%=map.get("id") %>">编辑</a>
	                    		<a href="javascript:del(4,'<%=map.get("id") %>')">删除</a>
	                    	<% } %>
	                    <% } %>
	                </td>
	            </tr>
	        <% } %>
	        </tbody>
        </table>
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="4" id="selectAll_4"/>|
               <% if (q.equals("1")) { %>
                   <a href="javascript:batchPass('4', '1')">审核通过</a>|
                   <a href="javascript:batchPass('4', '2')">审核不通过</a>|
                   <a href="javascript:batchAward('4','t')">已奖励</a>|
                   <a href="javascript:batchAward('4','f')">未奖励</a>|
               <% } %>
                   <a href="javascript:batchDel('4')">删除</a></td>
           </tr>
        </table>
    </div>
    <div class="box_1">
        <div class="div_title"><h4>专利列表</h4></div>
        <table id="tb5">
	        <thead>
	            <tr>
	                <th>选择</th>
	                <th width="">专利名称</th>
	                <th>类型</th>
	                <th>成员</th>
	                <th>专利号</th>
	                <th>公开日期</th>
	                <th>提交日期</th>
	                <th>审核状态</th>
	                <th>奖励</th>
	                <th>操作</th>
	            </tr>
	        </thead>
	        <tbody>
	        <% for (Map<String, String> map :list5) {%>
	            <tr>
	                <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
	                <td><a href="patentView.do?id=<%=map.get("id") %>&q=0"><%=map.get("title") %></a></td>
	                <td><%=map.get("type") %></td>
	                <td><%=map.get("members") %></td>
	                <td><%=map.get("number") %></td>
	                <td><%=map.get("date_public") %></td>
	                <td><%=map.get("date_commit") %></td>
	                <td>
	                <% 
	                    if (map.get("pass").equals("1")) out.print("通过");
	                    else if (map.get("pass").equals("2")) out.print("未通过");
	                    else if (map.get("pass").equals("3")) out.print("未审核");
	                %>
	                </td>
	                <td><% if (map.get("isAwarded").equals("t")) out.print("是"); else out.print("否");%></td>
	                <td>
	                    <% if (!q.equals("0") && t.equals("1")) { %>
	                    	<a href="patentView.do?id=<%=map.get("id") %>&q=1">审核</a>
	                    	<a href="submit/patentModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('5','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('5','<%=map.get("id") %>', 'f')">未奖励</a>
	                    	<a href="javascript:del(5,'<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
	                    	<a href="patentView.do?id=<%=map.get("id") %>&q=0">详情</a>
	                    	<% if (!map.get("pass").equals("1")) {%>
	                    		<a href="submit/patentModifyInput.do?id=<%=map.get("id") %>">编辑</a>
	                    		<a href="javascript:del(5,'<%=map.get("id") %>')">删除</a>
	                    	<% } %>
	                    <% } %>
	                </td>
	            </tr>
	        <% } %>
	        </tbody>
        </table>
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="5" id="selectAll_5"/>|
               <% if (q.equals("1")) { %>
                   <a href="javascript:batchPass('5','1')">审核通过</a>|
                   <a href="javascript:batchPass('5','2')">审核不通过</a>|
                   <a href="javascript:batchAward('5','t')">已奖励</a>|
                   <a href="javascript:batchAward('5','f')">未奖励</a>|
               <% } %>
                   <a href="javascript:batchDel('5')">删除</a></td>
           </tr>
        </table>
    </div>
    <div class="box_1">
        <div class="div_title"><h4>软件著作权列表</h4></div>
        <table id="tb6">
	        <thead>
	            <tr>
	                <th>选择</th>
	                <th width="">著作名称</th>
	                <th>类型</th>
	                <th>成员</th>
	                <th>登记号</th>
	                <th>发表日期</th>
	                <th>提交日期</th>
	                <th>审核状态</th>
	                <th>奖励</th>
	                <th>操作</th>
	            </tr>
	        </thead>
	        <tbody>
	        <% for (Map<String, String> map :list6) {%>
	            <tr>
	                <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
	                <td><a href="softwareView.do?id=<%=map.get("id") %>&q=0"><%=map.get("title") %></a></td>
	                <td><%=map.get("type") %></td>
	                <td><%=map.get("members") %></td>
	                <td><%=map.get("number") %></td>
	                <td><%=map.get("date_publish") %></td>
	                <td><%=map.get("date_commit") %></td>
	                <td>
	                <% 
	                    if (map.get("pass").equals("1")) out.print("通过");
	                    else if (map.get("pass").equals("2")) out.print("未通过");
	                    else if (map.get("pass").equals("3")) out.print("未审核");
	                %>
	                </td>
	                <td><% if (map.get("isAwarded").equals("t")) out.print("是"); else out.print("否");%></td>
	                <td>
	                    <% if (!q.equals("0") && t.equals("1")) { %>
	                    	<a href="softwareView.do?id=<%=map.get("id") %>&q=1">审核</a>
	                    	<a href="submit/softwareModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('6','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('6','<%=map.get("id") %>', 'f')">未奖励</a>
	                    	<a href="javascript:del(6,'<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
	                    	<a href="softwareView.do?id=<%=map.get("id") %>&q=0">详情</a>
	                    	<% if (!map.get("pass").equals("1")) {%>
	                    		<a href="submit/softwareModifyInput.do?id=<%=map.get("id") %>">编辑</a>
	                    		<a href="javascript:del(6,'<%=map.get("id") %>')">删除</a>
	                    	<% } %>
	                    <% } %>
	                </td> 
	            </tr>
	        <% } %>
	        </tbody>
        </table>  
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="6" id="selectAll_6"/>|
               <% if (q.equals("1")) { %>
                   <a href="javascript:batchPass('6','1')">审核通过</a>|
                   <a href="javascript:batchPass('6','2')">审核不通过</a>|
                   <a href="javascript:batchAward('6','t')">已奖励</a>|
                   <a href="javascript:batchAward('6','f')">未奖励</a>|
               <% } %>
                   <a href="javascript:batchDel('6')">删除</a></td>
           </tr>
        </table>      
    </div>
  </body>
    <jsp:include page="js.jsp" />
    <script>
	$(function () {
	    $('#tb1').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[6, "asc"],[5, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 5,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	    $('#tb2').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[8, "asc"],[7, "desc"],[6, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 5,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	    $('#tb3').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[8, "asc"],[7, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 5,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	    $('#tb4').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[8, "asc"],[7, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 5,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	    $('#tb5').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[7, "asc"],[6, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 5,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	    $('#tb6').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[7, "asc"],[6, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 5,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	});
    </script>
</html>
