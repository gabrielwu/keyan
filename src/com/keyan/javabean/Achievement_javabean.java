package com.keyan.javabean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.keyan.dbUtil.DB;
import com.keyan.dbUtil.DBTool;
import com.keyan.tool.MapTool;

public class Achievement_javabean {
	private String id;
	private String r_table;
	private String r_table_name;
	//private String r_table_names[] = {"", "r_paper", "r_project", "r_book", "r_awards", "r_patent", "r_software"};

    public Achievement_javabean(String rTable, String rTableName, String id) {
		this.id = id;
		r_table = rTable;
		r_table_name = rTableName;
	}
    public Achievement_javabean(String rTable, String rTableName) {
		this.id = "";
		r_table = rTable;
		r_table_name = rTableName;
	}
    public Achievement_javabean() {
		this.id = "";
		r_table = "";
		r_table_name = "";
	}
    /*
    public ArrayList<String> columnSplit(String data, String token) {
    	ArrayList<String> datas = new ArrayList<String>();
    	return datas;
    }*/
    public int passOrNo(String passValue){
    	Date dt = new Date();   
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
        String dateStr = sdf.format(dt);   
    	DB db = new DB();
    	String sql = "update "+this.r_table_name+" set pass='"+passValue+"', date_pass='"+dateStr+"' where id="+this.id;
    	System.out.println(sql);
    	int flag = db.update(sql);
    	db.close();
    	return flag;
    }
    public int batchModifyByIDs(String ids, String column, String value) {
    	DB db = new DB();
    	String sql = "update " + this.r_table_name + " set " + column +"='"+value+"' " +
    			"where id in(" + ids + ")";
    	int flag = db.update(sql);
    	db.close();
    	return flag;
    }
    public int batchPass(String ids, String pass) {
    	Date dt = new Date();   
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");   
        String dateStr = sdf.format(dt); 
    	DB db = new DB();
    	String sql = "update "+this.r_table_name+" set pass='"+pass+"' , date_pass='"+dateStr+"'"+
    			" where id in("+ids+")";
    	int flag = db.update(sql);
    	db.close();
    	return flag;
    }
    public Map<String, ArrayList<Map<String, String>>> getIndexList() {
		Paper_javabean jb1 = new Paper_javabean();
		Project_javabean jb2 = new Project_javabean();
		Book_javabean jb3 = new Book_javabean();
		Awards_javabean jb4 = new Awards_javabean();
		Patent_javabean jb5 = new Patent_javabean();
		Software_javabean jb6 = new Software_javabean();
		ArrayList<Map<String, String>> list1 = jb1.getList();
		ArrayList<Map<String, String>> list2 = jb2.getList();
		ArrayList<Map<String, String>> list3 = jb3.getList();
		ArrayList<Map<String, String>> list4 = jb4.getList();
		ArrayList<Map<String, String>> list5 = jb5.getList();
		ArrayList<Map<String, String>> list6 = jb6.getList();
		Map<String, ArrayList<Map<String, String>>> map = new HashMap<String, ArrayList<Map<String, String>>>();
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		map.put("list5", list5);
		map.put("list6", list6);
		return map;
    }
    public Map<String, ArrayList<Map<String, String>>> getIndexList(String user_id) {
		Paper_javabean jb1 = new Paper_javabean();
		Project_javabean jb2 = new Project_javabean();
		Book_javabean jb3 = new Book_javabean();
		Awards_javabean jb4 = new Awards_javabean();
		Patent_javabean jb5 = new Patent_javabean();
		Software_javabean jb6 = new Software_javabean();
		ArrayList<Map<String, String>> list1 = jb1.getList(user_id);
		ArrayList<Map<String, String>> list2 = jb2.getList(user_id);
		ArrayList<Map<String, String>> list3 = jb3.getList(user_id);
		ArrayList<Map<String, String>> list4 = jb4.getList(user_id);
		ArrayList<Map<String, String>> list5 = jb5.getList(user_id);
		ArrayList<Map<String, String>> list6 = jb6.getList(user_id);
		Map<String, ArrayList<Map<String, String>>> map = new HashMap<String, ArrayList<Map<String, String>>>();
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
		map.put("list5", list5);
		map.put("list6", list6);
		return map;
    	
    }
	public int add(Map<String, String> data, ArrayList<Map<String, String>> memberList){
    	DB db = new DB();
    	DBTool tool = new DBTool();
    	String sqlA = tool.getPreInsertSql(this.r_table_name, data);
    	int r_id = db.insertAndGetId(sqlA, data);
    	int flag = 0;
    	if (r_id != -1) {
    		ArrayList<String> sqls = new ArrayList<String>();
    		String member_table = this.r_table_name + "_member";
    		for (Map<String, String> member: memberList) {
    			member.put("r_id", String.valueOf(r_id));
    			sqls.add(tool.getInsertSql(member_table, member));
    		}
    		boolean flagM = db.excuteBatch(sqls);
    		if (flagM) {
    			flag = 1;
    		} else {
    			flag = 2;
    		}
    	} 
    	return flag;
    }	
	public int modify(Map<String, String> data, ArrayList<Map<String, String>> memberList) {
		DB db = new DB();
    	DBTool tool = new DBTool();
    	String sqlA = tool.getPreUpdateSql(this.r_table_name, data, "id");
    	int flag = db.updatePre(sqlA, data, data.get("id"));
		// TODO
		System.out.println(flag);
    	if (flag == 1) {
    		ArrayList<String> sqls = new ArrayList<String>();
    		String member_table = this.r_table_name + "_member";
    		String sqlDelMembers = "delete from "+member_table+" where r_id="+data.get("id");
    		// TODO
    		System.out.println(sqlDelMembers);
    		sqls.add(sqlDelMembers);
    		for (Map<String, String> member: memberList) {
    			member.put("r_id", data.get("id"));
    			sqls.add(tool.getInsertSql(member_table, member));
    		}
    		boolean flagM = db.excuteBatch(sqls);
    		// TODO
    		System.out.println(flagM);
    		if (flagM) {
    			flag = 1;
    		} else {
    			flag = 2;
    		}
    	} 
		return flag;
	}
	public ArrayList<String> batchDelete(String[] ids, String login_type) {
		ArrayList<String> filePaths = new ArrayList<String>();
    	for (String id: ids) {
    		String filePath = this.delete(id, login_type);
    		System.out.println(filePath);
    		if (!(filePath.equals("0")||filePath.equals("-1"))) {
    			filePaths.add(filePath);
    		}
    	}
    	return filePaths;
	}
    /**
     * @return String 成功返回文件路径 ；失败返回0；审核过的返回-1
     */
    public String delete(String a_id, String login_type) {
    	DB db = new DB();
    	String sql = "select id,file_path from "+this.r_table_name+" where id="+a_id+" ";
    	if (!login_type.equals("1")) {
    		sql += "and pass<>'1'";
    	}
    	System.out.println(sql);
    	Map<String, String> map = db.getSingleRow(sql);
    	String flag = "0";
    	if (map.size() != 0) {
    		String sql_p = "delete from "+this.r_table_name+" where id="+a_id;
    		String sql_m = "delete from "+this.r_table_name+"_member where r_id="+a_id;
    		ArrayList<String> sqls = new ArrayList<String>();
    		sqls.add(sql_p);
    		sqls.add(sql_m);
    		boolean flag2 = db.excuteBatch(sqls);
    		if (flag2) {
    			flag = map.get("file_path");
    		} else {
    			flag = "0"; // 数据库删除操作失败
    		}
    		// TODO del
        	System.out.println(sql);
    	} else {
    		flag = "-1"; // 已审核通过，不能删除
    	}
    	db.close();
    	return flag;
    }
    /**
     * 成果列表中加入成员信息
     * @param oriList
     * @return
     */
    public ArrayList<Map<String, String>> dataAddMembers(ArrayList<Map<String, String>> oriList) {
    	DB db = new DB();
    	ArrayList<Map<String, String>> list = oriList;
    	for (Map<String, String> map: list) {
    		String id = map.get("id");
    		String sql = "select u.name, u.id from r_user u, "+this.r_table_name+"_member m where m.user_id=u.id and m.r_id='"+id+"'";
    		// TODO del
    		System.out.println(sql);
        	ArrayList<Map<String, String>> memberList = db.getRsList(sql);
        	String memberString ="";
        	for (Map<String, String> memberMap: memberList) {
        		// 通信作者、组长等加*
        		if (memberMap.get("id").equals(map.get("leader_id"))) {
        			memberString += memberMap.get("name") + "(*),";
        		} else {
        			memberString += memberMap.get("name") + ",";
        		}
        	}
        	if (memberString.length() > 0) {
        		int i = memberString.length() - 1;
        		memberString = memberString.substring(0, i);
        	}
        	map.put("members", memberString);
    	}
    	db.close();
    	return list;
    }
    private ArrayList<Map<String, String>> getMembers() {
    	DB db = new DB();
    	String sql = "select u.name, m.* from r_user u, " + this.r_table_name + "_member m " +
    			"where u.id=m.user_id and m.r_id="+this.id;
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	db.close();
    	return list;
    }
    /**
     * 查看成果详情
     * @return 成果数据行，成员列表 组成的map
     */
    public Map<String, Object> view() {
    	DB db = new DB();
    	String sql = "select t2.name as type2013, a.*, substring(a.date_commit, 0, 10) as date_commit," +
    				 "t.name as type, t.category, u1.name as committer, u2.name as leader, " +
    				 "case a.pass when '1' then '通过' when '2' then '未通过' when '3' then '未审核' end as _pass, " +
    				 "case a.isAwarded when 't' then '是' when 'f' then '否' end as _isAwarded " +
    				 "from r_user u1, r_user u2, r_type t, r_type t2, " + this.r_table_name +" a " +
    				 "where t.r_table='"+this.r_table+"' and u1.id=a.user_id and u2.id=a.leader_id " +
    				 "and a.type2013_id=t2.id and t.id=a.type_id and a.id="+id;
    	MapTool mt = new MapTool();
    	Map<String, String> mapA = db.getSingleRow(sql);
    	mapA = mt.nullValueParse(mapA);
    	Map<String, Object> data = new HashMap<String, Object>();
    	data.put("data", mapA);
    	db.close();
    	ArrayList<Map<String, String>> members = this.getMembers();
    	String membersA = "";
    	for (Map<String, String> member:members) {
    		membersA += member.get("name")+"("+member.get("a_percent")+"%) ";
    	}
    	data.put("members", members);
    	data.put("membersA", membersA);
    	return data;
    }    
    public Map<String, Object> viewPaper() {
    	DB db = new DB();
    	String sql = "select t3.name as area, t2.name as type2013, a.*, substring(a.date_commit, 0, 10) as date_commit," +
    				 "t.name as type, t.category, u1.name as committer, u2.name as leader, " +
    				 "case a.pass when '1' then '通过' when '2' then '未通过' when '3' then '未审核' end as _pass, " +
    				 "case a.isAwarded when 't' then '是' when 'f' then '否' end as _isAwarded " +
    				 "from r_user u1, r_user u2, r_type t, r_type t2, r_type t3, " + this.r_table_name +" a " +
    				 "where t.r_table='"+this.r_table+"' and u1.id=a.user_id and u2.id=a.leader_id " +
    				 "and a.type2013_id=t2.id and t.id=a.type_id and a.id="+id+" and a.area_id=t3.id";
    	MapTool mt = new MapTool();
    	Map<String, String> mapA = db.getSingleRow(sql);
    	mapA = mt.nullValueParse(mapA);
    	Map<String, Object> data = new HashMap<String, Object>();
    	data.put("data", mapA);
    	db.close();
    	ArrayList<Map<String, String>> members = this.getMembers();
    	String membersA = "";
    	for (Map<String, String> member:members) {
    		membersA += member.get("name")+"("+member.get("a_percent")+"%) ";
    	}
    	data.put("members", members);
    	data.put("membersA", membersA);
    	return data;
    }    
    /**
     * 查看成果详情
     * @param id 成果id
     * @return 成果数据行，成员列表 组成的map
     */
    public Map<String, Object> view(String id) {
    	this.id = id;
    	return view();
    }
    public Map<String, Object> viewPaper(String id) {
    	this.id = id;
    	return viewPaper();
    }
    public int modifyAAdmin(String a_value) {
    	DB db = new DB();
    	String sql = "update "+this.r_table_name+" set a_value='"+a_value+"' where id="+this.id;
    	int flag = db.update(sql);
    	db.close();
    	return flag;
    }

    public String exist(String title){
    	DB db = new DB();
    	String result = "";
    	String sql = "select name,substring(a.date_commit, 1, 10) as date_commit from "+this.r_table_name+" a, r_user u " +
    			"where title='"+title+"' and a.user_id=u.id";
    	Map<String, String> map = db.getSingleRow(sql);
    	// TODO
    	System.out.println(sql);
    	if (map.size() != 0) {
    		result = "该成果已于 "+map.get("date_commit")+" 由 "+map.get("name")+" 提交";
    	}
    	// TODO
    	System.out.println(result);
    	db.close();
    	return result;
    }
    public String exist(String title, String id) {
    	DB db = new DB();
    	String result = "";
    	String sql = "select name,substring(a.date_commit, 1, 10) as date_commit from "+this.r_table_name+" a, r_user u " +
    			"where title='"+title+"' and a.user_id=u.id and a.id<>"+id;
    	Map<String, String> map = db.getSingleRow(sql);
    	// TODO
    	System.out.println(sql);
    	if (map.size() != 0) {
    		result = "该成果已于 "+map.get("date_commit")+" 由 "+map.get("name")+" 提交";
    	}
    	// TODO
    	System.out.println(result);
    	db.close();
    	return result;
	}

}
