<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<Map<String, String>> labList = (ArrayList<Map<String, String>>)request.getAttribute("labList");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'report.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
    <jsp:include page="../include/css.jsp" />
	<style type="text/css">
	.box_1 {margin:10px auto; width:80%;*margin:10px 40px;}
	#search_tb input,#search_tb select {width: 100px;}
	</style>
  </head>
  <body>
    <div id="" class="box_1">
        <div class="div_title">
            <h4>报表</h4>
        </div>      
        <form action="admin/reportDownload.do">
		<table id="search_tb">
	        <tr>
	            <td class="left">审核状态
	                <select id="pass" name="pass">
	                    <option value="'1','2','3'">全部</option>
	                    <option value="'1'">通过</option>
	                    <option value="'2'">未通过</option>
	                    <option value="'3'">未审核</option>
	                </select>
	            </td>
	            <td class="left">提交日期范围
                    <input readonly="readonly" class="date" name="date1" id="date1" />到
                    <input readonly="readonly" class="date" name="date2" id="date2" />
                </td>
	            <td class="left">A值奖金基数
                    <input value="<%=(String)application.getAttribute("aRMBRatio") %>" name="aRMBRatio" id="aRMBRatio" />
                 </td>
	            <td class="left"><input type="reset" class="button"/></td>
	            <td class="left" id="total_td">
	                <a href="javascript:generateTotal()">生成总表</a>&nbsp;<a id="downloadTotal"></a>
	            </td>
	        </tr>
	    </table>
	    </form>
    </div>
    <div class="box_1">
        <table class="tb_all_op">
           <tr>
               <td>全部<input type="checkbox" class="selectAll" title="1" id="selectAll_1"/>|
                   <a href="javascript:generateBatch()">生成所有实验室报表</a>&nbsp;
                   <a id="downloadLabs"></a>
           </tr>
        </table>
	    <table id="tb1">
		    <thead>
		       <tr>
		           <th width="10%">选择</th>
		           <th>实验室</th>
		           <th>操作</th>
		       </tr>
	       </thead>
	       <tbody>
		       <% 
		       for (Map<String, String> map : labList) {
		       %>
		       <tr id="tr_<%=map.get("id") %>">
		           <td class="center"><input value="<%=map.get("id") %>" class="checkbox" type="checkbox" name="checkbox"/></td>
		           <td class="td_name"><%=map.get("name") %></td>
		           <td class="td_op"><a href="javascript:generate(<%=map.get("id") %>)">生成报表</a>&nbsp;<a class="download"></a></td>
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
				"sPaginationType": "full_numbers",
				"iDisplayLength": 100,
				"oLanguage": {
	                "sUrl": "<%=basePath%>media/datatables/zh-cn.txt"
	            }
		});
	    $('.date').datepicker({
	        changeMonth: true,
	        changeYear: true,
	        dateFormat: 'yy-MM-dd'
	    });
	});
	function download(path) {
		var m = new model();
		m.p = path;
		$.ajax({
			url: "admin/reportDownload.do",
			type: 'POST',
			data: m
		 });
	}
	function generateTotal() {
		if (check()) {
			var date1 = $("#date1").val();
			var date2 = $("#date2").val();
			var pass = $("#pass").val();
			var aRMBRatio = $("#aRMBRatio").val();
			var type = "0";
			var m = new model();
			m.type = type;
			m.date1 = date1;
			m.date2 = date2;
			m.pass = pass;
			m.aRMBRatio = aRMBRatio;
			$.ajax({
				url: "admin/reportGenerate.do",
				type: 'POST',
				data: m,
				success:
					function(result){
					    if (result == "") {
						    alert("报表生成失败！");
					    } else {
							window.location.href = result;
					    }
				    }
			 });
		}
	}
	function generate(id) {
		if (check()) {
			var date1 = $("#date1").val();
			var date2 = $("#date2").val();
			var pass = $("#pass").val();
			var aRMBRatio = $("#aRMBRatio").val();
			var lab_id = id;
			var type = "1";
			var m = new model();
			m.type = type;
			m.date1 = date1;
			m.date2 = date2;
			m.pass = pass;
			m.aRMBRatio = aRMBRatio;
			m.lab_id = lab_id;
			$("#tr_"+id).find(".download").text("正在生成...");
			$.ajax({
				url: "admin/reportGenerate.do",
				type: 'POST',
				data: m,
				success:
					function(result){
					    if (result == "") {
						    alert("报表生成失败！");
						} else {
							var filePath = result;
							var href = filePath;
							$("#tr_"+id).find(".download").text("下载").attr("href",href);
						}
					}
			});
		}
	}
	function generateBatch() {
		if (check()) {
			var labs = "";
			var selector = "#tb1 td .checkbox:checked";
			$(selector).each(function (){
				labs += $(this).val()+",";
			});
			if (labs == "") {
			    alert("请选择！");
				return;
			}
			var length = labs.length;
			labs = labs.substr(0, length-1);
			var date1 = $("#date1").val();
			var date2 = $("#date2").val();
			var pass = $("#pass").val();
			var aRMBRatio = $("#aRMBRatio").val();
			var type = "2";
			var m = new model();
			m.type = type;
			m.date1 = date1;
			m.date2 = date2;
			m.pass = pass;
			m.labs = labs;
			m.type = type;
			m.aRMBRatio = aRMBRatio;
			$("#downloadLabs").text("正在生成...");
			$.ajax({
				url: "admin/reportGenerate.do",
				type: 'POST',
				data: m,
				success:
					function(result){
					    if (result == "") {
						    alert("报表生成失败！");
						} else {
							var filePath = result;
							var href = filePath;
							$("#downloadLabs").text("下载").attr("href",href);
						}
					}
			});
		}
	}
	function check() {
		var date1 = $("#date1").val();
		var date2 = $("#date2").val();
		var flag = true;
		if (date1 == "" ) {
			alert("请设置提交日期范围！");
			$("#date1").focus();
			return false;
		}
		if (date2 == "" ) {
			alert("请设置提交日期范围！");
			$("#date2").focus();
			return false;
		}
		return true;
	}
	function model() {
		var type;
		var date1;
		var date2;
		var pass;
		var lab_id;
		var aRMBRatio;
		var labs;
		var p;
	}
	</script>
</html>
