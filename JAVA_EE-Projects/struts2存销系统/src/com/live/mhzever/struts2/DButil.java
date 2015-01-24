package com.live.mhzever.struts2;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DButil {
	public static void main(String[] args){
		DButil util=new DButil();
		Connection conn = util.getConnection();
		System.out.println(conn);
	}
	public Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/struts2", "root", "");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void closeConnection(Connection conn){
		if(conn!=null)
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	public ResultSet get_info(String sql){
		DButil util = new DButil();
		ResultSet rs = null;
		Connection conn = util.getConnection();
		try {
			Statement stat = (Statement) conn.createStatement();
			rs = stat.executeQuery(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void insert(String username,String password,String email){
		Connection conn = getConnection();
		try {
			Statement stmt = (Statement) conn.createStatement();
			String sql="insert into UserTab(username,password,email) values('"+username+"','"+password+"','"+email+"')";
			stmt.execute(sql);
		//	System.out.println(sql);
			System.out.println("insert into table-> UserTab: "+username+" ||"+password+" ||"+email);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insert_goods(String username,String goodsname,float price){
		Connection conn = getConnection();
		 Date date = new Date();//获得系统时间.
         String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式.
		try {
			Statement stmt = (Statement) conn.createStatement();
			//String sql="insert into t"+username+"(goodsname,price,gin,gout,stock,date) values('"+goodsname+"',"+price+",0,0,0,"+new java.sql.Date(new java.util.Date().getTime())+")";
			String sql="insert into t"+username+"(goodsname,price,gin,gout,stock,date) values('"+goodsname+"',"+price+",0,0,0,'"+nowTime+"')";
			stmt.execute(sql);
		//	System.out.println(sql);
			System.out.println("insert into -> t"+username+": "+goodsname+" ||"+price+" ||");
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void update_goods(String username,int gin,int gout,String goodsname){
		Connection conn = getConnection();
		 Date date = new Date();//获得系统时间.
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//将时间格式转换成符合Timestamp要求的格式
        try {
			Statement stmt = (Statement) conn.createStatement();
			String sql="update t"+username+" set gin=gin+"+gin+",gout=gout+"+gout+",stock=stock+"+gin+"-"+gout+",date='"+nowTime+"' where goodsname='"+goodsname+"'";
			stmt.execute(sql);
				System.out.println("update t"+username);
				stmt.close();
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public ResultSet get_username(String sql){
		DButil util = new DButil();
		ResultSet rs = null;
		Connection conn = util.getConnection();
		try {
			Statement stat = (Statement) conn.createStatement();
			rs = stat.executeQuery(sql);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void create_table(String username){
		Connection conn = getConnection();
		try {
			Statement stmt = (Statement) conn.createStatement();
			String sql = "create table t"+username+"(goodsname varchar(20),price float,gin int,gout int,stock int,date varchar(30))";
			stmt.execute(sql);
			System.out.println("create table: t"+username);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ResultSet list(String username){
		ResultSet rs;
		Connection conn = getConnection();
		try {
			Statement stmt = (Statement) conn.createStatement();
			String sql = "select * from t"+username+"";
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
