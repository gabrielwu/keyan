package com.keyan.javabean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.keyan.dbUtil.DB;

public class User_javabean {
    public ArrayList<Map<String, String>> getUserList() {
    	String sql = "select * from r_user where off=0";
    	DB db = new DB();	
	    ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public ArrayList<Map<String, String>> getUserListByLab(String lab_id) {
    	String sql = "select u.*, l.name as lab_name from r_user u, r_lab l where u.lab_id=l.id and lab_id="+lab_id;
    	DB db = new DB();	
    	//System.out.println(sql);
	    ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public ArrayList<Map<String, String>> getUserAdminList() {
    	String sql = "select u.*, l.name as lab_name from r_user u, r_lab l where u.lab_id=l.id order by lab_id";
    	DB db = new DB();	
    	//System.out.println(sql);
	    ArrayList<Map<String, String>> dataList = db.getRsList(sql);
	    db.close();
		return dataList;
    }
    public int resetPassword(String id) {
    	DB db = new DB();
    	String sql = "update r_user set password=md5(username) where id="+id;
    	int flag = db.update(sql);
	    db.close();
	    return flag;
    }
    /**
     * 
	 * member_id = a_percent && member_id = a_percent && member_id = a_percent 的字符串形式解析,
	 * 注意最后一个&&后为空
     * @param info
     * @return
     */
    public ArrayList<Map<String, String>> membersStringToList(String info) {
	    ArrayList<Map<String, String>> dataList = new ArrayList<Map<String, String>>(); 
    	String[] members = info.split("&&"); 
    	for (int i = 0; i < members.length; i++ ) {
    		String mString = members[i];
    		String[] member = mString.split("=");
    		String user_id = member[0];
    		String a_percent = member[1];
    		Map<String, String> map = new HashMap<String, String>();
    		map.put("user_id", user_id);
    		map.put("a_percent", a_percent);
    		dataList.add(map);
    	}
    	return dataList;
    }
    public Map<String, String> getUserInfo(String id) {
	    DB db = new DB();
	    String sql = "select u.*,case u.type when '1' then '管理员' when '0' then '普通用户' end as type_name, l.name from r_user u, r_lab l where u.lab_id=l.id and u.id="+id;
	    Map<String, String> map = db.getSingleRow(sql);
	    //System.out.println(sql);
	    db.close();
    	return map;
    }
    public int modifyPassword(String id, String password, String passwordOri) {
    	DB db = new DB();
    	String sql = "update r_user set password=md5('"+password+"') where id="+ id + " and password=md5('"+passwordOri+"')";
    	int flag = db.update(sql);
    	db.close();
    	return flag;
    }
}
