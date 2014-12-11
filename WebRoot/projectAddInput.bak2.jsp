<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> typeListH = (ArrayList<Map<String, String>>)request.getAttribute("typeListH");
ArrayList<Map<String, String>> typeListP = (ArrayList<Map<String, String>>)request.getAttribute("typeListP");
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
	    <div class="div_title"><h4>提交项目</h4></div>
	    <table id="table_input_2">
	        <tr>
	            <td colspan="2">项目名称:<span id="msg_" class='msg_common'></span><br />
			        <input id="title" type="text" />
			    </td>
	        </tr>
	        <tr valign="top">
	            <td>
			        <table>
			            <tr>
			                <td>备注（链接）:<span id="msg_" class='msg_common'></span><br />
			                    <input id="remark" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>来源:<span id="msg_" class='msg_common'></span><br />
			                    <input id="source" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>经费（万元）:<span id="msg_" class='msg_common'></span><br />
			                    <input id="cost" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>编号:<span id="msg_" class='msg_common'></span><br />
			                    <input id="number" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>开始日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input readonly="readonly" class="date" id="date1" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>A值:<span id="msg_" class='msg_common'></span><br />
			                    <input class="readonly"  readonly="readonly" id="a_value" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>经费卡号:<span id="msg_" class='msg_common'></span><br />
			                    <input id="card" type="text" />
			                </td>
			            </tr>
			        </table>            
	            </td>
	            <td>
			        <table>
			            <tr>
			                <td>计划名称<span class='msg_format'></span>:<span id="msg_" class='msg_common'></span><br />
			                    <input id="plan" type="text" />
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
			                        <option value='p'>纵向</option>
			                        <option value='h'>横向</option>
			                    </select>
			                </td>
			                <td><span id="msg_" class='msg_common'></span></td>
			            </tr>
			            <tr class="tr_type tr_type_p">
			                <td>类型:<br />
			                    <select id="type_id_p">
			                    <% for (Map<String, String> type: typeListP) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>'><%=type.get("name") %></option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_h" style="display:none">
			                <td>类型:<br />
			                    <select id="type_id_h">
			                    <% for (Map<String, String> type: typeListH) { %>
			                        <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>'><%=type.get("name") %></option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr>
			                <td>结束日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input readonly="readonly" class="date" id="date2" type="text" />
			                </td>
			            </tr>
  		                <tr class="">
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
	        </tr>
	    </table>
	    <table>
	        <tr>
	            <td colspan="5">
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
			        		<td></td>
			        		<td class="td_year_cost">第1年</td>
			        		<td id="td_addYear"><a href="javascript:addYear()">添加年份</a></td>
			        	</tr>
			        	<tr class="tr_year_cost_input">
			        		<td>每年到帐(万元)</td>
			        		<td class="td_year_cost_input"><input type="text" class="costYear" /></td>
			                <td><span class="msg_common" id="msg_common_1"></span></td>
			        	</tr>
			            <tr>
			                <td>成员/A值分配%</td>
			                <td></td>
			                <td></td>
			                <td><span id="msg_members_common" class='msg_common'></span></td>
			            </tr>
			            <tr class="tr_member" id="tr_member_1">
			                <td>
			                    <input onkeyup="showMembers(this.value, this)" class="member_name" />
			                    <div class='selectM' ></div>
			                    <input type="hidden" class="member_id" />
			                </td>
			                <td class="td_year_a_input"><input class="a_percent" type="text" value="" /></td>
			                <td><a class="op" href="javascript:addMemberProject()">添加成员</a></td>
			                <td><span class="msg_common" id="msg_common_1"></span></td>
			            </tr>
			            <tr>
			                <td>组长:<br/>
			                    <select id="leader_id">
			                    </select>
			                </td>
			                <td></td>
			            </tr>
			        </table>
			        <table class="table_member">
			        </table>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" class="center"><input class="button" type="button" onclick="add()" value="提交"/></td>
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
    $('#date_publish').datepicker({
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
	var a_value = $("#type_id_p").children('option:selected').attr("title");
	$("#a_value").val(a_value);
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
function add() {
 	$(".msg_common").text("");
 	var file_path = $("#file_path").val();
   	var title = $("#title").val();
   	var remark = $("#remark").val();
   	var leader_id = $("#leader_id").val();
   	var number = $("#number").val();
   	var a_value = $("#a_value").val();
   	var plan = $("#plan").val();
   	var date1 = $("#date1").val();
   	var date2 = $("#date2").val();
   	var cost = $("#cost").val();
   	var source = $("#source").val();
   	var status = $("#status").val();
   	var type_id = ($("#category").val() == "1") ? $("#type_id_p").val() : $("#type_id_h").val();
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
   	$(".tr_member").each(function (){
       	var member_id = $(this).find(".member_id").val();
       	if ($(this).find(".member_name").val() == "") {
           	$(this).find(".msg_common").text("请填写成员！");
           	flag = false;
           	$(this).find(".member_name").focus();
       	} else if ($(this).find(".member_id").val() == "") {
       	 	$(this).find(".msg_common").text("查无此人！");
           	flag = false;
           	$(this).find(".member_name").focus();
       	}
       	members += member_id + "=";
       	$(this).find(".a_percent").each(function () {
           	var a_percent_value = $(this).val();
           	if (a_percent_value == "") {
       	   		flag = false;
       	   		$(this).focus();
       	   		$(this).parent().parent().find(".msg_common").text("不能为空！");
           	} else if (!isNaN(a_percent_value)) {
    	        var person_a_percent = parseFloat(a_percent_value);
             	members += person_a_percent + "%,";
           	} else {
           	 	$(this).parent().parent().find(".msg_common").text("只能为0-100的数！");
       	   		flag = false;
       	   		$(this).focus();
           	}
        });
       	members = members.substr(0, members.length - 1);
       	members += "&&";
   	});

   	if (flag) {
   	   	var yearsLength = $(".td_year_cost").length;
   	   	var members_a_percent_sum = new Array(yearsLength);
   	   	for (var i = 0; i < members_a_percent_sum.length; i++) {
   	   		members_a_percent_sum[i] = 0;
   	   	   	var membersLength = $(".tr_member").length;
   	   	   	for (var j = 0; j < membersLength; j++) {
   	   	   	   	var tr = $("#table_member .tr_member").eq(j);
   	   	   	   	var v_a = tr.find(".a_percent").eq(i).val();
   	   	   		members_a_percent_sum[i] += parseFloat(v_a) ;
   	   	   	}
   	   	}
   	   	for (var i = 0; i < members_a_percent_sum.length; i++) {
	   	   	if (members_a_percent_sum[i] > 100) {
	            $("#msg_members_common").text("A值分配总不能大于100%！");
	            flag = false;
	        }
   	   	}
    }

    if (title == "") {
       	$("#title").parent().find(".msg_common").text("不能为空！");
       	flag = false;    
    }
    if (remark == "") {
       	$("#remark").parent().find(".msg_common").text("不能为空！");
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
    if (card == "") {
       	$("#card").parent().find(".msg_common").text("不能为空！");
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
   	if (flag) {
       	var data = new model();
       	data.file_path = file_path;     
       	data.title = title;         
       	data.remark = remark;         
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
       	data.costYears = costYears;
       	data.source = source;      
       	data.status = status;                  
       	data.members = members;  
      	addSubmit(data);       
   	}
}
function addSubmit(data){
  	$.ajax({
        url: "submit/projectAdd.do",
		type: 'POST',
		data: data,
		success: 
		    function(result){
	            if (result == '1') {	
		            alert("添加成功！");
	                window.location.href = "projectList.do?q=0&f=1";
	            } else if (result == '0') {
		            alert("添加失败！");
			    } else {
		            alert("添加失败！"+result);
			    }	
            }
   });
}
function model() {
   	var file_path;
   	var title;
   	var leader_id;
   	var type_id;
   	var type2013_id;
   	var card;
   	var type_remark;
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
