<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> typeList1 = (ArrayList<Map<String, String>>)request.getAttribute("typeList1");
ArrayList<Map<String, String>> typeList2 = (ArrayList<Map<String, String>>)request.getAttribute("typeList2");
ArrayList<Map<String, String>> memberList = (ArrayList<Map<String, String>>)request.getAttribute("memberList");
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
	    <div class="div_title"><h4>提交软件著作权</h4></div>
	    <table id=table_input_2>
	        <tr>
	            <td colspan="2">名称:<span id="msg_" class='msg_common'></span><br />
			        <input id="title" type="text" />
			    </td>
	        </tr>
	        <tr valign="top">
	            <td>
			        <table>
			            <tr>
			                <td>链接:<span id="msg_" class='msg_common'></span><br />
			                    <input id="link" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>登记号:<span id="msg_" class='msg_common'></span><br />
			                    <input id="number" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>发表日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input readonly="readonly" class="date" id="date_publish" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>2013类型:<br />
			                    <select id="type2013_id">
			                    <% for (Map<String, String> type: typeList2) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>'><%=type.get("name") %></option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			        </table>            
	            </td>
	            <td>
			        <table>
			            <tr>
			                <td>授权日期:<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input readonly="readonly" class="date" id="date_authorized" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_1">
			                <td>类型:<br />
			                    <select id="type_id_1">
			                    <% for (Map<String, String> type: typeList1) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>'><%=type.get("name") %></option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr>
			                <td>A值:<span id="msg_" class='msg_common'></span><br />
			                    <input class="readonly"  readonly="readonly" id="a_value" type="text" />
			                </td>
			            </tr>
			        </table>
	            </td>
	        </tr>
              <tr>
                  <td colspan="2">备注:<span id="msg_" class='msg_common'></span><br />
                  	<textarea rows="" cols="" id="remak"></textarea>
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
							        <input name="file_path" type="hidden" id="file_path" value=""/>
							        <a id="upload_file_view" href=""></a>
							        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
		                        </td>
		                    </tr>
		                </table>
				    </form>
			        <table id="table_member" class="table_member">
			            <tr>
			                <td>作者</td>
			                <td>A值分配百分比</td>
			                <td><a href="javascript:addMember()">添加</a></td>
			                <td><span id="msg_members_common" class='msg_common'></span></td>
			            </tr>
			            <tr class="tr_member" id="tr_member_1">
			                <td>
			                    <input onkeyup="showMembers(this.value, this)" class="member_name" />
			                    <div class='selectM' ></div>
			                    <input type="hidden" class="member_id" />
			                </td>
			                <td><input class="a_percent" id="a_percent_1" type="text" />%</td>
			                <td><a class="op"></a></td>
			                <td><span class="msg_common" id="msg_common_1"></span></td>
			            </tr>
			        </table>
			        <table class="table_member">
			            <tr>
			                <td>组长:<br/>
			                    <select id="leader_id">
			                    </select>
			                </td>
			                <td></td>
			            </tr>
			        </table>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" class="center"><input class="button" type="button" onclick="add()" value="提交"/></td>
	        </tr>
	    </table>
	    <div class="box_4">
	    	<h4>说明</h4>
	    	<p><%=(String)application.getAttribute("submitTipSoftware") %></p>
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
        $('#date_press').datepicker({
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
  	<% for (Map<String, String> member: memberList) {%>
  	memberNameArray.push('<%=member.get("name")%>');
  	memberIdArray.push('<%=member.get("id")%>');
  	<% } %>
  	var memberI = 1;
  	$(function() {
	  	var a_value = $("#type_id_1").children('option:selected').attr("title");
	  	$("#a_value").val(a_value);
	  	$("#type_id_1").change(function(){ 
		  	var a_value = $(this).children('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	}); 
  	});
  	function add() {
	 	$(".msg_common").text("");
	 	var file_path = $("#file_path").val();
     	var title = $("#title").val();
     	var remark = $("#remark").val();
        var link = $("#link").val();
     	var leader_id = $("#leader_id").val();
     	var a_value = $("#a_value").val();
     	var number = $("#number").val();
     	var date_publish = $("#date_publish").val();
     	var date_authorized = $("#date_authorized").val();
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
     	if (date_publish == "") {
         	$("#date_publish").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	}
     	if (date_authorized == "") {
         	$("#date_authorized").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	} else if (date_authorized > dateE || date_authorized < dateS) {
            $("#date_authorized").parent().find(".msg_common").text("只能为当年成果！");
            flag = false;    
        }
     	if (file_path == "") {
         	$("#file_path").parent().find(".msg_common").text("请上传文件！");
         	flag = false;    
     	}

     	if (flag) {
         	var data = new model();
         	data.file_path = file_path;     
         	data.title = title;         
         	data.remark = remark;    
           	data.link = link;             
         	data.leader_id = leader_id;         
         	data.type_id = type_id;   
	        data.type2013_id = type2013_id; 
         	data.a_value = a_value;      
         	data.number = number;          
         	data.date_publish = date_publish;                      
         	data.date_authorized = date_authorized;                              
         	data.members = members;  
         	addSubmit(data);       
     	}
  	}
  	function model() {
      	var file_path;
      	var title;
      	var remark;
      	var link;
      	var leader_id;
      	var type_id;;
        var type2013_id;
      	var a_value;
      	var number;
      	var date_publish;
      	var date_authorized;
      	var members;
  	}
  	function addSubmit(data){
	  	$.ajax({
	        url: "submit/softwareAdd.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
		            if (result == '1') {	
			            alert("添加成功！");
		                window.location.href = "softwareList.do?q=0&f=1";
		            } else if (result == '0') {
			            alert("添加失败！");
				    } else {
			            alert("添加失败！"+result);
				    }	
	            }
	   	});
  	}
  	</script>
</html>
