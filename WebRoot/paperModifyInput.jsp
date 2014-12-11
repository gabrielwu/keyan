<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> typeJList = (ArrayList<Map<String, String>>)request.getAttribute("typeJList");
ArrayList<Map<String, String>> typeCList = (ArrayList<Map<String, String>>)request.getAttribute("typeCList");
ArrayList<Map<String, String>> typeList2 = (ArrayList<Map<String, String>>)request.getAttribute("typeList2");
ArrayList<Map<String, String>> areaList = (ArrayList<Map<String, String>>)request.getAttribute("areaList");
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
	    <div class="div_title"><h4>修改论文</h4></div>
	    <input id="id" type="hidden" value="<%=data.get("id") %>"/>
	    <table id="table_input_2">
	        <tr>
	            <td colspan="2">论文题目:<span id="msg_" class='msg_common'></span><br />
			        <input value="<%=data.get("title")%>" id="title" type="text" />
			    </td>
	        </tr>
	        <tr valign="top">
	            <td>
			        <table>
			            <tr>
			                <td>论文链接:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("link")%>" id="link" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>关键词<span class='msg_format'>(逗号,分割)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("keywords")%>" id="keywords" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>检索号:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("number")%>" id="number" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>影响因子:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("factor")%>" id="factor" type="text" /></td>
			                <td><span id="msg_" class='msg_common'></span></td>
			            </tr>
			            <tr>
			                <td>引用次数:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("citiations")%>" id="citiations" type="text" /></td>
			                <td><span id="msg_" class='msg_common'></span></td>
			            </tr>
			            <tr>
			                <td>发表日期<span class='msg_format'>(格式:yyyy-mm)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("date_publish")%>" readonly="readonly" class="date" id="date_publish" type="text" />
			                </td>
			            </tr>
  		                <tr class="">
  		                    <td>CCF推荐:<br />
  		                        <select id="type2013_id">
  		                        <% for (Map<String, String> type: typeList2) { %>
  		                            <option title="<%=type.get("a_value") %>" value='<%=type.get("id") %>' <% if (type.get("id").equals(data.get("type2013_id"))) { %>selected<% } %>><%=type.get("name") %></option>
  		                        <%} %>
  		                        </select>
  		                    </td>
			            </tr>
  		                <tr class="">
			                <td>JCR分区情况:<br />
			                    <select id="area_id">
			                    <% for (Map<String, String> area: areaList) { %>
			                        <option title="<%=area.get("a_value") %>" value='<%=area.get("id") %>' <% if (area.get("id").equals(data.get("area_id"))) { %>selected<% } %>><%=area.get("name") %></option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			        </table>            
	            </td>
	            <td>
			        <table>
			            <tr>
			                <td>期刊/会议:<br />
			                    <select id="category">
			                        <option value='j' <% if ("1".equals(data.get("category"))) { %>selected<% } %>>期刊</option>
			                        <option value='c' <% if ("2".equals(data.get("category"))) { %>selected<% } %>>会议</option>
			                    </select>
			                </td>
			                <td><span id="msg_" class='msg_common'></span></td>
			            </tr>
			            <tr class="tr_type tr_type_j">
			                <td>期刊类型:<br />
			                    <select id="type_id_j">
			                    <% for (Map<String, String> type: typeJList) { %>
			                        <option title="<%=type.get("a_value") %>"<% if (type.get("id").equals(data.get("type_id"))) { %>selected<% } %> value='<%=type.get("id") %>'>
			                        <%=type.get("name") %>
			                        </option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_j">
			                <td>期刊名称:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("publication")%>" id="publication_j" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_j">
			                <td>卷:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("j_volume")%>" id="j_volume" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_j">
			                <td>期:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("j_issue")%>" id="j_issue" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_j">
			                <td>页:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("j_page")%>" id="j_page" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_c" style="display:none">
			                <td>会议类型:<br />
			                    <select id="type_id_c">
			                    <% for (Map<String, String> type: typeCList) { %>
			                        <option title="<%=type.get("a_value") %>" <% if (type.get("id").equals(data.get("type_id"))) { %>selected<% } %> value='<%=type.get("id") %>'>
			                        <%=type.get("name") %>
			                        </option>
			                    <%} %>
			                    </select>
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_c" style="display:none">
			                <td>会议名称:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("publication")%>" id="publication_c" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_c" style="display:none">
			                <td>会议日期<span class='msg_format'>(格式:yyyy-mm-dd)</span>:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("c_date")%>" readonly="readonly" class="date" id="c_date" type="text" />
			                </td>
			            </tr>
			            <tr class="tr_type tr_type_c" style="display:none">
			                <td>会议地点:<span id="msg_" class='msg_common'></span><br />
			                    <input value="<%=data.get("c_location")%>" id="c_location" type="text" />
			                </td>
			            </tr>
			            <tr>
			                <td>A值:<span id="msg_" class='msg_common'></span><br />
			                    <input class="readonly"  value="<%=data.get("a_value")%>" readonly="readonly" id="a_value" type="text" />
			                </td>
			            </tr>
			        </table>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2">中文摘要:<span id="msg_" class='msg_common'></span><br />
			        <textarea rows="" cols="" id="_abstract"><%=data.get("abstract")%></textarea>
			    </td>
	        </tr>
	        <tr>
	            <td colspan="2">英文摘要:<span id="msg_" class='msg_common'></span><br />
			        <textarea rows="" cols="" id="_abstract_en"><%=data.get("abstract_en")%></textarea>
			    </td>
	        </tr>
			<tr>
			    <td colspan="2">备注:<span id="msg_" class='msg_common'></span><br />
			        <textarea rows="" cols="" id="remark"><%=data.get("remark")%></textarea>
			    </td>
			</tr>
	        <tr>
	            <td colspan="2">作者（生成文献用，逗号分隔，中文名或英文名）:<span id="msg_" class='msg_common'></span><br />
	                <input id="authors" value="<%=data.get("authors")%>" style="width:480px" type="text" />
			    </td>
			</tr>
	        <tr>
	            <td colspan="2">
		            <form name="form" action="uploadFile.do" method="POST" target="hidden_frame" enctype="multipart/form-data">
		                <table>
		                    <tr>
		                        <td>论文pdf文件:<span id="msg_file_path" class="msg_common"></span><br/>
							        <input type="file" name="file" id="file"/>
							        <input class="button" type="submit" value="上传"/>
							        <input name="file_path" value="<%=data.get("file_path")%>" type="hidden" id="file_path"/>
							        <a id="upload_file_view" href="<%=data.get("file_path")%>" target="blank">查看</a>
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
			                <td>通讯作者:<br/>
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
	    	<p><%=(String)application.getAttribute("submitTipPaper") %></p>
	    </div>
    </div>
  </body>
    <jsp:include page="include/js.jsp" />
  	<script type="text/javascript">
	$(function() {
        $('#c_date').datepicker({
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
  	var memberI = <%=members.size()%>;
  	$(function() {
	    <% if (data.get("category").equals("2")) { %>
	  	$(".tr_type").css("display", "none");
	  	$(".tr_type_c").css("display", "table-row");
	  	<% } %>
	  	$('#category').change(function(){ 
		  	var id = $(this).children('option:selected').val();
		  	$(".tr_type").css("display", "none");
		  	$(".tr_type_"+id).css("display", "");
		  	var a_value = $(".tr_type_"+id).find('option:selected').attr("title");
		  	$("#a_value").val(a_value);
		});
		$("#type_id_j").change(function(){ 
		  	var a_value = $(this).children('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	}); 	
	  	$("#type_id_c").change(function(){ 
		  	var a_value = $(this).children('option:selected').attr("title");
		  	$("#a_value").val(a_value);
	  	}); 	
  	});
  	function modify() {
	 	$(".msg_common").text("");
	 	var file_path = $("#file_path").val();
     	var id = $("#id").val();
     	var title = $("#title").val();
     	var remark = $("#remark").val();
     	var link = $("#link").val();
     	var leader_id = $("#leader_id").val();
     	var keywords = $("#keywords").val();
     	var _abstract = $("#_abstract").val();
     	var _abstract_en = $("#_abstract_en").val();
     	var number = $("#number").val();
     	var factor = $("#factor").val();
     	var a_value = $("#a_value").val();
     	var citiations = $("#citiations").val();
     	var date_publish = $("#date_publish").val();
        var authors = $("#authors").val();
     	if ($("#category").val() == "j") {
     	    var type_id = $("#type_id_j").val();
        	var publication = $("#publication_j").val();
         	var j_volume = $("#j_volume").val();
         	var j_issue = $("#j_issue").val();
         	var j_page = $("#j_page").val();
         	var c_date = "";
         	var c_location = "";
     	} else {
         	var type_id = $("#type_id_c").val();
         	var publication = $("#publication_c").val();
         	var j_volume = "";
         	var j_issue = "";
         	var j_page = "";
         	var c_date = $("#c_date").val();
         	var c_location = $("#c_location").val();
     	}
	    var type2013_id = $("#type2013_id").val();
	    var area_id = $("#area_id").val();

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
     	if (keywords == "") {
         	$("#keywords").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	}
     	if (_abstract == "") {
         	$("#_abstract").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	}
     	if (_abstract_en == "") {
         	$("#_abstract_en").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	}
     	if (number == "") {
         	$("#number").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	}
     	if (date_publish == "") {
         	$("#date_publish").parent().find(".msg_common").text("不能为空！");
         	flag = false;    
     	} else if (date_publish > dateE || date_publish < dateS) {
            $("#date_publish").parent().find(".msg_common").text("只能为当年成果！");
            flag = false;    
        }
        if (factor == "") {
            $("#factor").parent().find(".msg_common").text("不能为空！");
            flag = false;    
        }
        if (citiations == "") {
            $("#citiations").parent().find(".msg_common").text("不能为空！");
            flag = false;    
        }
     	if (file_path == "") {
         	$("#file_path").parent().find(".msg_common").text("请上传文件！");
         	flag = false;    
     	}
        if (authors == "") {
            $("#authors").parent().find(".msg_common").text("不能为空");
            flag = false;    
        }
     	if ($("#category").val() == "j") {
    	 	if (publication == "") {
             	$("#publication_j").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
    	 	if (j_volume == "") {
             	$("#j_volume").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
    	 	if (j_issue == "") {
             	$("#j_issue").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
    	 	if (j_page == "") {
             	$("#j_page").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
     	} else {
    	 	if (publication == "") {
             	$("#publication_c").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
    	 	if (c_date == "") {
             	$("#c_date").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
    	 	if (c_location == "") {
             	$("#c_location").parent().find(".msg_common").text("不能为空！");
             	flag = false;    
         	}
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
		    data.area_id = area_id;     
         	data.keywords = keywords;         
         	data._abstract = _abstract;       
         	data._abstract_en = _abstract_en;   
         	data.number = number;         
         	data.factor = factor;         
         	data.a_value = a_value;         
         	data.citiations = citiations;              
         	data.date_publish = date_publish;         
        	data.publication = publication;         
         	data.j_volume = j_volume;         
         	data.j_issue = j_issue;           
         	data.j_page = j_page;           
         	data.c_date = c_date;           
         	data.c_location = c_location;           
         	data.members = members;     
            data.authors = authors;  
         	modifySubmit(data);       
     	}
  	}
  	function modifySubmit(data){
	  	$.ajax({
	        url: "submit/paperModify.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
		            if (result == '1') {	
			            alert("修改成功！");
		                window.location.href = "paperList.do?q=0&f=1";
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
      	var leader_id;
      	var type_id;
        var type2013_id;
      	var keywords;
      	var _abstract;
      	var _abstract_en;
      	var remark;
      	var link;
      	var number;
      	var factor;
      	var a_value;
      	var citiations;
      	var date_publish;
      	var publication;
      	var j_volume;
      	var j_issue;
      	var j_page;
      	var c_date;
      	var c_location;
      	var members;
        var authors;
  	}
  	</script>
</html>
