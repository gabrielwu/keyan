<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> typeListP = (ArrayList<Map<String, String>>)request.getAttribute("typeListP");
ArrayList<Map<String, String>> typeListH = (ArrayList<Map<String, String>>)request.getAttribute("typeListH");
ArrayList<Map<String, String>> typeList2 = (ArrayList<Map<String, String>>)request.getAttribute("typeList2");
ArrayList<Map<String, String>> memberList = (ArrayList<Map<String, String>>)request.getAttribute("memberList");
Map<String, String> data = (Map<String, String>)request.getAttribute("data");
ArrayList<Map<String, String>> members = (ArrayList<Map<String, String>>)request.getAttribute("members");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'paperAdd.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <jsp:include page="include/css.jsp" />
  </head>
  <body>
    <div class="box_2">
	    <div class="div_title"><h4>修改项目</h4></div>
	    <input id="id" type="hidden" value="<%=data.get("id") %>"/>
	    <table id="table_input_2">
			<tr>
			    <td colspan="2">名称:<span id="msg_" class='msg_common'></span><br />
			        <input value=<%=data.get("title") %> id="title" type="text" />
			    </td>
			</tr>
	        <tr valign="top">
	            <td>
			        <table>
			            <tr>
			                <td>备注（链接）:<span id="msg_" class='msg_common'></span><br />
			                    <input value=<%=data.get("remark") %> id="remark" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>来源:<span id="msg_" class='msg_common'></span><br />
			                    <input value=<%=data.get("source") %> id="source" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>经费（万元）:<span id="msg_" class='msg_common'></span><br />
			                    <input value=<%=data.get("cost") %> id="cost" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>编号:<span id="msg_" class='msg_common'></span><br />
			                    <input value=<%=data.get("number") %> id="number" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>开始日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input value=<%=data.get("date1") %> readonly="readonly" class="date" id="date1" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>A值:<span id="msg_" class='msg_common'></span><br />
			                    <input class="readonly"  value="<%=data.get("a_value") %>" readonly="readonly" id="a_value" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>经费卡号:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("card") %>" id="card" type="text" />
			                </td>
			            </tr>
			        </table>            
	            </td>
	            <td>
			        <table>
			            <tr>
			                <td>计划名称<span class='msg_format'></span>:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("plan")%>" id="plan" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>状态:<br />
			                    <select id="status">
			                        <option value='在研'>在研</option>
			                        <option value='完成'>完成</option>
			                    </select>
			                </td>
			                <td><span id="msg_" class='msg_common'></span></td>
			            </tr>
			            <tr>
			                <td>横/纵向:<br />
			                    <select id="category">
			                        <option value='p' <% if ("1".equals(data.get("category"))) { %>selected<% } %>>纵向</option>
			                        <option value='h' <% if ("2".equals(data.get("category"))) { %>selected<% } %>>横向</option>
			                    </select>
			                </td>
			                <td><span id="msg_" class='msg_common'></span></td>
			            </tr>
			            <tr class="tr_type tr_type_p">
			                <td>类型:<br />
			                    <select id="type_id_p">
			                    <% for (Map<String, String> type: typeListP) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>' <% if (type.get("id").equals(data.get("type_id"))) { %>selected<% } %> value='<%=type.get("id") %>'>
			                            <%=type.get("name") %>
			                        </option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_h" style="display:none">
			                <td>类型:<br />
			                    <select id="type_id_h">
			                    <% for (Map<String, String> type: typeListH) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>' <% if (type.get("id").equals(data.get("type_id"))) { %>selected<% } %> value='<%=type.get("id") %>'>
			                            <%=type.get("name") %>
			                        </option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr>
			                <td>结束日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input value=<%=data.get("date2") %> readonly="readonly" class="date" id="date2" type="text" />
			                </td>
			            </tr>
  		                <tr class="">
  		                    <td>2013类型:<br />
  		                        <select id="type2013_id">
  		                        <% for (Map<String, String> type: typeList2) { %>
  		                            <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>' <% if (type.get("id").equals(data.get("type2013_id"))) { %>selected<% } %>><%=type.get("name") %></option>
  		                        <%} %>
  		                        </select>
  		                    </td>
  		                </tr>
			        </table>
	            </td>
	        </tr>
			<tr>
			    <td colspan="2">备注:<span id="msg_" class='msg_common'></span><br />
			        <textarea rows="" cols="" id="remark"><%=data.get("remark")%></textarea>
			    </td>
			</tr>
	        <tr>
	            <td colspan="2">
		            <form name="form" action="uploadFile.do" method="POST" target="hidden_frame" enctype="multipart/form-data">
		                <table>
		                    <tr>
		                        <td>证明文件:<span id="msg_file_path" class="msg_common"></span><br/>
							        <input type="file" name="file" id="file"/>
							        <input class="button" type="submit" value="上传"/>
							        <input name="file_path" value=<%=data.get("file_path") %> type="hidden" id="file_path" />
							        <a id="upload_file_view" href="<%=data.get("file_path")%>" target="blank">查看</a>
							        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
		                        </td>
		                    </tr>
		                </table>
				    </form>
			        <% 
			        	String[] costYearsList = data.get("costYears").split(",");  
			        	int iYears = 0;
			        %>
			        <table id="table_member" class="table_member">
			        	<tr>
			        		<td></td>
			        		<% for (; iYears < costYearsList.length; iYears++) { %>
			        		<td class="td_year_cost">第<%=iYears+1 %>年</td>
			        		<% } %>
			        		<td id="td_addYear"><a href="javascript:addYear()">添加年份</a></td>
			        		<% if (iYears > 1) {%><td id='td_delYear'><a href='javascript:delYear()'>删除年份</a></td><% } %>
			        	</tr>
			        	<tr class="tr_year_cost_input">
			        		<td>每年到帐(万元)</td>
			        		<% for (String costYear: costYearsList) { %>
			        		<td class="td_year_cost_input"><input type="text" class="costYear" value="<%=costYear %>"/></td>
			        		<% } %>
			                <td><span class="msg_common" id="msg_common_1"></span></td>
			        	</tr>
			            <tr>
			                <td>成员/A值分配</td>
			                <td><a href="javascript:addMemberProject()">添加</a></td>
			                <td><span id="msg_members_common" class='msg_common'></span></td>
			            </tr>
			            <%
			            int i = 1;
			            for (Map<String, String> map: members) { %>
			            <tr class="tr_member" id="tr_member_<%=i %>">
			                <td>
			                    <input value="<%=map.get("name")%>" onkeyup="showMembers(this.value, this)" class="member_name" />
			                    <div class='selectM' ></div>
			                    <input value="<%=map.get("user_id")%>" type="hidden" class="member_id" />
			                </td>
			                <td><input value="<%=map.get("a_percent")%>" class="a_percent" id="a_percent_1" type="text" />%</td>
			                <td><% if (i > 1){ %><a class="op" href="javascript:delMemberProject(<%=i %>)">删除</a><% } else { %><a class="op" ></a><% } %></td>
			                <td><span class="msg_common" id="msg_common_1"></span></td>
			            </tr>
			            <% i++;} %>
			        </table>
			        <table class="table_member">
			            <tr>
			                <td>组长:<br/>
			                    <select id="leader_id">
			                    <% for (Map<String, String> map: members) { %>
			                        <option value="<%=map.get("user_id") %>"<% if (map.get("user_id").equals(data.get("leader_id"))) {%>selected<% } %>><%=map.get("name") %></option>
			                    <% } %>
			                    </select>
			                </td>
			                <td></td>
			            </tr>
			        </table>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" class="center"><input class="button" type="button" onclick="modify()" value="提交"/></td>
	        </tr>
	    </table>
	    <div class="box_4">
	    	<h4>说明</h4>
	    	<p><%=(String)application.getAttribute("submitTipProject") %></p>
	    </div>
    </div>
  </body>
    <jsp:include page="include/js.jsp" />
    <script type="text/javascript">
    function addYear() {
    	var i = $(".td_year_cost").length + 1;
    	$(".td_year_cost:last").after($(".td_year_cost:last").clone());
    	$(".td_year_cost:last").text("第" + i + "年");
    	var td_html = '<td class="td_year_cost_input"><input type="text" class="costYear" /></td>';
    	$(".td_year_cost_input:last").after(td_html);
    	$(".td_year_cost_input:last input").val("");
    	$(".tr_member").each(function (){
    		var a_html = '<td class="td_year_a_input"><input class="a_percent" type="text" value="" /></td>';
    		$(this).find(" .td_year_a_input:last").after(a_html);
    	});
    	if (i == 2) {
    		var td_delYear = "<td id='td_delYear'><a href='javascript:delYear()'>删除年份</a></td>";
    		$("#td_addYear").after(td_delYear);
    	}
    }
    function delYear() {
    	var i = $(".td_year_cost").length - 1;
    	if (i == 1) {
    		$("#td_delYear").remove();
    	}
    	$(".td_year_cost:last").remove();
    	$(".td_year_cost_input:last").remove();
    	$(".tr_member").each(function (){
    		$(this).find(".td_year_a_input:last").remove();
    	});
    }
    function addMemberProject(){
    	var i = ++memberI;
      	var tr = $("#tr_member_1").clone().attr("id","tr_member_"+i);
      	tr.find(".msg_common").text("");
      	tr.find(".selectM").css({"border":"none","display":"none"});
      	tr.find(".selectM").html("");
      	tr.find(".member_name").val("");
      	tr.find(".member_name").attr("onkeyup", "showMembers(this.value, this)");
      	tr.find(".member_id").val("");
      	tr.find(".a_percent").val("");
      	tr.find("a.op").attr("href", "javascript:delMemberProject("+i+")").text("删除");
    	$(".tr_member:last").after(tr);
    }
    function delMemberProject(i){
    	tr = $("#tr_member_"+i);
    	id = tr.find(".member_id").val();
    	name = tr.find(".member_name").val();
    	tr.remove();
    }
    
	$(function() {
        $('.date').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-MM-dd'
        });
    });  
  	<% for (Map<String, String> member: memberList) {%>
  	memberNameArray.push('<%=member.get("name")%>');
  	memberIdArray.push('<%=member.get("id")%>');
  	<% } %>
  	var memberI = <%=members.size()%>;
  	$(function() {
	  	<% if (data.get("category").equals("2")) { %>
	  	$(".tr_type").css("display", "none");
	  	$(".tr_type_h").css("display", "table-row");
	  	<% } %>
	  	$('#category').change(function(){ 
		  	var id = $(this).children('option:selected').val();
		  	$(".tr_type").css("display", "none");
		  	$(".tr_type_"+id).css("display", "");
		  	var a_value = $(".tr_type_"+id).find('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	});
	  	$("#type_id_p").change(function(){ 
		  	var a_value = $(this).children('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	}); 	
	  	$("#type_id_h").change(function(){ 
		  	var a_value = $(this).children('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	}); 	
  	});
  	function modify() {
		$(".msg_common").text("");
		var id = $("#id").val();
		var file_path = $("#file_path").val();
	    var title = $("#title").val();
	    var remark = $("#remark").val();
     	var link = $("#link").val();
	    var leader_id = $("#leader_id").val();
	    var number = $("#number").val();
	    var a_value = $("#a_value").val();
     	var plan = $("#plan").val();
	    var date1 = $("#date1").val();
	    var date2 = $("#date2").val();
	    var cost = $("#cost").val();
	    var source = $("#source").val();
	    var status = $("#status").val();
	    var type_id = ($("#category").val() == "p") ? $("#type_id_p").val() : $("#type_id_h").val();
	    var type2013_id = $("#type2013_id").val();
	    var card = $("#card").val();

	   	var flag = true;
	   	var costYears = "";
	   	$(".costYear").each(function () {
	   	   	var v = $(this).val();
	       	if (v == "") {
	   	   		flag = false;
	   	   		$(this).focus();
	   	   		$(this).parent().parent().find(".msg_common").text("不能为空！");
	       	} else if (!isNaN(v)) {
	   			costYears += v + ",";
	   		} else {
	   	   		flag = false;
	   	   		$(this).focus();
	   	   		$(this).parent().parent().find(".msg_common").text("填写数字！");
	   		}
	    });
	   	costYears = costYears.substr(0, costYears.length - 1);

	 	var members = "";
	 	var members_a_percent_sum = 0;
	 	$(".tr_member").each(function (){
	     	var member_id = $(this).find(".member_id").val();
	     	var a_percent_value = $(this).find(".a_percent").val();
	     	if ($(this).find(".member_name").val() == "") {
	    	 	$(this).find(".msg_common").text("请填写成员！");
	         	flag = false;
	     	} else if ($(this).find(".member_id").val() == "") {
	    	 	$(this).find(".msg_common").text("查无此人！");
	         	flag = false;
	     	}
	     	if (!isNaN(a_percent_value)) {
	         	var member_a_percent = parseFloat(a_percent_value) ;
	         	members_a_percent_sum += member_a_percent;
	         	members += member_id + "=" + member_a_percent + "&&";
	     	} else {
	    	 	flag = false;
	    	 	$(this).find(".msg_common").text("只能为0-100的数！");
	     	}
	 	});
	    if (flag) {
	        if (members_a_percent_sum > 100) {
	            $("#msg_members_common").text("A值分配总不能大于100%！");
	       	 flag = false;
	        }
	    }
	    
	    if (title == "") {
	        $("#title").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (number == "") {
	        $("#number").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
     	if (plan == "") {
         	$("#plan").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	}
	    if (date1 == "") {
	        $("#date1").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (date2 == "") {
	        $("#date2").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (source == "") {
	        $("#source").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (cost == "") {
	        $("#cost").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    } else if (isNaN(cost)) {
	        $("#cost").parent().find(".msg_common").text("只能为数！");
	        flag = false;    
	    }
	    if (file_path == "") {
	        $("#file_path").parent().find(".msg_common").text("请上传文件！");
	        flag = false;    
	    }
	    if (card == "") {
	        $("#card").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }

	    if (flag) {
	        var data = new model();
	        data.id = id;
	        data.file_path = file_path;     
	        data.title = title;         
	        data.remark = remark;     
	        data.link = link;               
	        data.leader_id = leader_id;         
	        data.type_id = type_id;  
	        data.type2013_id = type2013_id;  
	        data.card = card;                  
	        data.number = number;         
	        data.a_value = a_value;      
         	data.plan = plan;           
	        data.date1 = date1;          
	        data.date2 = date2;         
	        data.cost = cost;          
	        data.source = source;      
	        data.status = status;                  
	        data.members = members; 
	       	data.costYears = costYears;
	        modifySubmit(data);       
	    }
    }
    function modifySubmit(data){
	 	 $.ajax({
	        url: "submit/projectModify.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
		            if (result == '1') {	
			            alert("修改成功！");
		                window.location.href = "projectList.do?q=0&f=1";
		            } else if (result == '0') {
			            alert("修改失败！");
				    } else {
			            alert("修改失败！"+result);
				    }	
	            }
	   });
  	}
  	function model() {
	  	var id;
      	var file_path;
      	var title;
      	var remark;
      	var link;
      	var leader_id;
     	var type_id;;
        var type2013_id;
        var card;
      	var number;
      	var a_value;
      	var plan;
      	var date1;
      	var date2;
      	var cost;
      	var source;
      	var status;
      	var members;
       	var costYears;
  	}
  	</script>
</html>
