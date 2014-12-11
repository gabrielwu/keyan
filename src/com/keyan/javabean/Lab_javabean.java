package com.keyan.javabean;

import java.util.ArrayList;
import java.util.Map;

import com.keyan.dbUtil.DB;

public class Lab_javabean {
    public ArrayList<Map<String, String>> getList() {
    	String sql = "select * from r_lab where del=0";
    	DB db = new DB();	
	    ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public Map<String, String> getLabById(String id) {
    	String sql = "select * from r_lab where del=0 and id="+id;
    	DB db = new DB();	
	    Map<String, String> data = db.getSingleRow(sql);
	    db.close();
		return data;
    }
    public String getLabNameById(String id) {
	    Map<String, String> data = this.getLabById(id);
	    return data.get("name");
    }
}
