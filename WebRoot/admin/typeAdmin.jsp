<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String r_t = request.getParameter("t");
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
    <input type="hidden" id="r_t" value="<%=r_t %>"/>
	<% if (r_t.equals("1")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的论文类型</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>类型名称</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>A值</td>
		            <td><input id="add_a_value"/></td>
		        </tr>
		        <tr>
		            <td>分类</td>
		            <td>
		                <select id="add_category">
		                    <option value='1'>期刊</option>
		                    <option value='2'>会议</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td>类型标记</td>
		            <td>
		                <select id="add_remark">
		                    <option value='1'>常规类型</option>
		                    <option value='2'>CCF推荐</option>
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
	           <th>类型名称</th>
	           <th>A值</th>
	           <th>分类</th>
	           <th>类型标记</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_a_value"><%=data.get("a_value") %></td>
	           <td class="td_category" title="<%=data.get("category") %>"><% if (data.get("category").equals("1")) out.print("期刊"); else out.print("会议");%></td>
	           <td class="td_remark" title="<%=data.get("remark") %>">
	           <% if (data.get("remark").equals("1")) out.print("常规类型"); else out.print("2013新类型");%>
	           </td>
	           <td class="td_op"><a href="javascript:modifyPaper(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } else if (r_t.equals("11")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的论文分区</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>名称</td>
		            <td>
		                <input id="add_name"/>
		                <input id="add_a_value" value="0" type="hidden"/>
		            </td>
		        </tr>
		    </table>
	    </form>
    </div>
    <div class="box_1">
    <table id="tb1">
	    <thead>
	       <tr>
	           <th>名称</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_op"><a href="javascript:modifyPaperArea(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } else if (r_t.equals("2")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的项目类型</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>类型名称</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>A值</td>
		            <td><input id="add_a_value"/></td>
		        </tr>
		        <tr>
		            <td>分类</td>
		            <td>
		                <select id="add_category">
		                    <option value='1'>纵向</option>
		                    <option value='2'>横向</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <td>类型标记</td>
		            <td>
		                <select id="add_remark">
		                    <option value='1'>常规类型</option>
		                    <option value='2'>2013类型</option>
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
	           <th>类型名称</th>
	           <th>A值</th>
	           <th>分类</th>
	           <th>类型标记</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_a_value"><%=data.get("a_value") %></td>
	           <td class="td_category" title="<%=data.get("category") %>"><% if (data.get("category").equals("1")) out.print("纵向"); else out.print("横向");%></td>
	           <td class="td_remark" title="<%=data.get("remark") %>">
	           <% if (data.get("remark").equals("1")) out.print("常规类型"); else out.print("2013新类型");%>
	           </td>
	           <td class="td_op"><a href="javascript:modifyProject(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } else if (r_t.equals("3")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的著作类型</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>类型名称</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>A值</td>
		            <td><input id="add_a_value"/></td>
		        </tr>
		        <tr>
		            <td>类型标记</td>
		            <td>
		                <select id="add_remark">
		                    <option value='1'>常规类型</option>
		                    <option value='2'>2013类型</option>
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
	           <th>类型名称</th>
	           <th>A值</th>
	           <th>类型标记</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_a_value"><%=data.get("a_value") %></td>
	           <td class="td_remark" title="<%=data.get("remark") %>">
	           <% if (data.get("remark").equals("1")) out.print("常规类型"); else out.print("2013新类型");%>
	           </td>
	           <td class="td_op"><a href="javascript:modifyBook(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } else if (r_t.equals("4")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的奖项类型</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>类型名称</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>A值</td>
		            <td><input id="add_a_value"/></td>
		        </tr>
		        <tr>
		            <td>类型标记</td>
		            <td>
		                <select id="add_remark">
		                    <option value='1'>常规类型</option>
		                    <option value='2'>2013类型</option>
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
	           <th>类型名称</th>
	           <th>A值</th>
	           <th>类型标记</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_a_value"><%=data.get("a_value") %></td>
	           <td class="td_remark" title="<%=data.get("remark") %>">
	           <% if (data.get("remark").equals("1")) out.print("常规类型"); else out.print("2013新类型");%>
	           </td>
	           <td class="td_op"><a href="javascript:modifyAwards(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } else if (r_t.equals("5")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的专利类型</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>类型名称</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>A值</td>
		            <td><input id="add_a_value"/></td>
		        </tr>
		        <tr>
		            <td>类型标记</td>
		            <td>
		                <select id="add_remark">
		                    <option value='1'>常规类型</option>
		                    <option value='2'>2013类型</option>
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
	           <th>类型名称</th>
	           <th>A值</th>
	           <th>类型标记</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_a_value"><%=data.get("a_value") %></td>
	           <td class="td_remark" title="<%=data.get("remark") %>">
	           <% if (data.get("remark").equals("1")) out.print("常规类型"); else out.print("2013新类型");%>
	           </td>
	           <td class="td_op"><a href="javascript:modifyPatent(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } else if (r_t.equals("6")) { %>
    <div id="add_type" class="box_2">
	    <form action="">
		    <span>添加新的软件著作权类型</span>
		    <input class="button" type="button" onclick="add()" value="添加"/>
		    <input class="button" type="reset" value="清空"/>
		    <table>
		        <tr>
		            <td>类型名称</td>
		            <td><input id="add_name"/></td>
		        </tr>
		        <tr>
		            <td>A值</td>
		            <td><input id="add_a_value"/></td>
		        </tr>
		        <tr>
		            <td>类型标记</td>
		            <td>
		                <select id="add_remark">
		                    <option value='1'>常规类型</option>
		                    <option value='2'>2013类型</option>
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
	           <th>类型名称</th>
	           <th>A值</th>
	           <th>类型标记</th>
	           <th>操作</th>
	       </tr>
       </thead>
       <tbody>
	       <% 
	       for (Map<String, String> data : dataList) {
	       %>
	       <tr id="tr_<%=data.get("id") %>">
	           <td class="td_name"><%=data.get("name") %></td>
	           <td class="td_a_value"><%=data.get("a_value") %></td>
	           <td class="td_remark" title="<%=data.get("remark") %>">
	           <% if (data.get("remark").equals("1")) out.print("常规类型"); else out.print("2013类型");%>
	           </td>
	           <td class="td_op"><a href="javascript:modifySoftware(<%=data.get("id") %>)">修改</a>|<a href="javascript:del(<%=data.get("id") %>)">删除</a></td>
	       </tr>
	       <% 
	       }
	       %>
       </tbody>
    </table>
    </div>
    <% } %>
  </body>
    <jsp:include page="../include/js.jsp" />
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
  function modifyPaper(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var a_value = tr.find(".td_a_value").text();
	  var category = tr.find(".td_category").attr("title");
	  var category_name = tr.find(".td_category").text();
	  var remark = tr.find(".td_remark").attr("title");
	  var remark_name = tr.find(".td_remark").text();
	  
	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";

	  var html_a = "<input class='m' type='text' value='"+a_value+"'>";
	  html_a += "<input class='hidden' type='hidden' value='"+a_value+"'>";
	  
	  var html_c = "<select class='m s_category'>";
	  html_c += "<option value='1'>"+'期刊'+"</option>";
	  html_c += "<option value='2'>"+'会议'+"</option>";
	  html_c += "</select>";
	  html_c += "<input class='hidden' type='hidden' title='"+category_name+"' value='"+category+"'>"; 

	  var html_r = "<select class='m s_remark'>";
	  html_r += "<option value='1'>"+'常规类型'+"</option>";
	  html_r += "<option value='2'>"+'2013类型'+"</option>";
	  html_r += "</select>";
	  html_r += "<input class='hidden' type='hidden' title='"+remark_name+"' value='"+remark+"'>"; 

      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelPaper("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      
      tr.find(".td_name").html(html_n);
      tr.find(".td_a_value").html(html_a);
      tr.find(".td_category").html(html_c);
      tr.find(".td_remark").html(html_r);
      tr.find(".td_op").html(html_op);
      
      tr.find(".s_category option").each(function (){
          if ($(this).val() == category) {
              $(this).attr("selected", "selected");
          }
      });
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  }  
  function modifyPaperArea(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();

	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";

      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelPaperArea("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      
	  tr.find(".td_name").html(html_n); 
      tr.find(".td_op").html(html_op);
      
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  } 
  function modifyProject(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var a_value = tr.find(".td_a_value").text();
	  var category = tr.find(".td_category").attr("title");
	  var category_name = tr.find(".td_category").text();
	  var remark = tr.find(".td_remark").attr("title");
	  var remark_name = tr.find(".td_remark").text();
	  
	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";
	  
	  var html_a = "<input class='m' type='text' value='"+a_value+"'>";
	  html_a += "<input class='hidden' type='hidden' value='"+a_value+"'>";

	  var html_c = "<select class='m s_category'>";
	  html_c += "<option value='1'>"+'纵向'+"</option>";
	  html_c += "<option value='2'>"+'横向'+"</option>";
	  html_c += "</select>";
	  html_c += "<input class='hidden' type='hidden' title='"+category_name+"' value='"+category+"'>"; 

	  var html_r = "<select class='m s_remark'>";
	  html_r += "<option value='1'>"+'常规类型'+"</option>";
	  html_r += "<option value='2'>"+'2013类型'+"</option>";
	  html_r += "</select>";
	  html_r += "<input class='hidden' type='hidden' title='"+remark_name+"' value='"+remark+"'>"; 

      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelProject("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      
      tr.find(".td_name").html(html_n);
      tr.find(".td_a_value").html(html_a);
      tr.find(".td_category").html(html_c);
      tr.find(".td_remark").html(html_r);
      tr.find(".td_op").html(html_op);
      
      tr.find("option").each(function (){
          if ($(this).val() == category) {
              $(this).attr("selected", "selected");
          }
      });
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  } 
  function modifyBook(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var a_value = tr.find(".td_a_value").text();
	  var remark = tr.find(".td_remark").attr("title");
	  var remark_name = tr.find(".td_remark").text();

	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";

	  var html_a = "<input class='m' type='text' value='"+a_value+"'>";
	  html_a += "<input class='hidden' type='hidden' value='"+a_value+"'>";

	  var html_r = "<select class='m s_remark'>";
	  html_r += "<option value='1'>"+'常规类型'+"</option>";
	  html_r += "<option value='2'>"+'2013类型'+"</option>";
	  html_r += "</select>";
	  html_r += "<input class='hidden' type='hidden' title='"+remark_name+"' value='"+remark+"'>"; 

      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelBook("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      
	  tr.find(".td_name").html(html_n);
      tr.find(".td_a_value").html(html_a);
      tr.find(".td_remark").html(html_r);  
      tr.find(".td_op").html(html_op);
      
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  } 
  function modifyAwards(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var a_value = tr.find(".td_a_value").text();
	  var remark = tr.find(".td_remark").attr("title");
	  var remark_name = tr.find(".td_remark").text();
	  
	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";

	  var html_a = "<input class='m' type='text' value='"+a_value+"'>";
	  html_a += "<input class='hidden' type='hidden' value='"+a_value+"'>";

	  var html_r = "<select class='m s_remark'>";
	  html_r += "<option value='1'>"+'常规类型'+"</option>";
	  html_r += "<option value='2'>"+'2013类型'+"</option>";
	  html_r += "</select>";
	  html_r += "<input class='hidden' type='hidden' title='"+remark_name+"' value='"+remark+"'>"; 

      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelAwards("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      
	  tr.find(".td_name").html(html_n);
      tr.find(".td_a_value").html(html_a); 
      tr.find(".td_remark").html(html_r);  
      tr.find(".td_op").html(html_op);
      
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  } 
  function modifyPatent(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var a_value = tr.find(".td_a_value").text();
	  var remark = tr.find(".td_remark").attr("title");
	  var remark_name = tr.find(".td_remark").text();

	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";

	  var html_a = "<input class='m' type='text' value='"+a_value+"'>";
	  html_a += "<input class='hidden' type='hidden' value='"+a_value+"'>";

	  var html_r = "<select class='m s_remark'>";
	  html_r += "<option value='1'>"+'常规类型'+"</option>";
	  html_r += "<option value='2'>"+'2013类型'+"</option>";
	  html_r += "</select>";
	  html_r += "<input class='hidden' type='hidden' title='"+remark_name+"' value='"+remark+"'>"; 

      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelPatent("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      
      tr.find(".td_name").html(html_n);
      tr.find(".td_a_value").html(html_a); 
      tr.find(".td_remark").html(html_r);  
      tr.find(".td_op").html(html_op);
      
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  } 
  function modifySoftware(id){
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name").text();
	  var a_value = tr.find(".td_a_value").text();
	  var remark = tr.find(".td_remark").attr("title");
	  var remark_name = tr.find(".td_remark").text();

	  var html_n = "<input class='m' type='text' value='"+name+"'>";
	  html_n += "<input class='hidden' type='hidden' value='"+name+"'>";

	  var html_a = "<input class='m' type='text' value='"+a_value+"'>";
	  html_a += "<input class='hidden' type='hidden' value='"+a_value+"'>";
	  
	  var html_r = "<input class='m' type='text' value='"+remark+"'>";
	  html_r += "<input class='hidden' type='hidden' value='"+remark+"'>";

	  var html_r = "<select class='m s_remark'>";
	  html_r += "<option value='1'>"+'常规类型'+"</option>";
	  html_r += "<option value='2'>"+'2013类型'+"</option>";
	  html_r += "</select>";
	  html_r += "<input class='hidden' type='hidden' title='"+remark_name+"' value='"+remark+"'>"; 
	  
      var html_op = "<a href='javascript:modifySubmit("+id+")'>提交</a>|";
      html_op += "<a href='javascript:modifyCancelSoftware("+id+")'>取消</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";

	  tr.find(".td_name").html(html_n);
      tr.find(".td_a_value").html(html_a); 
      tr.find(".td_remark").html(html_r);      
      tr.find(".td_op").html(html_op);
      
      tr.find(".s_remark option").each(function (){
          if ($(this).val() == remark) {
              $(this).attr("selected", "selected");
          }
      });
  }
  function modifyCancelPaper(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var a_value = tr.find(".td_a_value .hidden").val();
	  var category = tr.find(".td_category .hidden").val();
	  var category_name = tr.find(".td_category .hidden").attr("title");
	  var remark = tr.find(".td_remark .hidden").val();
      tr.find(".td_name").html(name);
      tr.find(".td_a_value").html(a_value);
      tr.find(".td_category").html(category_name);
      tr.find(".td_remark").html(remark);
      var html_op = "<a href='javascript:modifyPaper("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function modifyCancelPaperArea(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
      tr.find(".td_name").html(name);
      var html_op = "<a href='javascript:modifyPaperArea("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function modifyCancelProject(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var a_value = tr.find(".td_a_value .hidden").val();
	  var category = tr.find(".td_category .hidden").val();
	  var category_name = tr.find(".td_category .hidden").attr("title");
	  var remark = tr.find(".td_remark .hidden").val();
      tr.find(".td_name").html(name);
      tr.find(".td_a_value").html(a_value);
      tr.find(".td_category").html(category_name);
      tr.find(".td_remark").html(remark);
      var html_op = "<a href='javascript:modifyProject("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function modifyCancelBook(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var a_value = tr.find(".td_a_value .hidden").val();
	  var remark = tr.find(".td_remark .hidden").val();
	  //var category = tr.find(".td_category .hidden").val();
	  //var category_name = tr.find(".td_category .hidden").attr("title");
      tr.find(".td_name").html(name);
      tr.find(".td_a_value").html(a_value);
      tr.find(".td_remark").html(remark);
      //tr.find(".td_category").html(category_name);
      var html_op = "<a href='javascript:modifyBook("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function modifyCancelAwards(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var a_value = tr.find(".td_a_value .hidden").val();
	  var remark = tr.find(".td_remark .hidden").val();
	  //var category = tr.find(".td_category .hidden").val();
	  //var category_name = tr.find(".td_category .hidden").attr("title");
      tr.find(".td_name").html(name);
      tr.find(".td_a_value").html(a_value);
      tr.find(".td_remark").html(remark);
      //tr.find(".td_category").html(category_name);
      var html_op = "<a href='javascript:modifyAwards("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function modifyCancelPatent(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var a_value = tr.find(".td_a_value .hidden").val();
	  var remark = tr.find(".td_remark .hidden").val();
	  //var category = tr.find(".td_category .hidden").val();
	  //var category_name = tr.find(".td_category .hidden").attr("title");
      tr.find(".td_name").html(name);
      tr.find(".td_a_value").html(a_value);
      tr.find(".td_remark").html(remark);
      //tr.find(".td_category").html(category_name);
      var html_op = "<a href='javascript:modifyPatent("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function modifyCancelSoftware(id) {
	  var tr = $("#tr_"+id);
	  var name = tr.find(".td_name .hidden").val();
	  var a_value = tr.find(".td_a_value .hidden").val();
	  var remark = tr.find(".td_remark .hidden").val();
	  //var category = tr.find(".td_category .hidden").val();
	  //var category_name = tr.find(".td_category .hidden").attr("title");
      tr.find(".td_name").html(name);
      tr.find(".td_a_value").html(a_value);
      tr.find(".td_remark").html(remark);
      //tr.find(".td_category").html(category_name);
      var html_op = "<a href='javascript:modifySoftware("+id+")'>修改</a>|";
      html_op += "<a href='javascript:del("+id+")'>删除</a>";
      tr.find(".td_op").html(html_op);
  }
  function model(){
	  var r_t;
	  var id;
	  var name;
	  var a_value;
	  var category;
	  var remark;
  }
  function modifySubmit(id) {
	  var tr = $("#tr_"+id);
	  // ！校验
	  if (confirm("确认修改？")) {
		  var m = new model();
		  m.id = id;
		  m.r_t = $("#r_t").val();;
		  m.name = tr.find(".td_name .m").val();
		  m.a_value = tr.find(".td_a_value .m").val();
		  m.category = tr.find(".td_category .m").val();
		  m.remark = tr.find(".td_remark .m").val();

		  m.name = (typeof(m.name) == "undefined") ? '' : m.name;
		  m.a_value = (typeof(m.a_value) == "undefined") ? '0' : m.a_value;
		  m.category = (typeof(m.category) == "undefined") ? '' : m.category;
		  m.remark = (typeof(m.remark) == "undefined") ? '' : m.remark;
		  
		  $.ajax({
		        url: "admin/typeModify.do",
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
		  m.r_t = $("#r_t").val();
		  m.id = id;
		  $.ajax({
		        url: "admin/typeDelete.do",
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
	  m.r_t = $("#r_t").val();
	  m.name = $("#add_name").val();
	  m.a_value = $("#add_a_value").val();
	  m.category = $("#add_category").val();
	  m.remark = $("#add_remark").val();

	  m.name = (typeof(m.name) == "undefined") ? '' : m.name;
	  m.a_value = (typeof(m.a_value) == "undefined") ? '0' : m.a_value;
	  m.category = (typeof(m.category) == "undefined") ? '' : m.category;
	  m.remark = (typeof(m.remark) == "undefined") ? '' : m.remark;
	  
	  $.ajax({
		  url: "admin/typeAdd.do",
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
