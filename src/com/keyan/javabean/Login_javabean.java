package com.keyan.javabean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.keyan.dbUtil.DB;
import com.keyan.util.MD5Util;

public class Login_javabean {
    public boolean canLogin(String username, String password){
    	DB db = new DB();
    	String sql = "select password from r_user where username='"+username+"'";
    	System.out.println(sql);
    	boolean flag = false;
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	if (list.size() != 0) {
    		Map<String, String> map = list.get(0);
    		String password_c = map.get("password");
    		String passwordMD5 = MD5Util.MD5(password);
    		System.out.println(password_c);
    		System.out.println(passwordMD5);
    		if (passwordMD5.equals(password_c)) {
    			flag = true;
    		} else {
    			flag = false;
    		}
    	}
    	db.close();
    	return flag;
    }
    
    public Map<String, String> getUser(String username) {
    	DB db = new DB();
    	String sql = "select lab_id,id,name,type from r_user where username='"+username+"'";
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	Map<String, String> map = null;
    	if (list.size() != 0) {
    		map = list.get(0);
    	}
    	db.close();
		return map;
    }
    public Map<String, String> getConf() {
    	DB db = new DB();
    	String sql = "select * from r_conf";
    	ArrayList<Map<String, String>> list = db.getRsList(sql);
    	Map<String, String> mapConf = new HashMap<String, String>();
    	for (Map<String, String> map:list) {
    		String name = map.get("name");
    		String value = map.get("value");
    		mapConf.put(name, value);
    	}
    	return mapConf;
    }
}
