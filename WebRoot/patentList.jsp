<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userType = (String)request.getAttribute("userType");
String r_t = request.getParameter("t");
String q = (String)request.getAttribute("q");
String f = request.getParameter("f");
ArrayList<Map<String, String>> list = (ArrayList<Map<String, String>>)request.getAttribute("list");
ArrayList<Map<String, String>> typeList1 = (ArrayList<Map<String, String>>)request.getAttribute("typeList1");
ArrayList<Map<String, String>> typeList2 = (ArrayList<Map<String, String>>)request.getAttribute("typeList2");
ArrayList<Map<String, String>> memberList = (ArrayList<Map<String, String>>)request.getAttribute("memberList");
ArrayList<Map<String, String>> labList = (ArrayList<Map<String, String>>)request.getAttribute("labList");
Map<String, String> sMap = (Map<String, String>)request.getAttribute("sMap");
Map<String, String> sMapRange = (Map<String, String>)request.getAttribute("sMapRange");
Map<String, String> sMapEq = (Map<String, String>)request.getAttribute("sMapEq");
Map<String, String> sMapSpec = (Map<String, String>)request.getAttribute("sMapSpec");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'typeAdmin.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <jsp:include page="include/css.jsp" />
  </head>
  <body>
     <div class="box_1">
        <div class="div_title">
            <h4>专利列表</h4>
            <a id="search_toggle" class="search_off" href="javascript:search_on()">
                <em></em>搜索</a>
        </div>        
        <div id="search_div" >
        <form id="search_form" action="patentList.do?f=0&q=<%=q %>" onsubmit="s_check()" method="post" >
        <input type="hidden" name="q" value="<%=q %>" />
        <table id="search_tb">
            <% if (q.equals("1")) { %>
            <tr>
                <td>提交人</td>
                <td class="left" colspan="1">
		            <input onkeyup="showMembers(this.value, this)"  
                    <% for (Map<String, String> map: memberList) { 
                    	if (map.get("id").equals(sMapEq.get("user_id"))) {
                    		out.print("value='"+map.get("name")+"'");
                    		break;
                    	}
                    } %>class="member_name" />
		            <div class='selectM' ></div>
                    <input type="hidden" name="s_user_id" id="s_user_id" value="<%=sMapEq.get("user_id") %>" class="member_id" />
                </td>
                <td>实验室</td>
                <td class="left" colspan="1">
                    <select name="s_lab_id" id="s_lab_id">
                        <option value="0">全部</option>
                        <% for (Map<String, String> map: labList) { %>
                        <option value="<%=map.get("id") %>" <% if(sMapEq.get("lab_id").equals(map.get("id"))){ %>selected<% } %>>
                        	<%=map.get("name") %>
                        </option>
                        <% } %>
                    </select>
                </td>
                <td></td>
                <td colspan="1"></td>
                <td></td>
                <td colspan="1"></td>
            </tr>
            <% } %>
            <tr>
                <td>名称</td>
                <td class="left" colspan="1"><input name="s_title" id="s_title" value="<%=sMap.get("title") %>" /></td>
                <td>专利号</td>
                <td class="left" colspan="1"><input name="s_number" id="s_number" value="<%=sMap.get("number") %>" /></td>
                <td>申请号</td>
                <td class="left" colspan="1"><input name="s_number_apply" id="s_number_apply" value="<%=sMap.get("number_apply")%>" /></td>
                <td>公开号</td>
                <td class="left" colspan="1"><input name="s_number_public" id="s_number_public" value="<%=sMap.get("number_public") %>" /></td>
            </tr>
            <tr>
                <td>链接</td>
                <td class="left" colspan="1"><input name="s_link" id="s_link" value="<%=sMap.get("link") %>" /></td>
                <td>申请日期</td>
                <td class="left" colspan="1">
                	<input name="s_date_apply" class="date sInput" id="s_date_apply" value="<%=sMapRange.get("date_apply") %>" />
                	<input name="s_date_apply_2" class="date sInput" id="s_date_apply_2" value="<%=sMapRange.get("date_apply_2") %>" />
                </td>
                <td>公开日期</td>
                <td class="left" colspan="1">
                	<input name="s_date_public" class="date sInput" id="s_date_public" value="<%=sMapRange.get("date_public") %>" />
                	<input name="s_date_public_2" class="date sInput" id="s_date_public_2" value="<%=sMapRange.get("date_public_2") %>" />
                </td>
                <td>类型</td>
                <td class="left" id="td_type">
                    <input name="s_type_id" id="s_type" value="<% %>" type="hidden"/>
                    <select id="s_type_0">
                        <option value="0">全部</option>
                        <% for (Map<String, String> map: typeList1) { %>
                        <option value="<%=map.get("id") %>" <% if (map.get("id").equals(sMapEq.get("type_id"))) { %>selected<% } %>><%=map.get("name") %></option>
                        <% } %>
                    </select>
                </td>
            </tr>          
            <tr>
                <td>组长</td>
                <td class="left">
		            <input onkeyup="showMembers(this.value, this)" 
                    <% for (Map<String, String> map: memberList) { 
                    	if (map.get("id").equals(sMapEq.get("leader_id"))) {
                    		out.print("value='"+map.get("name")+"'");
                    		break;
                    	}
                    } %>
                    class="member_name" />
		            <div class='selectM' ></div>
                    <input type="hidden" name="s_leader_id" id="s_leader_id" value="<%=sMapEq.get("leader_id") %>" class="member_id" />
                </td>
                <td>成员</td>
                <td class="left" colspan="1">
		            <input onkeyup="showMembers(this.value, this)"
	                    <% for (Map<String, String> map: memberList) { 
	                    	if (map.get("id").equals(sMapSpec.get("member_id"))) {
	                    		out.print("value='"+map.get("name")+"'");
	                    		break;
	                    	}
	                    } %>
	                    class="member_name" />
		            <div class='selectM' ></div>
                    <input type="hidden" name="s_member_id" id="s_member_id" value="<%=sMapSpec.get("member_id") %>" class="member_id" />
                 </td>
                <td>提交日期</td>
                <td class="left" colspan="">
                    <input class=" sInput date" name="s_date_commit" id="s_date_commit" value="<%=sMapRange.get("date_commit") %>" />-
                    <input class=" sInput date" name="s_date_commit_2" id="s_date_commit_2" value="<%=sMapRange.get("date_commit_2") %>" />
                </td>      
                <td>2013类型</td>
                <td class="left">
                    <select name="s_type2013_id" id="s_type2013_id">
                        <option value="0">全部</option>
                        <% for (Map<String, String> map: typeList2) { %>
                        <option value="<%=map.get("id") %>" <% if (map.get("id").equals(sMapEq.get("type2013_id"))) { %>selected<% } %>><%=map.get("name") %></option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr><td>A值</td>
                <td class="left"><input name="s_a_value" id="s_a_value" value="<%=sMapEq.get("a.a_value") %>" /></td>       
                <td>已奖励</td>
                <td class="left" colspan="">
                    <select name="s_isAwarded" id="s_isAwarded">
                        <option value="0">全部</option>
                        <option value="t" <% if(sMapEq.get("isAwarded").equals("t")) { %>selected<% } %>>是</option>
                        <option value="f" <% if(sMapEq.get("isAwarded").equals("f")) { %>selected<% } %>>否</option>
                    </select>
                </td>
            </tr>
            <tr id="tr_c">
                <td>审核状态</td>
                <td class="left">
                    <select name="s_pass" id="s_pass">
                        <option value="0">全部</option>
                        <option value="1" <% if ("1".equals(sMapEq.get("pass"))){ %>selected<% } %>>通过</option>
                        <option value="2" <% if ("2".equals(sMapEq.get("pass"))){ %>selected<% } %>>未通过</option>
                        <option value="3" <% if ("3".equals(sMapEq.get("pass"))){ %>selected<% } %>>未审核</option>
                    </select> 
                </td>
                <td>审核日期</td>
                <td class="left" colspan="" style="text-align:left">
                    <input class=" sInput date" name="s_date_pass" id="s_date_pass" value="<%=sMapRange.get("date_pass")%>" />-
                    <input class=" sInput date" name="s_date_pass_2" id="s_date_pass_2" value="<%=sMapRange.get("date_pass_2")%>" />
                 </td>
                <td colspan="2">
                    <input class="button" value="查询" type="submit" id="btn_s_query" />
                    <input class="button" value="清空" type="button" id="btn_s_reset" />
                    <input class="button" value="导出" type="button" id="btn_s_export" onclick="exportList('patent')" />
                </td>
            </tr>
        </table> 
        </form>
        </div>
        <table id='tb5'>
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
	        <% for (Map<String, String> map :list) {%>
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
	                    <% if (!q.equals("0")) { %>
		                    <a href="patentView.do?id=<%=map.get("id") %>&q=1">审核</a>
		                    <a href="submit/patentModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    <a href="javascript:award('5','<%=map.get("id") %>', 't')">奖励</a>
		                   	<a href="javascript:award('5','<%=map.get("id") %>', 'f')">未奖励</a>
		                    <a href="javascript:del('5','<%=map.get("id") %>')">删除</a>
	                    <% } else {%>
		                    <a href="patentView.do?id=<%=map.get("id") %>&q=0">详情</a>
		                    <% if (!map.get("pass").equals("1")) {%>
		                    	<a href="submit/patentModifyInput.do?id=<%=map.get("id") %>">编辑</a>
		                    	<a href="javascript:del('5','<%=map.get("id") %>')">删除</a>
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
  </body>
    <jsp:include page="include/js.jsp" />
<script> 
$(function () {
	$("#btn_s_reset").click(function() {
		$("#search_form input[name^='s_']").val("");
		$("#search_form select option").prop("selected", false);
	});
});
	$(function () {
	    $('#tb5').dataTable({	    
	        "bJQueryUI": true,
	        "aaSorting": [[7, "asc"],[6, "desc"]],
			"sPaginationType": "full_numbers",
			"iDisplayLength": 10,
			"oLanguage": {
                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
            }
		});
	    <% if (f.equals("0")){ %>
	    search_on();
	    <% } %>
        $('.date').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-MM-dd'
        });
    	$("#selectAll").click(function (){
    		var value = $(this).attr("checked");
    		if (value == "checked") {
        		$("td .checkbox").attr("checked", true);
    		} else {
        		$("td .checkbox").attr("checked", false);
    		}
        });
		//var i = $('#s_category').children('option:selected').val();
		var i = 0;
		$("#td_type select").css("display", "none");
		$("#s_type_"+i).css("display", "block");
		var val = $("#s_type_"+i).children('option:selected').val();
		$("#s_type").val(val);
		$("#s_type_0").change(function(){ 
			var val = $(this).children('option:selected').val();
			$("#s_type").val(val);
		});
		$("#s_type_1").change(function(){ 
			var val = $(this).children('option:selected').val();
			$("#s_type").val(val);
		}); 
		$("#s_type_2").change(function(){ 
			var val = $(this).children('option:selected').val();
			$("#s_type").val(val);
		}); 	 	
	});
  	<% for (Map<String, String> member: memberList) {%>
  	memberNameArray.push('<%=member.get("name")%>');
  	memberIdArray.push('<%=member.get("id")%>');
  	<% } %>
  	</script>
</html>
