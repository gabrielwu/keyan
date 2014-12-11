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
    	<div class="div_title"><h4>论文详情</h4></div>
        <input type="hidden" id="id" value="<%=data.get("id")%>"/>
        <table id="tb_view">
            <tr>
                <th>论文题目</th>
                <td><%=data.get("title")%></td>
            </tr>
            <tr>
                <th>论文链接</th>
                <td><%=data.get("link")%></td>
            </tr>
            <tr>
                <th>关键字</th>
                <td><%=data.get("keywords")%></td>
            </tr>
            <tr>
                <th>中文摘要</th>
                <td><%=data.get("abstract")%></td>
            </tr>
            <tr>
                <th>英文摘要</th>
                <td><%=data.get("abstract_en")%></td>
            </tr>
            <tr>
                <th>检索号</th>
                <td><%=data.get("number")%></td>
            </tr>
            <tr>
                <th>影响因子</th>
                <td><%=data.get("factor")%></td>
            </tr>
            <tr>
                <th>引用次数</th>
                <td><%=data.get("citiations")%></td>
            </tr>
            <tr>
                <th>发表日期</th>
                <td><%=data.get("date_publish")%></td>
            </tr>
            <tr>
                <th>JCR分区情况</th>
                <td><%=data.get("area")%></td>
            </tr>
            <tr>
                <th>期刊/会议</th>
                <td><% if(data.get("category").equals("1")){%>期刊<% }else{ %>会议<%}%></td>
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
        <% if (data.get("category").equals("1")) {%>
            <tr>
                <th>期刊类型</th>
                <td><%=data.get("type")%></td>
            </tr>
            <tr>
                <th>期刊名称</th>
                <td><%=data.get("publication")%></td>
            </tr>
            <tr>
                <th>卷</th>
                <td><%=data.get("j_volume")%></td>
            </tr>
            <tr>
                <th>期</th>
                <td><%=data.get("j_issue")%></td>
            </tr>
            <tr>
                <th>页</th>
                <td><%=data.get("j_page")%></td>
            </tr>
        <% } else { %>
            <tr>
                <th>会议类型</th>
                <td><%=data.get("type")%></td>
            </tr>
            <tr>
                <th>会议名称</th>
                <td><%=data.get("publication")%></td>
            </tr>
            <tr>
                <th>会议日期</th>
                <td><%=data.get("c_date")%></td>
            </tr>
            <tr>
                <th>会议地点</th>
                <td><%=data.get("c_location")%></td>
            </tr>
        <% } %>
            <tr>
                <th>CCF推荐</th>
                <td><%=data.get("type2013")%></td>
            </tr>
            <tr>
                <th>提交人</th>
                <td><%=data.get("committer")%></td>
            </tr>
            <tr>
                <th>通讯作者</th>
                <td><%=data.get("leader")%></td>
            </tr>
            <tr>
                <th>作者</th>
                <td><%=data.get("authors")%></td>
            </tr>
            <tr>
                <th>作者A值分配</th>
                <td>
	            <% for (Map<String, String> member: members) {%>
	            <%=member.get("name")%>(<%=member.get("a_percent")%>%)&nbsp;&nbsp;
	            <%}%>
	            </td>
            </tr>
            <tr>
                <th>论文原件</th>
                <td><a href="<%=data.get("file_path")%>" target="blank">论文原件</a></td>
            </tr>
            <tr>
                <th>论文备注</th>
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
                    <input type="button" onclick="javascript:award('1','<%=data.get("id") %>', 't')" value="奖励"/>
                    <input type="button" onclick="javascript:award('1','<%=data.get("id") %>', 'f')" value="未奖励"/>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
  </body>
    <jsp:include page="include/js.jsp" />
  	<script type="text/javascript">
  	var r_table = "r_paper";
  	</script>
</html>
