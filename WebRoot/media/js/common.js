var tables = new Array();
tables[0] = "";
tables[1] = "r_paper";
tables[2] = "r_project";
tables[3] = "r_book";
tables[4] = "r_awards";
tables[5] = "r_patent";
tables[6] = "r_software";
function s_check() {
	// TODO
	return true;
}
function exportList(module) {
	var data = "";
	$("#search_form input[name^='s_'], #search_form select[name^='s_'], #search_form input[name='q']").each(function () {
		var name = $(this).attr("name");
		data += "&" + name + "=" + $(this).val();
	});
	$.ajax({
		url: module + "Export.do",
		type: 'POST',
		data: data,
		success: 
			function(result){
				if (result == "") {
				} else if (result == "0"){
					alert("没有匹配条件的记录！");
				} else {
					window.location.href = result;
				}	
		    }
	});
}
function modelOp(){
	var id;
	var table;
	var table_id;
	var ids;
	var pass_value;
	var award_value;
}
$(function() { 
    $(".selectAll").click(function (){
		var index = $(this).attr("title");
  	  	var value = $(this).attr("checked");
  	  	var selector = "#tb" + index + " td .checkbox";
  	  	if (value == "checked") {
  	  		$(selector).attr("checked", true);
  	  	} else {
  	   		$(selector).attr("checked", false);
  		}	  	  	
    });
});
function batchPass(table_id, pass_value) {
	var ids = "";
	var table_index = parseInt(table_id);
	var table = tables[table_index];
	var pass_value = pass_value;
	var selector = "#tb" + table_id + " td .checkbox:checked";
	$(selector).each(function (){
		ids += $(this).val()+",";
	});
	if (ids == "") {
		alert("请选择！");
		return;
	}
	var length = ids.length;
	ids = ids.substr(0, length-1);
	var m = new modelOp();
	m.ids = ids;
	m.table = table;
	m.pass_value = pass_value;
	$.ajax({
	      url: "admin/achievementBatchPass.do",
	      type: 'POST',
	      data: m,
	      success: 
			  function(result){
		          if (result > 0) { 	
		        	  alert("操作成功！共更新"+result+"条成果记录。");
		              window.location.reload();
				  } else {
			          alert("操作失败！");
				  }	
	          }
	 });
}
function batchDel(table_id) {
	var ids = "";
	var table = tables[table_id];
	var table_id = table_id;
	var selector = "#tb" + table_id + " td .checkbox:checked";
	var count = 0;
	$(selector).each(function (){
		ids += $(this).val()+",";
		count++;
	});
	if (ids == "") {
		alert("请选择！");
		return;
	}
	if (!confirm("确认删除这"+count+"条记录？")) {
		return;
	}
	var length = ids.length;
	ids = ids.substr(0, length-1);
	var m = new modelOp();
	m.ids = ids;
	m.table = table;
	m.table_id = table_id;
	$.ajax({
	      url: "submit/achievementBatchDelete.do",
	      type: 'POST',
	      data: m,
	      success: 
			  function(result){	
			          alert(result);
		              window.location.reload();
	          }
	 });
}
function batchAward(table_id, award_value) {
	var ids = "";
	var table_index = parseInt(table_id);
	var table = tables[table_index];
	var selector = "#tb" + table_id + " td .checkbox:checked";
	$(selector).each(function (){
		ids += $(this).val()+",";
	});
	if (ids == "") {
		alert("请选择！");
		return;
	}
	var length = ids.length;
	ids = ids.substr(0, length-1);
	var m = new modelOp();
	m.ids = ids;
	m.table = table;
	m.award_value = award_value;
	$.ajax({
	    url: "admin/achievementBatchAward.do",
		type: 'POST',
		data: m,
		success: 
		    function(result){
		        if (result > 0) { 	
		            alert("操作成功！共更新"+result+"条成果记录。");
		            window.location.reload();
			    } else {
		            alert("操作失败！");
			    }	
	        }
	});
}
function pass(pass_value) {
    var id = $("#id").val();
    var data = new modelOp();
    data.id = id;
    data.pass_value = pass_value;
    data.table = r_table;
	$.ajax({
		url: "admin/achievementPassOrNo.do",
		type: 'POST',
		data: data,
		success: 
		    function(result){
		        if (result == '1') {	
		            alert("操作成功！");
		            window.location.reload();
		        } else if (result == '0') {
		            alert("操作失败！");
			    } else {
		            alert("操作失败！"+result);
			    }
		    }
	})
}  
function del(table_id,id){
	if (confirm("确认删除？")) {
		var m = new modelOp();
		m.id = id;
		m.table_id = table_id;
		m.table = tables[table_id];
		$.ajax({
			url: "submit/achievementDelete.do",
			type: 'POST',
			data: m,
			success: 
			    function(result){
			        if (result == '1') { 	
				        alert("删除成功！");
			            window.location.reload();
			        } else if (result == '-1') {
				        alert("已通过审核，不能删除！");
					} else {
				        alert("删除失败！");
					}	
		        }
	   });
	}
}  
function award(table_id, id, award_value){
	if (confirm("确认操作？")) {
		var m = new modelOp();
		m.id = id;
		m.table_id = table_id;
		m.award_value = award_value;
		m.table = tables[table_id];
		$.ajax({
		    url: "admin/achievementAward.do",
			type: 'POST',
			data: m,
			success: 
			    function(result){
		            if (result == '1') { 	
			            alert("操作成功！");
		                window.location.reload();
		            } else {
			            alert("操作失败！");
				    }	
		        }
		});
	}
}
function modifyA() {
    var a_value = $("#a_value_ori").val();
    var html = "<input type='text' id='a_value' value='"+a_value+"'>";
    $("#span_a").html(html);
    var html2 = "<a href='javascript:modifyASubmit()'>提交修改</a>";
    html2 += "|<a href='javascript:modifyACancel()'>取消修改</a>";
    $("#a_op").html(html2);
}
function modifyACancel() {
    var a_value = $("#a_value_ori").val();
    var html = a_value;
    $("#span_a").html(html);
    var html2 = "<a href='javascript:modifyA()'>修改</a>";
    $("#a_op").html(html2);
}
  
function modifyASubmit() {
    var id = $("#id").val();
    var a_value = $("#a_value").val();
    if (a_value == "") {
        alert("A值不能为空！");
    } else if (isNaN(a_value)) {
        alert("A值必须为数！");
    } else {
        var data = new modelA();
        data.id = id;
        data.a_value = a_value;
        data.r_table = r_table;
        $.ajax({
		    url: "admin/achievementModifyA.do",
			type: 'POST',
			data: data,
			success: 
			    function(result){
			        if (result == '1') {	
			            alert("修改成功！");
			            window.location.reload();
			        } else {
			            alert("修改失败！");
				    }	
		        }
        });
    }
}
function modelA() {
    var r_table;
    var a_value;
}  
function uploadFileResult(flag, file_path) {
	switch (flag) {
	    case '1':
		  	$('#file_path').val(file_path);
	        $('#msg_file_path').html("上传成功！");
	        $('#upload_file_view').html("查看");
	        $('#upload_file_view').attr("href", file_path);
	        $('#upload_file_view').attr("target", "blank");
			break;
	  	case '-1':
	        $('#msg_file_path').html("请上传文件！");
	        break;
		default:
	  	    $('#msg_file_path').html("上传失败！");
			break;	
	}
}   
var memberNameArray = new Array();
var memberIdArray = new Array();
function showMembers(val, _this){
	var td = $(_this).parent();
	var selectM = td.find("div");
	selectM.css({"border":"1px solid #C5DBEC","display":"block"});
	var html = "";
	for (var i = 0; i < memberIdArray.length; i++) {
		if (memberNameArray[i].indexOf(val) != -1 && val != "") {
		    html += "<a>"+memberNameArray[i]+"<input type='hidden' value='"+memberIdArray[i]+"' /></a>";;
		}
	}
	selectM.html(html);
	$(_this).bind("blur", function(){
		var flag = false;
		for (var i = 0; i < memberIdArray.length; i++) {
			var id = memberIdArray[i];
			var name = memberNameArray[i];
			if (name == $(_this).val()) {
				$(_this).siblings(".member_id").val(id);
				// 加入leader候选
				addLeader(id, name);
				flag = true;
				break;
			}
		}
		if (!flag) {
			var id = $(_this).siblings(".member_id").val();
			$(_this).siblings(".member_id").val("");
			delLeader(id);
		}
	});
	$(".selectM a").each(function (){
        $(this).mouseover(function () {
            $(this).css({"background":"#0000ff","color":"#fff"});
        });
        $(this).mouseout(function () {
            $(this).css({"background":"#fff","color":"#000"});
        });
        $(this).click(function () {
            var name = $(this).text();
            var id = $(this).find("input").val();
            // 加入leader候选
			addLeader(id, name);
            $(this).parent().siblings(".member_name").val(name);
            $(this).parent().siblings(".member_id").val(id);
            $(this).parent().css({"border":"none","display":"none"});
            $(this).parent().html("");
        });
	});
	$("input").focus(function (){
		$(".selectM").css({"border":"none","display":"none"});
		$(".selectM").html("");
	})
} 
function addMember(){
	var i = ++memberI;
	var tr = $("#tr_member_1").clone().attr("id","tr_member_"+i);
	//tr.find(".a_percent").val(0);
	tr.find(".msg_common").text("");
	tr.find(".selectM").css({"border":"none","display":"none"});
	tr.find(".selectM").html("");
	tr.find(".member_name").val("");
	tr.find(".member_name").attr("onkeyup", "showMembers(this.value, this)");
	tr.find(".member_id").val("");
	tr.find("a.op").attr("href", "javascript:delMember("+i+")").text("删除"); 
	$("#table_member .tr_member:last").after(tr);
}
function delMember(i){
	tr = $("#tr_member_"+i);
	id = tr.find(".member_id").val();
	name = tr.find(".member_name").val();
	delLeader(id);
	tr.remove();
}
function delLeader(id) {
	$("#leader_id option").each(function (){
		if ($(this).val() == id) {
			$(this).remove();
		}
	});
}
function addLeader(id, name){
	var array = new Array();
	$("#leader_id option").each(function (){
        array.push($(this).val());
	})
	var flag = true;
	for (var i = 0; i < array.length; i++) {
		if (array[i] == id) {
			flag = false;
			break;
		}
	}
	if (flag) {
		var html = "<option value='"+id+"'>"+name+"</option>";
		$("#leader_id").append(html);
	}
}
$(function() {
	$.datepicker.regional['zh-CN'] = {  
		      clearText: '清除',  
		      clearStatus: '清除已选日期',  
		      closeText: '选择',  
		      closeStatus: '不改变当前选择',  
		      prevText: '<上月',  
		      prevStatus: '显示上月',  
		      prevBigText: '<<',  
		      prevBigStatus: '显示上一年',  
		      nextText: '下月>',  
		      nextStatus: '显示下月',  
		      nextBigText: '>>',  
		      nextBigStatus: '显示下一年',  
		      currentText: '今天',  
		      currentStatus: '显示本月',  
		      monthNames: ['01','02','03','04','05','06', '07','08','09','10','11','12'],  
		      monthNamesShort: ['一','二','三','四','五','六', '七','八','九','十','十一','十二'],  
		      monthStatus: '选择月份',  
		      yearStatus: '选择年份',  
		      weekHeader: '周',  
		      weekStatus: '年内周次',  
		      dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],  
		      dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],  
		      dayNamesMin: ['日','一','二','三','四','五','六'],  
		      dayStatus: '设置 DD 为一周起始',  
		      dateStatus: '选择 m月 d日, DD',  
		      dateFormat: 'yy-mm-dd',  
		      firstDay: 1,  
		      initStatus: '请选择日期',  
		      isRTL: false  
	};  
	$.datepicker.setDefaults($.datepicker.regional['zh-CN']);  
});
function search_on() {
	$("#search_div").fadeIn();
	$("#search_toggle").html('<em></em>收起搜索');
	$("#search_toggle").attr("href", "javascript:search_off()");
	$("#search_toggle").attr("class", "search_on");
}
function search_off() {
	$("#search_div").fadeOut();
	$("#search_toggle").html('<em></em>搜索');
	$("#search_toggle").attr("href", "javascript:search_on()");
	$("#search_toggle").attr("class", "search_off");
}
$(function(){
    var trs=$("#tb_view tbody tr");  
    trs.filter(":odd").addClass("even");  
    trs.filter(":even").addClass("odd");
});
var dateCurrent = new Date();
var yearCurrent = dateCurrent.getFullYear();
var dateS = yearCurrent + "-01";
var dateE = yearCurrent + "-12-31";