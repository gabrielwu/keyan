package com.keyan.javabean;

import java.util.ArrayList;
import java.util.Map;

import com.keyan.dbUtil.DB;

public class Type_javabean {
    public ArrayList<Map<String, String>> getTypeList(String r_table) {
    	String sql = "select * from r_type where del='0' and r_table='"+r_table+"' order by category";
    	DB db = new DB();	
	    ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public ArrayList<Map<String, String>> getTypeList(String r_table, int remark) {
    	String sql = "select * from r_type where remark='"+remark+"' and del='0' and r_table='"+r_table+"' order by category";
    	DB db = new DB();	
    	System.out.print(sql);
    	ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public ArrayList<Map<String, String>> getPaperAreaList() {
    	String sql = "select * from r_type where del='0' and r_table='11' order by category";
    	DB db = new DB();	
    	ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public ArrayList<Map<String, String>> getTypeListByCategory(String r_table, String category) {
    	String sql = "select * from r_type where remark='1' and del='0' and category='"+category+"' " +
    			"and r_table='"+r_table+"' order by category";
    	DB db = new DB();	
	    ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public int delete(String r_table, String id) {
    	DB db = new DB();
    	String sql = "update r_type set del='1' where id="+id+" and r_table='"+r_table+"'";
        int flag = db.update(sql);
		db.close();
    	return flag;
    }
    public int add(String r_table, String name, 
    			   String a_value, String category,
    			   String remark) {
    	DB db = new DB();
    	// 可能没有大类型
    	if (category.equals("undefined")) {
    		category = "1";
    	}
    	String sql = "insert into r_type(r_table, name, a_value, category, remark) values("+
    		"'"+r_table+"','"+name+"','"+a_value+"','"+category+"','"+remark+"')";
        int flag = db.update(sql);
		db.close();
    	return flag;
    }
	public int Modify(String r_table, String id, String name, 
			          String a_value, String category, String remark) {
    	DB db = new DB();
    	// 可能没有大类型
    	if (category.equals("undefined")) {
    		category = "1";
    	}
    	String sql = "update r_type set " +
    			     "name='" + name + "', " +
    			     "a_value='" + a_value + "', " +
    			     "category='" + category + "', " +
    			     "remark='" + remark + "' " +
    			     "where id="+id;
        int flag = db.update(sql);
        System.out.print(sql);
		db.close();
    	return flag;
	}
}
