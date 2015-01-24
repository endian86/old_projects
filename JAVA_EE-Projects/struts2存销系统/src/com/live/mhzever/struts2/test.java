package com.live.mhzever.struts2;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.live.mhzever.struts2.DButil;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class test {
	public static void main(String[] args){
		list();
	} 
	public static void list(){
		DButil util = new DButil();
		Connection conn = util.getConnection();
		String sql = "select password,username from UserTab";
		try {
			Statement stmt = (Statement) conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				
				String username=rs.getString(1);
				String password=rs.getString(2);
				//String email=rs.getString(3);
				System.out.println("  username="+username+"  password="+password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
