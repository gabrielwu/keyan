<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> dataList = (ArrayList<Map<String, String>>)request.getAttribute("dataList");
ArrayList<Map<String, String>> labList = (ArrayList<Map<String, String>>)request.getAttribute("labList");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'typeAdmin.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <jsp:include page="../include/css.jsp" />
    <jsp:include page="../include/js.jsp" />
  </head>
  <body>
    <div id="add_user" class="box_2">
	    <form action="">
		    <span>添加新用户</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>姓名</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>用户名(初始密码)</td>
		            <td><input id="add_username"/></td>
		        </tr>
		        <tr>
		            <td>实验室</td>
		            <td>
		                <select id="add_lab_id">
		                <% for (Map<String, String> map:labList) { %>
		                    <option value="<%=map.get("id")%>"><%=map.get("name") %></option>
		                <% } %>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td>用户类型</td>
		            <td>
		                <select id="add_type">
		                    <option value="0">普通用户</option>
		                    <option value="1">管理员</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td>性别</td>
		            <td>
		                <select id="add_sex">
		                    <option value="男">男</option>
		                    <option value="女">女</option>
		                </select>
		            </td>
		        </tr>
		    </table>
	    </form>
    </div>
    <div class="box_1">
    <table id="tb1">
	    <thead>
	       <tr>
	           <th>姓名</th>
	           <th>用户名</th>
	           <th>实验室</th>
	           <th>性别</th>
	           <th>用户类型</th>
	           <th>在/离职</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_username"><%=data.get("username") %></td>
	           <td class="td_lab_id" ><input type="hidden" value="<%=data.get("lab_id") %>"><%=data.get("lab_name") %></td>
	           <td class="td_sex"><%=data.get("sex") %></td>
	           <td class="td_type"><input type="hidden" value="<%=data.get("type") %>"><% if (data.get("type").equals("1")){ %>管理员<% }else{ %>普通用户<%} %></td>
	           <td class="td_off"><input type="hidden" value="<%=data.get("off") %>"><% if (data.get("off").equals("1")){ %>离职<% }else{ %>在职<%} %></td>
	           <td class="td_op">
	               <a href="javascript:modify(<%=data.get("id") %>)">修改</a>|
	               <a href="javascript:resetPassword(<%=data.get("id") %>)">重置密码</a>|
	               <a href="javascript:del(<%=data.get("id") %>)">删除</a>
	           </td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    
  </body>
	<script>
	$(function () {
	    $('#tb1').dataTable({	    
		        "bJQueryUI": true,
		        "aaSorting": [[3, "asc"],[1, "asc"]],
				"sPaginationType": "full_numbers",
				"iDisplayLength": 10,
				"oLanguage": {
	                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
	            }
		});
	});
  function modify(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var username = tr.find(".td_username").text();
	  var sex = tr.find(".td_sex").text();
	  var lab_id = tr.find(".td_lab_id input").val();
	  var lab_id_name = tr.find(".td_lab_id").text();
	  var type = tr.find(".td_type input").val();
	  var type_name = tr.find(".td_type").text();
	  var off = tr.find(".td_off input").val();
	  var off_name = tr.find(".td_off").text();

	  var html_name = "<input class='m' type='text' value='"+name+"'>";
	  html_name += "<input class='hidden' type='hidden' value='"+name+"'>";
	  var html_username = "<input class='m' type='text' value='"+username+"'>";
	  html_username += "<input class='hidden' type='hidden' value='"+username+"'>";
	  var html_sex = "<select class='m'><option value='男'>男</option><option value='女'>女</option></select>";
	  html_sex += "<input class='hidden' type='hidden' value='"+sex+"'>";
	  var html_type = "<select class='m'><option value='0'>普通用户</option><option value='1'>管理员</option></select>";
	  html_type += "<input class='hidden' type='hidden' value='"+type+"' title='"+type_name+"'>";
	  var html_off = "<select class='m'><option value='0'>在职</option><option value='1'>离职</option></select>";
	  html_off += "<input class='hidden' type='hidden' value='"+off+"' title='"+off_name+"'>";
	  var html_lab_id = "<input class='hidden' type='hidden' value='"+lab_id+"' title='"+lab_id_name+"'>";
	  
      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancel("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      html_op += "<a href='javascript:resetPassword("+id+")'>重置密码</a>";

	  var html_lab_list = $("#add_lab_id").clone().attr("id","lab_id_"+id);
	  html_lab_list.attr("class", "m");
	  
      tr.find(".td_name").html(html_name);
      tr.find(".td_username").html(html_username);
      tr.find(".td_sex").html(html_sex);
      tr.find(".td_type").html(html_type);
      tr.find(".td_off").html(html_off);
      tr.find(".td_lab_id").html(html_lab_id);
      tr.find(".td_lab_id").append(html_lab_list);
      tr.find(".td_op").html(html_op);

      tr.find(".td_sex option").each(function (){
          if ($(this).val() == sex) {
              $(this).attr("selected", "selected");
          }
      });
      tr.find(".td_type option").each(function (){
          if ($(this).val() == type) {
              $(this).attr("selected", "selected");
          }
      });
      tr.find(".td_off option").each(function (){
          if ($(this).val() == off) {
              $(this).attr("selected", "selected");
          }
      });
      tr.find(".td_lab_id option").each(function (){
          if ($(this).val() == lab_id) {
              $(this).attr("selected", "selected");
          }
      });
  } 
  function modifyCancel(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var username = tr.find(".td_username .hidden").val();
	  var sex = tr.find(".td_sex .hidden").val();
	  
	  var lab_id = tr.find(".td_lab_id .hidden").val();
	  var lab_id_name = tr.find(".td_lab_id .hidden").attr("title");
	  var lab_id_html = lab_id_name + "<input type='hidden' value='"+lab_id+"'>";
	  var type = tr.find(".td_type .hidden").val();
	  var type_name = tr.find(".td_type .hidden").attr("title");
	  var type_html = type_name + "<input type='hidden' value='"+type+"'>";
	  var off = tr.find(".td_off .hidden").val();
	  var off_name = tr.find(".td_off .hidden").attr("title");
	  var off_html = off_name + "<input type='hidden' value='"+off+"'>";
	  
      tr.find(".td_name").html(name);
      tr.find(".td_username").html(username);
      tr.find(".td_sex").html(sex);
      tr.find(".td_type").html(type_html);
      tr.find(".td_lab_id").html(lab_id_html);
      tr.find(".td_off").html(off_html);
      var html_op = "<a href='javascript:modify("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>|";
      html_op += "<a href='javascript:resetPassword("+id+")'>重置密码</a>";
      tr.find(".td_op").html(html_op);
  }
  function model(){
	  var id;
	  var name;
	  var lab_id;
	  var username;
	  var password;
	  var type;
	  var sex;
	  var off;
  }
  function modifySubmit(id) {
	  var tr = $("#tr_"+id);
	  // ！校验
	  if (confirm("确认修改？")) {
		  var m = new model();
		  m.id = id;
		  m.name = tr.find(".td_name .m").val();
		  m.lab_id = tr.find(".td_lab_id .m").val();
		  m.username = tr.find(".td_username .m").val();
		  m.password = "";
		  m.type = tr.find(".td_type .m").val();
		  m.sex = tr.find(".td_sex .m").val();
		  m.off = tr.find(".td_off .m").val();
		  $.ajax({
		        url: "admin/userModify.do",
				type: 'POST',
				data: m,
				success: 
				    function(result){
			            if (result == '1') {	
				            alert("修改成功！");
			                window.location.reload();
			            } else if (result == '0') {
				            alert("修改失败！");
					    } else {
				            alert(result + "修改失败！");
					    }
		            }
		   });
	  }
  }
  function resetPassword(id) {
	  var tr = $("#tr_"+id);
	  // ！校验
	  if (confirm("密码将还原为用户名，确认重置密码？")) {
		  var m = new model();
		  m.id = id;
		  $.ajax({
		        url: "admin/userResetPassword.do",
				type: 'POST',
				data: m,
				success: 
				    function(result){
			            if (result == '1') {	
				            alert("操作成功！");
			            } else if (result == '0') {
				            alert("操作失败！");
					    } else {
				            alert(result + "修改失败！");
					    }
		            }
		   });
	  }
  }
  function del(id){
	  if (confirm("确认删除？")) {
		  var m = new model();
		  m.id = id;
		  $.ajax({
		        url: "admin/userDelete.do",
				type: 'POST',
				data: m,
				success: 
				    function(result){
			            if (result == '1') {	
				            alert("删除成功！");
			                window.location.reload();
			            } else if (result == '0') {
				            alert("删除失败！");
					    } else {
				            alert(result + "删除失败！");
					    }
		            }
		   });
	  }
  }
  function add(){
	  var m = new model();
	  m.name = $("#add_name").val();
	  m.username = $("#add_username").val();
	  m.type = $("#add_type").val();
	  m.lab_id = $("#add_lab_id").val();
	  m.sex = $("#add_sex").val();
	  $.ajax({
		  url: "admin/userAdd.do",
		  type: 'POST',
		  data: m,
		  success: 
			  function(result){
		          if (result == '1') {	
				      alert("添加成功！");
			          window.location.reload();
			       } else if (result == '0') {
				       alert("添加失败！");
				   } else {
			           alert(result + "添加失败！");
				   }
	          }
      });
  }
  </script>
</html>
