package com.keyan.javabean;

import java.util.Map;

import com.keyan.dbUtil.DB;
import com.keyan.dbUtil.DBTool;

public class AllCommon_javabean {
	private String table;
    public AllCommon_javabean(String table) {
		this.table = table;
	}
	public int add(Map<String, String> data) {
    	DB db = new DB();
    	DBTool dt = new DBTool();
    	String sql = dt.getPreInsertSql(table, data);
    	int id = db.insertAndGetId(sql, data);
    	int flag = 0;
    	if (id != -1) {
    		flag = 1;
    	} 
		db.close();
    	return flag;
    }
	public int add2(Map<String, String> data) {
    	DB db = new DB();
    	DBTool dt = new DBTool();
    	String sql = dt.getInsertSql(table, data);
    	int id = db.update(sql);
    	int flag = 0;
    	if (id != -1) {
    		flag = 1;
    	} 
		db.close();
    	return flag;
    }
	public int modify(Map<String, String> data) {
		return this.modify(data, "id", data.get("id"));
	}
	public int modify(Map<String, String> data, String whereColumn, String whereValue) {
    	DB db = new DB();
    	DBTool tool = new DBTool();
    	String sqlA = tool.getPreUpdateSql(this.table, data, whereColumn);
    	int flag = db.updatePre(sqlA, data, whereValue);
		db.close();
    	return flag;
	}
	public int deleteById(String id) {
		DB db = new DB();
		String sql = "delete from " + this.table + " where id=" + id;
		int flag = db.update(sql);
		db.close();
		return flag;
	}
	public int deleteByIdFake(String id) {
		DB db = new DB();
		String sql = "update " + this.table + "set del=1 where id=" + id;
		int flag = db.update(sql);
		db.close();
		return flag;
	}

}
