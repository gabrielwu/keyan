<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String tip = (String)request.getAttribute("tip");
String tipType = (String)request.getAttribute("tipType");
String tipTypeText = "";
if (tipType.equals("Paper")) {
	tipTypeText = "论文";
} else if (tipType.equals("Project")) {
	tipTypeText = "项目";
} else if (tipType.equals("Book")) {
	tipTypeText = "著作";
} else if (tipType.equals("Awards")) {
	tipTypeText = "奖项";
} else if (tipType.equals("Patent")) {
	tipTypeText = "专利";
} else if (tipType.equals("Software")) {
	tipTypeText = "软件著作权";
} 
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
    <script type="text/javascript" src="<%=basePath%>media/kindeditor-4.1.9/kindeditor-all-min.js"></script>
  </head>
  <body>
    <div id="add_type" class="box_2">
	    <form action="">
	    	<div class="div_title">
	    		<h3 style="text-align:center; display:block;">提交说明—<%=tipTypeText %></h3>
		    </div>
		    <div class="box_1">
    			<textarea id="tip" name="tip" style="width:800px;height:400px;visibility:hidden;">
    			<%=tip %>
		    	</textarea>
		    </div>
		    <div class="box_1">
		    	<input class="button" type="button" name="submit" value="提交"/>
		    	<input class="button" type="reset" name="clear" value="清空"/>
		    </div>
	    </form>
    </div>
  </body>
    <jsp:include page="../include/js.jsp" />
	<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="tip"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : true,
			items : ['source',  'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'emoticons', 'image', 'link']
		});
		K('input[name=clear]').click(function(e) {
			editor.html('');
		});
	});
	$(function() {
		$('input[name=submit]').click(function(e) {
			modify();
		});
	});
  function model(){
	  var tip;
  }
  function modify() {
	  if (confirm("确认修改？")) {
		  var m = new model();
		  m.tip = editor.html();
		  
		  $.ajax({
		        url: "admin/submitTipModify.do",
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
  </script>
</html>
