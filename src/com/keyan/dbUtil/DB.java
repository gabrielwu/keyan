package com.keyan.dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class DB {

	public Statement getStmt() {
		return stmt;
	}
	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}
	private Connection conn = null;        
	private Statement stmt = null;   
	private PreparedStatement pstmt = null;   
	private ResultSet rs = null;
	public void setPstmt(PreparedStatement p){
		this.pstmt=p;
	}
	public PreparedStatement getPstmt(){
		return this.pstmt;
	}

	public DB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/research"; 
			String username = "root";
			String password = "root";
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public boolean excuteBatch(ArrayList<String> sqls) {
		try {
			for (String sql: sqls) {
				this.stmt.addBatch(sql);
			} 
			this.stmt.executeBatch();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	public boolean commit() {
		try {
			conn.commit();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
    public PreparedStatement prepare(String sql){
    	try {
    		this.pstmt = this.conn.prepareStatement(sql);
			return this.pstmt;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
    }
    @SuppressWarnings("unchecked")
	public int insertAndGetId(String sql, Map<String, String> data) {
    	try {
			this.pstmt = this.conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			Set set = data.entrySet();
	    	Iterator iter1 = set.iterator();
	    	int i = 0;
	    	while (iter1.hasNext()) {
	    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
	    		System.out.println(entry.getValue()+" ");
            	this.pstmt.setString(++i, entry.getValue());
	    	}
            this.pstmt.execute();
            this.rs = this.pstmt.getGeneratedKeys();
            int id = -1;
            if (this.rs != null&& this.rs.next()) {  
                id=rs.getInt(1);  
            }  
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
    }
    @SuppressWarnings("unchecked")
	public int updatePre(String sql, Map<String, String> data, String whereValue) {
    	try {
			this.pstmt = this.conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			Set set = data.entrySet();
	    	Iterator iter1 = set.iterator();
	    	int i = 0;
	    	while (iter1.hasNext()) {
	    		Map.Entry<String, String> entry = (Map.Entry<String, String>)iter1.next();
            	this.pstmt.setString(++i, entry.getValue());
	    	}
	    	this.pstmt.setString(++i, whereValue);
	    	this.pstmt.execute();
	    	int flag = this.pstmt.getUpdateCount();
	    	return flag;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
    }
    public ResultSet queryBack(String sql) {
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}
	public ResultSet query(String sql) {
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			return rs;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}

    public ArrayList<Map<String, String>> getRsList(String sql) {
	    ArrayList<Map<String, String>> dataList = new ArrayList<Map<String, String>>(); 
		try {
			this.pstmt = this.prepare(sql); 
			this.rs = this.pstmt.executeQuery(); 
			ResultSetMetaData rsmd = this.pstmt.getMetaData();  
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, String> data = new HashMap<String, String>();
				for (int i = 1; i < columnCount + 1; i++) { 
	   		        String columnName = rsmd.getColumnLabel(i);
                    data.put(columnName, rs.getString(columnName));  
                } 
				dataList.add(data);
			}
			return dataList;
		} catch (SQLException e) {
			e.printStackTrace();
			return dataList;
		}
    }    
    public Map<String, String> getSingleRow(String sql) {
	    Map<String, String> data = new HashMap<String, String>();
		try {
			this.pstmt = this.prepare(sql); 
			this.rs = this.pstmt.executeQuery(); 
			ResultSetMetaData rsmd = this.pstmt.getMetaData();  
			int columnCount = rsmd.getColumnCount();
			if (rs.next()) {
				for (int i = 1; i < columnCount + 1; i++) { 
	   		        String columnName = rsmd.getColumnLabel(i);
                    data.put(columnName, rs.getString(columnName));  
                } 
			}
			return data;
		} catch (SQLException e) {
			e.printStackTrace();
			return data;
		}
    }
    public int getRsSize(String sql) {
    	try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.last();
			int size = rs.getRow();
			return size;
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
    }
	public int update(String sql) {
		try {
			stmt = conn.createStatement();
			int i= stmt.executeUpdate(sql);
			return i;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	public Connection getConn() {
		return conn;
	}  

	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public void close() {
		if(rs   != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if(stmt != null)
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		if(conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}

