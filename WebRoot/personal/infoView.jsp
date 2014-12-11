<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String, String> data = (Map<String,String>)request.getAttribute("data");
ArrayList<Map<String, String>> labList = (ArrayList<Map<String, String>>)request.getAttribute("labList");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'personalInfo.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<jsp:include page="../include/css.jsp" />
    <jsp:include page="../include/js.jsp" />
  </head>
  <body>
      <div class="box_2">
          <form>
	          <div class="div_title"><h4>个人信息</h4></div>
	          <table id="table_input" class="table_persnal">
	              <tr>
	                  <td class="right">姓名：</td>
	                  <td>
	                      <input value="<%=data.get("name") %>" name="name" id="name" />
	                  </td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td class="right">用户名：</td>
	                  <td>
	                      <input readonly="readonly" class="readonly" value="<%=data.get("username") %>" name="username" id="username" />
	                  </td>
	                  <td><span class="msg_common">为工资号，不得更改</span></td>
	              </tr>
	              <tr>
	                  <td class="right">实验室：</td>
	                  <td>
	                      <select name="lab_id" id="lab_id">
	                      <% for (Map<String, String> map: labList) { %>
	                          <option value="<%=map.get("id") %>" <% if (map.get("id").equals(data.get("lab_id"))) { %>selected<% } %>><%=map.get("name") %></option>
	                      <% } %>
	                      </select>
	                  </td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td class="right">性别：</td>
	                  <td>
	                      <label><input class="radio sex" type="radio" name="sex" value="男" <% if (data.get("sex").equals("男")) { %>checked<% } %> id="sex1">男</label>
	                      <label><input class="radio sex" type="radio" name="sex" value="女" <% if (data.get("sex").equals("女")) { %>checked<% } %> id="sex2">女</label>
	                  </td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td class="right">用户类型：</td>
	                  <td><%=data.get("type_name")%></td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td class="right">在/离职：</td>
	                  <td>
	                      <label><input class="radio off" type="radio" name="off" value="0" <% if (data.get("off").equals("0")) { %>checked<% } %> id="off1">在职</label>
	                      <label><input class="radio off" type="radio" name="off" value="1" <% if (data.get("off").equals("1")) { %>checked<% } %> id="off2">离职</label>
	                  </td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td colspan="2" class="center">
	                      <input class="button" type="button" onclick="modify()" value="修改" />
	                      <input class="button" type="reset" value="恢复" />
	                  </td>
	              </tr>
	          </table>
          </form>
      </div>
  </body>
  <script type="text/javascript">
  function model() {
	  var name;
	  var username;
	  var off;
	  var lab_id;
	  var sex;
  }
  function modify() {
		 $(".msg_common").text("");
		 var name = $("#name").val();
	     var username = $("#username").val();
	     var off = $(".off:checked").val();
	     var lab_id = $("#lab_id").val();
	     var sex = $(".sex:checked").val();
	     
	     var flag = true;

	     if (name == "") {
	         $("#name").parent().parent().find(".msg_common").text("不能为空！");
	         flag = false;    
	     }
	     if (username == "") {
	         $("#username").parent().parent().find(".msg_common").text("不能为空！");
	         flag = false;    
	     }
	     if (flag) {
	         var data = new model();
	         data.name = name;
	         data.username = username;     
	         data.off = off;         
	         data.lab_id = lab_id;         
	         data.sex = sex;        
	         modifySubmit(data);       
	     }

  }
  function modifySubmit(data) {
	  $.ajax({
	        url: "personal/infoModify.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
		            if (result == '1') {	
			            alert("修改成功！");
		            } else if (result == '0') {
			            alert("修改失败！");
				    } else {
			            alert("用户名重复！修改失败！");
				    }	
	            }
	   });
  }
  </script>
</html>
