<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> dataList = (ArrayList<Map<String, String>>)request.getAttribute("dataList");
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
  </head>
  <body>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新实验室</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>实验室</td>
		            <td><input id="add_name"/></td>
		        </tr>
		    </table>
	    </form>
    </div>
    <div class="box_1">
    <table id="tb1">
	    <thead>
	       <tr>
	           <th>实验室名称</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_op"><a href="javascript:modify(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
  </body>
    <jsp:include page="../include/js.jsp" />
	<script>
	$(function () {
	    $('#tb1').dataTable({	    
		        "bJQueryUI": true,
		        "aaSorting": [[3, "asc"],[1, "asc"]],
				"sPaginationType": "full_numbers",
				"iDisplayLength": 25,
				"oLanguage": {
	                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
	            }
		});
	});
  function modify(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";
      tr.find(".td_name").html(html_n);
      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyPaper("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  } 
  function modifyCancel(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
      tr.find(".td_name").html(name);
      var html_op = "<a href='javascript:modify("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function model(){
	  var id;
	  var name;
  }
  function modifySubmit(id) {
	  var tr = $("#tr_"+id);
	  // ！校验
	  if (confirm("确认修改？")) {
		  var m = new model();
		  m.id = id;
		  m.name = tr.find(".td_name .m").val();
		  $.ajax({
		        url: "admin/labModify.do",
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
  function del(id){
	  if (confirm("确认删除？")) {
		  var m = new model();
		  m.id = id;
		  $.ajax({
		        url: "admin/labDelete.do",
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
	  $.ajax({
		  url: "admin/labAdd.do",
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
