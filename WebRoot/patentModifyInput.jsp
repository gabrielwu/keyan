<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> typeList1 = (ArrayList<Map<String, String>>)request.getAttribute("typeList1");
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
	    <div class="div_title"><h4>修改专利</h4></div>
	    <input id="id" type="hidden" value="<%=data.get("id") %>"/>
	    <table id="table_input_2">
	        <tr>
			    <td colspan="2">专利名称:<span id="msg_" class='msg_common'></span><br />
			        <input id="title" value="<%=data.get("title") %>" type="text" />
			    </td>
			</tr>
	        <tr valign="top">
	            <td>
			        <table>
			            <tr>
			                <td>备注（链接）:<span id="msg_" class='msg_common'></span><br />
			                    <input id="remark" value="<%=data.get("remark") %>" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>专利号:<span id="msg_" class='msg_common'></span><br />
			                    <input id="number" value="<%=data.get("number") %>" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>申请号:<span id="msg_" class='msg_common'></span><br />
			                    <input id="number_apply" value="<%=data.get("number_apply") %>" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>公开号:<span id="msg_" class='msg_common'></span><br />
			                    <input id="number_public" value="<%=data.get("number_public") %>" type="text" />
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
	            <td>
			        <table>
			            <tr>
			                <td>申请日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input readonly="readonly" value="<%=data.get("date_apply") %>" class="date" id="date_apply" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>公开日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input readonly="readonly" value="<%=data.get("date_public") %>" class="date" id="date_public" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_1">
			                <td>类型:<br />
			                    <select id="type_id_1">
			                    <% for (Map<String, String> type: typeList1) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>' <% if (type.get("id").equals(data.get("type_id"))) { %>selected<% } %> value='<%=type.get("id") %>'>
			                            <%=type.get("name") %>
			                        </option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr>
			                <td>A值:<span id="msg_" class='msg_common'></span><br />
			                    <input class="readonly"  value="<%=data.get("a_value") %>" readonly="readonly" id="a_value" type="text" />
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
							        <input name="file_path" value=<%=data.get("file_path") %> type="hidden" id="file_path" value=""/>
							        <a id="upload_file_view" href="<%=data.get("file_path")%>" target="blank">查看</a>
							        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
		                        </td>
		                    </tr>
		                </table>
				    </form>
			        <table id="table_member" class="table_member">
			            <tr>
			                <td>成员</td>
			                <td>A值分配百分比</td>
			                <td><a href="javascript:addMember()">添加</a></td>
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
			                <td><input value="<%=map.get("a_percent")%>" class="a_percent" id="a_percent_1" type="text"  />%</td>
			                <td><% if (i > 1){ %><a class="op" href="javascript:delMember(<%=i %>)">删除</a><% } else { %><a class="op" ></a><% } %></td>
			                <td><span class="msg_common" id="msg_common_1"></span></td>
			            </tr>
			            <% i++;} %>
			        </table>
			        <table class="table_member">
			            <tr>
			                <td>组长:<br/>
			                    <select id="leader_id">
			                    <% for (Map<String, String> map: members) { %>
			                        <option value="<%=map.get("user_id") %>" <% if (map.get("user_id").equals(data.get("leader_id"))) {%>selected<% } %>><%=map.get("name") %></option>
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
	    	<p><%=(String)application.getAttribute("submitTipPatent") %></p>
	    </div>
    </div>
  </body>
    <jsp:include page="include/js.jsp" />
    <script type="text/javascript">
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
	  	//$(".tr_type").css("display", "none");
	  	//$(".tr_type_2").css("display", "table-row");
	  	<% } %>
	  	$('#category').change(function(){ 
		  	var id = $(this).children('option:selected').val();
		  	$(".tr_type").css("display", "none");
		  	$(".tr_type_"+id).css("display", "table-row");
		  	var a_value = $(".tr_type_"+id).find('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	});
	  	$("#type_id_1").change(function(){ 
		  	var a_value = $(this).children('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	}); 	
	  	$("#type_id_2").change(function(){ 
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
	    var a_value = $("#a_value").val();
	    var number = $("#number").val();
	    var number_apply = $("#number_apply").val();
	    var number_public = $("#number_public").val();
	    var date_apply = $("#date_apply").val();
	    var date_public = $("#date_public").val();
	    var type_id = $("#type_id_1").val();
	    var type2013_id = $("#type2013_id").val();
	     
	    var flag = true;
	    var members = "";
	    var members_a_percent_sum = 0;
	    $(".tr_member").each(function (){
	        var member_id = $(this).find(".member_id").val();
	        var a_percent_value = $(this).find(".a_percent").val();
	        if ($(this).find(".member_name").val() == "") {
	        	$(this).find(".msg_common").text("请填写作者！");
	            flag = false;
	        } else if ($(this).find(".member_id").val() == "") {
	            $(this).find(".msg_common").text("查无此人！");
	            flag = false;
	        }
	        if (!isNaN(a_percent_value)) {
		        var member_a_percent = parseFloat(a_percent_value) ;
		        members_a_percent_sum += member_a_percent;
		        // member_id = a_percent && member_id = a_percent && member_id = a_percent 的字符串形式,后台处理
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
	    if (number_apply == "") {
	        $("#number_apply").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (number_public == "") {
	        $("#number_public").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (date_apply == "") {
	        $("#date_apply").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (date_public == "") {
	        $("#date_public").parent().find(".msg_common").text("不能为空！");
	        flag = false;    
	    }
	    if (file_path == "") {
	        $("#file_path").parent().find(".msg_common").text("请上传文件！");
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
	        data.a_value = a_value;      
	        data.number = number; 
	        data.number_apply = number_apply; 
	        data.number_public = number_public; 
	        data.date_apply = date_apply;       
	        data.date_public = date_public;                
	        data.members = members;
	        modifySubmit(data);       
	    }
  	}
  	function modifySubmit(data){
	  	$.ajax({
	        url: "submit/patentModify.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
		            if (result == '1') {	
			            alert("修改成功！");
		                window.location.href = "patentList.do?q=0&f=1";
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
      	var a_value;
      	var number;
      	var number_apply;
      	var number_public;
      	var date_apply;
      	var date_public;
      	var members;
  	}
  	</script>
</html>
