<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	          <div class="div_title"><h4>修改密码</h4></div>
	          <table id="table_input" class="table_persnal">
	              <tr>
	                  <td class="right">原密码：</td>
	                  <td>
	                      <input type="password" name="passwordOri" id="passwordOri" />
	                  </td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td class="right">新密码：</td>
	                  <td>
	                      <input type="password" name="password" id="password" />
	                  </td>
	                  <td><span class="msg_common"></span></td>
	              </tr>
	              <tr>
	                  <td class="right">确认密码：</td>
	                  <td>
	                      <input type="password" name="passwordConfirm" id="passwordConfirm" />
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
	  var password;
	  var passwordOri;
	  var passwordConfirm;
  }
  function modify() {
      $(".msg_common").text("");
	  var password = $("#password").val();
	  var passwordOri = $("#passwordOri").val();
	  var passwordConfirm = $("#passwordConfirm").val();
	  var flag = true;
	  if (passwordOri == "") {
	  	  alert("123");
	      $("#passwordOri").parent().parent().find(".msg_common").text("不能为空！");
	      flag = false;    
	  } 
	  if (password == "") {
	      $("#password").parent().parent().find(".msg_common").text("不能为空！");
	         flag = false;    
	  }
	  if (password != passwordConfirm) {
	      $("#passwordConfirm").parent().parent().find(".msg_common").text("两次密码不一致！");
	      flag = false;    
	  }
	  if (flag) {
          var data = new model();
          data.password = password;
	      data.passwordOri = passwordOri;
          data.passwordConfirm = passwordConfirm;
	      modifySubmit(data);       
	  }

  }
  function modifySubmit(data) {
	  $.ajax({
	        url: "personal/passwordModify.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
		            if (result == '1') {	
			            alert("密码修改成功！");
		            } else if (result == '0') {
			            alert("原始密码错误！修改失败！");
				    } else {
			            alert("密码修改失败！");
				    }	
	            }
	   });
  }
  </script>
</html>
