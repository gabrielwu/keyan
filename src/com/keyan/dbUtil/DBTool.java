package com.keyan.dbUtil;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class DBTool {
    @SuppressWarnings("unchecked")
	public String getInsertSql(String table, Map<String, String> data) {
    	String sql ="";
    	String sqlTable = "insert into "+table;
    	String sqlColumns = "(";
    	String sqlValues = "(";
    	
    	Set set = data.entrySet();
    	Iterator iter1 = set.iterator();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		sqlColumns += entry.getKey() + ",";
    		sqlValues += "'" + entry.getValue() + "',";
    	}
    	sqlColumns = sqlColumns.substring(0, sqlColumns.length() - 1);
    	sqlColumns += ")";
    	sqlValues = sqlValues.substring(0, sqlValues.length() - 1);
    	sqlValues += ")";
    	
    	sql = sqlTable + sqlColumns + " values" + sqlValues;
    	System.out.println(sql);
    	return sql;
    }
    @SuppressWarnings("unchecked")
	public String getPreInsertSql(String table, Map<String, String> data) {
    	String sql ="";
    	String sqlTable = "insert into "+table;
    	String sqlColumns = "(";
    	String sqlValues = "(";
    	
    	Set set = data.entrySet();
    	Iterator iter1 = set.iterator();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		sqlColumns += entry.getKey() + ",";
    		sqlValues += "?,";
    	}
    	sqlColumns = sqlColumns.substring(0, sqlColumns.length() - 1);
    	sqlColumns += ")";
    	sqlValues = sqlValues.substring(0, sqlValues.length() - 1);
    	sqlValues += ")";
    	
    	sql = sqlTable + sqlColumns + " values" + sqlValues;
    	System.out.println(sql);
    	return sql;
    }    
    @SuppressWarnings("unchecked")
	public String getPreUpdateSql(String table, Map<String, String> data, String whereColumn) {
    	String sql ="";
    	String sqlTable = "update "+table + " set ";
    	String sqlColumns = "";
    	
    	Set set = data.entrySet();
    	Iterator iter1 = set.iterator();
    	while (iter1.hasNext()) {
    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
    		sqlColumns += entry.getKey() + "=?,";
    	}
    	sqlColumns = sqlColumns.substring(0, sqlColumns.length() - 1);
    	sql = sqlTable + sqlColumns + " where " + whereColumn + "=?";
    	// TODO
    	System.out.println(sql);
    	return sql;
    }
}
