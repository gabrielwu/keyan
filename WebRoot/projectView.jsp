<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String, String> data = (Map<String, String>)request.getAttribute("data");
ArrayList<Map<String, String>> members = (ArrayList<Map<String, String>>)request.getAttribute("members");
String passOrView = (String)request.getAttribute("passOrView");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'paperView.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <jsp:include page="include/css.jsp" />
  </head>
  <body>
    <div class="box_3">
    	<div class="div_title"><h4>项目详情</h4></div>
        <input type="hidden" id="id" value="<%=data.get("id")%>"/>
        <table id="tb_view">
            <tr>
                <th>项目名称</th>
                <td><%=data.get("title")%></td>
            </tr>
            <tr>
                <th>项目链接</th>
                <td><%=data.get("link")%></td>
            </tr>
            <tr>
                <th>项目来源</th>
                <td><%=data.get("source")%></td>
            </tr>
            <tr>
                <th>计划名称</th>
                <td><%=data.get("plan")%></td>
            </tr>
            <tr>
                <th>项目经费</th>
                <td><%=data.get("cost")%></td>
            </tr>
            <tr>
                <th>每年到帐</th>
                <td><%=data.get("costYears")%></td>
            </tr>
            <tr>
                <th>经费卡号</th>
                <td><%=data.get("card")%></td>
            </tr>
            <tr>
                <th>开始日期</th>
                <td><%=data.get("date1")%></td>
            </tr>
            <tr>
                <th>结束日期</th>
                <td><%=data.get("date2")%></td>
            </tr>
            <tr>
                <th>项目状态</th>
                <td><%=data.get("status")%></td>
            </tr>
            <tr>
                <th>纵/横向</th>
                <td><% if(data.get("category").equals("1")){%>纵向<% }else{ %>横向<%}%></td>
            </tr>
            <tr>
                <th>项目类型</th>
                <td><%=data.get("type")%></td>
            </tr>
            <tr>
                <th>2013类型</th>
                <td><%=data.get("type2013")%></td>
            </tr>
            <tr>
                <th>A值<input type="hidden" id="a_value_ori" value="<%=data.get("a_value")%>"/></th>
                <td id="td_modify_a">
                    <span id="span_a"><%=data.get("a_value")%></span>
	                <span id="a_op">
		                <% if (passOrView.equals("1")) { %>
		                <a href="javascript:modifyA()">修改A值</a>
		                <% } %>
	                </span>
	            </td>
            </tr>
            <tr>
                <th>提交人</th>
                <td><%=data.get("committer")%></td>
            </tr>
            <tr>
                <th>组长</th>
                <td><%=data.get("leader")%></td>
            </tr>
            <tr>
                <th>成员</th>
                <td>
	            <% for (Map<String, String> member: members) {%>
	            <%=member.get("name")%>(<%=member.get("a_percent")%>%)&nbsp;&nbsp;
	            <%}%>
	            </td>
            </tr>
            <tr>
                <th>证明文件</th>
                <td><a href="<%=data.get("file_path")%>" target="blank">查看</a></td>
            </tr>
            <tr>
                <th>项目备注</th>
                <td><%=data.get("remark")%></td>
            </tr>
            <tr>
                <th>审核状态</th>
                <td><%=data.get("_pass")%></td>
            </tr>
            <tr>
                <th>是否奖励</th>
                <td><%=data.get("_isAwarded")%></td>
            </tr>
            <% if (!data.get("pass").equals("3")) {%>
            <tr>
                <th>审核日期</th>
                <td><%=data.get("date_pass")%></td>
            </tr>
            <% } %>
            <% if (passOrView.equals("1")) { %>
            <tr>
                <th>操作</th>
                
                <td>
                    <input type="button" onclick="pass(1)" value="审核通过"/>
                    <input type="button" onclick="pass(2)" value="审核不通过"/>
                    <input type="button" onclick="javascript:award('2','<%=data.get("id") %>', 't')" value="奖励"/>
                    <input type="button" onclick="javascript:award('2','<%=data.get("id") %>', 'f')" value="未奖励"/>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
  </body>
    <jsp:include page="include/js.jsp" />
    <script type="text/javascript">
    var r_table = "r_project";
    </script>
</html>
