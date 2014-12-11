package com.keyan.javabean;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.keyan.dbUtil.DB;

public class Book_javabean {
	private String table_name;
	private String table;
	public Book_javabean() {
		this.table_name = "r_book";
		this.table = "3";
	}
	// TODO
	public ArrayList<Map<String, String>> getList() {
		Calendar cal = Calendar.getInstance(); 
		int currentYear = cal.get(Calendar.YEAR);
    	String sql = "select a.isAwarded, a.id,a.leader_id,a.title, a.pass, a.date_press,a.press, a.isbn, " +
    			"substring(a.date_commit, 1, 10) as date_commit, u.name, t.name as type " +
    			"from "+this.table_name+" a, r_type t, r_user u where t.r_table='"+this.table+"' " +
    			"and a.type_id=t.id and a.user_id=u.id and a.date_commit like '"+currentYear+"%' " ;
    			//" order by pass, date_pass desc, date_commit desc ";
    	// TODO
    	System.out.println(sql);
    	DB db = new DB();
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	db.close();
    	Achievement_javabean ajb = new Achievement_javabean(this.table, this.table_name);
    	list = ajb.dataAddMembers(list);
    	return list;
		
	}
    public ArrayList<Map<String, String>> getList(String user_id){
		Calendar cal = Calendar.getInstance(); 
		int currentYear = cal.get(Calendar.YEAR);
    	String sql = "select a.isAwarded, a.id,a.leader_id,a.title, a.pass, a.date_press,a.press, a.isbn, " +
    			"substring(a.date_commit, 1, 10) as date_commit, u.name, t.name as type " +
    			"from "+this.table_name+" a, r_type t, r_user u where t.r_table='"+this.table+"' " +
    			"and a.type_id=t.id and a.user_id=u.id and a.date_commit like '"+currentYear+"%' " +
    			"and (a.user_id='"+user_id+"' or " + user_id +
				" in (select user_id from "+this.table_name+"_member where r_id=a.id))"; ;
    			//" order by pass, date_pass desc, date_commit desc ";
    	// TODO
    	System.out.println(sql);
    	DB db = new DB();
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	db.close();
    	Achievement_javabean ajb = new Achievement_javabean(this.table, this.table_name);
    	list = ajb.dataAddMembers(list);
    	return list;
    }
    @SuppressWarnings("unchecked")
	public ArrayList<Map<String, String>> getList(
    		Map<String, String> map,
    		Map<String, String> mapEq,
    		Map<String, String> mapRange,
    		Map<String, String> mapSpec){
    	String sql = "";
    	String sqlC = "select a.isAwarded, a.id,a.leader_id,a.title, a.pass, a.date_press,a.press, a.isbn, " +
    			"substring(a.date_commit, 1, 10) as date_commit, u.name, t.name as type ";
    	String sqlF = "from "+this.table_name+" a, r_type t, r_user u ";
    	String sqlW1 = "where t.r_table='"+this.table+"' " +
    			"and a.type_id=t.id and a.user_id=u.id ";
    	String sqlW2 = "";
    	// 处理成果表查询条件
		Set set = map.entrySet();
    	Iterator iter1 = set.iterator();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		//System.out.println(entry.hashCode());
    		if (entry.getValue() != null && !entry.getValue().equals("")) {
    			// 模糊查询
    			sqlW2 += "and " + entry.getKey() + " like '%"+entry.getValue()+"%' ";
    			// TODO
    			//System.out.println(sqlW2 );
    		}
    	}
    	// 处理等值查询条件
		set = mapEq.entrySet();
    	iter1 = set.iterator();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		//System.out.println(entry.hashCode());
    		if (entry.getValue() != null && 
    				!entry.getValue().equals("") && 
    				!entry.getValue().equals("0")) {
    			// 等值查询
    			// TODO!!!!!
    			if (entry.getKey().equals("user_id")) {
    				sqlW2 += "and (user_id='"+entry.getValue()+"' or " + entry.getValue()+
    						" in (select user_id from "+this.table_name+"_member where r_id=a.id))";
    			} else {
    				sqlW2 += "and " + entry.getKey() + "='"+entry.getValue()+"' ";
    			}
    			// TODO
    			//System.out.println(sqlW2 );
    		}
    	}
    	// 时间范围
    	String date_pass = mapRange.get("date_pass");
    	String date_pass_2 = mapRange.get("date_pass_2");
    	String date_commit = mapRange.get("date_commit");
    	String date_commit_2 = mapRange.get("date_commit_2");
    	String date_press = mapRange.get("date_press");
    	String date_press_2 = mapRange.get("date_press_2");
		if (date_pass != null && !date_pass.equals("")) {
			sqlW2 += "and date_pass>='"+date_pass+"' ";
		}
		if (date_commit != null && !date_commit.equals("")) {
			sqlW2 += "and date_commit>='"+date_commit+"' ";
		}
		if (date_press != null && !date_press.equals("")) {
			sqlW2 += "and date_press>='"+date_press+"' ";
		}
		
		if (date_pass_2 != null && !date_pass_2.equals("")) {
			sqlW2 += "and date_pass<='"+date_pass+"' ";
		}
		if (date_commit_2 != null && !date_commit_2.equals("")) {
			sqlW2 += "and date_commit<='"+date_commit_2+" 23:59:59' ";
		}
		if (date_press_2 != null && !date_press_2.equals("")) {
			sqlW2 += "and date_press<='"+date_press_2+"' ";
		}
    	
    	
    	
    	
    	// 特殊处理
    	String category = mapSpec.get("category");
    	String member_id = mapSpec.get("member_id");
    	if (category!= null && 
				!category.equals("") && 
				!category.equals("0")) {
			sqlW2 += "and t.category='"+category+"' ";
			//System.out.println(sqlW2 );
    	}
    	sql = sqlC + sqlF + sqlW1 + sqlW2;
    	System.out.println(sql);
    	DB db = new DB();
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	if (member_id!= null && 
				!member_id.equals("") && 
				!member_id.equals("0")) {
	    	for (int i = 0; i < list.size(); ) {
	    		String id = list.get(i).get("id");
	    		String sqlMember = "select id from "+this.table_name+"_member where r_id="+id+" and user_id="+mapSpec.get("member_id");
	    		// TODO
	    		//System.out.println(sqlMember);
	    		int c = db.getRsSize(sqlMember);
	    		if (c == 0) {
	    			list.remove(i);
	    		} else {
	    			i++;
	    		}
	    	}
    	}
    	db.close();
    	Achievement_javabean ajb = new Achievement_javabean(this.table, this.table_name);
    	list = ajb.dataAddMembers(list);
    	return list;
    }
}