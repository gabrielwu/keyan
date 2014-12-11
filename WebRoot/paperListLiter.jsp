<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String userType = (String)request.getAttribute("userType");
String r_t = request.getParameter("t");
String q = (String)request.getAttribute("q");
String f = request.getParameter("f");
ArrayList<Map<String, String>> list = (ArrayList<Map<String, String>>)request.getAttribute("list");
ArrayList<Map<String, String>> typeJList = (ArrayList<Map<String, String>>)request.getAttribute("typeJList");
ArrayList<Map<String, String>> typeCList = (ArrayList<Map<String, String>>)request.getAttribute("typeCList");
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
    <style type="text/css">
    #div_liters{width:92%;margin:10px auto;*margin:10px;padding:0 2em;}
    #div_liters p{text-indent:-2em;}
    </style>
  </head>
  <body>
    <div class="box_1">
        <div class="div_title">
            <h4>论文文献列表</h4>
            <a id="search_toggle" class="search_off" href="javascript:search_on()">
                <em></em>搜索</a>
        </div>
        <div id="search_div" >
        <form id="search_form" action="paperListLiter.do?f=0" onsubmit="s_check()" method="post" >
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
                <td>题目</td>
                <td class="left" colspan="1"><input name="s_title" id="s_title" value="<%=sMap.get("title") %>" /></td>
                <td>关键字</td>
                <td class="left" colspan="1"><input name="s_keywords" id="s_keywords" value="<%=sMap.get("keywords") %>" /></td>
                <td>摘要</td>
                <td class="left" colspan="1"><input name="s_abstract" id="s_abstract" value="<%=sMap.get("abstract")%>" /></td>
                <td>链接</td>
                <td class="left" colspan="1"><input name="s_link" id="s_link" value="<%=sMap.get("link") %>" /></td>
            </tr>
            <tr>
                <td>检索号</td>
                <td class="left"><input name="s_number" id="s_number" value="<%=sMap.get("number") %>" /></td>
                <td>影响因子</td>
                <td class="left"><input name="s_factor" id="s_factor" value="<%=sMap.get("factor")%>" /></td>
                <td>引用次数</td>
                <td class="left"><input name="s_citiations" id="s_citiations" value="<%=sMap.get("citiations")%>" /></td>
                <td>发表日期</td>
                <td class="left"><input class="" name="s_date_publish" id="s_date_publish" value="<%=sMap.get("date_publish")%>" /></td>
            </tr>
            <tr>
                <td>通讯作者</td>
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
                <td>作者</td>
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
                <td class="left" colspan="3">
                    <input class="date" name="s_date_commit" id="s_date_commit" value="<%=sMapRange.get("date_commit") %>" />到
                    <input class="date" name="s_date_commit_2" id="s_date_commit_2" value="<%=sMapRange.get("date_commit_2") %>" />
                </td>
            </tr>
            <tr>
                <td>期刊/会议</td>
                <td style="z-index:0"  class="left">
                    <select name="s_category" id="s_category">
                        <option value="0">全部</option>
                        <option value="1" <% if ("1".equals(sMapSpec.get("category"))) { %>selected<% } %>>期刊</option>
                        <option value="2" <% if ("2".equals(sMapSpec.get("category"))) { %>selected<% } %>>会议</option>
                    </select>
                </td>
                <td>类型</td>
                <td class="left" id="td_type">
                    <input name="s_type_id" id="s_type" value="<% %>" type="hidden"/>
                    <select id="s_type_0">
                        <option value="0">全部</option>
                        <% for (Map<String, String> map: typeJList) { %>
                        <option value="<%=map.get("id") %>" <% if (map.get("id").equals(sMapEq.get("type_id"))) { %>selected<% } %>><%=map.get("name") %></option>
                        <% } %>
                        <% for (Map<String, String> map: typeCList) { %>
                        <option value="<%=map.get("id") %>" <% if (map.get("id").equals(sMapEq.get("type_id"))) { %>selected<% } %>><%=map.get("name") %></option>
                        <% } %>
                    </select>
                    <select id="s_type_1" style="display:none;">
                        <option value="0">全部</option>
                        <% for (Map<String, String> map: typeJList) { %>
                        <option value="<%=map.get("id") %>" <% if (map.get("id").equals(sMapEq.get("type_id"))) { %>selected<% } %>><%=map.get("name") %></option>
                        <% } %>
                    </select>
                    <select id="s_type_2" style="display:none;">
                        <option value="0">全部</option>
                        <% for (Map<String, String> map: typeCList) { %>
                        <option value="<%=map.get("id") %>" <% if (map.get("id").equals(sMapEq.get("type_id"))) { %>selected<% } %>><%=map.get("name") %></option>
                        <% } %>
                    </select>
                </td>
                <td>A值</td>
                <td class="left"><input name="s_a_value" id="s_a_value" value="<%=sMapEq.get("a.a_value") %>" /></td>
                <td>期刊/会议名称</td>
                <td class="left"><input name="s_publication" id="s_publication" value="<%=sMap.get("publication")%>" /></td>
            </tr>
            <tr id="tr_j">
                <td>期刊卷</td>
                <td class="left"><input name="s_j_volume" id="s_j_volume" value="<%=sMap.get("j_volume")%>" /></td>
                <td>期刊期</td>
                <td class="left"><input name="s_j_issue" id="s_j_issue" value="<%=sMap.get("j_issue")%>" /></td>
                <td>期刊页</td>
                <td class="left"><input name="s_j_page" id="s_j_page" value="<%=sMap.get("j_page") %>" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr id="tr_c">
                <td>会议地点</td>
                <td class="left"><input name="s_c_location" id="s_c_location" value="<%=sMap.get("c_location") %>" /></td>
                <td>会议时间</td>
                <td class="left" colspan="3">
                    <input class="date" name="s_c_date" id="s_c_date" value="<%=sMapRange.get("c_date")%>" />到
                    <input class="date" name="s_c_date_2" id="s_c_date_2" value="<%=sMapRange.get("c_date_2")%>" />
                </td>
                <td></td>
                <td colspan="3">
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
                <td class="left" colspan="3" style="text-align:left">
                    <input class="date" name="s_date_pass" id="s_date_pass" value="<%=sMapRange.get("date_pass")%>" />到
                    <input class="date" name="s_date_pass_2" id="s_date_pass_2" value="<%=sMapRange.get("date_pass_2")%>" />
                 </td>
                <td colspan="2">
                    <input class="button" id="s_" type="submit" value="提交" />
                    <input class="button" id="s_" type="reset" />
                </td>
            </tr>
        </table>
        </form>
        </div>
        <div id="div_liters">
	        <% for (Map<String, String> map :list) {%>
	            <p>[<%=map.get("no") %>]<%=map.get("liter") %></p>
	        <% } %>
        </div>
    </div>
  </body>
    <jsp:include page="include/js.jsp" />
    <script>
    $(function () {
        <% if (f.equals("0")){ %>
        search_on();
        <% } %>
        $('.date').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-MM-dd'
        });
        $('#s_date_publish').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-MM',
            showButtonPanel: true,
            onClose: function(dateText, inst) {
                var monthStr = $("#ui-datepicker-div .ui-datepicker-month option:selected").val();//得到选中的月份值
                var month = (parseInt(monthStr)+1);
                if (month < 10) {
                    month = "0" + month;
                }
                var year = $("#ui-datepicker-div .ui-datepicker-year option:selected").val();//得到选中的年份值
                $(this).val(year+'-'+month);//给input赋值，其中要对月值加1才是实际的月份
            }
        });
    });
    $(function() {
    	$("#selectAll").click(function (){
    		var value = $(this).attr("checked");
    		if (value == "checked") {
        		$("td .checkbox").attr("checked", true);
    		} else {
        		$("td .checkbox").attr("checked", false);
    		}
        });
    });   
	$(function() {
		  var i = $('#s_category').children('option:selected').val();
		  $("#td_type select").css("display", "none");
		  $("#s_type_"+i).css("display", "block");
		  var val = $("#s_type_"+i).children('option:selected').val();
		  $("#s_type").val(val);
		  $('#s_category').change(function(){ 
			  var id = $(this).children('option:selected').val();
			  $("#td_type select").css("display", "none");
			  $("#s_type_"+id).css("display", "block");
			  var val = $("#s_type_"+id).children('option:selected').val();
			  $("#s_type").val(val);
		  });
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
